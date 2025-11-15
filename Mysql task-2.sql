create schema products;

use products;

-- Create a table Product(id,name,price):

create table product(
ID int primary key,
NAME varchar(50),
PRICE int
);

describe product;

-- Add a New Column Stock Int Using Alter Table: 

alter table product add column STOCK int;

-- Rename Column price to unit_price

alter table product rename column PRICE to UNIT_PRICE;

select * from product;

create schema companyDB;

use companyDB;

-- Create a table employees:

create table employees(
id int primary key,
name varchar(50) not null,
salary int default 30000,
email varchar(50)
);

-- Add a UNIQUE constraint on email:

alter table employees 
add constraint empl_email 
unique (email);

show tables;
describe employees;
select * from employees;



