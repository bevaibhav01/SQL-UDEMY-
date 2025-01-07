-- Create the Departments table
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Departments' AND xtype='U')
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    ManagerName NVARCHAR(100),
    Budget DECIMAL(12, 2) NOT NULL,
    EstablishedDate DATE
);