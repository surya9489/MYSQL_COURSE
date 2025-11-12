USE schoolDB;

CREATE SCHEMA schooldb;

CREATE TABLE schooldb (
  id   INT  PRIMARY KEY,
  name VARCHAR(100) ,
  age  INT,
  grade VARCHAR(10)
);

select* from schooldb