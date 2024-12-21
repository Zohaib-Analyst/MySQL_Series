-- MySQL SUBQUERIES --
-- A Subquery is basically a query within a query. Query(Subquery)
-- We write a Query and close it in set of parenthesis, whatever value or values are retruned from the Subquery we would use in outer Query
-- We can write a Subquery in few different ways such as in Where Clause, Select Statement and From Clasue 
-- If we want to know the employees working in parks_dempartment we can do that by using Joins or we can use SUBQUERY in Where clause

Select *
from employee_demographics
WHERE employee_id IN 
	(Select employee_id
	from employee_salary
	Where dept_id = 1); 

-- If we run our Subquery it creates a list of employees where dept_id is equal to 1. And our outer or main Query matches employee ids from employee demographics table to this list
-- So we are selecting everything from employee_demographics WHERE employee_id is IN employee_salary WHERE dept_id = 1. 
-- Our Subquery which is also called Operand because IN is operator should only contain one column

-- Let's suppose we wnat to compare the salary of each employee to the average salary we can use SUBQUERY in our Select Statement to achieve this task
-- If we want we can also give Alias to our Subquery

Select first_name, 
last_name, 
salary,
	(Select avg(salary)
	from employee_salary) AS avg_salary
from employee_salary;


-- Subquery in FROM Statement
-- We will creat a Group By based on gender column then add aggregated functions to it and use it in SUBQUERY in the FROM Statement

Select gender, 
avg(age), 
max(age), 
min(age), 
count(age)
from employee_demographics
group by gender;

-- Now if we want the average of max or min age or average of male and female count we can do that with our table but we have to use it in our From statement
-- So now we will select everything from the output in our From Statement and first we must give an ALIAS to our table 
-- Now before starting aggregations on our table one last thing that we need to do is to give names (alias) to our aggreated functions 
-- We can now perform aggregated functions and do calculations 

Select *
from 
(Select gender, 
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_age,
count(age) as count_age
from employee_demographics
group by gender) as Aggreated_Table;






