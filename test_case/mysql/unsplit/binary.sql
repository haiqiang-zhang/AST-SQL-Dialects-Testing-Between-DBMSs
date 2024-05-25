drop table if exists t1,t2;
create table t1 (name char(20) not null, primary key (name)) charset latin1;
create table t2 (name char(20) collate utf8mb4_bin not null, primary key (name));
insert into t2 select * from t1;
select * from t1 order by name;
select concat("*",name,"*") from t1 order by 1;
select min(name),min(concat("*",name,"*")),max(name),max(concat("*",name,"*")) from t1;
select * from t2 order by name;
select concat("*",name,"*") from t2 order by 1;
select min(name),min(concat("*",name,"*")),max(name),max(concat("*",name,"*")) from t2;
select name from t2 where name between 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤' and 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¶';
select name from t2 where name between 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ' and 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ';
drop table t1,t2;
create table t1 (a char(10) not null, b char(10) collate latin1_bin not null,key (a), key(b)) charset latin1;
insert into t1 values ("hello ","hello "),("hello2 ","hello2 ");
select concat("-",a,"-",b,"-") from t1 where a="hello";
select concat("-",a,"-",b,"-") from t1 where a="hello ";
select concat("-",a,"-",b,"-") from t1 ignore index (a) where a="hello ";
select concat("-",a,"-",b,"-") from t1 where b="hello";
select concat("-",a,"-",b,"-") from t1 where b="hello ";
select concat("-",a,"-",b,"-") from t1 ignore index (b) where b="hello ";
alter table t1 modify b tinytext not null, drop key b, add key (b(100));
select concat("-",a,"-",b,"-") from t1;
select concat("-",a,"-",b,"-") from t1 where b="hello ";
select concat("-",a,"-",b,"-") from t1 ignore index (b) where b="hello ";
drop table t1;
create table t1 (b char(8));
insert into t1 values(NULL);
select b from t1 where cast(b as binary)  like '';
select b from t1 having cast(b as binary) like '';
drop table t1;
create table t1 (a char(3) binary, b binary(3)) charset latin1;
insert into t1 values ('aaa','bbb'),('AAA','BBB');
select upper(a),upper(b) from t1;
select lower(a),lower(b) from t1;
select * from t1 where upper(a)='AAA';
select * from t1 where lower(a)='aaa';
select * from t1 where upper(b)='BBB';
select * from t1 where lower(b)='bbb';
select charset(a), charset(b), charset(cast('ccc' as binary)) from t1 limit 1;
select collation(a), collation(b), collation(cast('ccc' as binary)) from t1 limit 1;
drop table t1;
create table t1( firstname char(20), lastname char(20));
insert into t1 values ("john","doe"),("John","Doe");
select * from t1 where firstname='john' and firstname like cast('john' as binary);
select * from t1 where firstname='john' and cast('john' as binary) = firstname;
select * from t1 where firstname='john' and firstname = cast('john' as binary);
select * from t1 where firstname='John' and firstname like cast('john' as binary);
select * from t1 where firstname='john' and firstname like cast('john' as binary);
drop table t1;
create table t1 (a binary) charset utf8mb4;
drop table t1;
create table t1 (col1 binary(4));
insert into t1 values ('a'),('a ');
select hex(col1) from t1;
alter table t1 modify col1 binary(10);
select hex(col1) from t1;
insert into t1 values ('b'),('b ');
select hex(col1) from t1;
drop table t1;
CREATE TABLE t1 (
  a binary(20) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 
  index idx(a)
);
INSERT INTO t1 SET a=unhex('1F9480179366F2BF567E1C4B964C1EF029087575');
INSERT INTO t1 SET a=unhex('1F9480179366F2BF567E1C4B964C1EF029082020');
INSERT INTO t1 SET a=unhex('1F9480179366F2BF567E1C4B964C1EF029080707');
SELECT hex(a) FROM t1 order by a;
SELECT hex(a) from t1 WHERE a=unhex('1F9480179366F2BF567E1C4B964C1EF029082020');
SELECT hex(a) from t1 WHERE a=unhex('1F9480179366F2BF567E1C4B964C1EF029082020');
SELECT hex(a) from t1 WHERE a=unhex('1F9480179366F2BF567E1C4B964C1EF02908');
DROP TABLE t1;
CREATE TABLE t1 (
  id numeric(20) NOT NULL,
  lang varchar(8) NOT NULL,
  msg varchar(32) NOT NULL,
  PRIMARY KEY (id,lang)
);
INSERT INTO t1 VALUES (33, 'en', 'zzzzzzz');
INSERT INTO t1 VALUES (31, 'en', 'xxxxxxx');
INSERT INTO t1 VALUES (32, 'en', 'yyyyyyy');
SELECT * FROM t1 WHERE id=32;
DROP TABLE t1;
