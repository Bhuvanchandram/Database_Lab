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
(001,"Priya","ECE",'2002-01-06'),
(001,"Ria","CSBS",'2002-01-04'),
(001,"Ashley","MECH",'2002-01-03'),
(001,"Maurice","ISE",'2002-01-02');

INSERT INTO 