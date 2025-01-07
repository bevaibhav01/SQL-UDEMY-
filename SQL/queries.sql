-- Select all columns from the Departments table
SELECT * FROM Departments;

-- Select all columns from the Employees table
SELECT * FROM Employees;

-- Select employees from the HR department
SELECT * FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');


-- Select employees who are in the HR department and have a salary greater than 60000
SELECT * FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR')
AND Salary > 60000;


-- Select employees sorted by department and salary in descending order
SELECT FirstName, LastName, DepartmentID, Salary
FROM Employees
ORDER BY DepartmentID ASC, Salary DESC;


-- Select distinct job titles from the Employees table
SELECT DISTINCT JobTitle
FROM Employees;


-- Get the total number of employees in each department
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;

-- Get the total salary paid by each department
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;


-- Get the average salary in each department
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

-- Get the highest salary in each department
SELECT DepartmentID, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY DepartmentID;


-- Get the lowest salary in each department
SELECT DepartmentID, MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY DepartmentID;

-- Group employees by department and show the number of employees in each department
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;


-- Group employees by department and show departments that have more than 3 employees
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 3;


-- Select employee details along with their department name
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Select all employees and their departments, even if they don't belong to a department
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Select all departments and their employees, even if the department has no employees
SELECT D.DepartmentName, E.FirstName, E.LastName
FROM Employees E
RIGHT JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Select all employees and departments, even if they don't have a match in the other table
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
FULL OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Select employees and categorize their salary as 'High', 'Medium', or 'Low' based on thresholds
SELECT FirstName, LastName, Salary,
    CASE 
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

