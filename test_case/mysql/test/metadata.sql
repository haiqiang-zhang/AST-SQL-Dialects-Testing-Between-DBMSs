select 1, 1.0, -1, "hello", NULL;
create table t1 (a tinyint, b smallint, c mediumint, d int, e bigint, f float(3,2), g double(4,3), h decimal(5,4), i year, j date, k timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, l datetime, m enum('a','b'), n set('a','b'), o char(10));
select * from t1;
select a b, b c from t1 as t2;
drop table t1;
CREATE TABLE t1 (id tinyint(3) default NULL, data varchar(255) default NULL);
INSERT INTO t1 VALUES (1,'male'),(2,'female');
CREATE TABLE t2 (id tinyint(3) unsigned default NULL, data char(3) default '0');
INSERT INTO t2 VALUES (1,'yes'),(2,'no');
select t1.id, t1.data, t2.data from t1, t2 where t1.id = t2.id;
select t1.id, t1.data, t2.data from t1, t2 where t1.id = t2.id order by t1.id;
select t1.id from t1 union select t2.id from t2;
drop table t1,t2;
create table t1 ( a int, b varchar(30), primary key(a));
insert into t1 values (1,'one');
insert into t1 values (2,'two');
select @arg00 FROM t1 where a=1 union distinct select 1 FROM t1 where a=1;
select * from (select @arg00) aaa;
select 1 union select 1;
select * from (select 1 union select 1) aaa;
drop table t1;
create table t1 (i int);
insert into t1 values (1),(2),(3);
select * from t1 where i = 2;
drop table t1;
select a.* from (select 2147483648 as v_large) a;
select a.* from (select 214748364 as v_small) a;
CREATE TABLE t1 (c1 CHAR(1));
CREATE TABLE t2 (c2 CHAR(1));
CREATE VIEW v1 AS SELECT t1.c1 FROM t1;
CREATE VIEW v2 AS SELECT t2.c2 FROM t2;
INSERT INTO t1 VALUES ('1'), ('2'), ('3');
INSERT INTO t2 VALUES ('1'), ('2'), ('3'), ('2');
SELECT v1.c1 FROM v1 JOIN t2 ON c1=c2 ORDER BY 1;
SELECT v1.c1, v2.c2 FROM v1 JOIN v2 ON c1=c2;
SELECT v1.c1, v2.c2 FROM v1 JOIN v2 ON c1=c2 GROUP BY v1.c1;
SELECT v1.c1, v2.c2 FROM v1 JOIN v2 ON c1=c2 GROUP BY v1.c1 ORDER BY v2.c2;
DROP VIEW v1,v2;
DROP TABLE t1,t2;
CREATE TABLE t1 (i INT, d DATE);
INSERT INTO t1 VALUES (1, '2008-01-01'), (2, '2008-01-02'), (3, '2008-01-03');
DROP TABLE t1;
CREATE TABLE t1 (f1 INT);
CREATE VIEW v1 AS SELECT f1 FROM t1;
SELECT f1 FROM v1 va;
DROP VIEW v1;
DROP TABLE t1;
create table t1(
# numeric types
bool_col bool,
boolean_col boolean,
bit_col bit(5),
tiny tinyint,
tiny_uns tinyint unsigned,
small smallint,
small_uns smallint unsigned,
medium mediumint,
medium_uns mediumint unsigned,
int_col int,
int_col_uns int unsigned,
big bigint,
big_uns bigint unsigned,
decimal_col decimal(10,5),
# synonyms of DECIMAL
numeric_col numeric(10),
fixed_col fixed(10),
dec_col dec(10),
decimal_col_uns decimal(10,5) unsigned,
fcol float,
fcol_uns float unsigned,
dcol double,
double_precision_col double precision,
dcol_uns double unsigned,
# date/time types
date_col date,
time_col time,
timestamp_col timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
year_col year,
datetime_col datetime,
# string types
char_col char(5),
varchar_col varchar(10),
binary_col binary(10),
varbinary_col varbinary(10),
tinyblob_col tinyblob,
blob_col blob,
mediumblob_col mediumblob,
longblob_col longblob,
text_col text,
mediumtext_col mediumtext,
longtext_col longtext,
enum_col enum("A","B","C"),
set_col set("F","E","D")
);
select * from t1;
drop table t1;
CREATE TABLE t1 (f1 INTEGER, f2 CHAR(1));
INSERT INTO t1 VALUES (10, 'A');
CREATE VIEW v1 AS SELECT f1, f2 FROM t1;
CREATE VIEW v2 AS SELECT DISTINCT f1 FROM t1;
SELECT * FROM (SELECT f1 FROM t1) AS dt;
SELECT * FROM (SELECT f1 FROM (SELECT f1 FROM t1) AS dt1) AS dt2;
SELECT *
FROM (SELECT t1.f1 AS a, t2.f1 AS b, t1.f1+t2.f1 AS d FROM t1 JOIN t1 AS t2) AS dt;
SELECT * FROM (SELECT DISTINCT f1 FROM t1) AS dt;
SELECT * FROM (SELECT DISTINCT t1.f1+t2.f1 AS d FROM t1 JOIN t1 AS t2) AS dt;
SELECT * FROM v1;
SELECT * FROM v2;
SELECT * FROM (SELECT * FROM v1) AS dt;
SELECT * FROM (SELECT * FROM v2) AS dt;
DROP VIEW v1,v2;
DROP TABLE t1;
create table t(a int);
create view v as select a as d, 2*a as two from t;
select a as d from t limit 1;
select * from (select a as d, 2*a as two from t) dt;
select d, two from (select a as d, 2*a as two from t) dt;
select d as e, two as f from (select a as d, 2*a as two from t) dt;
select * from v;
select d, two from v;
select d as e, two as f from v;
select * from (select a as d, 2*a as two from t) dt;
select d from (select a as d, 2*a as two from t) dt;
select d as e from (select a as d, 2*a as two from t) dt;
select * from v;
select d, two from v;
select d as e, two as f from v;
drop view v;
drop table t;
