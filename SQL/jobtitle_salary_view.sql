CREATE VIEW JobTitleSalaryView
AS
SELECT DISTINCT JobTitle,Salary
FROM Employees;

SELECT * FROM JobTitleSalaryView;