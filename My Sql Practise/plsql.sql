set SERVEROUTPUT on;
set autoprint on
variable v_last_name varchar2(25);
DECLARE
    --v_last_name VARCHAR(25);
    v_emp_id    NUMBER := 125;
    v_myname varchar(25); 
    employee_id number := 125;
BEGIN
    dbms_output.put_line('the employees lastname:' || v_myname);
    v_myname :='jeeeva';
        dbms_output.put_line('the employees lastname:' || v_myname);
    v_myname:= q'[helooo]'    ;
        dbms_output.put_line('the employees lastname:' || v_myname);
        

    
    SELECT
        last_name
    INTO :v_last_name
    FROM
        employees
    WHERE
        employee_id = v_emp_id;

    dbms_output.put_line('the employees lastname:' || v_last_name);
    --employee_id=employee_id;
END;
/

--PRINT c_last_name;
--dbms_output.put_line('the employees lastname:' || v_last_name);


--------------------------------without dbms_output
variable b_emp_salary number
set autoprint on
begin
 select salary into:b_emp_salary
 from employees where employee_id=178;
 end;
 /
 --print b_emp_salary

---------------------------------------------
variable v_last_name VARCHAR2(25);

 

set autoprint on;
DECLARE
    v_emp_id NUMBER := 125;
BEGIN
    SELECT
        last_name INTO :v_last_name
    FROM
        employees
    WHERE
        employee_id =v_emp_id;

 

END;
/
-----------------------------------------------------------------------------------------


DECLARE
    v_no_of_month NUMBER;
--v_st varchar(25):="hi heloo welcome to plsql";
BEGIN
    SELECT
        round(
            months_between(
                sysdate, hire_date
            ), 0
        )
    INTO v_no_of_month
    FROM
        employees 
--    SELECT
--        months_between(
--            start_date, end_date
--        )
--    INTO v_no_of_month
--    FROM
--        job_history
--    WHERE
--        department_id = (
--            SELECT
--                department_id
--            FROM
--                employees
--            WHERE
--                last_name = 'Abel'
--        );
    WHERE
        last_name = 'Abel';

    dbms_output.put_line('No of months worked is' || v_no_of_month);
END;

--------------------------------nested----------------------------------
DECLARE
    v_father_name VARCHAR(25) := 'abc';
BEGIN
    DECLARE
        v_child_name VARCHAR(25) := 'xyz';
    BEGIN
        dbms_output.put_line(v_father_name);
        dbms_output.put_line(v_child_name);
    END;

    dbms_output.put_line(v_father_name);
END;


----------------------------------------------------------
DECLARE
    v_sal_amount    employees.salary%TYPE := &sal;
    v_l_name        employees.last_name%TYPE := '&name';
    v_l_name_up     employees.last_name%TYPE;
    v_sal_amount_up employees.salary%TYPE;
BEGIN
    UPDATE employees
    SET
        salary = v_sal_amount
    WHERE
        last_name = v_l_name;

    SELECT
        last_name,
        salary
    INTO
        v_l_name_up,
        v_sal_amount_up
    FROM
        employees
    WHERE
        last_name = v_l_name;

    dbms_output.put_line(v_l_name_up);
    dbms_output.put_line(v_sal_amount_up);
END;

begin 
insert into employees
(employee_id,first_name,last_name,email,hire_date,job_id,salary)values(218,'ruth','cores','rcores',current_date,'AD_ASST',4000);
end;

select * from employees where employee_id=218;

update employee set salary=25000 where last_name='King';
-------------------------------------if else------------------------

DECLARE
    v_myage NUMBER := &age;
BEGIN
    IF v_myage < 11 THEN
        dbms_output.put_line('I am a child');
    ELSE
        dbms_output.put_line('I am a adult');
    END IF;
END;

set SERVEROUTPUT on;
declare
v_grade varchar(20) := lower('&grade');
begin CASE v_grade
    WHEN  'a' THEN
        dbms_output.put_line('excellent');
    WHEN   'b' THEN
        dbms_output.put_line('good');
    WHEN  'c' THEN
        dbms_output.put_line('average');
    WHEN  'd' THEN
        dbms_output.put_line('below average');
    WHEN 'e' THEN
        dbms_output.put_line('fail');
    ELSE
        dbms_output.put_line('Enter proper grade');
        end case;
end;
------------------------------------------------------------------
declare
v_message varchar(20):='&msg';
v_counter number:=1;
begin
loop
dbms_output.put_line(v_message);
v_counter := v_counter+1;
exit when  v_counter>10;
end loop;
end;
----------------------------------------
DECLARE
    v_employeid employees.employee_id%TYPE := 100;
    v_name      employees.last_name%TYPE;
    v_salary    employees.salary%TYPE;
    v_jobid     employees.job_id%TYPE;
BEGIN
--select employee_id,last_name,salary,job_id into(v_employeid,v_name,v_salary,v_jobid) from employees
    WHILE v_employeid <= 110 LOOP
        SELECT
            last_name,
            salary,
            job_id
        INTO
            v_name,
            v_salary,
            v_jobid
        FROM
            employees
        WHERE
            employee_id = v_employeid;

        dbms_output.put_line(v_employeid
                             || ' '
                             || v_name
                             || ' '
                             || v_salary
                             || ' '
                             || v_jobid);

        v_employeid := v_employeid + 1;
    END LOOP;
END;
/
DECLARE
    TYPE emp IS RECORD (
        lname VARCHAR(25),
        jobn  VARCHAR(30),
        sal   NUMBER,
        en    employees%rowtype
    );
    emp_ref emp;
