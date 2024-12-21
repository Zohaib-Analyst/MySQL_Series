-- MySQL HAVING vs WHERE Clause --
-- HAVING is specifically created for filtering based on aggregate functions once Group By happens otherwise if we use Where clause before Group By it won't work.

Select gender, avg(age)
from employee_demographics
Group by gender
HAVING avg(age) > 40;

-- We can use Having and Where both in one querry

Select occupation, avg(salary)
from employee_salary
Where occupation like '%manager%'
Group by occupation
Having avg(salary) > 75000;

-- Here we filtered at row level with WHERE clause and at aggregated function level with HAVING. 
-- HAVING is only going to work for aggregated functions after the Group By runs. We have to use Having clause if we want to filter on aggregated functions.alter

