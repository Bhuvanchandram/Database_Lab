--JOIN operators
SELECT Person.name,car.Model FROM Person
INNER JOIN owns ON Person.driver_id=owns.driver_id
INNER JOIN car ON owns.Reg_no=car.Reg_no;

--WHERE operator
SELECT Accident.report_number,Accident.location,Person.name FROM Participated
JOIN Person ON Participated.driver_id=Person.driver_id
JOIN Car ON Participated.Reg_no=car.Reg_no
JOIN Accident ON Participated.report_number=Accident.report_number
WHERE Accident.acc_date BETWEEN "2020-01-01" AND "2021-12-12"
ORDER BY Participated.damage_amount;

--Using GROUP BY operator
SELECT Car.Model, COUNT(Participated.report_number) FROM Participated
JOIN Car ON Participated.Reg_no=Car.Reg_no
GROUP BY Car.Model HAVING COUNT(Participated.report_number)>=2;

--Using Order by
SELECT * from Accident ORDER BY acc_date;