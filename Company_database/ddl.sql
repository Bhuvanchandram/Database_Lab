--Create database
CREATE database company;

--USe database
USE company;

--Creating tables
CREATE TABLE department
(
    DNo INT(10) primary key,
    Dname CHAR(20),
    MgrSSN INT(10),
    Mgrstartdate DATE
);

CREATE table Employee
(
    SSN INT(10) primary key,
    ename CHAR(20),
    address CHAR(50),
    sex char(2),
    salary int(8),
    superssn INT(10),
    Dno INT(10),
    FOREIGN KEY (Dno) REFERENCES department(DNo) ON DELETE CASCADE
);

CREATE TABLE Dlocation
(
    Dno INT(10),
    Dloc CHAR(50),
    FOREIGN KEY (Dno) REFERENCES department(DNo) ON DELETE CASCADE
);

CREATE TABLE project
(
    Pno INT(10) primary key,
    Pname CHAR(20),
    Ploc CHAR(50),
    Dno INt(10),
    FOREIGN key (Dno) REFERENCES department(DNo) on DELETE CASCADE
);

CREATE TABLE works_on
(
    SSN INT(10),
    Pno INT(10),
    Hours INT(10),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE,
    FOREIGN KEY (Pno) REFERENCES project(Pno) ON DELETE CASCADE
);

INSERT INTO department values
(01,'CSE',001,'2001-01-01'),
(02,'ME',002,'2002-01-01'),
(03,'EEE',003,'2003-01-01'),
(04,'ECE',004,'2004-01-01'),
(05,'ISE',005,'2005-01-01');

INSERT INTO Employee values
(001,"Scott","Manhattan",'M',200000,01,01),
(002,"Britney","New Jersey",'F',300000,02,02),
(003,"Alice","Texas",'F',2000000,03,03),
(004,"Alex","Washington",'M',254000,04,04),
(005,"Ross","Alabama",'M',200450,05,05);

INSERT INTO Dlocation values
(01,'Bengaluru'),
(02,'Chennai'),
(03,'Hyderabad'),
(04,'Delhi'),
(05,'Mumbai');

INSERT INTO project values
(01,"Project_1","Bengaluru",01),
(02,"Project_2","Chennai",02),
(03,"Project_3","Hyderabad",03),
(04,"Project_4","Delhi",04),
(05,"Project_5","Mumbai",05);

INSERT INTO works_on values
(01,01,25),
(02,02,20),
(03,03,35),
(04,04,40),
(05,05,20);