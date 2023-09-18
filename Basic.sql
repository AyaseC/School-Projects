--- BASIC ADD FUNCTIONS
CREATE OR REPLACE PROCEDURE add_department(
  department_id INTEGER,
  department_name VARCHAR(100)
) AS $$
  INSERT INTO
    Departments (did, dname)
  VALUES
    (department_id, department_name);
$$ LANGUAGE sql;

CREATE OR REPLACE PROCEDURE remove_department(department_id INTEGER)
AS $$
    DELETE FROM Departments
    WHERE did = department_id;
$$ LANGUAGE sql;

CREATE OR REPLACE PROCEDURE add_room(
  did INTEGER,
  floor_no INTEGER,
  room_no INTEGER,
  rname VARCHAR(100),
  room_capacity INTEGER
) AS $$
    INSERT INTO MeetingRooms (floor_no, room_no, rname, did) VALUES (floor_no, room_no, rname, did);
    INSERT INTO Updates VALUES (floor_no, room_no, CURRENT_DATE, room_capacity, NULL);
$$ LANGUAGE sql;

CREATE OR REPLACE PROCEDURE change_capacity
(floor_num INTEGER, room_num INTEGER, capacity INTEGER, tdate date)
AS $$
    UPDATE Updates
    SET udate = tdate, new_cap = capacity
    WHERE floor_no = floor_num AND room_no = room_num;
$$ LANGUAGE sql;

DROP TYPE IF EXISTS EMPLOYEE_TYPE CASCADE;
CREATE TYPE EMPLOYEE_TYPE AS ENUM('senior', 'junior', 'manager');

CREATE OR REPLACE PROCEDURE add_employee(
  employee_name VARCHAR(100),
  employee_phone CHAR(10),
  ptype PHONE_TYPE,
  etype EMPLOYEE_TYPE,
  employee_department INTEGER
)
AS $$
DECLARE
    generated_eid INTEGER;
BEGIN
    INSERT INTO Employees(ename, did) VALUES (employee_name, employee_department) RETURNING eid INTO generated_eid;
    INSERT INTO Contacts(eid, phone_type, phone) VALUES (generated_eid, ptype, employee_phone);
    UPDATE Employees e
    SET email = CONCAT(lpad(generated_eid::text, 8, '0'), '@office-email.com')
    WHERE e.eid = generated_eid;
    CASE etype
        WHEN 'senior' THEN
            INSERT INTO Bookers VALUES (generated_eid);
        WHEN 'manager' THEN
            INSERT INTO Bookers VALUES (generated_eid);
            INSERT INTO Managers VALUES (generated_eid);
        ELSE
    END CASE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE remove_employee
(employee_id INTEGER, tdate DATE)
AS $$
    Update Employees
    SET resigned_date = tdate
    WHERE eid = employee_id;
$$ LANGUAGE sql;