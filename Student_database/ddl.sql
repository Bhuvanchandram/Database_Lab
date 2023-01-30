--Creating a database
CREATE database Student_details;

--USE details
Use Student_details;

--Creating tables
CREATE table Student
(
    regno INT(10) primary key,
    sname CHAR(15),
    major CHAR(15),
    bdate DATE
);

CREATE TABLE Course
(
    course_id INT(10) primary key,
    cname CHAR(15),
    dept CHAR(15)
);

CREATE TABLE Enroll
(
    regno INT(10),
    course_id INT(10),
    sem INT(2),
    marks INT(3),
    FOREIGN KEY (regno) REFERENCES Student(regno) ON Delete CASCADE,
    FOREIGN key (course_id) REFERENCES Course(course_id) ON DELETE CASCADE
);

CREATE table Book_adoption
(
    course_id INT(10),
    sem INT(2),
    book_ISBN INT(10) primary key,
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON Delete CASCADE
);

CREATE table Text   
(
    book_ISBN INT(10),
    title CHAR(15),
    publisher CHAR(15),
    author CHAR(15),
    FOREIGN KEY (book_ISBN) REFERENCES Book_adoption(book_ISBN) on Delete CASCADE
);

--Inserting the values into the tables
INSERT INTO Student values
(001,"Alice","CSE",'2002-01-01'),
(002,"Priya","ECE",'2002-01-06'),
(003,"Ria","CSBS",'2002-01-04'),
(004,"Ashley","MECH",'2002-01-03'),
(005,"Maurice","ISE",'2002-01-02');

INSERT INTO Course values
(001,"AI","CSE"),
(002,"CN","CSE"),
(003,"Web Tech","ISE"),
(004,"Sensors","ECE"),
(005,"transistors","EEE");

INSERT INTO Enroll values
(001,001,5,70),
(001,002,5,80),
(005,003,5,85),
(002,004,5,54),
(002,005,5,48);

INSERT INTO Book_adoption values
(001,5,0125),
(002,5,0126),
(003,5,0127),
(004,5,0128),
(005,5,0129);

INSERT INTO Text values
(0125,"AI1","Penguin","Author_1"),
(0126,"AI2","PacMillan","Author_2"),
(0127,"AI3","Penguin","Author_3"),
(0128,"DBMS 1","Arihant","Author_4"),
(0129,"DBMS 2","Pearson","Author_5");

--ALTER Table
ALTER TABLE Book_adoption modify course_id INT NOT NULL;
ALTER TABLE Text modify title CHAR NOT NULL;

--Display the details
Select * from Text;
Select * from Book_adoption;
Select * from Enroll;
Select * from Course;
Select * from Student;

--Update operation
Update Book_adoption SET sem=6 WHERE course_id=002;

--Delete operation
Select * from Enroll;
Delete from Enroll where regno=001;
Select * from Enroll;

INSERT INTO Enroll values
(001,001,5,70),
(001,002,5,80);

--Display the details
Select * from Text;
Select * from Book_adoption;
Select * from Enroll;
Select * from Course;
Select * from Student;