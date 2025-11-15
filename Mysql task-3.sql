create schema product;

use product;

-- Create a table orders (id, product_name, quantity, price):

create table orders(

id int primary key auto_increment,
product_name varchar(50) not null,
quatity int,
price int

);

-- Insert 5 orders with different values:

insert into orders(product_name,quatity,price) values
("Apple",10,100),
("Orange",15,150),
("Mango",13,120),
("Pineapple",20,200),
("Banana",25,160);

-- Select all orders:

select * from orders;
