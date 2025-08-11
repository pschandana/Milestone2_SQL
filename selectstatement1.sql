--Determine the structure of the Departments table and its contents
drop table departments;
Create table DEPARTMENTS(
   lastname Varchar(10),
   job_ID VARCHAR(10),
   hiredate Date,
   Emp_ID int );
   
INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Smith', 'IT_PROG', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 101);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Johnson', 'HR_REP', TO_DATE('2022-08-15', 'YYYY-MM-DD'), 102);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Williams', 'IT_PROG', TO_DATE('2021-03-21', 'YYYY-MM-DD'), 103);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Brown', 'SA_MAN', TO_DATE('2020-11-05', 'YYYY-MM-DD'), 104);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Davis', 'HR_REP', TO_DATE('2019-07-18', 'YYYY-MM-DD'), 105);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Miller', 'IT_PROG', TO_DATE('2023-01-12', 'YYYY-MM-DD'), 106);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Wilson', 'SA_REP', TO_DATE('2022-02-25', 'YYYY-MM-DD'), 107);

INSERT INTO DEPARTMENTS (lastname, job_ID, hiredate, Emp_ID)
VALUES ('Moore', 'SA_MAN', TO_DATE('2021-10-30', 'YYYY-MM-DD'), 108);

-- Operations on Table departments

select * from departments;
describe departments;
select Emp_ID, job_ID,hiredate AS HIRE_DATE , lastname from Departments;
select DIstinct job_ID from departments;
COLUMN hire_date FORMAT A15 HEADING 'Hire Date';
select Emp_ID AS "Emp #",lastname  AS Employee,job_ID AS Job,hiredate AS "HireDate" from departments;
