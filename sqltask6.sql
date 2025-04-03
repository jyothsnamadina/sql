
-- create
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

-- insert
INSERT INTO Employees (EmployeeID, Name, Position, Salary, HireDate) VALUES
(1, 'Sreeja', 'Software Engineer', 75000.00, '2020-06-15'),
(2, 'Ram', 'Project Manager', 90000.00, '2018-03-10'),
(3, 'Seetha', 'QA Engineer', 65000.00, '2021-09-01'),
(4, 'Jansi', 'HR Manager', 80000.00, '2017-07-23'),
(5, 'Roja', 'Software Engineer', 77000.00, '2022-01-12');

-- fetch 
SELECT * FROM Employees;

-- 1. Modify Table Structure
-- Task: Add and Populate New Columns
ALTER TABLE Employees ADD COLUMN LastUpdated DATE;
ALTER TABLE Employees ADD COLUMN Status VARCHAR(10) DEFAULT 'Inactive';
SELECT * FROM Employees;

-- Populate New Columns
UPDATE Employees SET LastUpdated = CURDATE();
UPDATE Employees SET Status = 'Active';
SELECT * FROM Employees;

-- 2. Delete Records Based on Conditions
-- Task: Remove Records Based on Criteria
-- Delete records where Status = "Inactive".
DELETE FROM Employees WHERE Status = 'Inactive';
SELECT * FROM Employees;

-- Remove records older than a specific date in the LastUpdated column.
DELETE FROM Employees WHERE LastUpdated < '2024-01-01';
SELECT * FROM Employees;