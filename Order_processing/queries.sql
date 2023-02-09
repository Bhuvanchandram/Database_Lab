--List order_id and ship date from all orders shipped from Warehouse 2
Select order_id,ship_date from shipment where warehouse='002';

--List the Warehouse information from which the Customer named "Kumar" was supplied his orders
Select warehouse.warehouse,warehouse.city from warehouse
JOIN shipment ON warehouse.warehouse=shipment.warehouse
JOIN ORDERS ON Orders.Order_id=shipment.order_id
JOIN Customer ON Customer.Cust_num=Orders.Cust_num
WHERE Customer.cname LIKE "%kumar%";

--Produce a listing: Cname, #ofOrders, Avg_Order_Amt, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer.
Select customer.cname,COUNT(Order_id),AVG(Order_amt) 
FROM Orders
JOIN Customer ON Orders.Cust_num=Customer.Cust_num;

--Delete all orders from the customer named Kumar
Delete from Orders where Cust_num=(Select Cust_num from Customer where cname LIKE "%Kuamr");

--Find the item with the maximum unit price
Select * from Item where unitprice=(Select MAX(unitprice) from Item);

--A view to display orderID and shipment date of all orders shipped from a warehouse 2. 
CREATE VIEW View1 AS
Select Order_id,ship_date from shipment WHERE warehouse='002';

Select * from View1;

--Create a view that shows the warehouse name from where Kumar's order is being shipped
--Note:Do not forget to add back the details of Kumar after deleting from the previous query
CREATE VIEW View2 AS
Select warehouse.warehouse,warehouse.city from warehouse
JOIN shipment ON warehouse.warehouse=shipment.warehouse
JOIN ORDERS ON Orders.Order_id=shipment.order_id
JOIN Customer ON Customer.Cust_num=Orders.Cust_num
WHERE Customer.cname LIKE "%kumar%";

Select * from View2;

--A trigger that updates order_amount based on quantity and unit price of order_item .
DELIMITER //
CREATE TRIGGER trigger1
AFTER INSERT ON Order_item
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET Order_amt = Order_amt + (NEW.qty * (SELECT unitprice FROM Item WHERE Item.Item = NEW.Item))
    WHERE Order_id = NEW.Order_id;
END //
DELIMITER ;