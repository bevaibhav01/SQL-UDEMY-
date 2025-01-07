CREATE PROCEDURE GetEmployeeSalary 
    @EmployeeID INT
AS
BEGIN
    -- Select the salary of the employee based on EmployeeID
    SELECT Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
END;


EXEC GetEmployeeSalary @EmployeeID = 1; 


EXEC GetEmployeeSalary @EmployeeID = 3; 
