-- MYSQL WHERE CLAUSE-- 
-- Where Clasue is used to filter our data. By using Where Clause we only return rows that meet specific condition
-- We use different comparison operators such as =, !=, >, <, >=, <= and between etc. 

Select *
from employee_demographics
Where first_name = 'Jerry';

Select * 
from employee_salary
Where Salary <= 50000;

Select * 
from employee_demographics
Where gender != 'female';

Select *
from employee_demographics
Where birth_date > 1985-01-01; 

-- To add logic in Where clause we can add different LOGICAL Operators such AND, OR and NOT in our querry. 
-- For instance, we can say Select everything from e_d where birth_date > 1985 AND gender = male or female. It will return row which fullfill both conditions.

Select *
from employee_demographics
Where birth_date > 1985-01-01
AND gender = 'male';

-- When we use OR operator if one of the condition is true querry will return the data.

Select *
from employee_demographics
Where birth_date > 1985-01-01
OR gender = 'male';

-- We can have more than one conditional statements if we use parenthesis in our querry.

Select * 
from employee_demographics
Where (first_name = "Leslie" AND age = 44) OR age > 55; 

-- LIKE Statement-- We use LIKE statement in Where clause if we are looking for a spesific pattern in our data. 
-- We can add two special characters in our LIKE Statement whihc are % and _. The % sign means anything and _ means a specific value.

-- It will return names which start with an 'a' 

Select *
from employee_demographics
Where first_name LIKE 'a%';

-- It will retrun name that start with 'a' and than have any two other words

Select *
from employee_demographics
Where first_name LIKE 'a__';

-- We can also combine both characters to get what we want. For example if we want to extract 'April' from employee_demo table. 

Select * 
from employee_demographics
Where first_name LIKE "a____%";
