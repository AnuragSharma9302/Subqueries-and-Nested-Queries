-- ================================
-- Employees Table
-- ================================
CREATE TABLE Employees (
    EmpID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary NUMERIC(10,2)
);

-- ================================
-- Departments Table
-- ================================
CREATE TABLE Departments (
    DeptID SERIAL PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- ================================
-- Salaries Table (for historical tracking)
-- ================================
CREATE TABLE Salaries (
    SalaryID SERIAL PRIMARY KEY,
    EmpID INT REFERENCES Employees(EmpID),
    Amount NUMERIC(10,2),
    EffectiveDate DATE
);
```
