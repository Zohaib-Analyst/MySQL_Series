-- MySQL String Functions--

-- 1. LENGTH: Lenght functions tells us how long a text string is. 

Select length('Zohaib'); 

Select first_name, length(first_name) 
from employee_demographics
order by 2;

-- 2. UPPER: Upper function gives us string in all upper case 

Select Upper('zohaib'); 

-- 3. LOWER: Lower function provide string in all lower case

Select Lower('ZOHAIB'); 

Select first_name, Upper(first_name), Lower(first_name)
from employee_demographics;

-- With UPPER and LOWER functions we can easily fix standardization issues in our columns. 

-- 4. TRIM: Trim function eleminates blank spaces from the start and at the end of a string. 

Select Trim('      Zohaib       '); 

-- a. LTrim: Left Trim removes blank spaces from the start of a text. 

Select Ltrim('     Zohaib       ');

-- b. RTrim: Right Trim romoves spaces from the end of the string. 

Select Rtrim('     Zohaib       ');

-- 5. LEFT: Left function helps us extract characters from left of a text. We need to specify the number of characters to be extracted.

Select first_name, left(first_name,3)
from employee_demographics;

-- 6. RIGHT: With Right function we extract specified numbers of characters from right side of a string. 

Select first_name, right(first_name,3)
from employee_demographics; 

-- 7. SUBSTRING: If compare to Left and Right function SUBSTRING is extremely useful because it allows us to do many things which will be difficult with other functions
-- If we want to extract characters from the middle of a string we can use Substring to do it easily
-- After selecting our desired column the first thing that we need after comma is the position that we want to start at, and then specify how many characters we want to extract
-- For instance, we have bith_date column in our table and if management wants to know birth month of each employee we can use String function to extract month easily

Select *
from employee_demographics;

Select birth_date, substring(birth_date,6,2) as birth_month
from employee_demographics;


-- 8. REPLACE: As name suggests it will Replace specific characters with other characters that we mention. 

Select first_name, Replace(first_name, 'a', 'z')
from employee_demographics;

-- 9. LOCATE: It Locates the position of a character or a sequence in a string

Select Locate('a','Zohaib');

Select first_name, locate('an', first_name)
from employee_demographics;


-- 10. CONCAT: With Concat function we can combine two seperate columns into a single column. For example, first_name and last_name columns can be combined 
-- This function is very useful. This function is used a lot in real jobs
-- To add a space between first and last name we just need to put a space between commas in our code. And we can call it as full_name

Select first_name, last_name,
concat(first_name,' ', last_name) as full_name
from employee_demographics;


