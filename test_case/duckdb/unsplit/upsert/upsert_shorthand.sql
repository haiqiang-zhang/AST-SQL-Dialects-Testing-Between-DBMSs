pragma enable_verification;
create table tbl (a integer, b integer unique);
insert into tbl values (1,2), (2,1);
insert into tbl values (1,2) on conflict do update set a = excluded.a;
insert or ignore into tbl values (1,2), (2,1);
insert or replace into tbl values (5,2), (10,1);
create or replace table tbl (a integer unique, b integer unique);
select * from tbl;
