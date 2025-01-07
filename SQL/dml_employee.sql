--create temp table for employee
CREATE TABLE #TempEmployees (
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle NVARCHAR(50),
    DepartmentName NVARCHAR(100) -- Reference DepartmentName to ensure consistency
);

-- insert data into temporary Employees table
INSERT INTO #TempEmployees (FirstName, LastName, Email, Salary, HireDate, JobTitle, DepartmentName)
VALUES
('John', 'Doe', 'john.doe@company.com', 60000, '2021-01-15', 'Software Engineer', 'IT'),
('Jane', 'Smith', 'jane.smith@company.com', 70000, '2022-05-10', 'System Analyst', 'IT'),
('Michael', 'Johnson', 'michael.johnson@company.com', 50000, '2020-03-20', 'Recruiter', 'HR'),
('Emily', 'Clark', 'emily.clark@company.com', 55000, '2023-09-12', 'HR Specialist', 'HR'),
('David', 'Brown', 'david.brown@company.com', 80000, '2019-11-30', 'Accountant', 'Finance'),
('Sophia', 'Williams', 'sophia.williams@company.com', 75000, '2022-07-25', 'Marketing Manager', 'Marketing'),
('Chris', 'Taylor', 'chris.taylor@company.com', 68000, '2021-10-14', 'Sales Executive', 'Sales'),
('Oliver', 'Lee', 'oliver.lee@company.com', 77000, '2023-04-18', 'Research Scientist', 'Research'),
('Grace', 'Wilson', 'grace.wilson@company.com', 63000, '2022-01-11', 'Operations Manager', 'Operations'),
('Ethan', 'Davis', 'ethan.davis@company.com', 50000, '2023-05-03', 'Support Engineer', 'Support');

-- insert unique records into the Employees table
INSERT INTO Employees (FirstName, LastName, Email, Salary, HireDate, JobTitle, DepartmentID)
SELECT 
    T.FirstName, T.LastName, T.Email, T.Salary, T.HireDate, T.JobTitle, D.DepartmentID
FROM 
    #TempEmployees T
JOIN 
    Departments D ON T.DepartmentName = D.DepartmentName
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM Employees E 
        WHERE E.Email = T.Email
    );

-- Drop temporary Employees table
DROP TABLE #TempEmployees;


-- Update the salary and job title of an employee
UPDATE Employees
SET Salary = 75000, JobTitle = 'Senior Software Engineer'
WHERE EmployeeID = 1;
