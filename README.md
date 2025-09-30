# 📝Subqueries-and-Nested-Queries



## 🎯 Objective

Master **subqueries and nested queries** in SQL to filter, aggregate, and derive insights from relational databases.

---

## 📂 Project Structure

```
task6-subqueries/
│── README.md       # Documentation + Concepts + Questions
│── schema.sql      # Table creation
│── data.sql        # Insert sample data
│── queries.sql     # Subquery practice queries
```

---

## 📘 Key Concepts

🔍 **What is a Subquery?**
A query written inside another query to provide filtering, calculation, or derived logic.

### 🔹 Types of Subqueries

* 🟦 **Scalar Subquery** → Returns a single value (e.g., AVG, MAX).
* 🟩 **Correlated Subquery** → Depends on values from the outer query.
* 🟧 **IN Subquery** → Filters results based on multiple values.
* 🟥 **EXISTS Subquery** → Checks whether rows exist.
* 🟨 **Derived Table (FROM Subquery)** → Treats subquery results as a virtual table.

---

## 📑 Example ER Diagram

```dbml
Table Employees {
  EmpID serial [pk]
  Name varchar(50)
  DepartmentID int
  Salary numeric(10,2)
}

Table Departments {
  DeptID serial [pk]
  DeptName varchar(50)
}

Table Salaries {
  SalaryID serial [pk]
  EmpID int [ref: > Employees.EmpID]
  Amount numeric(10,2)
  EffectiveDate date
}
```

📌 **Explanation**:

* One **Department** ➝ Many **Employees**
* One **Employee** ➝ Many **Salary Records**

---



## 📜 Deliverables

✔️ Schema creation (`schema.sql`)
✔️ Sample data (`data.sql`)
✔️ **Subqueries** covering scalar, correlated, IN, EXISTS, derived tables, and advanced use cases (`queries.sql`).

