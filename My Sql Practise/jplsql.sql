set serveroutput on;

 

DECLARE
    v_last_name VARCHAR2(24);
    v_emp_id    NUMBER := 125;
    v_myname    VARCHAR2(20);
    employee_id NUMBER DEFAULT 125;
BEGIN
    dbms_output.put_line(v_myname);
    v_myname := q'!father's name!';
    dbms_output.put_line(v_myname);
    SELECT
        last_name
    INTO v_last_name
    FROM
        employees
    WHERE
        employee_id = v_emp_id;

 

    dbms_output.put_line('The Employees last name :' || v_last_name);
END;
/

 

--print v_last_name ;

 

---------------------------------------------

 

 

variable v_sal number;
variable v_name varchar2(25);
set autoprint on --to print automatically

 

BEGIN
    SELECT
        salary,last_name
    INTO :v_sal, :v_name
    FROM
        employees
    WHERE
        employee_id = 178;

 

END;
/
--print v_sal

 

 

-------------------------------------------------------------
DECLARE
    v_count     NUMBER;
    v_hire_date DATE;
BEGIN
    SELECT
        hire_date,
        round(
            months_between(
                sysdate, hire_date
            ), 2
        )
    INTO
        v_hire_date,
        v_count
    FROM
        employees
    WHERE
        last_name = 'Abel';

 

    dbms_output.put_line(v_count);
    dbms_output.put_line(v_hire_date);
END;

 

 

 

-------------Nested blocks--------------------
DECLARE
    v_father VARCHAR(25) := 'abc';
BEGIN
    DECLARE
        v_child VARCHAR(25) := 'xyz';
    BEGIN
        dbms_output.put_line(v_father);
        dbms_output.put_line(v_child);
    END;

 

    dbms_output.put_line(v_father);
    --dbms_output.put_line(v_child); we cannot access this 
END;

 

 

----------------User input-----------------------

 

DECLARE
    v_salary     employees.salary%TYPE := &sal;
    v_name       employees.last_name%TYPE := '&name';
    v_new_name   employees.last_name%TYPE;
    v_new_salary employees.salary%TYPE;
    --records v_row ;
BEGIN
    UPDATE employees
    SET
        salary = v_salary
    WHERE
        last_name = v_name;

 

    SELECT
        last_name,
        salary
    INTO
        v_new_name,
        v_new_salary
    FROM
        employees
    WHERE
        last_name = v_name;

 

    dbms_output.put_line(v_new_name);
    dbms_output.put_line(v_new_salary);
END;

 

------------------------insert------------------------
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        salary
    ) VALUES (
        218,
        'Ruth',
        'Cores',
        'RCORES',
        current_date,
        'AD_ASST',
        4000
    );

 

END;
/

 

select * from employees where employee_id = 218;

 

-----------------------cursor----------------
set SERVEROUT on;

 

DECLARE
    c_name employees.last_name%TYPE;
    CURSOR c_employees IS
    SELECT
        last_name
    FROM
        employees;

 

BEGIN
OPEN c_employees;
    LOOP

        FETCH c_employees INTO c_name;
        EXIT WHEN c_employees%notfound;
        dbms_output.put_line(c_name);
    END LOOP;

 

    CLOSE c_employees;
END;
/

 

--------------implicit cursor attributes----------
DECLARE
    v_name employees.last_name%TYPE;
BEGIN
    SELECT
        salary
    INTO v_name
    FROM
        employees
    WHERE
        last_name = 'Abel';

 

    IF SQL%found THEN
        dbms_output.put_line(SQL%rowcount
                             || ' '
                             || 'rows found');
    END IF;

 

END;
/
-----------------------if else statement------------
set serveroutput on;

 

DECLARE
    v_age NUMBER := &age;
BEGIN
    IF v_age >= 18 THEN
        dbms_output.put_line('Adult');
    ELSE
        dbms_output.put_line('child');
    END IF;
END;
/

 

