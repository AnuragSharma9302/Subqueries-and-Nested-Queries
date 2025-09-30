-- ======================================
-- Scalar Subqueries
-- ======================================

-- 1. Employees earning above company average
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 2. Highest paid employee
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 3. Employees whose salary equals the minimum salary
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

-- ======================================
-- Correlated Subqueries
-- ======================================

-- 4. Employees earning above their department average
SELECT Name, Salary
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 5. Employees with salary higher than at least one colleague in the same dept
SELECT Name, Salary
FROM Employees e
WHERE Salary > (
    SELECT MIN(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- 6. Employees with salary equal to department maximum
SELECT Name, Salary
FROM Employees e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- ======================================
-- IN Subqueries
-- ======================================

-- 7. Employees working in IT or Sales departments
SELECT Name
FROM Employees
WHERE DepartmentID IN (
    SELECT DeptID FROM Departments WHERE DeptName IN ('IT', 'Sales')
);

-- 8. Employees with historical salaries above 80,000
SELECT Name
FROM Employees
WHERE EmpID IN (
    SELECT EmpID FROM Salaries WHERE Amount > 80000
);

-- ======================================
-- EXISTS Subqueries
-- ======================================

-- 9. Employees having salary history
SELECT Name
FROM Employees e
WHERE EXISTS (
    SELECT 1 FROM Salaries s WHERE s.EmpID = e.EmpID
);

-- 10. Employees with no salary history
SELECT Name
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1 FROM Salaries s WHERE s.EmpID = e.EmpID
);

-- ======================================
-- FROM Subqueries (Derived Tables)
-- ======================================

-- 11. Max salary per department
SELECT DeptName, MAX(Salary) AS MaxSalary
FROM (
    SELECT e.DepartmentID, e.Salary, d.DeptName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DeptID
) AS dept_salaries
GROUP BY DeptName;

-- 12. Department average salaries
SELECT DeptName, AVG(Salary) AS AvgSalary
FROM (
    SELECT e.Salary, d.DeptName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DeptID
) AS dept_avg
GROUP BY DeptName;

-- 13. Top 2 highest salaries company-wide
SELECT Name, Salary
FROM (
    SELECT Name, Salary, RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM Employees
) AS ranked
WHERE rnk <= 2;

-- ======================================
-- Nested Queries in SELECT
-- ======================================

-- 14. Show employee salary and company average side by side
SELECT Name, Salary,
       (SELECT AVG(Salary) FROM Employees) AS CompanyAvg
FROM Employees;

-- 15. Show employee salary and their department average
SELECT Name, Salary,
       (SELECT AVG(Salary) 
        FROM Employees e2
        WHERE e2.DepartmentID = e1.DepartmentID) AS DeptAvg
FROM Employees e1;

-- ======================================
-- Advanced Subqueries
-- ======================================

-- 16. Employees who earn more than any HR employee
SELECT Name, Salary
FROM Employees
WHERE Salary > ANY (SELECT Salary FROM Employees WHERE DepartmentID = 1);

-- 17. Employees who earn more than all HR employees
SELECT Name, Salary
FROM Employees
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE DepartmentID = 1);

-- 18. Latest salary record per employee (using correlated subquery)
SELECT s.EmpID, s.Amount, s.EffectiveDate
FROM Salaries s
WHERE EffectiveDate = (
    SELECT MAX(EffectiveDate)
    FROM Salaries
    WHERE EmpID = s.EmpID
);

-- 19. Employees who have more than one salary record
SELECT EmpID
FROM Salaries
GROUP BY EmpID
HAVING COUNT(*) > 1;

-- 20. Departments with employees earning above 75,000
SELECT DISTINCT DeptName
FROM Departments d
WHERE d.DeptID IN (
    SELECT DepartmentID FROM Employees WHERE Salary > 75000
);
```
