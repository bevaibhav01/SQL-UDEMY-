--create temp table to store data 
CREATE TABLE #TempDepartments (
    DepartmentName NVARCHAR(100),
    ManagerName NVARCHAR(100),
    Budget DECIMAL(12, 2),
    EstablishedDate DATE
);

-- insert data into temporary departments table
INSERT INTO #TempDepartments (DepartmentName, ManagerName, Budget, EstablishedDate)
VALUES
('IT', 'Alice Johnson', 500000, '2010-01-01'),
('HR', 'Bob Smith', 200000, '2012-03-15'),
('Finance', 'Catherine Lee', 300000, '2011-06-20'),
('Marketing', 'David Brown', 250000, '2015-08-10'),
('Sales', 'Emma Davis', 400000, '2013-11-25'),
('Research', 'Frank Wilson', 600000, '2018-02-18'),
('Operations', 'Grace Martin', 450000, '2014-07-12'),
('Support', 'Hank Anderson', 220000, '2017-09-05'),
('Logistics', 'Ivy Turner', 380000, '2019-04-14'),
('Legal', 'Jack White', 310000, '2016-12-01');

-- insert unique records into the departments table
INSERT INTO Departments (DepartmentName, ManagerName, Budget, EstablishedDate)
SELECT 
    T.DepartmentName, T.ManagerName, T.Budget, T.EstablishedDate
FROM 
    #TempDepartments T
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM Departments D 
        WHERE D.DepartmentName = T.DepartmentName
    );

DROP TABLE #TempDepartments;


SELECT * FROM DEPARTMENTS;







