-- MySQL TRIGGERS and EVENTS-- 
-- TRIGGERS: A Trigger is a block of code which executes automatically when an Event takes place on a specific table
-- For example, let's suppose when an employee is hired their details are entered into employee_salary table but sometimes they forget to add this information in employee_demographics table and we don't want that
-- So what we want is that when someone's employee_id, first_name and last_name details are added into salary table it should automatically appears in demographics table as well
-- So we will write a Trigger when data is updated in salary table it will automatically update demographics table for us

Select * 
from employee_demographics;

Select *
from employee_salary;

-- To start writting Trigger first we will change Delimiter to double dollar sign $$ because it will help us if we have multiple lines of code which we will have so this delimiter will help us have multiple queries in our Create trigger Statement
-- Ater changing delimite to $$ we will type in CREATE TRIGGER and then name it to our preference such employee_insert
-- Now we will specify what Event needs to take place for this to Trigger
-- So we will write AFTER INSERT ON employee_salary means after we insert data into employee_salary table and down below we will write what will happen
-- Now we writting AFTER means data is entered but we can also write BEFORE which means if data is Deleted or Updated from salary table but we are not doing that now 
-- Now we will tpye in FOR EACH ROW and it means that Trigger will be activated for each row that is inserted. For example, if we add five new employees trigger will be activate for five rows
-- So After Inserting On employee_salary table For Each Row what will happen now? We will write it now 

-- Now we will write a code after typing in BEGIN at start and END at the end of it
-- and this code enclosed between Begin and End will tell what will happen when the above Event takes palce
-- So what we want is that when we insert data in Salary table we want the employee_id, first_name and last_name are insert in demographics table
-- In our code we will say INSERT INTO employee_demographics then specify columns and enclose them in parenthesis (id, first_name,last_name) because we are not selecting everything
-- Now we will specify Values and from Salary table we want id, first and last name but we don't want all of them we only want NEW values and we don't want old values
-- So after typing in VALUES in parenthesis we will type NEW which means we are only selecting the New rows that are just inserted
-- We also have OLD key word if we delete or update rows we use OLD because we can only delete or update Old rows
-- So we will type in NEW. before every column which we have specified id, first and last name

-- Recape:
-- We are creating our trigger called employee_insert. After a row is inserted into the employee_salary table for each row 
-- what will happen is that we will insert into employee_demographics table the employee_id, first_name and last_name
-- then we are taking the values new.employee_id, new.first_name and new.last_name and mysql undertands new means new events that will take place
-- So let's create our Trigger by selecting then executing it and we can see our trigger is created

Delimiter $$ 
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
	FOR EACH ROW 
Begin
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
Delimiter ;

-- If we go to Navigator window underd employee_salary table under Triggers we can find our trigger but we can do anything like update, change and drop
-- Now we will test our Trigger by Inserting data into our salary table

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Owen', 'Chase', 'CEO 360 Entertainment', 950000, NULL);

-- We can see that data was inserted into employee_salary tabel and then automatically our trigger populated employee_demographics table with data in our specified columns
-- So that is how a terigger works and we don't need to go to the table and check it because we know that we have created a trigger and it is automatically inserting data for us
-- it is very helpful in real world because when we have a lots of tables we need many things to be done automatically rather than manually doing it


-- EVENTS -- 
-- A trigger happens when an EVENT takes place whereas an Event takes place when its scheduled 
-- Events can be fantastic for a lot of things like importing data we can pull data from a specific path on a schedule, we can build reports that are exported to a file on a schedule like daily, weekly, monthly, yearly or however we like
-- Events are supper helpful for automation in general 

-- Let's suppose higher management wants to save some money by retiring employees with age of over 60 years
-- So we will create an EVENT which will check let's say every month or everyday if employees are over a specific age it will delete them from the table if they are
-- So if employees are over the age of 60 they will be automatically retired and removed from the table

Select * 
from employee_demographics;

-- Just like triggers first of all we will change delimiter to $$ so we can use multiple statements in our code
-- To create Event we will type in CREATE EVENT and then name it for instance, delete_retiree
-- after naming we will say ON SCHEDULE EVERY and then we select every single month, day or whatever we want. But here we will do Every 30 seconds
-- We will type in DO and here is what needs to happen every 30 second.  
-- NOw will write BEGIN and END and between them we will put our code
-- What will happen every thirty seconds is that employees with age of over 60 should be deleted from employee_demographics table
-- So we will use DELETE statement instead of Select. So we will say Delete from employee_demographics where age is greater then 60

Delimiter $$
CREATE EVENT delete_retiree
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE 
    FROM employee_demographics
    WHERE age > 60;
END $$
Delimiter ;

-- Now we can see that one of the employee with id number 5 Jerry is no more in the list because he was over the age of 60 

-- Let's say what we did that din't worked and we could not create Event at all we need to do two things to fix this
-- first: we will type show variable; and then where variable is like 'event%' and execute 
-- We have even_scheduler where Value is ON. However, if your Value is OFF you should Update it to ON

SHOW VARIABLES LIKE 'event%';

-- Seondly: We many not have permissions to DELETE things. If we do not we will go to Edit located in upper left corner
-- after clicking edit we will select Preferences and then go to SQL Editor and down in the bottom uncheck the box saying Safe Update(rejects updates and deletes with no rejection)
 

