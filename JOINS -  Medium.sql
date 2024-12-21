-- MySQL JOINS--
-- With JOINS we combine two or more columns together if they have same columns. The columns may have same names or contain same type of data

-- INNER JOIN--
-- One of the most common and simple Join which returns rows that are same from both columns in both tables. 
-- By default Join represent Inner join we can write just join or inner join. 
-- So we are Selecting from employee_demographics and having an Inner Join on employee_salary
-- After selecting the tables on which we are joinning we have to tell mysql on which columns we are Joinning? 
-- we will type in a key word ON which tells mysql that we are joinning the tables based ON these two columns. In our example these are employee_id
-- We have to mention to which table each employee_id column belongs otherwise mysql will not give us our desired result. 

Select *
from employee_demographics;

Select *
from employee_salary;

Select * 
from employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;

-- Now we can use Aliases to make our code simple and easy to read

Select *
from employee_demographics AS dem
Inner Join employee_salary AS sal
	ON dem.employee_id = sal.employee_id; 

-- Now instead of everything we can Select specific columns from both the tables. Let's select first_name, age and occupation.
-- We need to focus on our Select satatement here because first_name is present in both tables and we have to mention from which table we are fetching data or mysql will give an error
-- we will retrieve first_name from employee_demographic table. we can also type Alias dem in select satatement

Select dem.first_name, 
age, occupation
from employee_demographics as dem
inner join employee_salary as sal
	ON dem.employee_id = sal.employee_id;


-- OUTER JOINS--
-- We have LEFT Outer Joins and RIGHT Outter Joins. 
-- LEFT Join or LEFT Outer Join is going to take everything from the left table even if there there is no matching columns then it is going to return matches from the right table. 
-- Right Join or Right Outer Join will take everything from right table and return matching values from the left table. Exactly opposite 

Select *
from employee_demographics as dem
LEFT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;

Select * 
from employee_demographics as dem
RIGHT JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;

-- In LEFT Join it took everything from left table which employee_demo and returned matching values from right table which is salary table
-- In Right Join everythig from right table which is Salary table was taken and matching from left table demo table but if there is no match it will return NULLS


-- SELF JOIN-- 
-- As the name suggests in SELF Join the table is joined to itself. 
-- Let's say its first december and HR dept decided to do a Secret Santa (arrangement by which all collegues exchange gifts anonymously)
-- Management decided who is going to be secret santa for employees will be decided based on their employee_ids
-- So we will Select from employee_salary and then Join on employee_salary as well. But when we come to ON key word we have to specify from which table we are pulling? is left or right?
-- We must distinguish between these tables because they both are same so we will use ALIAS to change their names to anything, here it will be emp1 and emp2
 -- When we run this we will get exactly one on one match because they both are the same tables. 
 -- Now we will assign an employee_id to next employee_id and that will be their Secret Santa. So if we add one (+1) to emp1.employee_id and run querry
 -- Now we can see employee_id 1 which Leslie Knope is going to be assigned to Ron Swanson who has employee_id 2 and so on. 
 
Select * 
from employee_salary AS emp1
Join employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;

-- Now we can see that our output looks chaotic and if we want we can simplify it and specify which columns we want in our output
-- What we want is the employee_id, first_name, last_name and then employee_id, first_name, last_name of the person who they got secret santa
-- 
Select emp1.employee_id as emp_santa, 
emp1.first_name as first_name_santa, 
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name, 
emp2.first_name as first_name_emp, 
emp2.last_name as last_name_emp
from employee_salary as emp1
inner join employee_salary as emp2
	ON emp1.employee_id + 1 = emp2.employee_id;


-- Joining Multiple Tables--
-- We can join three tables together and extract data from them. 
-- We already have joined employee and salary tables together and we will Join parks_dempartments table to it 
-- If we notice we have department_id column in parks_departments table and dept_id in salary table. Their name is different but they both have same type of data so we can join them
-- So we will add another Inner Join at the end of already joinned demographics and salary tables. 

Select * 
from employee_demographics as dem
inner join employee_salary as sal
	On dem.employee_id = sal.employee_id
Inner Join parks_departments as pd
	On sal.dept_id = pd.department_id;

Select *
from parks_departments;







