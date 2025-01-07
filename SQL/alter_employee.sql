-- unique constraint on the combination of FirstName, LastName, and Email
ALTER TABLE Employees
ADD CONSTRAINT UQ_EmployeeNameEmail UNIQUE (FirstName, LastName, Email);
