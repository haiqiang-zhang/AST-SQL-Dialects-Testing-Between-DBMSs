drop database if exists demo;
create database demo;
select "Starting ...";
select "The end";
select "Oops ... now what ?";
select "In prod_middle()";
create temporary table t1(a integer, b integer);
drop temporary table t1;
select "Doing something that works ...";
select "Doing something that fail (simulate an error) ...";
select "Doing something that *SHOULD* works ...";
drop temporary table if exists t1;
select "The end";
select "Doing cleanup !";
select "In prod_middle()";
create temporary table t1(a integer, b integer);
drop temporary table t1;
select "Doing something that works ...";
select "Doing something that fail (simulate an error) ...";
select "Doing something that *SHOULD* works ...";
drop database demo;
