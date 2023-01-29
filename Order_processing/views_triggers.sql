--Creating Views
CREATE View View1 as
Select Item,qty
FROM Order_item
WHERE Order_id BETWEEN 1 AND 3;

Select * from View1;

DROP VIEW View1;


--Triggers
DELIMITER //
CREATE TRIGGER less_qty
BEFORE INSERT ON Order_item
FOR EACH ROW
BEGIN
    IF reservation_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete boat with active reservations';
    END IF;
END//
DELIMITER ;

INSERT INTO Customer values
(006,'Sam','Mysuru');

INSERT INTO Orders values
(006,'2022-01-14',006,2000);

INSERT INTO Order_item values
(006,006,3);
