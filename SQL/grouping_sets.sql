SELECT 
    D.DepartmentID,
    D.DepartmentName,
    D.ManagerName,
    SUM(E.Salary) AS TotalSalary,
    COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY GROUPING SETS (
    (D.DepartmentID, D.DepartmentName, D.ManagerName),
    (D.DepartmentID, D.DepartmentName),
    (D.DepartmentID)
);

-----cube-----------
SELECT 
    D.DepartmentID,
    D.DepartmentName,
    D.ManagerName,
    SUM(E.Salary) AS TotalSalary,
    COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY CUBE (D.DepartmentID, D.DepartmentName, D.ManagerName);


--roll up-----
SELECT 
    D.DepartmentID,
    D.DepartmentName,
    D.ManagerName,
    SUM(E.Salary) AS TotalSalary,
    COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY ROLLUP (D.DepartmentID, D.DepartmentName, D.ManagerName);



