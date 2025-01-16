-- MySQL UNION --
-- UNIONS allow us to combine rows together. we can combine rows of data from seperate tables or from same table. 
-- We use Unions by taking one Select Statement and combine it whith another Select Statement. 
-- In Select statements we need to select similar columns in both statements other wise we will recieve bad data in our result. So consistancy in data is necessary in Select Statements
-- We can not combine random columns together. We need to keep the data same (in Select Statements) while using Union in mysql. 

Select first_name, last_name
from employee_demographics
UNION 
Select first_name, last_name
from employee_salary;

-- By default Union is Distinct which means it will only display distinct values. If we want duplicate values as well we will use Union ALL

Select first_name, last_name
from employee_demographics
UNION ALL
Select first_name, last_name
from employee_salary;

-- Now suppose management wanted to identify employees with age greater than 40 and salary greater than 70000 and also seperate them by gender. 
-- We will use Unions to combine rows of data in both tables and we will use Where clause to identify people whith higher age and salary
-- We will also LABEL employees as Old Man or Old Lady and also Highly Paid Employee. And in last we will Order by first and last name. 
-- To keep the data consistent we used first_name and last_name in all the Select Statements

Select first_name, last_name, 'Old Man' as Label
from employee_demographics
Where age > 40 and gender = 'Male'
Union
Select first_name, last_name, 'Old Lady' as Label
from employee_demographics
Where age > 40 and gender = 'Female'
Union 
Select first_name, last_name, 'Highly Paid Employee' as Label
from employee_salary
Where Salary > 70000
Order by first_name, last_name;
