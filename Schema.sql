DROP TABLE IF EXISTS Departments CASCADE;
CREATE TABLE Departments(
    did INTEGER NOT NULL,
    dname VARCHAR(100) NOT NULL,
    PRIMARY KEY (did)
);

DROP TABLE IF EXISTS Employees CASCADE;
CREATE TABLE Employees(
    eid INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    ename VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    did INTEGER NOT NULL,
    resigned_date DATE,
    PRIMARY KEY (eid),
    FOREIGN KEY (did) REFERENCES Departments(did) ON DELETE CASCADE
);

DROP TYPE IF EXISTS PHONE_TYPE CASCADE;
CREATE TYPE PHONE_TYPE AS ENUM('home', 'mobile', 'office');

DROP TABLE IF EXISTS Contacts CASCADE;
CREATE TABLE Contacts(
    eid INTEGER NOT NULL,
    phone CHAR(10) NOT NULL,
    phone_type PHONE_TYPE NOT NULL,
    FOREIGN KEY (eid) REFERENCES Employees(eid)
);

DROP TABLE IF EXISTS Bookers CASCADE;
CREATE TABLE Bookers(
    eid INTEGER PRIMARY KEY,
    FOREIGN KEY (eid) REFERENCES Employees(eid) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Managers CASCADE;
CREATE TABLE Managers(
    eid INTEGER PRIMARY KEY,
    FOREIGN KEY (eid) REFERENCES Bookers(eid) ON DELETE CASCADE
);

DROP TABLE IF EXISTS MeetingRooms CASCADE;
CREATE TABLE MeetingRooms(
    floor_no INTEGER NOT NULL,
    room_no INTEGER NOT NULL,
    rname VARCHAR(100) NOT NULL,
    did INTEGER NOT NULL,
    PRIMARY KEY (floor_no, room_no),
    FOREIGN KEY (did) REFERENCES Departments(did) ON DELETE CASCADE
);

DROP TABLE IF EXISTS close_contact_list CASCADE;
CREATE TABLE close_contact_list
    (contactor INTEGER NOT NULL,
    in_date DATE,
    PRIMARY KEY(contactor),
    FOREIGN KEY(contactor) REFERENCES Employees(eid)
);


DROP TABLE IF EXISTS Updates CASCADE;
CREATE TABLE Updates(
    floor_no INTEGER NOT NULL,
    room_no INTEGER NOT NULL,
    udate DATE NOT NULL,
    new_cap INTEGER NOT NULL,
    mid INTEGER, -- Manager id is null when room is just added
    PRIMARY KEY (floor_no, room_no, udate),
    FOREIGN KEY (floor_no, room_no) REFERENCES MeetingRooms(floor_no, room_no) ON DELETE CASCADE,
    FOREIGN KEY (mid) REFERENCES Managers(eid)
);

CREATE OR REPLACE FUNCTION has_fever(eid INTEGER)
RETURNS BOOLEAN AS $$
    SELECT EXISTS (
        SELECT 1
        FROM HealthDeclarations hd
        WHERE hd.hdate = CURRENT_DATE
        AND hd.eid = eid
        AND hd.temperature > 37.5
    );
$$ LANGUAGE sql;

DROP TABLE IF EXISTS Sessions CASCADE;
CREATE TABLE Sessions(
    floor_no INTEGER NOT NULL,
    room_no INTEGER NOT NULL,
    sdate DATE NOT NULL,
    stime TIME NOT NULL,
    booker_id INTEGER NOT NULL,
    approver_id INTEGER,
    is_approved BOOLEAN,
    PRIMARY KEY(floor_no, room_no, sdate, stime),
    FOREIGN KEY (floor_no, room_no) REFERENCES MeetingRooms(floor_no, room_no) ON DELETE CASCADE,
    FOREIGN KEY (booker_id) REFERENCES Bookers(eid),
    FOREIGN KEY (approver_id) REFERENCES Managers(eid)
);

DROP TABLE IF EXISTS Joins CASCADE;
CREATE TABLE Joins(
    eid INTEGER NOT NULL,
    room_no INTEGER NOT NULL,
    floor_no INTEGER NOT NULL,
    sdate DATE NOT NULL,
    stime TIME NOT NULL,
    PRIMARY KEY (eid, room_no, floor_no, sdate, stime),
    FOREIGN KEY (eid) REFERENCES Employees(eid),
    FOREIGN KEY (room_no, floor_no, sdate, stime) REFERENCES Sessions (room_no, floor_no, sdate, stime)
);

DROP TABLE IF EXISTS HealthDeclarations CASCADE;
CREATE TABLE HealthDeclarations(
    hdate DATE NOT NULL,
    eid INTEGER NOT NULL,
    temperature FLOAT NOT NULL CHECK (temperature BETWEEN 34 AND 43), -- Constraint 32
    PRIMARY KEY (hdate, eid),
    FOREIGN KEY (eid) REFERENCES Employees(eid) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW MeetingRoomsWithCapacity(
    floor_no,
    room_no,
    rname,
    did,
    capacity
) AS (
    SELECT m.floor_no, m.room_no, m.rname, m.did, 
    (
        SELECT new_cap
        FROM Updates u
        WHERE m.floor_no = u.floor_no
        AND m.room_no = u.room_no
        ORDER BY udate DESC -- Most recent capacity update
        LIMIT 1
    )
    FROM MeetingRooms m
);