pragma enable_verification;
create or replace table tbl (
	a integer unique,
	b integer
);
insert into tbl VALUES (3,2), (1,3);
insert into tbl(b) VALUES (5) ON CONFLICT (a) DO UPDATE SET b = 8;
insert into tbl(b) VALUES (5) ON CONFLICT (a) DO UPDATE SET b = 8;
select * from tbl;
select * from tbl;
