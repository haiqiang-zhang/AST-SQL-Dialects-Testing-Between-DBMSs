drop table if exists t;
drop table if exists s;
create table t(a Int64, b Int64, c String) engine = Memory;
create table s(a Int64, b Int64, c String) engine = Memory;
insert into t values(1,1,'a');
insert into s values(2,2,'a');