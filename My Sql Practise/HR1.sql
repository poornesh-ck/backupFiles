--desc employees;
--
-- 
--
--select employee_id, last_name,salary,
--case JOB_ID 
--when 'IT_PROG' then salary*5+salary
--when 'SA_REP' then salary*0.5+salary
--when 'IT_MAG' then salary*0.8+salary
--else salary
--end salary
--from employees;
--
-- 
--
--select employee_id, last_name,salary,
--DECODE(JOB_ID,'IT PROG' ,salary*5+salary
--            ,'SA-REP' ,salary*0.5+salary
--            ,'IT-MAG' ,salary*0.8+salary
--,salary) using_decode_sal
--from employees;
--
-- 
--
--select count(*)
--from employees;
--
-- 
--
--select sum(salary)/count(*)
--from employees;
--
-- 
--
--select sum(salary) total_salary,round(avg(salary),2) avg_salary,max(hire_date) max_salary,min(hire_date) min_salary
--from employees;
--
-- 
--
--select count(salary)
--from employees;
--
-- 
--
--select round(sum(salary)/count(*),2),
--round(sum(salary)/count(manager_id),2),
--round(sum(salary)/count(nvl(manager_id,0)),2),
--round(avg(salary),2)
--from employees;
--
-- 
--
--select count(department_id)
--from departments;
--
-- 
--
--select count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
--from employees;
--
-- 
--
--select department_id "Depatment name",salary,job_id"role",avg(salary)"avg salary",first_name ,count(department_id) "total id",sum(salary) "total salary",round(avg(salary),3) "avg salary",max(salary) "max sal",max(first_name),min(salary)"min sal"
--from employees
--Group By Department_Id,Salary,Job_Id, First_Name;
--
-- 
--
--select salary, max(first_name(salary))
--from employees
--group by salary
--having first_name = max(salary);
--
-- 
--
--select salary(max(first_name))
--from employees;
--
-- 
--
--select department_id, sum(salary), round(avg(salary),0),max(salary),min(salary)
--from employees
--group by department_id;
--
-- 
--
--select employee_id, last_name,salary,
--case JOB_ID when 'IT PROG' then salary*1.5+salary
--            when 'SA-REP' then salary*0.5+salary
--            when 'IT-MAG' then salary*0.8+salary
--else salary
--end salary
--from employees;
--
-- 
--
-- 
--
--select first_name 
--from employees;
--
-- 
--
--select first_name "name",salary*12 "annual salary"
--from employees;
--
-- 
--
--select first_name||' '||last_name||' is a '||salary
--from employees;
--
-- 
--
--select first_name||q'|Employee's salary is |'||salary sal
--from employees;
--
-- 
--
--select distinct salary,first_name      --it erases the duplicates only in the display not in the real sheet
--from employees;
--
-- 
--
--select *
--from employees
--where department_id=80 AND salary > 11000 AND salary <> 11000;
--
-- 
--
--select *
--from employees
----where salary IN(8000,10000,20000);
--where salary BETWEEN 8000 AND 10000;
--
-- 
--
--SELECT *
--FROM employees
--WHERE salary = &sal;
--
-- 
--
--select &colName   --col name
--from &table       --table name 
--where &col;       --condition
--
-- 
--
--select &&col, last_name
--from &table
--where &con
--order by first_name;      --ascending order
--
-- 
--
--DEFINE
--select &&colname, first_name, last_name
--from employees
--where &&condition
--order by first_name desc;  --descending order
--
-- 
--
--select employee_id,last_name,department_id,department_name
--from employees
--natural join departments;
--
-- 
--
-- 
--
--select * from departments
--order by manager_id;
--
-- 
--
-- 
--
--select employee_id,last_name,employees.department_id,manager_id,department_name
--from employees 
--join departments
--using(manager_id);
--
-- 
--
-- 
--
--select employee_id, last_name,employees.department_id,department_name
--from employees
--join departments
--on (employees.department_id=departments.department_id);
--
-- 
--
-- 
--
--select employee_id,last_name,employees.manager_id,department_id,department_name
--from employees 
--join departments
--using(department_id)
--where employees.manager_id=100
--order by employee_id;
--
-- 
--
-- 
--
--select * from employees
--where department_id IS NULL;
--
-- 
--
-- 
--
--select employee_id, last_name,department_name,employees.department_id
--from employees
--right outer join departments
--on(employees.department_id = departments.department_id);
--
-- 
--
-- 
--
--select department_name,employee_id, last_name,employees.department_id
--from employees
--left outer join departments
--on(employees.department_id = departments.department_id);
--
-- 
--
--
--select employee_id, last_name,department_name,employees.department_id
--from employees
--full outer join departments
--on(employees.department_id = departments.department_id);
--
-- 
--
--
--select employee_id, last_name,department_name,employees.department_id
--from employees
--cross join departments;
--
-- 
--
--
--select e.employee_id,e.last_name,e.manager_id,m.employee_id,m.last_name
--from employees e
--join employees m
--on(e.manager_id = m.employee_id);
--
-- 
--
--SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME='Abel';
--
-- 
--
-- 
--
--SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
--FROM EMPLOYEES
--WHERE SALARY = (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME='Abel');
--
-- 
--
-- 
--
--SELECT EMPLOYEE_ID,SALARY
--FROM EMPLOYEES
--WHERE SALARY >(SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100);
--
-- 
--
-- 
--
--SELECT * FROM EMPLOYEES;
--
-- 
--
--SELECT EMPLOYEE_ID,LAST_NAME,SALARY,DEPARTMENT_ID
--FROM EMPLOYEES
--WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME = 'Taylor' ) AND 
--SALARY > ANY(SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME='Taylor') ;
--
-- 
--
-- 
--
--SELECT EMPLOYEE_ID,DEPARTMENT_ID,SALARY FROM EMPLOYEES
--WHERE SALARY IN(SELECT MIN(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
--
-- 
--
--has context menu
--Compose
--
-- 
--
--select employee_id,manager_id from employees; -- employee
--
-- 
--
--select employee_id,manager_id from employees;  -- Manager
--
-- 
--
-- 
--
--select employee_id,last_name,job_id,salary,department_name,city
--from employees e
--join departments d
--on(e.department_id=d.department_id)
--join locations l
--on(d.location_id = l.location_id);
--
-- 
--
-- 
--
--select employee_id,last_name,job_id,salary,department_name,city
--from employees
--join departments
--using(department_id)
--join locations
--using(location_id);
--
-- 
--
-- 
--
--desc job_history;
--
-- 
--
--------------------------------SET OPERATOR------------------------------------------
--
-- 
--
--select employee_id,job_id                     --union
--from employees
--union
--select employee_id,job_id
--from job_history
--order by employee_id;
--
-- 
--
--select employee_id,job_id                 --union all
--from employees
--union all
--select employee_id,job_id
--from job_history
--order by employee_id;
--
-- 
--
--select employee_id,job_id,department_id
--from employees
--intersect
--select employee_id,job_id,department_id
--from job_history;
--
-- 
--
--select employee_id,job_id
--from employees
--minus
--select employee_id,job_id
--from job_history
--order by employee_id;
--
-- 
--
--desc employees;
--
-- 
--
--select employee_id,job_id,salary
--from employees
--union
--select employee_id,job_id,0
--from job_history
--intersect
--select employee_id,job_id,salary
--from employees
--order by employee_id;
--
-- 
--
--select employee_id,job_id,salary
--from employees
--union
--select employee_id,job_id,first_name
--from job_history
--intersect
--select employee_id,job_id,varchar(null)
--from employees
--order by employee_id;

 
--select Employee_id,last_Name,salary,job_id,
--Decode( job_id , 'IT_PROG' , salary*0.2+SALARY 
--, 'PU_MAN' , salary*0.8+salary
--, 'PU_CLERK' , salary*0.5+salary
--, salary )  AS ANUUAL_SALARY 
--
-- select count(*) from employees
-- select sum(salary) total_salary, round(avg(salary),2) avg_salary from employees
-- select min(hire_date) as latest_hiring, max(hire_date) as first_hiring from employees;
-- select count(department_id) from departments;
-- 
-- select job_id,count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
-- from employees
-- group by job_id
-- 
-- order by department_id;
-- 
-- select department_id,count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
-- from employees
-- where department_id<>110
-- group  by job_id,department_id 
-- having avg(salary)>1500;
 
 
-- group by job_id,department_id;
--select "salaryy" from employees;

--select salary, commission_pct,salary||commission_pct from employees;
--select first_name,last_name ,concat(89898||last_name,commission_pct) from employees;
 --select lpad(first_name,12,1) from employees;
-- select replace(first_name,'E','M') from employees; 

--select first_name,
-- case  when salary>4000 then 100.787
-- else 0 
-- end from employees; 
--
--select salary
--decode(job_id,'IT_PROG',salary+100,salary>50000,salary+190,0) 
--from employees;
-- 
-- select round(66.653,-2) from dual; 
-- 
-- select count(*) from employees where commission_pct is null;
-- select job_id from jobs;
-------------------------------------------------------------As
 CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;
---------------------------------------------------------------
--select employee_id,last_name,department_id,department_name
--from employees
--natural join departments;

--select employee_id,last_name,employees.department_id,department_name
--from employees join departments
--on(employees.department_id=departments.department_id and employees.manager_id = departments.manager_id);

select first_name,employees.department_id
from employees  join departments 
using(manager_id)
--where e.manager_id=124;--poda mudiyathuuu

select employee_id,last_name,department_name,e.department_id
from employees e
full outer join departments d
on(e.department_id=d.department_id);

select employee_id,last_name,department_name,e.department_id
from employees e
cross join departments d;

select e.employee_id,e.last_name,department_name,e.department_id,m.employee_id
from employees e
join employees m
on(e.manager_id=m.employee_id);

select e.employee_id,e.last_name,e.job_id,e.salary,d.department_name,l.city 
from employees e
join  departments d
using(department_id)
join locations l
using(location_id);

--select * from job_grades;
select e.employee_id,e.last_name,e.salary,e.job_id,j.grade 
from employees e
join job_grades j
on(e.salary between j.lowest_sal and j.highest_sal )
order by j.grade desc;

select * from employees where department_id in
(select department_id from employees where salary in (select salary from employees where last_name='Abel'));

select first_name,salary,department_id from employees where department_id in
(select department_id from employees where last_name='Taylor') and salary>any(select salary from employees where last_name='Taylor');
-----------------------------------------------------------------------------------------------------------

--set--
select job_id,employee_id from employees
union
select job_id,employee_id from job_history
order by employee_id;
--------------------------------
select department_id,employee_id from employees
intersect
select department_id,employee_id from job_history
order by employee_id;
---------------------------------
select  job_id,employee_id from employees
minus
select job_id,employee_id from job_history
order by employee_id;
------------------------------------
select job_id,employee_id,salary from employees
union
select job_id,employee_id ,1 from job_history
order by employee_id;
-------------------------------------
select job_id,employee_id,last_name,to_date(null) startdate from employees
union
select job_id,employee_id ,to_char(null),start_date from job_history
order by employee_id;
-------------------------------------------
 ------------------------------default constraint------------
create table hire_date
(id number(8),hire_date date default sysdate);

insert into hire_date values(1,'04-01-2020');
insert into hire_date(id) values(2);
insert into hire_date(id) values(123456789);--only 8 digits is specified --soo its throws error
select* from hire_date;


desc employees;

delete  from  employees;
select * from departments;

----------------------------------------
create table dept80
as
select employee_id,last_name,salary*12 annsal,hire_date from employees
where department_id=80;
select * from dept80;
----------------alter -------------
alter table dept80 read only;
alter table dept80 read write;
----------------- simple view----------
create view empv80
 as select employee_id,last_name,salary
 from employees
 where department_id=80;
 insert into empv80 values(210,'test',40000);
 delete from empv80 where salary =(select max(salary) from empv80);
 
 desc empv80;
 select * from empv80;
 
----------------complex view-----------
create or replace view ennp80
(name,minsal,maxsal,avgsal) as select d.department_name,min()

--------------------------------drop&geetting from recycle_bin---------------------------
drop table job_grades;
select * from job_grades;
flashback table hr.job_grades to before drop;
select * from job_grades;
------------------------sequence---------------
create sequence dept_deptid_seq
increment by 10
start with 120
maxvalue 9999
nocache 
nocycle;
desc departments;
 drop sequence dept_seq;
insert into departments values(dept_deptid_seq.next,'training',null,null);
--select last_name||q'[iddd]'||first_name from employees;
create sequence dept_seq
increment by 10
start with 310
nocycle 
nocache;
insert into departments values(dept_seq.nextval,'training',null,null);
insert into departments values(dept_seq.nextval,'hr',null,null);


select * from departments
order by department_id;
select dept_seq.nextval,dept_seq.currval from dual;

select * from employees;
delete from departments
where department_id>300;
--------------------------synonym------------------------------
create synonym emp
for employees;
select * from emp;
select * from employees;
drop synonym emp;

create user userA identified by Reset123;
alter user hr identified by hr;

SELECT
    *
FROM
    user_tab_privs_made;

SELECT
    *
FROM
    user_sys_privs;

s
------------------------------------pl/sql----------------------------
declare
v_last_name varchar(25);
begin 
select last_name into v_last_name
from employees
where employee_id=100;
end;


------------------------------------------------------------------
select last_name from employees group by last_name having count(last_name)>1; 

SELECT last_name
FROM employees
WHERE last_name NOT LIKE '[aeiouAEIOU]%[aeiouAEIOU] ';







select d.department_id,d.manager_id,count(e.employee_id) from departments d
join employees e
on(d.department_id = e.department_id)
group by d.department_id,d.manager_id;











