--Color of boats reserved by Albert
SELECT sailors.sname,Boat.color FROM Sailors
INNER JOIN Rservers on sailors.sid=Rservers.sid
INNER JOIN Boat on Rservers.bid=Boat.bid
WHERE sname="Albert";

--Find all sailors id's of sailors who have a rating of at least 3 or reserved boat 117
SELECT sailors.SID,sailors.sname FROM Sailors
INNER JOIN Rservers on sailors.sid=Rservers.sid
WHERE rating>3 or Rservers.bid=117; 

--Insertion of new data into the list
INSERT INTO Sailors values
('S888','Sandstorm',1,23),
('S999','Bill Storm',7,35),
('S105','George Trump',10,49);

INSERT INTO Boat values
('B118','Tinky','Purple'),
('B119','Rider','Indigo');

INSERT into Rservers values
('S888','B118','2015-01-01'),
('S105','B119','2017-05-31');

--Not reserved a boat whose name conatins the string "Storm"
SELECT sailors.sname FROM Sailors
LEFT JOIN Rservers on sailors.sid=Rservers.sid
WHERE sailors.sname LIKE "%storm%" AND Rservers.Bid IS NULL;

--Names of Sailors who have reserved all boats
INSERT into Rservers values
('S111','B112','2020-05-31'),
('S111','B114','2019-02-21'),
('S111','B115','2018-04-05'),
('S111','B116','2017-11-12'),
('S111','B117','2017-11-12'),
('S111','B118','2017-11-12'),
('S111','B119','2017-11-12');

SELECT Sailors.sname
FROM Sailors
JOIN Rservers ON Sailors.sid = Rservers.sid
GROUP BY Sailors.sname, Sailors.sid
HAVING COUNT(Rservers.bid) = (SELECT COUNT(*) FROM Boat);

--Name and age of oldest sailor
SELECT sname,age FROM Sailors WHERE age=(SELECT MAX(Sailors.age) FROM Sailors);

--Each boat which was reserved by atleast 5 sailors with age>=40, finding thier boat id and the average age of such sailors
SELECT Rservers.bid, AVG(Sailors.age) as avg_age
FROM Rservers
JOIN Sailors ON Rservers.sid = Sailors.sid
WHERE Sailors.age >= 40
GROUP BY Rservers.bid
HAVING COUNT(Rservers.sid) >= 5;

--View
CREATE VIEW View1 as
Select sname,rating FROM Sailors
ORDER by rating desc;

Select * from View1;

--Trigger
DELIMITER //
CREATE TRIGGER prevent_boat_deletion
BEFORE DELETE ON Boat
FOR EACH ROW
BEGIN
    DECLARE reservation_count INT;
    SELECT COUNT(*) INTO reservation_count
    FROM Rservers
    WHERE Rservers.bid = OLD.bid;
    IF reservation_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete boat with active reservations';
    END IF;
END//
DELIMITER ;

DELETE FROM Boat WHERE bid="B115";