---------------------------------case statements-----------------
set serveroutput on;
Declare
v_grade char := upper('&grade');
begin CASE v_grade
    WHEN 'A' THEN
        dbms_output.put_line('Excellent');
    WHEN 'B' THEN
        dbms_output.put_line('Good');
    WHEN 'C' THEN
        dbms_output.put_line('Average');
    WHEN 'D' THEN
        dbms_output.put_line('Below average');
    WHEN 'E' THEN
        dbms_output.put_line('Fail');
    end case;
END ;
/

 

 

-------------------loop statements---------------------------------
DECLARE
    v_counter NUMBER := 1;
BEGIN
    LOOP
        dbms_output.put_line('WELCOME');
        v_counter := v_counter + 1;
        EXIT WHEN ( v_counter > 10 );
    END LOOP;
END;
/
------------------------while loop-------------------
DECLARE
    v_eid   employees.employee_id%TYPE := 100;
    v_fname employees.first_name%TYPE;
    v_dept  employees.department_id%TYPE;
    v_job   employees.job_id%TYPE;
    v_sal   employees.salary%TYPE;
BEGIN
    WHILE v_eid <= 110 LOOP
        SELECT
            first_name,
            department_id,
            job_id,
            salary
        INTO
            v_fname,
            v_dept,
            v_job,
            v_sal
        FROM
            employees
        WHERE
            employee_id = v_eid;

 

        dbms_output.put_line(v_eid
                             || ' '
                             || v_fname
                             || ' '
                             || v_dept
                             || ' '
                             || v_job
                             || ' '
                             || v_sal);

            v_eid := v_eid+1;                 

 

    END LOOP;
END;
/
--------------------records--------------------------------

 

declare
type emp is record
(lname varchar(25),
job varchar(35),
sal number,
e employees%rowtype
);
emp_ref emp;
begin
select * into emp_ref.e from employees where employee_id = 124;
select last_name,job_id,salary into emp_ref.lname,emp_ref.job,emp_ref.sal from employees where employee_id = 124;
dbms_output.put_line(emp_ref.lname||' '||emp_ref.sal||' '||emp_ref.job);
dbms_output.put_line(emp_ref.e.employee_id||' '||emp_ref.e.job_id);
end;
/

 

------------shortcut for rowtype record----------------------
DECLARE
    employee employees%rowtype;
BEGIN
    SELECT
        *
    INTO employee
    FROM
        employees
    WHERE
        employee_id = 124;

 

    --dbms_output.put_line(employee.last_name);
    insert into copyEmp values employee;
END;
/

 

create table copyEmp
as
SELECT
    *
FROM
    employees;

 

delete from copyEmp where employee_id = 124;

 

select * from copyEmp;

 

 

-------------------associative arrays--------------------
set serveroutput on;

 

DECLARE
    v_id NUMBER := 100;
    TYPE emp_table IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    emp  emp_table;
BEGIN
    WHILE v_id <= 110 LOOP
        SELECT
            *
        INTO
            emp
        (v_id)
        FROM
            employees
        WHERE
            employee_id = v_id;

 

        dbms_output.put_line(emp(v_id).employee_id
                             || ' '
                             || emp(v_id).job_id
                             || ' '
                             || emp(v_id).salary);

 

        v_id := v_id + 1;
    END LOOP;
END;
/

-----------------------cursor---------------------
DECLARE
    CURSOR c_emp IS
    SELECT
        last_name,
        job_id
    FROM
        employees;

 

    v_name employees.last_name%TYPE;
    v_job  employees.last_name%TYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO
            v_name,
            v_job;

        EXIT WHEN c_emp%notfound;
        dbms_output.put_line(v_name
                             || ' '
                             || v_job);
    END LOOP;
    close c_emp;

 

END;
/

 

 

------------------Exception handling-----------------------
set serveroutput on;
DECLARE
    v_name VARCHAR2(15);
BEGIN
    SELECT
        last_name
    INTO v_name
    FROM
        employees
    WHERE
        last_name = 'Taylor';

 

    dbms_output.put_line(v_name);
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('too many rows');
END;
/

 

-----------------USER DEFINED EXCEPTIONS-----------------

 

set serveroutput on;

 

DECLARE
    e_insert_excep EXCEPTION;
    PRAGMA exception_init ( e_insert_excep, -01422 );
    v_name VARCHAR2(15);
