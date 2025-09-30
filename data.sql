-- ================================
-- Insert data into Departments
-- ================================
INSERT INTO Departments (DeptName) VALUES
('HR'),
('IT'),
('Finance'),
('Sales');

-- ================================
-- Insert data into Employees
-- ================================
INSERT INTO Employees (Name, DepartmentID, Salary) VALUES
('Alice', 2, 70000),
('Bob', 2, 80000),
('Charlie', 1, 50000),
('Diana', 3, 90000),
('Evan', 4, 60000);

-- ================================
-- Insert data into Salaries
-- ================================
INSERT INTO Salaries (EmpID, Amount, EffectiveDate) VALUES
(1, 65000, '2023-01-01'),
(1, 70000, '2024-01-01'),
(2, 75000, '2023-06-01'),
(2, 80000, '2024-01-01'),
(4, 85000, '2023-03-01'),
(4, 90000, '2024-01-01');
```
