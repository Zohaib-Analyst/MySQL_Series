-- COMMON TABLE EXPRESSION (CTEs) in MySQL--
-- CTEs allow us to define a subquery block which we can then reference in our main query. 
-- To understand the basics of creating a CTE we will make our query a CTE. 
-- So we will join demographics and salary tables and then Select gender and Group By gender and perform some aggregated functions such avg, max, min and count

Select gender, 
avg(salary) as avg_sal, 
max(salary) as max_sal, 
min(salary)as min_sal, 
count(salary) as count_sal
from employee_demographics dem
join employee_salary sal
	On dem.employee_id = sal.employee_id
Group by gender;

-- We will type in "WITH" which is the key word to define and start a CTE and then we will name our CTE i.e; "custome_cte" then type in "AS" 
-- So after typing With then naming our CTE and typing AS we will put our query inside parenthesis to emphasis this is in CTE. We can do that in other ways as well
-- We can use CTEs immediately after we create them so if we come right below it then we can select everything or any aggregated function from our custom_cte
-- CTE is a like we create a table and then query of it down below. 

WITH custom_cte AS
(
Select 
gender, 
avg(salary) as avg_sal, 
max(salary) as max_sal, 
min(salary) as min_sal, 
count(salary) as count_sal
from employee_demographics dem
join employee_salary sal
	On dem.employee_id = sal.employee_id
Group by gender
)
Select avg(avg_sal)
from custom_cte;

-- Other benifits of CTEs are that we can perform more complex calculations which we can not perform easiy in a subquery and
-- with CTEs it is easy to read and understand our code although, we can achieve same result with a subquery but that will be more chaotic and hard to read the code
-- We can only query of a CTE right below it using a Select statement. If we try another Select statement below that to query from a CTE it will show us an error or we can not reuse it
-- reason is that we are not creating a permanent object like a temp table, real table, view or  anything its just a Common Table Expression. It is just like a temporary table

-- We can create multiple CTEs within one CTE and the reason for this is that if we want to use more complex queries or join multiple queries we can build a cte within cte

WITH custom_cte AS
(
Select employee_id, gender, birth_date
from employee_demographics
Where birth_date > '1985-01-01'
),
custom_cte2 AS
(
Select employee_id, salary
from employee_salary
where salary > 50000
)
Select * 
from custom_cte
Join custom_cte2
	ON custom_cte.employee_id = custom_cte2.employee_id
;

-- It is not a real use case but an example. Howevere, if we have complex queries we can combine CTEs together and answer our questions






