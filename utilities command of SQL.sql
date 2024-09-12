create database cybrom;

use cybrom;

show tables;
 
 create table student(s_id int,s_name varchar(20),fee decimal(10,2), 
 city varchar(15),d_o_b date,mobile varchar(15));
 
 desc student;
 rename table student to stu;
 desc stu;
 drop table stu;
 drop database cybrom;
 
