CREATE OR REPLACE FUNCTION is_employee_booker(eid INTEGER)
RETURNS BOOLEAN AS $$
    SELECT eid IN (
        SELECT b.eid FROM Bookers b);
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION search_room(
    min_cap INTEGER,
    search_date DATE,
    start_hour INTEGER,
    end_hour INTEGER
)
RETURNS TABLE(floor_no INTEGER, room_no INTEGER, rname VARCHAR(100), did INTEGER, capacity INTEGER)
AS $$
BEGIN RETURN QUERY
    SELECT mr.floor_no, mr.room_no, mr.rname, mr.did, mr.capacity FROM MeetingRoomsWithCapacity mr
    WHERE mr.capacity >= min_cap
    AND NOT EXISTS (
        SELECT FROM Sessions s
        WHERE mr.floor_no = s.floor_no
        AND mr.room_no = s.room_no
        AND search_date = s.sdate
        AND DATE_PART('hour', s.stime) BETWEEN start_hour AND end_hour - 1 
    )
    ORDER BY mr.capacity ASC;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION book_room(
    floor_no INTEGER,
    room_no INTEGER,
    book_date DATE,
    start_hour INTEGER,
    end_hour INTEGER,
    booker_id INTEGER
) RETURNS VARCHAR(20)
AS $$
DECLARE
    is_booker BOOLEAN;
    is_room_free BOOLEAN;
    session_hour INTEGER := start_hour;
BEGIN
    SELECT is_employee_booker(booker_id) INTO is_booker;
    SELECT (floor_no, room_no) IN (
        SELECT room.floor_no, room.room_no
        FROM search_room(1, book_date, start_hour, end_hour) room
    ) INTO is_room_free;
    IF is_booker AND is_room_free THEN
        WHILE session_hour < end_hour LOOP
            INSERT INTO Sessions VALUES (
                floor_no,
                room_no,
                book_date,
                MAKE_TIME(session_hour, 0, 0), -- hours, minutes, seconds
                booker_id,
                NULL,
                NULL
            );
            INSERT INTO Joins VALUES (
                booker_id,
                room_no,
                floor_no,
                book_date,
                MAKE_TIME(session_hour, 0, 0)
            );
            session_hour = session_hour + 1;
        END LOOP;
        RETURN 'Booking successful';
    ELSE
        RETURN 'Booking failed';
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION unbook_room(
    floor_no INTEGER,
    room_no INTEGER,
    book_date DATE,
    start_hour INTEGER,
    end_hour INTEGER,
    booker_id INTEGER
) RETURNS VOID
AS $$
DECLARE
    is_booker BOOLEAN;
    session_hour INTEGER := start_hour;
