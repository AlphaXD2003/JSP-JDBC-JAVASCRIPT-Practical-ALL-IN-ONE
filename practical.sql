-- Create Database and use that
create database exam;
use exam;

-- Create table 
create table practical (username varchar(255) , mail varchar(255) , password varchar(255));

-- Insert demo data into table
insert into practical(username , mail , password) values("subhamoy" , "subhamoyghosh2017@gmail.com" , "Agarpara@2003");

-- Select all data from table to check the reflection of data in table
select * from practical;