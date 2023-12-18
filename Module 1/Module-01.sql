-- Create a SQL schema named filmlocations
CREATE SCHEMA `filmlocations` ;

/*
In filmlocations, right-click on Tables
and the select Table Data Import Wizard
to import csv file.
*/

LOAD DATA LOCAL INFILE 'C:/Users/user/Desktop/MOOCs/IBM DB0111EN/data/FilmLocations.csv'
INTO TABLE filmlocations.filmlocations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/* Data Description
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
