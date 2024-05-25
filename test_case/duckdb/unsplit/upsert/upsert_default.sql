pragma enable_verification;
create table tbl (
	a integer DEFAULT 5,
	b integer unique,
	c integer DEFAULT 10
);
insert into tbl(b) VALUES (3), (5), (6);
insert into tbl(b) VALUES (7), (3), (4) ON CONFLICT do update set c = 5, a = 10;
create table t (i int primary key, j int);
select * from tbl;
insert into t values (1, 1) on conflict do nothing;
insert into t values (1, 1) on conflict do nothing;
insert into t values (1, 1) on conflict (i) do update set j = excluded.i;