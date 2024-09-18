## 16 sep

## 1 Write a SQL query to calculate the average buy price of all products
use dummyy;
select avg(buyprice) as avgbuyprcie
from products;
select round(avg(buyprice)) as avgbuyprcie
from products;

## 2 Write a SQL query to calculate the average buy price for each productline
use dummyy;
select productline, avg(buyprice) as avgbuyprice
from products
group by productline;

## 3 Write a SQL query to get the number of products for each productline
use dummyy;
select productline, count(*) as num_of_products
from products
group by productline;

## 4 Write a SQL query to get total order value for each product
use dummyy;
select productcode,
sum(quantityordered * priceeach) as total_order_value
from orderdetails
group by productcode;


## 5 Write a SQL query to get total order value by product code and product name
use dummyy;
select * from orderdetails;
select p.productcode, p.productname,
sum(quantityordered * priceeach) as total_order_value
from products p 
inner join orderdetails o on p.productcode = o.productname
group by p.productcode, p.productname 
order by total_order_value desc;

## 6 Write a SQL query to get highest buy price from the product table
use dummyy;
select productline, max(buyprice) as highestbuyprice
from products
group by productline;

## 7 Write a SQL query to get maximum buy price from productline
use dummyy;
select max(buyprice) as max_buyprice
from products
group by productline;

## 8 Write a SQL query to calculate avg, count,max, minimum, sum of buyprice by each productline
use dummyy;
select productline,
avg(buyprice) as avgbuyprice,
count(buyprice) as countbuyprice,
max(buyprice) as maxbuyprice,
min(buyprice) as minibuyprice,
sum(buyprice) as sumbuyprice
from products
group by productline;






