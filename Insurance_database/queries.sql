--Total number of people who owned cars that were involved in accidents in 2021
SELECT COUNT(Person.driver_id)
FROM Accident
JOIN Participated ON Accident.report_number=Participated.report_number
JOIN Owns ON Owns.Reg_no=Participated.Reg_no
JOIN Person ON Owns.driver_id=Person.driver_id
WHERE acc_date BETWEEN '2021-01-01' AND '2021-12-31';

--Number of accidents in which the car belonging to 'Smith' were involved
SELECT COUNT(Person.driver_id)
FROM Participated
JOIN Person ON Person.driver_id=Participated.driver_id
WHERE Person.name LIKE "%Smith%";

--Add a new accident to the database
INSERT INTO Accident values
(52048,'2017-03-17',"Bhogadi");

--Delete Wagaon R belonging to Smith
DELETE Car
FROM Car
JOIN Owns ON Owns.Reg_no = Car.Reg_no
JOIN Person ON Person.driver_id = Owns.driver_id
WHERE Person.name = 'Smith' AND Car.Model = 'Wagon r';

--Update the damage amount for the car with license number KA-09-MA-1234
Update Participated SET damage_amount=25000 where driver_id="D333";

--View
CREATE VIEW View1 AS 
Select Model,year from Car;

Select * from View1;

--Trigger
DELIMITER //
CREATE TRIGGER damage_amount_trigger
BEFORE INSERT ON Participated
FOR EACH ROW
BEGIN
    IF NEW.damage_amount>50000 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT='Do not cross the limit of 50000 damage amount';
    END IF;
END//
DELIMITER;

INSERT INTO Person values("D777","Ross","Bogadi");
INSERT INTO Car values("KA-13-AB-4223","Swift",2020);
INSERT INTO Accident values(43649,'2020-04-05',"Ilvala");
INSERT INTO Participated values("D777","KA-13-AB-4223",43649,70000);    