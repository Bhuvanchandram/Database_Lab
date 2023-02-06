--CREATE DATABASE
CREATE DATABASE insurance;
USE insurance;

--Creating table
CREATE TABLE Person
(
    driver_id VARCHAR(5) primary key,
    name CHAR(50),
    address CHAR(100)
);

CREATE TABLE Car 
(
    Reg_no VARCHAR(14) primary key,
    Model CHAR(50),
    year INT(4)
);

CREATE TABLE Accident
(
    report_number INT(10) primary key,
    acc_date DATE,
    location CHAR(50)
);

CREATE TABLE Owns
(
    driver_id VARCHAR(5),
    Reg_no VARCHAR(14),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Car(Reg_no) ON DELETE CASCADE
);

CREATE TABLE Participated
(
    driver_id VARCHAR(5),
    Reg_no VARCHAR(14),
    report_number INT(10),
    damage_amount INT(10),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES Car(Reg_no) ON DELETE CASCADE,
    FOREIGN KEY (report_number) REFERENCES Accident(report_number) ON DELETE CASCADE
);

--Insertion of data into the tables
INSERT INTO Person values
("D111","Steve","Kuvempunagara"),
("D222","Smith","J P Nagar"),
("D333","Alex","Udaygiri"),
("D444","Alice","Rajivnagar"),
("D555","Amanda","Lakshmipuram");

INSERT INTO Car values
("KA-09-AB-4223","Swift",2020),
("KA-10-BC-5674","Wagan r",2019),
("KA-11-AC-5473","Mazda",2015),
("KA-09-MA-1234","Porsche",2013),
("KA-09-CA-4321","Range Rover",2010);

INSERT INTO Accident values
(43627,'2020-04-05',"Nazarabad"),
(56345,'2019-12-16',"Gokulam"),
(63744,'2020-05-14',"Vijaynagara"),
(54634,'2020-08-30',"Kuvempunagara"),
(65738,'2021-01-21',"JSS Layout");

INSERT INTO Owns values
("D111","KA-09-AB-4223"),
("D222","KA-10-BC-5674"),
("D333","KA-11-AC-5473"),
("D444","KA-09-MA-1234"),
("D555","KA-09-CA-4321");

INSERT INTO Participated values
("D111","KA-09-AB-4223",43627,20000),
("D222","KA-10-BC-5674",54634,30000),
("D333","KA-11-AC-5473",56345,40000),
("D444","KA-09-MA-1234",63744,60000),
("D555","KA-09-CA-4321",65738,70000);

--ALTER Commands
ALTER Table Participated modify damage_amount INTEGER;
ALTER Table Accident modify location TEXT NOT NULL;
ALTER TABLE Accident modify acc_date DATE NOT NULL;

--Display the updated deatils
Select * from Person;
Select * from Car;
Select * from Accident;
Select * from Owns;
Select * from Participated;

--Update operation
Update Participated SET damage_amount=215000 where driver_id="D222";

--DELETE Operation
DELETE from Person where driver_id="D555";
DELETE from car where Reg_no="KA-09-AB-4223";

--Reinserting the above values
INSERT INTO Person values
("D555","Amanda","Lakshmipuram");

INSERT INTO car values
("KA-09-AB-4223","Swift",2020);

--Display the updated deatils
Select * from Person;
Select * from Car;
Select * from Accident;
Select * from Owns;
Select * from Participated;