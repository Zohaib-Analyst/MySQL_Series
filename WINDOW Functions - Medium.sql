-- MySQL WINDOW Functions--
-- Window functions are very powerful and they are like Gruop By but they do not roll up everything in one row 
-- To compare Window Functions with Group By first we will wirte a Group by and then Window functions for compariso
-- So we will take salary column from salary table and gender from demographic table by joining them and then use Group by and Window functions to compare salaries of gender

Select * 
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id;

Select gender, 
avg(salary)
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id
group by gender;

-- In MySQL we have aggregated functions such as sum, min, max, count etc these functions will take some numbers of rows that we have grouped together using GROUP BY and reduce group of values into a single value
-- Like we have selected gender and avg salary and then group by gender so avg salary of Females are grouped together and Males together in a single row 
-- So we have two differene groups and we have two different rows and their average salaries. Each group is collapsed down to a single row and that is what Group By does

-- However, that is not how WINDOWS Functions work. Windows Fuctions can also perform aggregated functions on group of rows, but they will produce result for every single row 
-- Let's perform same calculation by using a Window function "OVER". We will calculate the average salary for each gender 
-- We get the same numbers when it comes to the average salaries of male and female, however in group by the result is grouped in a single row for each group. But in windows function the result is displayed for each row

Select gender, 
salary, 
avg(salary) OVER(partition by gender) as gender_avg
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id;

-- The OVER key word in our Window function is vital it tells SQL that we are running this as a Window function and when we leave it empty it says one massive Window means all the rows in our selection
-- So AVG(Salary) OVER() will calculate the average salary Over one massive window with all of the rows
-- Let's see how it works. Every single row now should have overall average salary of 56090.90 next to it. 

Select gender, 
salary, 
avg(salary) OVER() as overall_salary
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id;

-- So inside OVER we use Partition By and instead of one massive window with all of the rows calculating average salary for all rows, we will calcuate average salary for each of the group Partition by gender (male,female)

Select gender, 
salary, 
avg(salary)over(Partition By gender) as gender_avg
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id;

-- We can do the same thing with all of the aggregated functions. For instance, we can find gender max and min salary using Over function

Select gender, 
salary, 
avg(salary) OVER(partition by gender) as gender_avg,
max(salary) OVER(Partition By gender) as gender_max,
min(salary) OVER(Partition By gender) as gender_min
from employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id;

-- We can find same avg, max, min using Windows Over Partition By function, but they are along side origional rows. 

-- Another Window function which works with Over clause is RANK. Rank allow us to find Rank of a current row within its partition
-- What we can do is to calculate the current rank of each salary within the gender and also overall rank of each employee in the department

Select gender,
salary,
avg(salary) over(partition by gender) as avg_salary,
max(salary) over(partition by gender) as max_salary,
min(salary) over(partition by gender) as min_salary,
RANK() Over(Order by Salary desc) as overall_rank,
RANK() Over(Partition by gender Order by Salary desc) as gender_rank
from employee_demographics as dem
Join employee_salary as sal 
	on dem.employee_id = sal.employee_id;

-- Now we have overall Rank for every employee and then Rank within the gender. 
-- We can see that in Rank function when we have a duplicate value in our salary table while we are using Order by this function will assign same number to duplicates
-- and next number will not be numerically it will be positionally just like in our example of 1 2 3 4 5 5 7 in gender_rank column

-- We have another Window function called ROW_NUMBER which will not assign same number to duplicate values and will return numbers numerically

Select gender,
salary,
avg(salary) over(partition by gender) as avg_salary,
max(salary) over(partition by gender) as max_salary,
min(salary) over(partition by gender) as min_salary,
RANK() Over(Order by Salary desc) as overall_rank,
RANK() Over(Partition by gender Order by Salary desc) as gender_rank,
ROW_NUMBER () Over(Partition by gender Order by Salary desc) as row_num
from employee_demographics as dem
Join employee_salary as sal 
	on dem.employee_id = sal.employee_id;
