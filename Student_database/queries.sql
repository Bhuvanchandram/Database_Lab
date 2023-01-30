--Add new Textbook into the department
INSERT INTO Course values
(006,"DBMS","CSE");
INSERT INTO Book_adoption values
(006,6,0215);
INSERT INTO Text values
(0215,"DBMS2","Penguin","Author_6");

--Display Course ID,Book_ISBN and Book Title in alpahbetical order
Select Book_adoption.course_id,Text.book_ISBN,Text.title
FROM Book_adoption
JOIN Text ON Book_adoption.book_ISBN=Text.book_ISBN
JOIN Course ON Book_adoption.course_id=Course.course_id
WHERE Course.dept LIKE "%CSE%";

--

--List the students who have scored maximum marks in AI

--Create a View
CREATE VIEW student_courses AS
SELECT Student.regno, Student.sname, Course.course_id, Course.cname, Enroll.marks
FROM Student
JOIN Enroll ON Student.regno = Enroll.regno
JOIN Course ON Enroll.course_id = Course.course_id;

Select * from student_courses;

--Create Trigger
