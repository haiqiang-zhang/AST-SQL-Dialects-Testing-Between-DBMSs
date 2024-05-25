set prefer_localhost_replica=1;
drop table if exists data_02572;
drop table if exists proxy_02572;
drop table if exists push_to_proxy_mv_02572;
drop table if exists receiver_02572;
create table data_02572 (key Int) engine=Memory();
-- proxy data with MV
create materialized view push_to_proxy_mv_02572 to proxy_02572 as select * from data_02572;
select * from data_02572 order by key;
insert into data_02572 settings materialized_views_ignore_errors=1 values (2);
select * from data_02572 order by key;
system flush logs;
select * from data_02572 order by key;
create table receiver_02572 as data_02572;
select * from data_02572 order by key;
select * from receiver_02572 order by key;