BEGIN
    SELECT is_employee_booker(booker_id) INTO is_booker;
    IF is_booker THEN 
        WHILE (session_hour < end_hour) LOOP
            IF (is_approved IS NULL IN (SELECT is_approved FROM sessions AS s 
            WHERE (s.floor_no = floor_no) AND (s.room_no = room_no) 
            AND (s.sdate = book_date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN
                DELETE FROM sessions AS ss 
                WHERE (ss.floor_no = floor_no) AND (ss.room_no = room_no) 
                AND (ss.sdate = book_date) AND (ss.stime = MAKE_TIME(session_hour, 0, 0));
                DELETE FROM joins AS j 
                WHERE (j.floor_no = floor_no) AND (j.room_no = room_no)
                AND (j.sdate = book_date) AND (j.stime = MAKE_TIME(session_hour, 0, 0)); 
                session_hour := session_hour + 1;
            END IF;
            IF (is_approved = TRUE IN (SELECT is_approved FROM sessions AS s 
            WHERE (s.floor_no = floor_no) AND (s.room_no = room_no) 
            AND (s.sdate = book_date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN --meeting approved
                DELETE FROM sessions AS ss 
                WHERE (ss.floor_no = floor_no) AND (ss.room_no = room_no) 
                AND (ss.sdate = book_date) AND (ss.stime = MAKE_TIME(session_hour, 0, 0)); --delete session
                DELETE FROM joins AS j 
                WHERE (j.floor_no = floor_no) AND (j.room_no = room_no)
                AND (j.sdate = book_date) AND (j.stime = MAKE_TIME(session_hour, 0, 0)); --delete all employees joined the meeting
                session_hour := session_hour + 1;
            END IF;
        END LOOP;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION join_meeting(
    floor_no INTEGER,
    room_no INTEGER,
    date DATE,
    start_hour INTEGER,
    end_hour INTEGER,
    employee_id INTEGER
) RETURNS VOID
AS $$
DECLARE
    session_hour INTEGER := start_hour;
BEGIN
    WHILE (session_hour < end_hour) LOOP
        IF (is_approved = TRUE IN (SELECT is_approved FROM sessions AS s 
        WHERE (s.floor_no = floor_no) AND (s.room_no = room_no) 
        AND (s.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN --approved meeting cannot join
            EXIT;
        END IF;
        IF (is_approved IS NULL IN (SELECT is_approved FROM sessions AS s 
        WHERE (s.floor_no = floor_no) AND (s.room_no = room_no) 
        AND (s.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN
            INSERT INTO joins (eid, room_no, floor_no, sdate, stime)
            VALUES (employee_id, room_no, floor_no, date, MAKE_TIME(session_hour, 0, 0));
            session_hour := session_hour + 1;
        END IF;
    END LOOP;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION leave_meeting(
    floor_no INTEGER,
    room_no INTEGER,
    date DATE,
    start_hour INTEGER,
    end_hour INTEGER,
    employee_id INTEGER
) RETURNS VOID
AS $$
DECLARE
    session_hour INTEGER := start_hour;
BEGIN
    WHILE (session_hour < end_hour) LOOP
        IF (is_approved = TRUE IN (SELECT is_approved FROM sessions AS s
        WHERE (s.floor_no = floor_no) AND (s.room_no = room_no)
        AND (s.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN --approved meeting cannot leave
            EXIT;
        END IF;
        IF (is_approved IS NULL IN (SELECT is_approved FROM sessions AS s
        WHERE (s.floor_no = floor_no) AND (s.room_no = room_no)
        AND (s.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN
            IF (employee_id IS NULL IN (SELECT eid FROM joins AS j 
            WHERE (j.eid = employee_id) AND (j.floor_no = floor_no) AND (j.room_no = room_no)
            AND (j.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN
                EXIT;
            END IF;
            IF (employee_id IS NOT NULL IN (SELECT eid FROM joins AS j 
            WHERE (j.eid = employee_id) AND (j.floor_no = floor_no) AND (j.room_no = room_no)
            AND (j.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0)))) THEN
                DELETE FROM joins WHERE (j.eid = employee_id) AND (j.floor_no = floor_no) 
                AND (j.room_no = room_no) AND (j.sdate = date) AND (s.stime = MAKE_TIME(session_hour, 0, 0));
                session_hour := session_hour + 1;
            END IF;
        END IF;
    END LOOP;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION approve_meeting(
    floor_num INTEGER,
    room_num INTEGER,
    book_date DATE,
    start_hour INTEGER,
    end_hour INTEGER,
    manager_id INTEGER,
    manager_approval boolean
) RETURNS VOID
AS $$
DECLARE
    session_hour INTEGER := start_hour;
BEGIN
    IF (manager_id IN (SELECT eid FROM managers)) THEN
        IF (manager_approval=TURE) THEN
            WHILE (session_hour < end_hour) LOOP
                UPDATE sessions AS s SET s.approver_id = manager_id
                WHERE (s.floor_no = floor_num) AND (s.room_no = room_num) AND (s.sdate = book_date)
                AND (s.stime = MAKE_TIME(session_hour, 0, 0));
                session_hour := session_hour + 1;
            END LOOP;
        END IF;
        IF (manager_approval=FALSE) THEN
            DELETE FROM sessions WHERE (s.floor_no = floor_num) AND (s.room_no = room_num) AND (s.sdate = book_date)
                AND (s.stime = MAKE_TIME(session_hour, 0, 0));  
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;