-- Find the total number of crimes recorded in the CRIME table.
select COUNT(*)
from CHICAGO_CRIME;
-- Retrieve first 10 rows from the CRIME table.
select *
from CHICAGO_CRIME
limit 10;
-- How many crimes involve an arrest?
select COUNT(*)
from CHICAGO_CRIME
where lcase(ARREST) = 'true';
-- Which unique types of crimes have been recorded at GAS STATION locations?
-- hint: Which column lists types of crimes e.g. THEFT?
select distinct(PRIMARY_TYPE), LOCATION_DESCRIPTION
from CHICAGO_CRIME
where LOCATION_DESCRIPTION like '%gas%';
-- In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’.
select COMMUNITY_AREA_NAME
from CHICAGO_SOCIOECONOMIC_DATA
where COMMUNITY_AREA_NAME like 'b%';
-- Which schools in Community Areas 10 to 15 are healthy school certified?
select NAME_OF_SCHOOL, COMMUNITY_AREA_NUMBER, HEALTHY_SCHOOL_CERTIFIED
from chicago_public_schools
where (COMMUNITY_AREA_NUMBER between 10 and 15)and HEALTHY_SCHOOL_CERTIFIED like 'y%';
-- What is the average school Safety Score?
select round(avg(SAFETY_SCORE), 2)
from chicago_public_schools;
-- List the top 5 Community Areas by average College Enrollment [number of students]
select COMMUNITY_AREA_NAME, round(avg(COLLEGE_ENROLLMENT),2) as AVG_ENROLLMENT
from chicago_public_schools
group by COMMUNITY_AREA_NAME
order by AVG_ENROLLMENT desc
limit 5;
-- Use a sub-query to determine which Community Area has the least value for school Safety Score?
-- I will not consider empty rows
select COMMUNITY_AREA_NAME, SAFETY_SCORE
from chicago_public_schools
where SAFETY_SCORE = (select MIN(SAFETY_SCORE)
					  from chicago_public_schools
                      where SAFETY_SCORE <> '');
-- [Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1.
-- solution one
select CSD.COMMUNITY_AREA_NAME, PER_CAPITA_INCOME, CPS.SAFETY_SCORE
from chicago_socioeconomic_data CSD, chicago_public_schools CPS
where (CSD.COMMUNITY_AREA_NUMBER = CPS.COMMUNITY_AREA_NUMBER) and (CPS.SAFETY_SCORE = 1);
-- solution two
select COMMUNITY_AREA_NAME, PER_CAPITA_INCOME
from chicago_socioeconomic_data
where COMMUNITY_AREA_NUMBER IN (select COMMUNITY_AREA_NUMBER
                                from chicago_public_schools
                                where SAFETY_SCORE = 1);
-- to check not null values
select *
from chicago_socioeconomic_data
where PER_CAPITA_INCOME is not null;

