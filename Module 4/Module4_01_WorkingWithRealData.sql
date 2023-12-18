-- How many Elementary Schools are in the dataset?
-- solution one
select COUNT(DISTINCT(LCASE(NAME_OF_SCHOOL)))
from chicago_public_schools
where `Elementary, Middle, or High School` = 'ES';
-- solution two / in case we are sure there are no duplicates
select count(*)
from chicago_public_schools
where `Elementary, Middle, or High School` ='ES';
-- What is the highest Safety Score?
select MAX(SAFETY_SCORE) AS MAX_SAFETY_SCORE
from chicago_public_schools;
-- Which schools have highest Safety Score?
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, SAFETY_SCORE
from chicago_public_schools
where SAFETY_SCORE = (select MAX(SAFETY_SCORE)
from chicago_public_schools);
-- What are the top 10 schools with the highest “Average Student Attendance”?
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, AVERAGE_STUDENT_ATTENDANCE
from chicago_public_schools
order by AVERAGE_STUDENT_ATTENDANCE desc
limit 10;
-- Retrieve the list of 5 Schools with the lowest Average Student Attendance sorted in ascending order based on attendance
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, AVERAGE_STUDENT_ATTENDANCE
from chicago_public_schools
order by AVERAGE_STUDENT_ATTENDANCE
limit 5;
-- Now remove the ‘%’ sign from the above result set for Average Student Attendance column
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, replace(AVERAGE_STUDENT_ATTENDANCE, '%', '')
from chicago_public_schools
order by AVERAGE_STUDENT_ATTENDANCE
limit 5;
-- Which Schools have Average Student Attendance lower than 70%?
-- solution one
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, AVERAGE_STUDENT_ATTENDANCE
from chicago_public_schools
where AVERAGE_STUDENT_ATTENDANCE < 70
order by AVERAGE_STUDENT_ATTENDANCE;
-- solution two
select School_ID, NAME_OF_SCHOOL, `Elementary, Middle, or High School`, AVERAGE_STUDENT_ATTENDANCE
from chicago_public_schools
where cast(replace(AVERAGE_STUDENT_ATTENDANCE,'%','') as double) < 70
order by AVERAGE_STUDENT_ATTENDANCE;
-- Get the total College Enrollment for each Community Area
select COMMUNITY_AREA_NAME, sum(COLLEGE_ENROLLMENT) as TOTAL_ENROLLMENT
from chicago_public_schools
group by COMMUNITY_AREA_NAME;
-- Get the 5 Community Areas with the least total College Enrollment sorted in ascending order
select COMMUNITY_AREA_NAME, sum(COLLEGE_ENROLLMENT) as TOTAL_ENROLLMENT
from chicago_public_schools
group by COMMUNITY_AREA_NAME
order by TOTAL_ENROLLMENT asc
limit 5;
-- List 5 schools with lowest safety score.
select NAME_OF_SCHOOL, SAFETY_SCORE
from chicago_public_schools
order by SAFETY_SCORE asc
limit 5;
-- Get the hardship index for the community area which has College Enrollment of 4368
select CSD.COMMUNITY_AREA_NUMBER, CSD.COMMUNITY_AREA_NAME, HARDSHIP_INDEX
from chicago_socioeconomic_data CSD, chicago_public_schools CPS
where CSD.COMMUNITY_AREA_NUMBER = CPS.COMMUNITY_AREA_NUMBER and COLLEGE_ENROLLMENT = 4368;
-- Get the hardship index for the community area which has the school with the highest enrollment.
-- solution one based on the previous query
select CSD.COMMUNITY_AREA_NUMBER, CSD.COMMUNITY_AREA_NAME, HARDSHIP_INDEX
from chicago_socioeconomic_data CSD, chicago_public_schools CPS
where CSD.COMMUNITY_AREA_NUMBER = CPS.COMMUNITY_AREA_NUMBER and COLLEGE_ENROLLMENT = (select MAX(COLLEGE_ENROLLMENT) from chicago_public_schools);
-- solution two
select community_area_number, community_area_name, hardship_index
from chicago_socioeconomic_data 
where community_area_number in (select community_area_number
                                from chicago_public_schools
                                where COLLEGE_ENROLLMENT = (select MAX(COLLEGE_ENROLLMENT)
                                                            from chicago_public_schools
                                                            )
								);

-- Get the hardship index for the community area which has Total College Enrollment above 10000
/* intermediate query
the query gets the number and name of areas with enrollment higher than 10000 */
select *
from (select COMMUNITY_AREA_NUMBER, COMMUNITY_AREA_NAME, sum(COLLEGE_ENROLLMENT) as TOTAL_ENROLLMENT
      from chicago_public_schools
	  group by COMMUNITY_AREA_NAME) as TOT_ENR_SUB
where TOT_ENR_SUB.TOTAL_ENROLLMENT > 10000;
-- full query
select COMMUNITY_AREA_NAME, HARDSHIP_INDEX
from chicago_socioeconomic_data
where COMMUNITY_AREA_NUMBER IN (select TOT_ENR_SUB.COMMUNITY_AREA_NUMBER
                                from (select COMMUNITY_AREA_NUMBER, sum(COLLEGE_ENROLLMENT) as TOTAL_ENROLLMENT
                                      from chicago_public_schools
									  group by COMMUNITY_AREA_NAME) as TOT_ENR_SUB
                                 where TOT_ENR_SUB.TOTAL_ENROLLMENT > 10000
								);