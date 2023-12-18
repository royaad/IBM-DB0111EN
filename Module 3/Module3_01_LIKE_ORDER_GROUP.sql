-- Use a database.
USE ibm_edx;
-- Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';
/* Retrieve all employees who were born during the 1970’s.
Here, the age is a character and not an integer */
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';
-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;
-- Retrieve a list of employees ordered by department ID.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;
-- Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;
-- In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;
-- For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;
-- Using department name
SELECT D.DEP_NAME, COUNT(*) AS COUNT
FROM EMPLOYEES AS E, DEPARTMENTS AS D
WHERE E.DEP_ID = D.DEPT_ID_DEP
GROUP BY E.DEP_ID;
/* For each department retrieve the number of employees in the department, and the average employee salary in the department.
Label the computed columns in the result set of SQL as NUM_EMPLOYEES and AVG_SALARY.
Order the result set by Average Salary.*/
SELECT D.DEP_NAME, COUNT(*) AS 'NUMBER OF EMPLOYEES', AVG(E.SALARY) AS 'AVERAGE SALARY'
FROM EMPLOYEES AS E, DEPARTMENTS AS D
WHERE E.DEP_ID = D.DEPT_ID_DEP
GROUP BY E.DEP_ID
ORDER BY 3; -- ORDER BY AVG_SALARY, if we used AVG_SALARY as name for the column
-- limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;