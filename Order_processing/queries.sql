--Order ID and Shipment date shipped from warehouse Bengaluru
Select Order_id,ship_date from shipment WHERE warehouse = (Select warehouse from warehouse where warehouse="Bengaluru");

--Warehouse information from which Customer named "Alice" was supplied thier orders
SELECT warehouse.city
FROM shipment
INNER JOIN Orders ON shipment.Order_id = Orders.Order_id
INNER JOIN Customer ON Orders.Cust_num = Customer.Cust_num
INNER JOIN warehouse ON shipment.warehouse = warehouse.warehouse
WHERE Customer.cname = 'Alice';

--Produce cname,oforders,Avg_order_amt


--Delete all orders for customers named "Alice"
Select * from Orders;
Delete from Orders where Cust_num=(Select Cust_num from Customer where cname="Alice");
Select * from Orders;
INSERT INTO Orders values
(002,'2021-04-13',002,500);

--Select Item having Maximum price
Select * from Item having Max(unitprice);

--Views
CREATE View View1 as
Select Order_id,ship_date from shipment where warehouse=2;

Select * from View1;