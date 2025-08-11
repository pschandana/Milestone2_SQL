drop table EMPLOYEES;

CREATE TABLE EMPLOYEES (
    employee_id     NUMBER PRIMARY KEY,
    last_name       VARCHAR2(10),
    salary          NUMBER(10,2),
    department_id   NUMBER,
    job_id          VARCHAR2(20),
    hire_date       DATE,
    manager_id      NUMBER,
    commission_pct  NUMBER(4,2)
);
describe Employees;
Insert into Employees values(101,'King',24000.00,90,'AD_PRES',TO_DATE('17-06-1987','DD-MM-YYYY'),NULL,NULL);
INSERT INTO EMPLOYEES VALUES (102, 'Blake',12000,  20, 'SA_MAN',TO_DATE('01-01-1994', 'DD-MM-YYYY'),101,0.10);
INSERT INTO EMPLOYEES VALUES (103, 'Clark',9000,50,'SA_REP', TO_DATE('12-04-2000', 'DD-MM-YYYY'),102,0.05);
INSERT INTO EMPLOYEES VALUES (104, 'Scott',5000,20,'IT_PROG',TO_DATE('05-09-1994', 'DD-MM-YYYY'),103, NULL);
INSERT INTO EMPLOYEES VALUES (105, 'Adams',11000,50,'SA_REP',TO_DATE('21-07-2010', 'DD-MM-YYYY'),102, 0.15);
INSERT INTO EMPLOYEES VALUES (106, 'Jones',4000,10,'HR_REP',TO_DATE('14-11-1995', 'DD-MM-YYYY'),102, NULL);
INSERT INTO EMPLOYEES VALUES (107, 'Smith',15000,60,'FI_MGR',TO_DATE('23-03-2005', 'DD-MM-YYYY'),101, NULL);
INSERT INTO EMPLOYEES VALUES (108, 'Matos',8000,20,'IT_PROG',TO_DATE('02-08-1998', 'DD-MM-YYYY'),103, NULL);
INSERT INTO EMPLOYEES VALUES (109, 'Taylor',7500,50,'SA_REP',TO_DATE('19-05-1996', 'DD-MM-YYYY'),103, 0.20);
INSERT INTO EMPLOYEES VALUES (176, 'Grant',13000,50,'SA_MAN',TO_DATE('01-01-2012', 'DD-MM-YYYY'),102, 0.25);

COLUMN hire_date FORMAT A15 HEADING 'Hire Date';
select * from employees;

--TO_CHAR(salary, '$99,999.00') 
---1 . salary greater than $12000
select last_name,TO_CHAR(salary,'$99,999.00') from employees where salary>12000;

--2. employee number 176
select last_name,department_id from employees where employee_id = 176;

--3. details of employee between salary $5000 to $12000
select last_name,salary from employees where salary NOT BETWEEN 5000 AND 12000;

--4.Create a report to display the last name, job ID, and hire date for employees
--with the last names of Matos and Taylor. Order the query in ascending order by the hire date.
select last_name,job_id,hire_date from employees where last_name IN ('Matos','Taylor') ORDER BY hire_date ASC;

--5.Display the last name and department ID of all employees
--in departments 20 or 50 in ascending alphabetical order by name.
select last_name,department_id from employees where department_id IN (20,50) ORDER BY last_name ASC;

--6. List employees who earn between $5,000 and $12,000, and are in department 20 or 50. 
--Label the columns as Employee and Monthly Salary, respectively.
select last_name AS Employee, salary AS "Monthly Salary", department_id AS Department from Employees where (salary BETWEEN 5000 AND 12000) AND department_id IN (20,50);

--7. who were hired in 1994
select last_name ,hire_date from Employees where Extract (YEAR from Hire_date) = 1994;
--or
SELECT last_name,
       TO_CHAR(hire_date, 'DD-MON-YYYY') AS hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1994;

---8.retrieve data where manager id is null(manager_id = NULL is wrong syntax)
select last_name,job_id from Employees where manager_id IS NULL;

---9. Create a report to display the last name, salary, and commission of all employees who earn commissions.
---Sort data in descending order based on salary and commissions. Use the column's numeric position in the ORDER BY clause.
select last_name,salary,commission_pct from Employees where commission_pct IS NOT NULL ORDER BY 2 DESC,3 DESC;

--10. disply data who have salary greater than specified by user
select last_name,salary from Employees where salary > &salary;

---11. Create a query that prompts the user for a manager ID and generates the employee ID, last name, salary and department 
--for that manager's employees and prompts a column name by which result should be sorted.
--Eg:
--manager_id:103
--sorted_by last_name
select employee_id,last_name,salary,department_id from employees where manager_id = &manager ORDER BY &sort;

--12. employees with third letter is 'a'
select last_name from Employees where LOWER(last_name) LIKE '__a%';

---13 . names who have both 'a' and 'e';
select last_name from Employees where Lower(last_name) LIKE '%a%' OR Lower(last_name) LIKE '%e%';

---14. Display the last name, job, and salary for all employees whose jobs are either those of a sales representative or of a stock clerk,
--and whose salaries are not equal to $2,500, $3,500, or $7,000.
select last_name,job_id,salary from Employees where job_id IN ('IT_PROG','HR_REP') AND salary NOT IN (2500,3500,7000);

--- renaming the column
--ALTER TABLE table_name
--RENAME COLUMN old_column_name TO new_column_name;

---- ADD a COLUMN AND INSERT
ALTER TABLE Employees ADD first_name VARCHAR(20);
--- this is one way for all rows
--update Employees set first_name = "Carter" where employee_id=101;

---another way at a time

UPDATE Employees
SET first_name = CASE employee_id
    WHEN 101 THEN 'Carter'
    WHEN 102 THEN 'Mitchell'
    WHEN 103 THEN 'Hughes'
    WHEN 104 THEN 'Parker'
    WHEN 105 THEN 'Bennett'
    WHEN 106 THEN 'Coleman'
    WHEN 107 THEN 'Reed'
    WHEN 108 THEN 'Foster'
    WHEN 109 THEN 'Murphy'
    WHEN 176 THEN 'Ward'
END
WHERE employee_id IN (101,102,103,104,105,106,107,108,109,176);



---ADD constraint
alter table employees MODIFY last_name CONSTRAINT nn_lastname NOT NULL;

select * from Employees;

