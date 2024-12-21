-- SELECT Statement--
-- To extract data from a database we use Select statement and we use Select Distinct to extract unique data from a table. 

Select * 
from parks_and_recreation.employee_demographics;

Select first_name,last_name,gender
from employee_demographics;

Select gender
from employee_demographics;

Select distinct gender 
from employee_demographics;