BEGIN
    SELECT
        first_name
    INTO v_name
    FROM
        employees
    WHERE
        last_name = 'Taylor';

 

    dbms_output.put_line(v_name);
EXCEPTION
    WHEN e_insert_excep THEN
        dbms_output.put_line('too many rows');
       dbms_output.put_line(SQLERRM);
END;
/

 

------------------------------------------------
DECLARE
    e_exception EXCEPTION;
    PRAGMA exception_init ( e_exception, -00001 );
BEGIN
    INSERT INTO employees VALUES (
        125,
        'Jeeva',
        'Nandham',
        'jeevan',
        NULL,
        sysdate,
        'trainee',
        40000,
        NULL,
        50,
        80
    );

 

EXCEPTION
    WHEN e_exception THEN
        dbms_output.put_line('Entered value already exists');
        dbms_output.put_line(sqlerrm);
        dbms_output.put_line(sqlcode);
END;
/

 

----------------------procedure with parameters----------------------------------------
create table dept as select * from departments;
create procedure add_depart(dept_id dept.department_id%type, dept_name dept.department_name%type) is
begin
insert into dept(department_id,department_name) values(dept_id,dept_name);
dbms_output.put_line('Inserted');
end;
--procedure call--
begin 
add_depart(300,'Trainer');
end;

 

 

create procedure add_depart1(dept_id dept.department_id%type, dept_name dept.department_name%type) is

 

v_id dept.department_id%type:=dept_id;
v_name dept.department_name%type:=dept_name;
begin
insert into dept(department_id,department_name) values(v_id,v_name);
dbms_output.put_line('Inserted');
end;

 

 

--procedure call--
begin 
add_depart1(302,'Traineeeee');
end;
drop procedure add_depart1;

 

select * from dept;

 

-----------------------------function with parameters-----------------

 

CREATE FUNCTION check_sal (
    id employees.employee_id%TYPE
) RETURN BOOLEAN IS

 

    v_dept_id    employees.department_id%TYPE;
    v_salary     employees.salary%TYPE;
    v_avg_salary employees.salary%TYPE;
BEGIN
    SELECT
        salary,
        department_id
    INTO
        v_salary,
        v_dept_id
    FROM
        employees
    WHERE
        employee_id = id;

 

    SELECT
        AVG(salary)
    INTO v_avg_salary
    FROM
        employees
    WHERE
        department_id = v_dept_id;

 

    IF v_salary > v_avg_salary THEN
        RETURN true;
    ELSIF v_salary < v_avg_salary THEN
        RETURN false;
    ELSE
        RETURN NULL;
    END IF;

 

END;
/
----function call-------
declare
v_bool boolean := check_sal(&&eid);
begin
if(v_bool = null) then
dbms_output.put_line('No record found');
elsif(v_bool) then
dbms_output.put_line(&eid||' '||'Salary is greater than avg salary ');
else
dbms_output.put_line(&eid||' '||'Salary is lesser than avg salary');
end if;
end;
/

 

 

---------------------------------------------
select * from job_history where employee_id = (select employee_id from employees where last_name = 'Abel');
update employees set department_id = 90,job_id='' where last_name = 'Abel';

 

--------------------Triggers-----------------------
CREATE OR REPLACE TRIGGER display_salary_changes BEFORE
    DELETE OR INSERT OR UPDATE ON employees
    FOR EACH ROW
    WHEN (new.employee_id > 0 )
DECLARE
    sal_diff NUMBER;
BEGIN
    sal_diff := :new.salary - :old.salary;
    dbms_output.put_line('Old salary: ' || :old.salary);
    dbms_output.put_line('New salary: ' || :new.salary);
    dbms_output.put_line('Salary Difference: ' || sal_diff);
END;
/

 

insert into employees values(300,
        'Jeeva',
        'Nandham',
        'jeevan',
        NULL,
        sysdate,
        'trainee',
        40000,
        NULL,
        50,
        80);

 

 

update employees set salary = 25000 where last_name = 'Abel';
drop trigger display_salary_changes;
select * from employees;







declare
    charcter varchar2(10):=&cah;
begin



select * from product;


