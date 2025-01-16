-- MySQL CASE STATEMENT--
-- Case satatement allow us to add logic in our Select Statement like If and Else in excel or other programming languages. 
-- Let's say we want to categorize our employees Young if their age is less than or equal to 30 and Old if their age is between 30 and 50
-- And then finally if their age is above 50 they will be on Death Door. 
-- We will select those columns which are related to our Case statement then type in CASE to show it is a Case Statement
-- Now in next line our logic will come. After typing WHEN we will type in our condition and after typing THEN we will type our outcome
-- If we want we can add only one logic in our Case Statement and then to end the Case we will type in END and run our Case statement

Select first_name, 
last_name,
age,
CASE
	When age <= 30 Then 'Young'
End
from employee_demographics; 

-- What makes CASE Satament great is that we can add multiple When satatements on our Case Statement. 
-- In our outcome the name of our Case statement may look chaotic so we can change it by using Alias at the END of the Case statement

Select first_name,
last_name,
age,
CASE
	When age <= 30 Then 'Young'
    	When age between 30 and 50 Then 'Old'
    	When age >= 50 Then 'On Death Door'
END As age_bracket
from employee_demographics;

-- Let's suppose management decided to give 5% increase in salary to employees if their salary is below 50000 dollars and 7% if it is above 50000 and 10% bonus if employee is in finance department
-- if < 50000 then 5% increase
-- if > 50000 then 7% increase 
-- if finance then 10% bonus 
-- To give bonus we need to add a new Case Statement in the same Select Statement so at very end of first Case we will put comma then add another Case statement

Select first_name, 
last_name, 
salary,
Case
	When Salary < 50000 Then salary * 0.5
	When Salary > 50000 Then salary * 0.7
End as new_salary,
Case
	When dept_id = 6 Then salary * 0.10
End as Bonus
from employee_salary;


Select *
from parks_departments;

-- CASE Statements are very powerful and useful and can be often used. We can add add some logic, labeling and even perform some maths in it

