-- Create a SQL schema named filmlocations
CREATE SCHEMA `filmlocations`;

/*
In filmlocations, right-click on Tables
and the select Table Data Import Wizard
to import csv file.

Data Description
FilmLocations(
    Title:              titles of the films, 
    ReleaseYear:        time of public release of the films, 
    Locations:          locations of San Francisco where the films were shot, 
    FunFacts:           funny facts about the filming locations, 
    ProductionCompany:  companies who produced the films, 
    Distributor:        companies who distributed the films, 
    Director:           people who directed the films, 
    Writer:             people who wrote the films, 
    Actor1:             person 1 who acted in the films, 
    Actor2:             person 2 who acted in the films, 
    Actor3:             person 3 who acted in the films

Basic SQL Read Commands
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

-- Retrieve all records with all columns from the FilmLocations table.
SELECT * FROM FilmLocations;
-- Retrieve the names of all films with director names and writer names.
SELECT Title, Director, Writer FROM FilmLocations;
-- Retrieve the names of all films released in the 21st century and onwards
-- (release years after 2001 including 2001), along with filming locations and release years.
SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear>=2001;
# Retrieve the names, production company names, filming locations, and release years 
# of the films which are not written by James Cameron.
SELECT Title, ProductionCompany, Locations, ReleaseYear FROM FilmLocations WHERE Writer<>"James Cameron";
# Retrieve the number of rows from the “FilmLocations” table.
SELECT COUNT(*) FROM FilmLocations;
/* In this example, now we want to count the number of locations of the films.
But we also want to restrict the output resultset in such a way that we only 
retrieve the number of locations of the films written by a certain writer. */
SELECT COUNT(Locations) FROM FilmLocations WHERE Writer="James Cameron";
# Retrieve the name of all films without any repeated titles.
SELECT DISTINCT Title FROM FilmLocations;
# Retrieve the number of release years of the films distinctly, produced by Warner Bros. Pictures.
SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures";
# Retrieve the names of all the directors and their distinct films shot at City Hall.
SELECT DISTINCT Title, Director FROM FilmLocations WHERE Locations="City Hall";
# Retrieve the first 25 rows from the “FilmLocations” table.
SELECT * FROM FilmLocations LIMIT 25;
# Retrieve the first 15 rows from the “FilmLocations” table starting from row 11.
SELECT * FROM FilmLocations LIMIT 15 OFFSET 10;
# Retrieve first 10 film names distinctly released in 2015. (order of WHERE AND LIMIT matter)
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 10;
# Retrieve the next 3 film names distinctly after first 5 films released in 2015.
SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 3 OFFSET 5;

# Create a new schema
CREATE SCHEMA `instructors`;
/* Creat a table syntax
CREATE TABLE `table_name` (
`column1` TYPE CONSTRAINT,
`column2` TYPE CONSTRAINT, 
...); */
CREATE TABLE `instructor`	(
							`ins_id` INT,
							`lastname` VARCHAR(50),
							`firstname` VARCHAR(50),
							`city` VARCHAR(50),
							`country` VARCHAR(3)
							);

/* Insert syntax
INSERT INTO table_name (column1, column2, ... )
VALUES (value1, value2, ... ); */

/* Insert a new instructor record with id 4 for Sandip Saha who lives in Edmonton, CA
into the “Instructor” table. */
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');

/* Insert two new instructor records into the “Instructor” table.
First record with id 5 for John Doe who lives in Sydney, AU.
Second record with id 6 for Jane Doe who lives in Dhaka, BD. */
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(5, 'Doe', 'John', 'Sydney', 'AU'), (6, 'Doe', 'Jane', 'Dhaka', 'BD'),
(16, 'Smith', 'Hima', NULL, NULL);

# Insert with missing info
INSERT INTO Instructor(ins_id, lastname, firstname, country)
VALUES(8, 'DOE', 'Antonio', 'CA');

SELECT * FROM instructor;

/* Update syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; */
# Update the city for Sandip to Toronto.
UPDATE Instructor 
SET city='Toronto' 
WHERE firstname="Sandip";
/* might cause Error code 1175,
check following link for solution
https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench */

# Update the city and country for Doe with id 5 to Dubai and AE respectively.
UPDATE Instructor 
SET city='Dubai', country='AE' 
WHERE ins_id=5;

SELECT * FROM instructor;

/* # Delete syntax
DELETE FROM table_name
WHERE condition; */

# Remove the instructor record of Doe whose id is 6.
DELETE FROM instructor
WHERE ins_id = 6;
# Remove the instructor record of Hima.
DELETE FROM instructor
WHERE firstname = 'Hima';
# Remove all rows
DELETE FROM instructor;

SELECT * FROM instructor;