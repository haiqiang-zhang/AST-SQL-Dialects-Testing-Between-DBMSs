pragma enable_verification;
create or replace table tbl(
	i integer PRIMARY KEY,
	j integer UNIQUE,
	k integer
);
insert into tbl VALUES
	(1, 10, 1),
	(2, 20, 1),
	(3, 30, 2);
insert into tbl VALUES (3,5,1) ON CONFLICT (i) DO UPDATE SET k = 5;
insert into tbl VALUES (3,5,1) ON CONFLICT (i) DO UPDATE SET k = 1 + excluded.k;
insert into tbl VALUES (3,5,1) ON CONFLICT (i) DO UPDATE SET k = k + excluded.k;
select * from tbl;
select * from tbl;
select * from tbl;
