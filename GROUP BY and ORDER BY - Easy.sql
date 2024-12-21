-- MySQL GROUP BY-- 
-- It Groups together rows that have same values in specified column or columns that we are actually grouping on. 
-- After grouping rows together we can run aggregated functions on those rows. 


Select * 
from employee_demographics;

Select gender
from employee_demographics
Group by gender;

-- If we want the average ages for both the genders we will Select and Group by gender then we can perform an aggregated function and 
-- find the avg(age) of each gender. We can also perform other aggregated functions as well such min, max and count etc. 

Select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
Group by gender;


-- MySQL ORDER BY-- 
-- ORDER BY orders our results in an ascending or descending order. 
-- At the very end of our querry we will type in Order By then type in the name of the column on which we want to order all of our columns 
-- By default Order By is in ascending ASC order i.e from A to Z but if we want to order from Z to A we need to type in DESC 

Select * 
from employee_demographics
ORDER BY first_name;

Select * 
from employee_demographics
ORDER BY first_name DESC; 

-- We can Order By more than one column at once. For instance, let's Order by gender and age together and just for age we can change order to DESC
-- We need to carefully place columns in Order By because it may be useless if we put age before gender because all the values are unique in age and gender will not be order by anything.

Select *
from employee_demographics
ORDER BY gender, age DESC; 

-- If we want to use column numbers instead of their names we can but if we delete a column from a table it will not work properly then.

Select *
from employee_demographics
Order By 5, 4; 
