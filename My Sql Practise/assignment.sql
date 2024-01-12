DROP TABLE IF EXISTS  ;
DECLARE
   CURSOR c1 IS SELECT *  FROM employees;
   
BEGIN
   EXECUTE IMMEDIATE 'CREATE TABLE eemp  AS SELECT employee_id,last_name,job_id,department_id FROM employees WHERE 1=2 ';
   FOR r1 IN c1 LOOP
      EXECUTE IMMEDIATE 'INSERT INTO eemp VALUES (:1,:2,:3,:4)' USING r1.employee_id, r1.last_name,r1.job_id,r1.department_id;
      
   END LOOP;
   
   DROP TABLE IF EXISTS  
END;



 