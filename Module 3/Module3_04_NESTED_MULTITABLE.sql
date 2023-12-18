-- Exercise 1: Accessing Multiple Tables with Sub-Queries
-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
-- solution one
select E.*
from employees E, jobs J
where E.JOB_ID = J.JOB_IDENT;
-- solution two
select *
from EMPLOYEES
where JOB_ID IN (select JOB_IDENT from JOBS);
-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
-- solution one
select *
from EMPLOYEES
where JOB_ID IN (select JOB_IDENT from JOBS where LCASE(JOB_TITLE) like '%jr%designer%');
-- solution two
select *
from EMPLOYEES
where JOB_ID IN (select JOB_IDENT from JOBS where JOB_TITLE= 'Jr. Designer');
-- Retrieve JOB information and who earn more than $70,000.
select *
from JOBS
where JOB_IDENT in (select JOB_ID from EMPLOYEES where SALARY > 70000);
-- Retrieve JOB information and list of employees whose birth year is after 1976.
-- solution one
select E.F_NAME, E.L_NAME, E.B_DATE, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY
from EMPLOYEES E, JOBS J
where E.JOB_ID = J.JOB_IDENT and year(E.B_DATE) > 1976;
-- solution two
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from JOBS
where JOB_IDENT IN (select JOB_ID from EMPLOYEES where YEAR(B_DATE)>1976 );
select * from jobs;
-- Retrieve JOB information and list of female employees whose birth year is after 1976.
-- solution one
select *
from JOBS
where JOB_IDENT IN (select JOB_ID from EMPLOYEES where YEAR(B_DATE)>1976 and SEX = 'f');
-- solution two (nested tables)
-- every derived table must have its own alias, without the alias the nesting doesn't work
select *
from JOBS
where JOB_IDENT IN (select EF.JOB_ID from (select * from EMPLOYEES where SEX = 'f') EF where YEAR(EF.B_DATE)>1976);
-- Exercise 2: Accessing Multiple Tables with Implicit Joins
-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select *
from EMPLOYEES, JOBS;
-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table. USE shorter aliases for table names.
select *
from EMPLOYEES E, JOBS J
where E.JOB_ID = J.JOB_IDENT;
-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
from EMPLOYEES E, JOBS J
where E.JOB_ID = J.JOB_IDENT;
-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select EMP_ID, F_NAME, L_NAME, JOB_TITLE
from EMPLOYEES E, JOBS J
where E.JOB_ID = J.JOB_IDENT;