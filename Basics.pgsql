Create or replace function add_department
(department_id integer, department_name varchar(100))
return void as $$
    Insert into Departments (did, dname) values (department_id,department_name);
$$ language sql;

Create or replace function remove_department
(department_id integer)
returns void as $$
    delete from Departments
    where did=department_id;
$$ language sql;

Create or replace function add_room
(floor_num integer, room_num integer, room_name varchar(100), room_capacity integer)
returns void as $$
    Insert into MeetingRooms (floor_no, room_no,rname) values (floor_num,room_num,room_name)
    Update Updates 
    set new_cap=room_capacity
    where floor_no=floor_num, room_no=room_num;
$$ language sql;

Create or replace function change_capacity
(floor_num integer, room_num integer, capacity integer, tdate date)
returns void as $$
    update Updates
    set udate=tdate, new_cap=capacity
    where floor_no=floor_num, room_no=room_num;
$$ language sql;

Create or replace function add_employee
(employee_name varchar(100), employee_num integer, ptype varchar(100), kind varchar(100), employee_depart integer)
returns void as $$
    Insert into Employees (ename,did) values (employee_name,employee_depart)
    Update contact 
        set (phone,phone_type)=(employee_num,ptype)
            where eid=
            (select eid from Employees where ename=employee_name)
    IF kind='Senior'
        Insert into Booker (eid)
            select eid
            From Employees
            where ename=employee_name
    ELSE IF kind='Manager'
        Insert into Booker (eid)
            select eid
            From Employees
            where ename=employee_name
        Insert into Manager (eid)
            select eid
            From Employees
            where ename=employee_name;
$$ language sql;

Create or replace function remove_employee
(employee_id integer, tdate date)
return void as $$
    Update Employees
    set (resigned_date) = tdate
    where eid= employee_id;
$$ language sql;


