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
insert into tbl VALUES (3,5,1) ON CONFLICT (i) DO UPDATE SET k = k + excluded.k;
insert into tbl VALUES (3,5,1) ON CONFLICT (i) DO UPDATE SET k = excluded.k;
insert into tbl VALUES (4,2,3), (3,5,10) ON CONFLICT (i) DO NOTHING;
insert into tbl VALUES
	(3,1,5),
ON CONFLICT (i) DO UPDATE SET
	k = excluded.k;
insert into tbl VALUES (3,5,1) ON CONFLICT (i) WHERE k >= 5 DO UPDATE SET k = 1;
insert into tbl VALUES (3,5,3) on conflict (i) do update set k = 10 WHERE k != 1;
insert into tbl VALUES (3,5,3) on conflict (i) do update set k = 10 WHERE k == 1;
insert into tbl VALUES (5,1,0), (3,5,20) ON CONFLICT DO NOTHING;
create or replace table single_constraint (
	i integer PRIMARY KEY,
	j integer,
	k varchar,
);
insert into single_constraint values (5,1,'hello'), (1,10,'test');
insert into single_constraint values (1,5,'bye'), (3,10,'quack') on conflict do update set j = excluded.j, k = concat(k, excluded.k);
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from tbl;
select * from single_constraint;
