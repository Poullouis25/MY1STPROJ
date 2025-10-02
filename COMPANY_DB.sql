CREATE DATABASE company_db;
USE company_db;
CREATE TABLE skill_id( 
	skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(20) NOT NULL,
    category VARCHAR(20)
    );
SELECT * FROM skill_id;

DROP TABLE skill_id;
drop table staff;
SHOW DATABASES;
SHOW TABLES;
RENAME TABLE skill_id TO staff;

-- necessary tables required for the projects
CREATE TABLE depatment(
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE EMPLOYEE(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,3),
    dept_id INT,
    gender VARCHAR(1),
    FOREIGN key(dept_id) REFERENCES department(dept_id)
    );
    
drop table EMPLOYEE;
SHOW TABLES;

RENAME TABLE depatment TO department;

CREATE TABLE project(
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    dept_id int,
    foreign key(dept_id) REFERENCES department(dept_id)
    );

-- DATA INSERTIONS
-- insert data into department
INSERT INTO department(dept_name,location) VALUES 
('HR','NEW YORK'),
('IT','SAN FRANCISCO'),
('FINANCE','CHICAGO'),
('OPERATION','DALLOS');

SELECT *FROM department;

-- insert data in employee table
INSERT INTO EMPLOYEE(first_name,last_name,email,hire_date,salary,dept_id,gender) VALUES
('alice','green','alice.green2gmail.com','2024-01-10',62000.00,4,'F'),
('john','doe','john.doe@gmail.com','2023-05-15',600000.00,2,'M'),
('jane','smith','jane.smith@gmail.com','2022-11-20',720000.00,1,'F');

SELECT *FROM EMPLOYEE;

-- insert data in project table
INSERT INTO project(project_name,budget,dept_id) values
('mobile app',60000.00,2),
('Training program',25000,1);

insert into department(dept_name, location) values('sales','Boston');

insert into employee(first_name,email) values('Tom','tom2gmail.com');

-- Data Retrival
SELECT * FROM employee;

select emp_id as "EMPLOYEE ID", first_name as "NAME", email as "EMAIL ADDRESS" FROM employee;

select *from employee where hire_date > '2023-01-01';

select *from project where budget > 40000 order by budget desc;

select distinct location from department;

-- data modification

alter table employee 
add column ph_number varchar(15) after email;

update employee 
set salary = 60000.00 where first_name = 'john';

update employee set gender = 'O' where dept_id = 2;

select *from employee where salary between 60000 and 80000;

-- JOINS

-- Employees with department names
SELECT e.first_name, e.last_name, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id;

-- Departments with employee count (including those with 0 employees)
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM department d
LEFT JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Projects with department names
SELECT p.project_name, d.dept_name
FROM project p
JOIN department d ON p.dept_id = d.dept_id;

-- Employees in departments located in San Francisco
SELECT e.first_name, e.last_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

-- Departments with no projects
SELECT d.dept_name
FROM department d
LEFT JOIN project p ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;


--  STRING & NUMERIC FUNCTIONS

-- Full name of employees
SELECT CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM employee;

-- Convert dept_name to uppercase
SELECT UPPER(dept_name) FROM department;

-- First 3 characters of email
SELECT SUBSTRING(email, 1, 3) FROM employee;

-- Absolute value of -50000
SELECT ABS(-50000);

-- Round average salary to 2 decimals
SELECT ROUND(AVG(salary), 2) AS avg_salary_rounded FROM employee;


--  ADVANCED QUERIES

-- First 3 employees by latest hire date
SELECT * FROM employee
ORDER BY hire_date DESC
LIMIT 3;

-- Pagination: employees 4–6 (page 2, 3 per page)
SELECT * FROM employee
ORDER BY emp_id
LIMIT 3 OFFSET 3;

-- IF for salary classification
SELECT first_name,
       IF(salary >= 70000, 'High', 'Low') AS salary_level
FROM employee;

-- CASE for project budget classification
SELECT project_name,
       CASE 
           WHEN budget >= 60000 THEN 'Large'
           WHEN budget >= 40000 THEN 'Medium'
           ELSE 'Small'
       END AS budget_category
FROM project;

-- Total project budget grouped by department
SELECT dept_id, SUM(budget) AS total_budget
FROM project
GROUP BY dept_id;

-- Employee with longest first name
SELECT first_name
FROM employee
ORDER BY LENGTH(first_name) DESC
LIMIT 1;

-- Employees hired within last 90 days from March 22, 2025
SELECT * FROM employee
WHERE hire_date >= DATE_SUB('2025-03-22', INTERVAL 90 DAY);


--  DELETION & CLEANUP

-- Delete employees with salary < 60000
DELETE FROM employee
WHERE salary < 60000;

-- Drop project table
DROP TABLE project;

-- Restore database from backup (example for MySQL CLI)
-- NOTE: This step must be run in terminal, not inside SQL editor
-- mysql -u root -p company_db < company_db_backup.sql

-- After restore, check tables
SHOW TABLES;

-- Delete the DB after verification
DROP DATABASE company_db;
