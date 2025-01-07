
CREATE PROCEDURE GetDepartmentBudget 
    @DepartmentID INT,
    @Budget DECIMAL(12, 2) OUTPUT
AS
BEGIN
    -- Try to get the budget for the given DepartmentID
    BEGIN TRY
        SELECT @Budget = Budget
        FROM Departments
        WHERE DepartmentID = @DepartmentID;
        
        -- If no data is found, set the output to NULL
        IF @Budget IS NULL
        BEGIN
            PRINT 'Department not found.';
        END
    END TRY
    BEGIN CATCH
        -- Handle any errors
        PRINT 'An error occurred.';
    END CATCH;
END;


DECLARE @DepartmentBudget DECIMAL(12, 2);

-- Execute the stored procedure with a specific DepartmentID
EXEC GetDepartmentBudget @DepartmentID = 3, @Budget = @DepartmentBudget OUTPUT;

-- Display the result
SELECT @DepartmentBudget AS DepartmentBudget;

