--Creating the tables
--Creating the Sailors Tables
 CREATE TABLE Sailors
(SID VARCHAR(5) primary key,
sname CHAR(50),
rating INT(2),
AGE INT(2));

--Creating the Boat Tables
 CREATE TABLE Boat
(BID VARCHAR(5) primary key,
bname CHAR(25),
color CHAR(25));

--Creating the Rservers table
CREATE TABLE Rservers
(sid VARCHAR(5),
bid VARCHAR(5),
date DATE);

--Inserting values into the Sailors Database
INSERT INTO Sailors values
('S111','Albert',4,23),
('S222','Max',2,20),
('S333','Steve',5,36),
('S444','Alex',5,30),
('S555','Alice',5,25);

--Insert values into the Boat database
INSERT INTO Boat values
('B111','Billy','Black'),
('B112','Pilly','Red'),
('B113','Trilly','Green'),
('B114','Willy','White'),
('B115','Lilly','Blue');

--Insert values into Rservers
INSERT into Rservers values
('S111','B111','2021-01-01'),
('S222','B112','2020-05-31'),
('S333','B113','2019-02-21'),
('S444','B114','2018-04-05'),
('S555','B115','2017-11-12');

--Alter tables
ALTER Table Sailors CHANGE COLUMN sname sailor_name CHAR(25);
ALTER Table Sailors CHANGE COLUMN sailor_name sname CHAR(25);
ALTER table Sailors modify age INTEGER NOT NULL;
ALTER TABLE Rservers modify DATE SET NOT NULL;


--Adding and Dropping constaints
ALTER TABLE Rservers ADD FOREIGN key(sid) REFERENCES Sailors(SID);
ALTER TABLE Rservers ADD FOREIGN key(bid) REFERENCES Boat(BID);
ALTER TABLE Sailors DROP FOREIGN KEY sid;
ALTER TABLE Rservers ADD FOREIGN key(sid) REFERENCES Sailors(SID);

--
