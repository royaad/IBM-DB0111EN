-- if we want to access the table in a schema, we can use the . attribute operator
SELECT * FROM pets.petrescue;
-- create a new schema
CREATE SCHEMA `chicago_schools`;
-- show list of tables in schema
SHOW TABLES;
-- show column names and types
show columns from chicago_public_schools;
-- only for NAME_OF_SCHOOL /  the '' are necessary
show columns from chicago_public_schools where field = 'NAME_OF_SCHOOL';
-- or use desc or describe function
desc chicago_public_schools;
-- just for NAME_OF_SCHOOL
desc chicago_public_schools NAME_OF_SCHOOL;
-- any columns containing school
desc chicago_public_schools '%SCHOOL%';
-- use INFORMATION SCHEMA
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH AS MAX_LENGTH, CHARACTER_OCTET_LENGTH AS OCTET_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
AND TABLE_NAME = 'chicago_public_schools' 
AND COLUMN_NAME = 'NAME_OF_SCHOOL';