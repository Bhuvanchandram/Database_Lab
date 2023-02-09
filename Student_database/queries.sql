--Demonstrate how you add a new text book to the database and make this book be adopted by some department.  
INSERT INTO Text values
(0125,"AI5","Penguin House","Author_10");

--Produce a list of textbooks including Course_id, Book_ISBN, Book_Title in the alphabetical order for Courses offered by CS department 
--Here it has been sorted by the order of Course ID
Select Text.book_ISBN,Text.title,Book_adoption.course_id 
from Text
JOIN Book_adoption ON Book_adoption.book_ISBN=Text.book_ISBN
ORDER BY course_id ASC;

--