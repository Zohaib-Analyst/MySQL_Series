-- MySQL TEMPORARY TABLES--
-- Temporary Tables are only visible in a session in which we create them. If we close SQL and reopen it our temporary table would not work
-- We can use Temporary tables for many taks such as to store complex queries or manipulating data before inserting it into a real table
-- There are 2 ways to create temporary tables

-- 1. We can create temp table just like we create a regular table by typing in Create Temporary Table and then name it. And then we use INSERT INTO to insert data into it
-- If we exclude word TEMPORARY in our syntax by mistake or willingly it will create a regular table

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50), last_name varchar(50), favourite_movie varchar(100)
);

INSERT INTO temp_table
VALUES('Zohaib', 'Ahmed', 'Pirates of the Caribbean: Curse of the Black Pearl');

Select *
from temp_table;


-- 2. We can also create a Temporary table by just querying data from a regular table and use it to create a temporary table

-- For instance, if we want to extract data from our empoloyee_salary table with Salary equal to or greater then 50k and convert it into a Temp table
-- So again we will type use Create Temporary Table then name it and then use SELECT Statement to select data WHERE salary is equal to or greater then 50k

Create Temporary Table salary_over_50k 
SELECT *
from employee_salary
WHERE salary >= 50000; 

Select *
from salary_over_50k;


