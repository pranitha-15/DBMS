use student;
create table Employee (
empno varchar(50),
emp_name varchar(50),
dept varchar(15),
salary int,
doj varchar(50),
branch varchar(50)
);


INSERT INTO Employee(empno,emp_name,dept,salary,doj,branch) VALUES 
('E001','Amit','Production',45000,'12-mar-00','Bangalore'),
('E002','Amit','HR',70000,'3-jul-02','Bangalore'),
('E003','sunita','Management',120000,'11-jan-01','mysore'),
('E004','sunita','IT',67000,'1-aug-01','mysore'),
('E005','mahesh','Civil',145000,'20-sep-03','Mumbai');

select * from Employee;

select empno,salary from Employee;

select avg(salary) from Employee;

select count(*) from Employee;

select count(distinct emp_name) from Employee;

select emp_name,sum(salary),count(*) from Employee group by(emp_name);

SELECT EMP_NAME, SUM(SALARY)
FROM Employee GROUP BY(EMP_NAME) 
HAVING SUM(SALARY)>120000;

select emp_name from Employee order by emp_name;

select * from Employee where emp_name='Amit' and salary>50000;


SELECT CURRENT_DATE;
-- 6b (2)
SELECT EXTRACT(YEAR FROM SYSDATE);
SELECT YEAR(CURDATE());

-- 6b(3)
SELECT DAY(CURDATE());
SELECT EXTRACT(DAY FROM CURDATE());

-- 6b(4)
SELECT EXTRACT(MONTH FROM CURDATE());
SELECT MONTH(CURDATE());

-- 6b(5)
SELECT CURDATE();
SELECT NOW();


-- string functions
SELECT ASCII('a');
SELECT ASCII('A');
SELECT ASCII('Z');
SELECT ASCII('z');


SELECT UPPER('bldeasb arts and kcp science college');

SELECT LOWER('WELCOME TO DBMSLAB');

SELECT REPLACE('HELLO', 'H', 'K');

SELECT REPLACE('COMPUTER', 'C', 'K');

SELECT REPLACE('HELLO', 'L', 'A');

SELECT TRIM(BOTH 'A' FROM 'ANACONDA');

SELECT SUBSTRING('ANACONDA' FROM 2); 

SELECT SUBSTRING('ANIL' FROM 2);

SELECT LEFT('ANITA', LENGTH('ANITA') - 1);

-- math functions

CREATE TABLE Student1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    admission_no VARCHAR(45) NOT NULL UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    age INT,
    city VARCHAR(25) NOT NULL
);

CREATE TABLE Fee (
    admission_no VARCHAR(45) NOT NULL,
    course VARCHAR(45) NOT NULL,
    amount_paid INT
    
);

INSERT INTO Student1 (admission_no, first_name, last_name, age, city)
VALUES (3354,'Luisa', 'Evans', 13, 'Texas'),
(2135, 'Paul', 'Ward', 15, 'Alaska'),
(4321, 'Peter', 'Bennett', 14, 'California'),
(4213,'Carlos', 'Patterson', 17, 'New York'),
(5112, 'Rose', 'Huges', 16, 'Florida'),
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),
(7555,'Antonio', 'Butler', 14, 'New York'),
(8345, 'Diego', 'Cox', 13, 'California');

INSERT INTO Fee (admission_no, course, amount_paid) VALUES (3354,'Java', 20000),
(7555, 'Android', 22000),
(4321, 'Python', 18000),	
(8345,'SQL', 15000),
(5112, 'Machine Learning', 30000);

-- join commands
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 INNER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 LEFT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1 RIGHT OUTER JOIN Fee ON Student1.admission_no = Fee.admission_no;

SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
LEFT JOIN Fee ON Student1.admission_no = Fee.admission_no
UNION
SELECT Student1.admission_no, Student1.first_name, Student1.last_name, Fee.course, Fee.amount_paid
FROM Student1
RIGHT JOIN Fee ON Student1.admission_no = Fee.admission_no;

-- Exercise
CREATE TABLE EMPLOYEE1 (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(50) NOT NULL,
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id INT,
    Designation VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO EMPLOYEE1 (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary)
VALUES 
(101, 'Alice Johnson', '123 Main St', '9876543210', 1, 'HR', 201, 'MANAGER', 75000.00),
(102, 'Bob Smith', '456 Elm St', '8765432109', 2, 'IT', 202, 'ENGINEER', 60000.00),
(103, 'Charlie Brown', '789 Oak St', '7654321098', 3, 'Finance', 203, 'MANAGER', 80000.00);

SELECT Emp_no, E_name, Salary
FROM EMPLOYEE1
WHERE Designation = 'MANAGER';

SELECT * FROM EMPLOYEE1 WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE1 WHERE Dept_name = 'IT PROFF');

ALTER TABLE EMPLOYEE1 ADD Joining_Date DATE;
SELECT * FROM EMPLOYEE1 WHERE YEAR(Joining_Date) > 1981 ORDER BY Designation ASC;

SELECT Emp_no, E_name, 
       TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) AS Experience, 
       Salary / 30 AS Daily_Salary 
FROM EMPLOYEE1;

SELECT * FROM EMPLOYEE1 WHERE Designation IN ('CLERK', 'ANALYST');

