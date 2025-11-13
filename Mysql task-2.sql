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

select * from product


