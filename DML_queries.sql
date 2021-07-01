#Select all products with brand �Cacti Plus�
SELECT * FROM product
WHERE brand = 'Cacti Plus';


#Count of total products with product category=�Skin Care�
SELECT COUNT(category)
FROM product
WHERE category='Skin Care';

#Count of total products with MRP more than 100
SELECT COUNT(product_id)
FROM product
WHERE mrp>100;

#Count of total products with product category=�Skin Care� and MRP more than 100
SELECT COUNT(product_id)
FROM product
WHERE mrp>100 AND category='Skin Care';

#Brandwise product count
select brand, COUNT(*) from product
group by brand

#Brandwise as well as Active/Inactive Status wise product count
select brand, active, COUNT(*)
from product
group by brand, active

#Display all columns with Product category in Skin Care or Hair Care
select * from product
where category = 'Skin Care' or category= 'Hair Care'

#Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100
select * from product
where category = 'Skin Care' or category= 'Hair Care' AND mrp>100

#Display   all   columns   with   Product   category=�Skin   Care�   and
#Brand=�Pondy�, and MRP more than 100
select * from product
where category = 'Skin Care' or category= 'Pondy' AND mrp>100

#Display all product names only with names starting from letter P
select * from product
where product_name like 'p%'

#Display  all product  names only with names Having letters �Bar�  in Between
select * from product
where product_name like '%bar%'

#Sales of those products which have been sold in more than two quantity in a bill
select * from sales
where qty>2

#Sales of those products which have been sold in more than two quantity throughout the bill
select product_id, SUM(qty) quantity from sales
group by product_id having SUM(qty)>2

#Create a new table with columns username and birthday, and dump data from dates file. Convert it to .csv format if required.
#Research on Date Function Queries from the slide
#After populating the data, find no of people sharing
#Birth date
#Birth month
#Weekday

Create table dbo.userBirthDate(
username varchar(20),
birthday datetime
)

BULK INSERT dbo.userBirthDate
FROM 'C:\Users\acer\OneDrive\Documents\Leapfrog\dates.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
)

select birthday, count(*) as Number_of_People from userBirthDate
group by birthday having count(*)>1

select datepart(month, birthday) as Month, count(*) as Number_of_People from userBirthDate
group by datepart(month, birthday) having count(*)>1

select datepart(WEEKDAY, birthday) as Weekday, count(*) as Number_of_People from userBirthDate
group by datepart(WEEKDAY, birthday) having count(*)>1








