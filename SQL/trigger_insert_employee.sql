
CREATE TRIGGER Employee_Insert_Trigger
ON Employees
AFTER INSERT
AS 
BEGIN
PRINT 'Insertion Not Allowed.'
ROLLBACK TRANSACTION
END

INSERT INTO Employees (FirstName, LastName, Email, Salary, HireDate, JobTitle, DepartmentId)
VALUES
('Vaibhav', 'M', 'Vai.doe@company.com', 60000, '2021-01-15', 'Software Engineer', 1)

