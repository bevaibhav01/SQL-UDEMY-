CREATE VIEW EmployeeManagerView
AS
SELECT e.FirstName,e.LastName,d.ManagerName 
FROM Employees AS e
INNER JOIN 
Departments AS d
ON
e.DepartmentId=d.DepartmentId;

SELECT * FROM EmployeeManagerView;