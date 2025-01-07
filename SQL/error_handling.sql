BEGIN TRY
    -- Start a new transaction
    BEGIN TRANSACTION
    INSERT INTO Departments (DepartmentName, ManagerName, Budget, EstablishedDate)
    VALUES ('Marketing', 'David Brown', 250000, '2015-08-10');

    -- Attempt to insert an employee with a non-existent DepartmentID (e.g., 999)
    INSERT INTO Employees (FirstName, LastName, Email, Salary, HireDate, JobTitle, DepartmentID)
    VALUES ('Alice', 'Green', 'alice.green@example.com', 50000, '2024-01-01', 'Marketing Specialist', 999);  -- Invalid DepartmentID

    -- Commit the transaction if no error occurs
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully';

END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK TRANSACTION;

    -- Print error details
    PRINT 'Error occurred:';
    PRINT ERROR_MESSAGE();  -- will print the foreign key violation message
END CATCH;
