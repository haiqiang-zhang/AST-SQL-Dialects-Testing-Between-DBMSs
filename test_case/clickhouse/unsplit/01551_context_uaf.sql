DROP TABLE IF EXISTS f;
DROP TABLE IF EXISTS v;
create table f(s String) engine File(TSV, '/dev/null');
create view v as (select * from f);
select * from v;
select * from merge('', 'f');
DROP TABLE f;
DROP TABLE v;
