--Find the total number of people who owned cars that were involved in accidents in 2021
Select COUNT(*) from Accident WHERE acc_date BETWEEN '2021-01-01' AND '2021-12-31';

--Find the number of accidents in which the cars belonging to “Smith” were involved. 
Select COUNT(*) FROM Participated WHERE driver_id=(Select driver_id from Person WHERE name LIKE "%Smith");

--Add a new accident to the database; assume any values for required attributes
INSERT INTO Accident values
(1205,'2020-05-31','Bengaluru');

--Delete Mazda belonging to Smith
Select * from Car;
Delete from Car WHERE Model='Mazda' AND Reg_no=(Select Reg_no from Owns where driver_id=(Select driver_id from Person WHERE name LIKE '%Smith'));
Select * from Car;

--Update the damage amount for the car with license number “KA09MA1234” in the accident with report
Update Participated SET damage_amount=20000 where Reg_no='KA09MA1234';

--A view that shows models and year of cars that are involved in accident. 
CREATE VIEW View1 AS
Select Model,year from Car;

Select * from View1;
