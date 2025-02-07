-- MySQL LIMIT-- 
-- In mysql LIMIT is used to specify the number of rows that we want to be retrieved in our query. 
-- At the end of our query we will type in LIMIT and then the number of row we want to extract. For example, 4 and run a query

Select *
from employee_demographics
LIMIT 4;

-- We can combine Limit with Order By to make it more powerful. For instance, if we want to know three oldest employees we will Order by age Desc then Limit 3

Select * 
from employee_demographics
Order by age Desc
Limit 3;

-- MySQL ALIASING-- 
-- We use Aliasing just to change the name of the column. We can use Aliasing in Join frequently 
-- Here we can use Alias to change the name of avg(age). We will typein AS after avg(age) then give it new name as we like. 

Select gender, 
avg(age)
from employee_demographics
Group by gender;

Select gender, 
avg(age) AS avg_age
from employee_demographics
Group by gender;

