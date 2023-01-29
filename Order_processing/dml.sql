--Using Like operator
Select * from Customer where city LIKE "%sur%";

--USing Between operator
Select * from Order_item where Order_id BETWEEN 2 and 4;

--Using where operator
Select * from Item where Item=3;

--Using Order By operator
Select * from shipment ORDER BY ship_date;
Select * from shipment ORDER BY ship_date desc;

--Set operations
Select Item from Order_item
UNION
Select unitprice from Item;

Select city from warehouse
INTERSECT
Select city from Customer;

--Exits 
Select * from Item where Exits (Select * from Order_item where Order_item.Order_id=003);

--JOIN Operation
Select * from Order_item
JOIN Item ON Order_item.Item=Item.Item;

--Aggregate functions
SELECT SUM(qty) from Order_item;
SELECT AVG(qty) from Order_item;
SELECT MIN(qty) from Order_item;
SELECT MAX(qty) from Order_item;

--GROUP BY 
SELECT Item,AVG(qty)
FROM Order_item
WHERE Order_id BETWEEN 1 AND 5
GROUP BY Item;

--GROUP BY HAVING
SELECT Item,MAX(qty)
FROM Order_item
GROUP BY Item
HAVING MAX(qty) = 5;

