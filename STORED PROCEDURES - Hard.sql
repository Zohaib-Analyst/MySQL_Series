-- MySQL STORED PROCEDURES-- 
-- Stored Procedures are a way to store our codes and then reuse them again and again. We can CALL it after saving and then it will run that code
-- Stored Procedures are very helpful in saving complex codes, simplifying queries and enhancing overall performance. 
-- To start creating Stored Procedures we will start with a simple code then we will use more complex queries and other things that we can do in Stored Procedures
-- Let's Select employees from our employee_salary table where salary is greater then or equal to 50000 and then we will save this code in a Stored Procedure

-- To create a simple procedure we will type in CREATE PROCEDURE and then name it, i.e; large_salaries and then put close Parenthesis () and execute 
-- It is very simple Stored Procedure
-- Now if we press refresh button in SCHEMAS we can see under Stored Procedures we have our large_salaries which we wanted in our parks_and_recreation database
-- To make sure it is stored in parks_and_recreation db we can type in USE park_and_recreation before CREATE PROCEDURE but it is not compulsory

CREATE PROCEDURE large_salaries()
Select *
from employee_salary
Where salary >= 50000;

-- Now after creating we can CALL our Stored Procedure by typing in CALL then name of the procedure along with parenthesis large_salarie () and put semi colon and execute 
-- Another way to call our Procedure is if we hover our pointer over Stored Procedure we can see a tiny lightning sign button appears if we give it a click our procedure will be opened in a new window

CALL large_salaries();

-- The way we created our large_salaries Stored Procedure is not a good practice because the code we used is very basic and simple and when creating stored procedures we need to look at multiple things
-- For example, if we  have multiple queries in a procedure and change it's name to large_salaries2(). So we have two different statements and we want them to be under large_salarie2()
-- When we run this code two things happened first we created a stored procedure large_salaries2 and then we selected everything where salary is greater than 10000

CREATE PROCEDURE large_salaries2()
Select *
from employee_salary
Where salary >= 50000;
Select *
FROM employee_salary
Where salary > 10000;

-- The first Select Statement was used in creating a Stored Procedure while second Select was just a random query and we don't want that
-- What we actually want is that both these Select Statements are stored in a  single Store Procedure
-- The best way to achieve this is to use DELIMITER. The semi colon ; which seperates our queries is also a Delimiter and that is why we did not got both Select statements in our Sotred procedure
-- Now we can change a Delimiter to anything we want like //, \\ or $$. So we will type in Delimiter and put $$ and then come to our code
-- and in our code we will type in BEGIN at the start of the first Select statement and END at the end of the second Select statement and put $$ signs 
-- What happened is that we changed Delimiter to $$ then Created our porocedure and Selected both Select Statements. Now all of the code will go in this one Store Procedure
-- Now Semi Colon ; is not our Delimeter and it is best practice to change it again to semi colon ; so we can continue with our queries like before
-- Now one last thing is to change the name of the procedure because large_salaries2() already exists in our Stored Procedures 
-- If we run all this and refresh our SCHEMAS our large_salaries3 Stored Procedure would pe populated 

Delimiter $$
CREATE PROCEDURE large_salaries3()
BEGIN
	Select *
	from employee_salary
	Where salary >= 50000;
	Select *
	from employee_salary
	Where salary > 10000;
END $$ 
Delimiter ;

-- Now if we give a right click to our procedure and selecte Alter Stored Procedure we can see that we have both of the queries with the stored procedure
-- If we call our store procedure we can see that we have two outputs Result 4 and Result 5. Result 4 is where salary is greater than 50000 and Result 5 is where salary > 10000

Call large_salaries3();


-- So far we have done everything by writting it all which is great thing
-- However, if we come to Stored Procedures in Navigator window and give it a right click then select Create Stored Procedure we can than automatically create a store procedure
-- Let's copy larg_salaries3 and create same store procedure if we copy code and paste it their and we can call it new_procedure 
-- Now when we click Apply in right down corner it will generate a new script and we can apply it and create it from their
-- First the script says USE parks_and_rec db then it says Drop Procedure If Exist 'new_procedure' it is beneficial because sometimes if we already created a stored procedure with same name it will not create another one
-- And it is doing everything for us automatically what we wrote in creating a Stored Procedure
-- So when we click Apply and then Finish our new_procedure should be ready. And it looks exactly same to larg_salaries3 because we copied that

-- Last thing we will look is called PARAMETER. Parameters are variables that are passed as an input into Store Procedures and they allow the store procedure to accept an input value and place it into our code
-- We will remove one Select Statement from the code to keep it simple
-- When we say parameters are variables that are passed through into stored procedures we are talking about when we are calling it
-- Let's suppose we want to pass in employee_id and we want to pass in specific person and we want to extract their salary
-- first we will remove where clause from our code and when we are calling it we will pass through a value like 1 which is Leslie Knope
-- and then we want Leslie Knope salary to be the output so we will select salary in select statement instead of everything first
-- But how do we know this 1 is the person we are looking for? Actually we create Parameter right inside parenthesis with name of the procedure
-- and that is what tells store porcedure to accept input value when we are calling it down below. We will call it employee_id and 
-- then we will call our Parameter and give it a data type so we will give it an INT. So we are telling the store procedure when someone calls a store procedure they had to pass an integer can't be a string or date
-- Now we will add Where clause saying employee_id which is first column in our Salary table is equal to employee_id which our Parameter in parenthesis
-- It looks confusing because column name and parameter names are exactly same however, we can change Parameter name if we want and it is encourged
-- There are some naming conventions which can be helpful like P_employee_id or employee_id_param but we can give paremeter any name it will still work
-- Now we will create this Stored Procedure and then call it which should return the salary where the employee_id in employee_id column is equal to whatever was passed through that parameter
-- We will keep it 1 and it should return 75000. We will create it then call it 

Delimiter $$
 Create Procedure large_salaries4(employee_id_param INT)
 Begin
	 Select salary
	 from employee_salary
     Where employee_id = employee_id_param
     ;
 End $$
 Delimiter ;
 
 Call large_salaries4(1); 
 
 
 
 
 
 
 
 

