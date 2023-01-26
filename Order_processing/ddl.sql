--CREATE Database
CREATE Database Order_processing;

--Using Order Processing database
USE Order_processing;

--Creating tables
CREATE table Customer
(
    Cust_num INT(10) primary key,
    cname CHAR(25),
    city CHAR(25)
);

CREATE TABLE Orders
(
    Order_id INT(10) PRIMARY KEY,
    odate DATE,
    Cust_num INT(10),
    Order_amt INT(6),
    FOREIGN KEY (Cust_num) REFERENCES Customer(Cust_num)
);


CREATE TABLE Order_item
(
    Order_id INT(10),
    Item INT(10) primary key,
    qty INT(255),
    FOREIGN key (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Item
(
    Item INT(10),
    unitprice INT(10),
    FOREIGN key (Item) REFERENCES Order_item(Item)
);

CREATE TABLE shipment
(
    Order_id INT(10),
    warehouse INT(10) primary key,
    ship_date DATE,
    FOREIGN key (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE warehouse
(
    warehouse INT(10),
    city CHAR(50),
    FOREIGN key (warehouse) REFERENCES shipment(warehouse)
);

--Inserting values into the table
