
-- Misc. md5 tests, moved here from other .test files.

select md5('a'), hex(md5('a'));
create table t1 as select md5('a') as c1;
drop table t1;

select md5('hello');
select length(unhex(md5("abrakadabra")));

--
-- Bug#15351: Wrong collation used for comparison of md5() and sha()
-- parameter can lead to a wrong result.
--
create table t1 (f1 varchar(4), f2 varchar(64), unique key k1 (f1,f2));
insert into t1 values ( 'test',md5('test')), ('test', sha('test'));
select * from t1 where f1='test' and (f2= md5("test") or f2= md5("TEST"));
select * from t1 where f1='test' and (f2= md5("TEST") or f2= md5("test"));
select * from t1 where f1='test' and (f2= sha("test") or f2= sha("TEST"));
select * from t1 where f1='test' and (f2= sha("TEST") or f2= sha("test"));
drop table t1;

--# From suite/gcol/inc/gcol_supported_sql_funcs_main.inc
--echo -- MD5()
let $cols = a varchar(1024), b varbinary(32) generated always as (md5(a)) virtual;
let $values1 = 'testing',default;
let $rows = 1;