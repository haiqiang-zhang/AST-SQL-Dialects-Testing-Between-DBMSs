pragma enable_verification;
create or replace table tbl (a integer primary key, b integer);
insert into tbl VALUES (1,3), (2,2), (3,10), (4,3);
insert into tbl VALUES (3,8), (2,2) ON CONFLICT (a) DO UPDATE SET b = b*2 WHERE b == excluded.b;