lock tables t1 write, t2 write, t3 write;
drop table t2, t3, t1;
create table t1 (c1 int);
create table t2 (c1 int);
create table t3 (c1 int);
lock tables t1 write, t2 write, t3 write, t1 as t4 read;
alter table t2 add column c2 int;
drop table t1, t2, t3;
create table t1 ( a int(11) not null auto_increment, primary key(a));
create table t2 ( a int(11) not null auto_increment, primary key(a));
lock tables t1 write, t2 read;
delete from t1 using t1,t2 where t1.a=t2.a;
delete t1 from t1,t2 where t1.a=t2.a;
unlock tables;
drop table t2,t1;
create table t1 (a int);
lock table t1 write;
unlock tables;
drop table t1;
CREATE TABLE t1 (i INT);
UNLOCK TABLES;
UNLOCK TABLES;
UNLOCK TABLES;
UNLOCK TABLES;
DROP TABLE t1;
drop view if exists v_bug5719;
drop table if exists t1, t2, t3;
create table t1 (a int);
create temporary table t2 (a int);
create table t3 (a int);
create view v_bug5719 as select 1;
lock table v_bug5719 write;
select * from t2;
select * from v_bug5719;
unlock tables;
create or replace view v_bug5719 as select * from t1;
lock tables v_bug5719 write;
select * from v_bug5719;
select * from t1;
select * from t2;
drop table t1;
unlock tables;
create table t1 (a int);
lock tables t1 write, v_bug5719 write;
drop table t1;
select * from t3;
unlock tables;
drop view v_bug5719;
drop table t2, t3;
CREATE TABLE t1 (
table1_rowid SMALLINT NOT NULL
);
CREATE TABLE t2 (
table2_rowid SMALLINT NOT NULL
);
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (1);
LOCK TABLES t1 WRITE, t2 READ;
DELETE FROM t1 
WHERE EXISTS 
( 
SELECT 'x' 
FROM t2
WHERE t1.table1_rowid = t2.table2_rowid
);
UNLOCK TABLES;
DROP TABLE t1,t2;
create table t1 (a int);
create table t2 (a int);
lock table t1 write, t2 write;
create temporary table t1 (a int);
drop temporary table t1;
select * from t1;
unlock tables;
drop table t1, t2;
drop table if exists t1;
drop view if exists v1;
create table t1 (c1 int);
create view v1 as select * from t1;
lock tables t1 write, v1 write;
insert into t1 values (33);
select * from t1;
unlock tables;
drop table t1;
drop view v1;
create table t1 (a int);
insert into t1 values (1);
lock table t1 write;
drop table t1;
create table t1 (a int);
insert into t1 values (1);
drop table t1;
drop tables if exists t1, t2;
drop view if exists v1;
drop function if exists f1;
create table t1 (i int);
create table t2 (j int);
create view v1 as select * from t2;
lock tables t1 write, v1 write;
alter table t2 add column k int;
drop table t2;
unlock tables;
drop view v1;
create table t2 (j int);
alter table t2 add column k int;
drop table t2;
unlock tables;
create table t2 (j int);
lock tables t1 write;
unlock tables;
drop tables t1;
create table t1 (i int);
lock tables t1 write, t1 as a read, t1 as b read;
alter table t1 add column j int;
unlock tables;
drop table t1;
create temporary table t1 (i int);
alter table t1 add column j int;
unlock tables;
drop table t1;
CREATE TABLE t1 (a INT);
LOCK TABLE t1 WRITE;
UNLOCK TABLES;
DROP TABLE t1;
CREATE TABLE t1(a INT);
LOCK TABLE t1 READ;
LOCK TABLE t1 WRITE;
LOCK TABLE t1 READ;
LOCK TABLE t1 WRITE;
UNLOCK TABLES;
DROP TABLE t1;
CREATE TABLE t1 (f1 INT, f2 INT) ENGINE = MEMORY;
INSERT INTO t1(f1) VALUES(0);
DROP TABLE t1;
CREATE TABLE t1 (id INT);
LOCK TABLE t1 WRITE;
LOCK TABLE t2 WRITE;
UNLOCK TABLES;
UNLOCK TABLES;
DROP TABLE t1, t2;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (a INT);
LOCK TABLES t1 LOW_PRIORITY WRITE;
UNLOCK TABLES;
DROP TABLE t1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (c1 INT);
LOCK TABLES t1 READ;
UNLOCK TABLES;
DROP TABLE t1;
