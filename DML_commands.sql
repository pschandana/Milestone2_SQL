drop table MY_EMPLOYEE;
---1
Create table MY_EMPLOYEE
AS
select employee_id,first_name,last_name,department_id,salary from Employees
where 1=2;

select * from MY_EMPLOYEE;
---2
describe my_employee;

-- Inserting Record
INSERT INTO MY_EMPLOYEE VALUES(201,'Michael','Hartstein',20,13000);
select * from my_employee;
INSERT INTO MY_EMPLOYEE VALUES(202,'Pat','Fay',20,NULL);
select * from my_employee;
--- listing column 
INSERT INTO MY_EMPLOYEE(employee_id,first_name,last_name,department_id,salary)
VALUES(203,'Susan','Mavris',40,NULL);
select * from my_employee;
--- Insert again
INSERT INTO MY_EMPLOYEE VALUES (100, 'Steven', 'King', 90, 24000);
INSERT INTO MY_EMPLOYEE VALUES (101, 'Neena', 'Kochhar', 90, 17000);
INSERT INTO MY_EMPLOYEE VALUES (102, 'Lex De', 'Haan', 90, 17000);
INSERT INTO MY_EMPLOYEE VALUES (111, 'Ismael', 'Sciarra', 100, 7700);
INSERT INTO MY_EMPLOYEE VALUES (112, 'Jose Manuel', 'Urman', 100, 7800);
INSERT INTO MY_EMPLOYEE VALUES (204, 'Hermann', 'Baer', 70, 10000);

select * from my_employee;
--- increase by 10%
update my_employee set salary = salary+(salary * 0.1) where department_id = 90;

select * from my_employee;

----update last_name to higgins 
update my_employee set last_name = 'Higgins' where employee_id = 202;
select * from my_employee;

-----delete name either having seq 'man'
delete my_employee where first_name LIKE '%man%' OR last_name LIKE '%man%';
select * from my_employee;




