drop table if exists t1, t2;
create table t1 (a int);
insert into t1 values (1);
insert ignore into t1 values ("hej");
insert ignore into t1 values ("hej"),("dÃÂÃÂ¥");
insert ignore into t1 values ("hej");
insert ignore into t1 values ("hej"),("dÃÂÃÂ¥");
drop table t1;
drop temporary table if exists not_exists;
drop table if exists not_exists_table;
drop database if exists not_exists_db;
create table t1(id int);
create table if not exists t1(id int);
select @@warning_count;
drop table t1;
create table t1(a tinyint, b int not null, c date, d char(5));
select @@warning_count;
drop table t1;
create table t1(a tinyint NOT NULL, b tinyint unsigned, c char(5));
insert ignore into t1 values(NULL,100,'mysql'),(10,-1,'mysql ab'),(500,256,'open source'),(20,NULL,'test');
alter table t1 add d char(2);
update ignore t1 set a=NULL where a=10;
update ignore t1 set c='mysql ab' where c='test';
update ignore t1 set d=c;
create table t2(a tinyint NOT NULL, b char(3));
insert ignore into t2 select b,c from t1;
insert ignore into t2(b) values('mysqlab');
insert ignore into t2(b) values('mysqlab');
drop table t1, t2;
create table t1(a char(10));
alter table t1 add b char;
update ignore t1 set b=a;
select @@warning_count;
update ignore t1 set b='hi';
select @@warning_count;
drop table t1;
create table t1 (a int);
insert into t1 (a) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
update ignore t1 set a='abc';
select * from t1 limit 0;
select * from t1 limit 1, 0;
select * from t1 limit 0, 0;
drop table t1;
CREATE TABLE t1( f1 CHAR(20) );
CREATE TABLE t2( f1 CHAR(20), f2 CHAR(25) );
CREATE TABLE t3( f1 CHAR(20), f2 CHAR(25), f3 DATE );
INSERT INTO t1 VALUES ( 'a`' );
INSERT INTO t2 VALUES ( 'a`', 'a`' );
INSERT INTO t3 VALUES ( 'a`', 'a`', '1000-01-1' );
DROP PROCEDURE IF EXISTS sp1;
DROP PROCEDURE IF EXISTS sp2;
DROP PROCEDURE IF EXISTS sp3;
DROP PROCEDURE IF EXISTS sp1;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
create table t1 (c_char char(255), c_varchar varchar(255), c_tinytext tinytext);
create table t2 (c_tinyblob tinyblob);
insert into t1 values(@c, @c, @c);
insert into t2 values(@c);
insert into t1 values(@q, @q, @q);
insert into t2 values(@q);
insert into t1 values(@c, @c, @c);
insert into t2 values(@c);
insert into t1 values(@q, NULL, NULL);
insert into t1 values(NULL, @q, NULL);
insert into t1 values(NULL, NULL, @q);
insert into t2 values(@q);
drop table t1, t2;
DROP TABLE IF EXISTS t1;
DROP FUNCTION IF EXISTS f1;
CREATE TABLE t1(a INT UNIQUE);
DROP TABLE t1;
