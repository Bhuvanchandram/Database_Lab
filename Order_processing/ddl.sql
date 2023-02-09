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
    FOREIGN KEY (Cust_num) REFERENCES Customer(Cust_num) ON Delete Cascade
);

CREATE TABLE Order_item
(
    Order_id INT(10),
    Item INT(10) primary key,
    qty INT(255),
    FOREIGN key (Order_id) REFERENCES Orders(Order_id) on delete Cascade
);

CREATE TABLE Item
(
    Item INT(10),
    unitprice INT(10),
    FOREIGN key (Item) REFERENCES Order_item(Item) on delete Cascade
);

CREATE TABLE shipment
(
    Order_id INT(10),
    warehouse INT(10) primary key,
    ship_date DATE,
    FOREIGN key (Order_id) REFERENCES Orders(Order_id) on delete Cascade
);

CREATE TABLE warehouse
(
    warehouse INT(10),
    city CHAR(50),
    FOREIGN key (warehouse) REFERENCES shipment(warehouse) on delete Cascade
);

--Inserting values into the table
INSERT INTO Customer values
(001,'Alex','Mysuru'),
(002,'Kumar','Mangaluru'),
(003,'Sam','Bengaluru'),
(004,'Robert','Mumbai'),
(005,'Donald','Delhi');

INSERT INTO Orders values
(001,'2022-01-14',001,2000),
(002,'2021-04-13',002,500),
(003,'2019-10-02',003,2500),
(004,'2019-05-12',004,1000),
(005,'2020-12-23',004,1200);

INSERT INTO Order_item values
(001,001,5),
(002,002,1),
(003,003,5),
(004,004,1),
(005,005,12);

INSERT INTO Item values
(001,400),
(002,200),
(003,1000),
(004,100),
(005,500);

INSERT INTO shipment values
(001,002,"2022-01-14"),
(002,001,"2021-04-13"),
(003,004,"2019-10-09"),
(004,003,"2019-05-16"),
(005,005,"2020-12-23");

INSERT into warehouse values
(001,"Mysuru"),
(002,"Mangaluru"),
(003,"Bengaluru"),
(004,"Mumbai"),
(005,"Delhi");  

--Alter tables
Alter table Item modify  unitprice INTEGER NOT NUll;
ALTER table Customer modify cname VARCHAR(25) NOT NUll;

--Display
Select * from Item;
Select * from Customer;

--Update 
Update Order_item SET qty=3 WHERE Order_id=002;

--Delete
Delete from warehouse WHERE warehouse=004;