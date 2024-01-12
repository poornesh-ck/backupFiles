select * from employees where hire_date>'01-01-1997' and job_id='%CLERK' ; 
----------2--------------
select last_name,job_id,salary,commission_pct from employees where commission_pct>0 order by commission_pct desc;
--select * from employees where hire_date>'01-01-1997' and job_id='s' 
--select  'The salary of'|| ' '||last_name||' '||'after a 10% raise is '||nvl(commission_pct,salary+(salary*0.1)) new_salary from employees ;
--select first_name||' '||last_name||' is a '||salary
--from employees;-
-------------3---------------
select nvl2(commission_pct,'The salary of'|| ' '||last_name||' '||'after a 10% raise is '||(salary+(salary*0.1)),salary) 
new_salary from employees ;
select last_name, round(months_between(sysdate,hire_date),0) Months,round(round(months_between(sysdate,hire_date),0)/12,0) years from employees
order by hire_date;

SELECT LAST_NAME FROM employees
  WHERE last_name LIKE
  'J%' OR last_name LIKE 'K%' OR last_name LIKE 'L%' OR last_name LIKE 'M%' ;
--6------------  
select last_name,salary,
decode(commission_pct,null,'No'
            ,'yes') as commission from employees;



SELECT DEPARTMENT_NAME,LOCATION_ID,LAST_NAME,JOB_ID,SALARY FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING(DEPARTMENT_ID)
WHERE LOCATION_ID=&LOC;

------------8------------------------

SELECT count(LAST_NAME) from employees WHERE last_name LIKE
  '%n' ;
   select last_name from employees  where substr(last_name, -1) = 'n';
  ------------10----------------
  select job_id from employees where department_id=10 or department_id=20;
  
  --------------9----------------------------
  select department_id,department_name,location_id,count(employee_id) from departments join employees
  using(department_id) 
  group by department_id,department_name,location_id;
  
  ---------------11-----------------------
  select job_id,count(employee_id) from employees  group by department_id  having department_id=90 ;
  -------------12--------------------
  select last_name,hire_date from employees where round(hire_date,'day')>hire_date;
  -----------14---------------------
select e.employee_id,e.last_name,e.salary,e.job_id,j.grade 
from employees e
join employees m
join job_grades j
on(e.salary >15000 )
order by j.grade desc;
-----------------------