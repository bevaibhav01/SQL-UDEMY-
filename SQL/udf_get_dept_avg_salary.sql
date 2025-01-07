CREATE FUNCTION GetDepartmentAverageSalary (@DepartmentID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @AvgSalary DECIMAL(10, 2);
    
    -- Calculate the average salary for the given DepartmentID
    SELECT @AvgSalary = AVG(Salary)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;

    -- Return the result
    RETURN @AvgSalary;
END;


-- Get the average salary for department 1 
SELECT dbo.GetDepartmentAverageSalary(1) AS AverageSalary; 




