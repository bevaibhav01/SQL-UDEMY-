CREATE FUNCTION GetEmployeesByDepartment (@DepartmentID INT)
RETURNS TABLE
AS
RETURN
(
    -- Query to return employees for the given DepartmentID
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE DepartmentID = @DepartmentID
);


-- Get employees of department with DepartmentID = 1 
SELECT * 
FROM dbo.GetEmployeesByDepartment(2);
