--Create database
CREATE database company;

--USe database
USE company;

--Creating tables
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

CREATE TABLE department
(
    DNo INT(10) primary key,
    Dname CHAR(20),
    MgrSSN INT(10),
    Mgrstartdate DATE
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