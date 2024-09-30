CREATE DATABASE CompanyDTA;
USE CompanyDTA;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_name) VALUES ('Sales');
INSERT INTO Departments (department_name) VALUES ('Marketing');
INSERT INTO Departments (department_name) VALUES ('HR');
INSERT INTO Departments (department_name) VALUES ('Finance');
INSERT INTO Departments (department_name) VALUES ('IT');
INSERT INTO Departments (department_name) VALUES ('Operation');

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('John', 'Doe', '2023-01-15', 1);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Jane', 'Smith', '2022-05-22', 2);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Michael', 'Johnson', '2021-09-10', 3);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Alice', 'Williams', '2023-02-10', 4);  

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Bob', 'Smith', '2023-03-15', 5);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Charlie', 'Johnson', '2023-04-20', 6);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('David', 'Brown', '2023-05-25', 4);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Eva', 'Jones', '2023-06-30', 5);

SELECT * FROM Departments;
SELECT * FROM Employees;

SELECT Employees.first_name, Employees.last_name
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
WHERE Departments.department_name = 'Finance';

SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2023;

SELECT Departments.department_name, COUNT(Employees.employee_id) AS employee_count
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
GROUP BY Departments.department_name
ORDER BY employee_count DESC;

UPDATE Departments
SET department_name = 'Operations and Logistics'
WHERE department_name = 'Operation';

SELECT employee_id
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'IT'
)
ORDER BY hire_date DESC
LIMIT 1;

SELECT d.department_name, e.first_name, e.last_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name, e.employee_id
HAVING COUNT(e.employee_id) > 2
ORDER BY d.department_name, e.last_name;