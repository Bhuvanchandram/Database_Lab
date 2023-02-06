--Colors of boat reserved by Albert
Select color from Boat where BID=(Select BID from Rservers WHERE SID=(Select SID from Sailors WHERE sname="Albert"));

--Select the sailors who have the rating 8 pr above or reserved the boat 103
Select * from Sailors where rating>8 OR SID=(Select SID from Rservers WHERE bid=103);

--Names of sailors who have not reserved the boat and whose names contains string Storm
Select sname from Sailors 
JOIN Rservers ON Rservers.sid=Sailors.SID 
WHERE bid IS NULL AND Sailors.sname LIKE "%storm%";

--Names of Sailors who have reserved all boat
Select * from Sailors
JOIN Rservers ON Rservers.sid=Sailors.SID
JOIN Boat ON Boat.BID=Rservers.bid
HAVING COUNT(Rservers.bid) = (SELECT COUNT(*) FROM Boat);

--Name and age of the oldest sailor
Select sname,age from Sailors where age=(Select Max(age) from Sailors);

--For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors. 
Select bid,AVG(age) from Sailors
JOIN Rservers on Rservers.sid=Sailors.SID
JOIN Boat on Rservers.bid=Boat.BID
WHERE 

--View showing names and ratings of all sailors sorted by rating in descending order
CREATE VIEW View1 AS
Select sname,rating from Sailors order by rating desc;

Select * from View1;

-- View showing the names of the sailors who have reserved a boat on a given date.
CREATE VIEW View2 AS
Select sname from Sailors
JOIN Rservers ON Rservers.sid=Sailors.SID
WHERE Rservers.date='2020-05-31';

Select * from View2;

--View showing names and color of all boats that have reserved a Sailor with a specific rating
CREATE VIEW View3 AS
Select bname,color from Boat
JOIN Rservers ON Rservers.bid=Boat.BID
JOIN Sailors ON Sailors.SID=Rservers.sid
WHERE rating>2;

Select * from View3;

--Trigger that prevents boats from being deleted If they have active reservations
Delimiter //
CREATE TRIGGER trigger1
BEFORE DELETE ON Boat
FOR EACH ROW
BEGIN
    DECLARE reservation_count INT;
    Select COUNT(*) INTO reservation_count
    FROM Rservers
    WHERE Rservers.bid=OLD.bid;

    IF reservation_count>0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cannot delete a reserved boat';
    END IF;
END //

Delimiter ;

DELETE from Boat WHERE bid='B111';

--Trigger that prevents sailors with rating less than 3 from reserving a boat
DELIMITER //
CREATE TRIGGER trigger2
BEFORE INSERT ON Rservers
FOR EACH ROW
BEGIN 
    DECLARE sailor_rating INT;
    Select rating INTO sailor_rating
    FROM Sailors
    WHERE Sailors.SID=NEW.sid;

    IF sailor_rating<3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cannote reserve a boat to the sailor having rating less than 3';
    END IF;
END //
Delimiter ;

INSERT INTO Rservers values 
('S222','B777','2021-01-01');

--Trigger that deletes all expired reservations
DELIMITER //
CREATE TRIGGER delete_expired_reservations
AFTER INSERT ON Rservers
FOR EACH ROW
BEGIN
    DELETE FROM Rservers
    WHERE date < NOW() AND sid = NEW.sid AND bid = NEW.bid;
END //
DELIMITER ;