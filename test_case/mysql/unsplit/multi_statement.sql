DROP TABLE IF EXISTS t1;
select 1;
select 2;
select 3;
select 6;
select 50, 'abc';
select "abcd'";
select 'finish';
create table t1 (i int);
insert into t1 values (1);
select * from t1 where i = 1;
insert into t1 values (2),(3),(4);
select * from t1 where i = 2;
