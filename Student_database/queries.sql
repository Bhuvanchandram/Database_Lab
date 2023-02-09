--Demonstrate how you add a new text book to the database and make this book be adopted by some department.  
INSERT INTO Text values
(0125,"AI5","Penguin House","Author_10");

--Produce a list of textbooks including Course_id, Book_ISBN, Book_Title in the alphabetical order for Courses offered by CS department 
--Here it has been sorted by the order of Course ID
Select Text.book_ISBN,Text.title,Book_adoption.course_id 
from Text
JOIN Book_adoption ON Book_adoption.book_ISBN=Text.book_ISBN
ORDER BY course_id ASC;

--List any department that has all of its adopted books specified by a specific publisher
SELECT  dept
FROM Course 
JOIN Book_adoption  ON Course.course_id = Book_adoption.course_id
JOIN Text ON Book_adoption.book_ISBN = Text.book_ISBN
GROUP BY dept, publisher
HAVING count(Text.book_ISBN) = count(*) AND publisher LIKE "%penguin";

--Write a query to show a student who has scored maximum marks in DBMS
--Ensure to enter the values having subject DBMS as well. The following data will return the empty set
SELECT Student.regno, Student.sname, marks
FROM Student 
JOIN Enroll  ON Student.regno = Enroll.regno
JOIN Course  ON Enroll.course_id = Course.course_id
WHERE cname LIKE "%DBMS%";

--Create a view to display all the courses opted by a student aong with the marks obtained 
CREATE VIEW View1 AS
Select Course.course_id,Course.cname,Course.dept,Enroll.marks from Course
JOIN Enroll ON Enroll.course_id=Course.course_id;

Select * from View1;

--Create a view to show the enrolled details of a student
CREATE VIEW View2 AS
Select * from Enroll;

Select * from View2;

--View to display course related books from Course adoption and Textbook table using Book_ISBN
CREATE VIEW View3 AS
Select Book_adoption.book_ISBN,Book_adoption.course_id,Book_adoption.sem,Text.title,Text.publisher,Text.author from Book_adoption
JOIN Text ON Text.book_ISBN=Book_adoption.book_ISBN;

Select * from View3;

--Trigger 1
DELIMITER //
CREATE TRIGGER Trigger1
AFTER DELETE ON Course
FOR EACH ROW
BEGIN
    DELETE FROM Enroll WHERE course_id = OLD.course_id;
END //
DELIMITER ;

--Trigger 2
--Let the prerequisite be 50 marks
DELIMITER //
CREATE TRIGGER Trigger2
BEFORE INSERT ON Enroll
FOR EACH ROW
BEGIN 
    IF new.marks<50
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='The student does not qualify to enroll for the following course due to low marks';
    END IF;
END //
DELIMITER ;
