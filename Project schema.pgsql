CREATE TABLE Employees(
   eid INTEGER,
   ename VARCHAR(100),
   email VARCHAR(100) unique,
   resigned_date DATE,
   primary key (eid)
);

CREATE TABLE contact(
    user_id INTEGER,
    home_phone INTEGER,
    mobile_phone INTEGER,
    office_phone INTEGER
    FOREIGN KEY (user_id) REFERENCES Employees (eid)
);

Create table Junior(
    eid integer primary key,
    foreign key (eid) references Employees (eid) on delete cascade
);

Create table Booker(
    eid integer primary key,
    foreign key (eid) references Employees (eid) on delete cascade
);

Create table Senior(
    eid integer primary key,
    foreign key (eid) references Booker (eid) on delete cascade
);

Create table Manager(
    eid integer primary key,
    foreign key (eid) references Booker (eid) on delete cascade
);

CREATE TABLE Works_IN(
    employee_id integer,
    department_id integer not null,
    primary key (employee_id),
    foreign key (employee_id) references Employees(eid),
    foreign key (department_id) references Departments(did)
);

Create table Departments(
    did integer,
    dname varchar(100),
    primary key (did)
);

Create table Located_In(
    room_num integer,
    floor_num integer,
    depart_id integer not null,
    primary key (room_num,floor_num),
    foreign key (room_num) references Meeting_Rooms(room),
    foreign key (floor_num) references Meeting_Rooms(floor),
    foreign key (depart_id) references Departments(did)
);

Create table Meeting_Rooms(
    room integer,
    floor integer,
    rname varchar(100),
    primary key (room,floor)
);

Create table Updates(
    manager_id integer not null,
    udate date,
    new_cap integer,
    room_no integer,
    floor_no integer,
    primary key (room_no,floor_no,udate),
    foreign key (room_no) references Meeting_Rooms(room),
    foreign key (floor_no) references Meeting_Rooms(floor)
    foreign key (manager_id) references Manager(eid)
);

Create table Sessions(
    sroom integer,
    sfloor integer,
    stime integer,
    sdate date,
    primary key(sroom,sfloor,stime,sdate),
    foreign key (sroom) references Meeting_Rooms (room)
        on delete cascade,
    foreign key (sfloor) references Meeting_Rooms (floor)
        on delete cascade
);

Create table Approves(
    mid integer,
    mroom integer,
    mfloor integer,
    session_time integer,
    session_date date,
    primary key(session_time,session_date,mroom,mfloor,mid),
    foreign key (mid) references Manager(eid),
    foreign key (session_time) references Sessions (stime),
    foreign key (session_date) references Sessions (sdate),
    foreign key(mroom,mfloor) references Sessions (sroom,sfloor)
);

Create table Books(
    bid integer,
    sstime integer,
    ssdate date,
    mr integer,
    mf integer
    primary key (bid,ssdate,sstime,mr,mf),
    foreign key (bid) references Booker (eid),
    foreign key (sstime,ssdate) references Sessions (stime,sdate)
    foreign key (mr,mf) references Sessions (sroom,sfloor)
);

Create table Joins(
    e_id integer,
    session_time integer,
    session_date date,
    rm integer,
    fl integer,
    primary key (e_id,session_date,session_time,rm,fl),
    foreign key (e_id) references Employees (eid),
    foreign key (session_date,session_time) references Sessions (sdate,stime)
    foreign key (rm,fl) references Sessions (sroom,sfloor)
);

Create table Health_Declaration(
    hdate date,
    temperature float,
    fever boolean,
    emp_id integer,
    primary key (hdate,emp_id),
    foreign key (emp_id) references Employees (eid)
        on delete cascade
);


