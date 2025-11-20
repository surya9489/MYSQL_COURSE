create schema Product_Details;

use product;

-- Create a table products (id, name, price):

create table products(
ID int,
NAME varchar(100),
PRICE int
);

-- Add a new column stock INT using ALTER TABLE:

alter table products add column STOCK int;

-- Rename column price to unit_price:

alter table products rename column PRICE to UNIT_PRICE;

-- Insert 5 products into the table:

insert into products values
(1,"APPLE",100,10),
(2,"ORANGE",200,20),
(3,"PINAAPPLE",300,30),
(4,"LEMON",400,40),
(5,"BANANA",500,50);

-- Update the stock of one product:

update products 
set STOCK=100 
where id=5;

-- Delete one product from the table:

delete from products
where id=4;


select * from products



