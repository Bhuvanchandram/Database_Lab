--Inserting Extra values
INSERT INTO Sailors values
('S666','Raechal',4,23),
('S777','Robin',2,20);

INSERT INTO Boat values
('B116','Tweety','Violet'),
('B117','Roger','Pink');

INSERT into Rservers values
('S666','B116','2017-11-26'),
('S777','B117','2015-04-04');

--LIKE Operation
SELECT * from Boat where bname LIKE "%ger";

--BETWEEN Operator
SELECT * from Sailors where age BETWEEN 26 and 30;

--JOIN Operator
SELECT sailors.sname,Boat.bname,Rservers.date FROM Sailors
INNER JOIN Rservers on sailors.sid=Rservers.sid
INNER JOIN Boat on Rservers.bid=Boat.bid
WHERE rating=(SELECT MIN(rating) FROM sailors);

--Having Order by 
SELECT color, COUNT(bid) as count_bid FROM Boat 
GROUP BY color 
HAVING COUNT(bid) >= 1 
ORDER BY count_bid desc;