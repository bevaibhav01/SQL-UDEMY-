SELECT 
    E.EmployeeID,                    
    ROW_NUMBER() OVER (ORDER BY E.Salary DESC) AS RowNumber,   -- Assign a unique row number ordered by Salary in descending order
    RANK() OVER (ORDER BY E.Salary DESC) AS Rank,              -- Assign ranks based on Salary; ties will have the same rank with gaps
    DENSE_RANK() OVER (ORDER BY E.Salary DESC) AS DenseRank,   -- Assign ranks based on Salary; ties will have the same rank without gaps
    NTILE(4) OVER (ORDER BY E.Salary DESC) AS Quartile         -- Divide employees into 4 equal parts based on Salary, assign each employee a quartile
FROM Employees E;                                              -- From the Employees table (aliased as 'E')