BEGIN
    SELECT
        *
    INTO emp_ref.en
    FROM
        employees
    WHERE
        employee_id = 124;

    SELECT
        last_name,
        job_id,
        salary
    INTO
        emp_ref.lname,
        emp_ref.jobn,
        emp_ref.sal
    FROM
        employees
    WHERE
        employee_id = 124;

    dbms_output.put_line(emp_ref.lname
                         || ' '
                         || emp_ref.jobn
                         || ' '
                         || emp_ref.sal);

    dbms_output.put_line(emp_ref.en.employee_id
                         || ' '
                         || emp_ref.en.department_id);

END;                           
         
create table copyemp as(select * from employees)    
delete from copyemp where employee_id=118;


declare 
emp employees%rowtype;
begin 
select * into emp
from employees
where employee_id=118;
insert  into copyemp values emp;
end;
select* from employees where employee_id=118;
--select * from copyemp order by employee_id;

DECLARE
    TYPE emp_table IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emp           emp_table;
    v_employee_id NUMBER := 100;
BEGIN
    WHILE v_employee_id <= 110 LOOP
        SELECT
            *
        INTO
            emp
        (v_employee_id)
        FROM
            employees
        WHERE
            employee_id = v_employee_id;

        dbms_output.put_line(emp(v_employee_id).employee_id
                             || ' '
                             || emp(v_employee_id).last_name
                             || ' '
                             || emp(v_employee_id).job_id
                             || ' '
                             || emp(v_employee_id).salary);

        v_employee_id := v_employee_id + 1;
    END LOOP;
END;
----------------------------------------------------------


DECLARE
    CURSOR c_emp IS
    SELECT
        employee_id,
        last_name,salary
    FROM
        employees
    WHERE
        department_id = 30;

    iname   employees.last_name%TYPE;
    ejob    employees.job_id%TYPE;
    isalary employees.salary%TYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO
            iname,
            ejob,
            isalary;
        dbms_output.put_line(iname
                             || ' '
                             || ejob
                             || ' '
                             || isalary);

        EXIT WHEN c_emp%NOTFOUND;
    END LOOP;

END;
 select * from employees;
 -----------------exception-------------------
 
 declare
 v_lname varchar2(20);
 begin 
 select last_name into v_lname from employees
 where last_name='Taylor';
 dbms_output.put_line(v_lname);
 exception 
 when too_many_rows then 
 dbms_output.put_line('should use cursor');
 end;
 
 
declare 
e_too_many_row_excep exception;
pragma exception_init(e_too_many_row_excep,-01422);
 v_lname varchar2(20);
begin
 select last_name into v_lname from employees
 where last_name='Taylor';
 dbms_output.put_line(v_lname);
exception 
when
e_too_many_row_excep then
dbms_output.put_line('use cursor');
end;


declare
e_duplicate_id_excep exception;
pragma exception_init(e_duplicate_id_excep,-01400);
v_id employees.employee_id%type:=&id;
begin
insert
into employees (employee_id) values(v_id);
exception
when e_duplicate_id_excep then
dbms_output.put_line('already exist');

end;
--------------------------------------procedure----------------------
create table dept as select* from departments;
create procedure add_dept(v_dept_id dept.department_id%TYPE,v_dept_name dept.department_name%type) is 
--v_dept_id dept.department_id%TYPE;
--v_dept_name dept.department_name%type;
begin
--v_dept_id:=280;
--v_dept_name:='st-curriculam';
insert into dept(department_id,department_name) values (v_dept_id,v_dept_name);
dbms_output.put_line('inserted'||sql%rowcount||'row');
end;
begin 

add_dept(290,'clerk');
end;
select * from dept order by department_id;
--------------------------------------------function----------------
create function check_sal(v_dept_id employees.department_id%type) return boolean is
v_empno employees.employee_id%type;
v_sal employees.salary%type;
v_avg_sal employees.salary%type;
begin 
SELECT salary,department_id into v_sal,v_dept_id from employees
where employee_id=v_empno;
select avg(salary) into v_avg_sal from employees where department_id =v_dept_id;
if v_sal>v_avg_sal then
return true;
else
return false;
end if;
exception
when no_data_found then
return null;

end;

begin

if(check_sal() is null) then 
dbms_output.put_line('the function returned');
else if(check__sal())then
dbms_output.put_line('sal>average');
else
dbms_output.put_line('sal<average');
end if;
end;
--------------------------
select *from job_history where employee_id=(select employee_id from employees where last_name='Abel');


update employees set job_id='IT_PROG',department_id=60 where last_name='Abel';

select * from employees order by employee_id;
select * from job_history order by employee_id;
-----------------------trigger-----------------------------;
;

------------------------------------------------------------------

CREATE OR REPLACE TRIGGER display_salary_changes after
    DELETE or update or insert  ON employees
    FOR EACH ROW
    WHEN ( new.employee_id > 0 )
DECLARE
    sal_diff NUMBER;
BEGIN
    sal_diff := :new.salary - :old.salary;
    dbms_output.put_line('Old salary: ' || :old.salary);
    dbms_output.put_line('new salary: ' || :new.salary);
    dbms_output.put_line('salary difference: ' || sal_diff);
END;

drop trigger display_salary_changes;

update employees set salary=28000 where employee_id=174;


insert into employees (employee_id,last_name,email,job_id,hire_date) values(3001,'poornesh','ckpoornesh12','IT_PROG',sysdate);








