--Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott,’ either as a worker or as a manager of the department that controls the project.  
Select Pno from works_on where SSN=(Select SSN from Employee where ename LIKE "%Scott%");

--Update Salary
--In the question it is IoT, in the program it has been changed to ECE
Update Employee SET salary=salary+(0.10*salary) where Dno=(Select Dno from project where Pname LIKE "%ECE%");

--Retrieve the name of each employee who works on all the projects controlled by department number 5 
Select ename from Employee where SSN=(Select SSN from works_on where Pno=(Select Pno from project where Dno=5) GROUP BY SSN Having COUNT(Pno)=(Select COUNT(*) from project WHERE Dno=5));

--For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000. 
