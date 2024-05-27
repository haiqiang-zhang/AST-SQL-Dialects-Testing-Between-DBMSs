pragma enable_verification;
create or replace table tbl (
	a integer primary key,
	b integer
);
insert into tbl VALUES (1,2), (2,2);
insert into tbl VALUES (1,3), (3,4) ON CONFLICT (a) DO UPDATE SET b = excluded.b;
insert into tbl VALUES (4,3), (3,8) ON CONFLICT (a) WHERE excluded.b >= 8 DO UPDATE SET b = 10;
insert into tbl VALUES (3,8), (2,2), (7,2) ON CONFLICT (a) DO UPDATE SET b = b*2 WHERE b == excluded.b;