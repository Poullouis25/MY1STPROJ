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