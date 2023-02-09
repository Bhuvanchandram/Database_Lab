--Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott,’ either as a worker or as a manager of the department that controls the project.  
Select Pno from works_on where SSN=(Select SSN from Employee where ename LIKE "%Scott%");

--Update Salary
--In the question it is IoT, in the program it has been changed to ECE
Update Employee SET salary=salary+(0.10*salary) where Dno=(Select Dno from project where Pname LIKE "%ECE%");

--