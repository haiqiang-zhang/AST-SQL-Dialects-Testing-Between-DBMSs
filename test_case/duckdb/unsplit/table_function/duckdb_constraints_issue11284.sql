pragma enable_verification;
create table t (i int primary key);
create table u (i int references t);
create table v (i int references t);
drop table v;
drop table u;
select constraint_text from duckdb_constraints() where constraint_type = 'PRIMARY KEY';
select constraint_text from duckdb_constraints() where constraint_type = 'PRIMARY KEY';
select constraint_text from duckdb_constraints() where constraint_type = 'PRIMARY KEY';
select constraint_text from duckdb_constraints() where constraint_type = 'PRIMARY KEY';
select constraint_text from duckdb_constraints() where constraint_type = 'PRIMARY KEY';
