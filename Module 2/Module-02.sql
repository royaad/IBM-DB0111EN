/*
Terminology
Entities map to tables
Attributes map to columns in a table
Data types
varchar()	# for characters variable in length
char 		# if they do not vary in length
bigint		# hold a number up to 19 digits long

Each table is assigned a primary key which uniquely identifies each row.
Table can also contain foreign keys which correspond to primary keys of other tables therefore linking them together.
860cc263f1d11f35940a5a9fecb581ff
*/

/* Create table syntax 
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....); */
   
# Create two tables PETSALE and PET
CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );
    
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );

# Insert and diplay values
INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');

SELECT * FROM PETSALE;

INSERT INTO PET VALUES
    (1,'Cat',3),
    (2,'Dog',4),
    (3,'Hamster',2);

SELECT * FROM PET;

/* ALTER syntax
ALTER TABLE table_name
ADD COLUMN column_name data_type column_constraint; */

# Add a new QUANTITY column to the PETSALE table and show the altered table
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

# Update the newly added QUANTITY column of the PETSALE table with some values and show all the records of the table.
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM PETSALE;

/* Drop column syntax
ALTER TABLE table_name
DROP COLUMN column_name; */

# Delete the PROFIT column from the PETSALE table and show the altered table
ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;

/* Modify column datatype syntax
ALTER TABLE table_name
MODIFY COLUMN column_name data_type; */

# Change the data type to VARCHAR(20) type of the column PET of the table PETSALE and show the altered table
ALTER TABLE PETSALE
MODIFY COLUMN PET VARCHAR(20);

SELECT * FROM PETSALE;

/* Rename column syntax
ALTER TABLE table_name
RENAME COLUMN current_column_name TO new_column_name; */

# In the PETSALE table, rename the column PET to ANIMAL and show the altered table.
ALTER TABLE PETSALE
RENAME COLUMN PET TO ANIMAL;

SELECT * FROM PETSALE;

# We can equally use
ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);
# Which changes the name and the type of the column

/* TRUNCATE syntax
TRUNCATE TABLE table_name; */

# Remove all rows from the PET table and show the empty table
TRUNCATE TABLE PET;
# TRUNCATE statement is similar to DELETE. However, TRUNCATE is faster than DELETE.
DELETE FROM PET;

SELECT * FROM PET;

/* DROP syntax
DROP TABLE table_name;
Can be executed one table at a time */

/* Delete the PET table and verify if the table still exists or not 
(SELECT statement won’t work if a table doesn’t exist). */
DROP TABLE PET;

SELECT * FROM PET;