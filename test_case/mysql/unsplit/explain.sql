drop table if exists t1;
create table t1 (id int not null, str char(10), unique(str)) charset utf8mb4;
insert into t1 values (1, null),(2, null),(3, "foo"),(4, "bar");
select * from t1 where str is null;
select * from t1 where str="foo";
drop table t1;
create table t1 (a int not null);
insert into t1 values(1);
insert into t1 values(1);
drop table t1;
create table ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0 int, ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ1 int, key ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0 (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0), key ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ01 (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0,ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ1));
insert into ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0) values (1);
insert into ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ0) values (2);
drop table ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ;
select 3 into @v1;
create table t1(f1 int, f2 int);
insert into t1 values (1,1);
create view v1 as select * from t1 where f1=1;
drop view v1;
drop table t1;
CREATE TABLE t1(c INT);
INSERT INTO t1 VALUES (),();
CREATE TABLE t2 (b INT,
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b),
KEY(b),KEY(b),KEY(b),KEY(b),KEY(b));
INSERT INTO t2 VALUES (),(),();
DROP TABLE t2;
DROP TABLE t1;
CREATE TABLE t1(a INT);
CREATE TABLE t2(a INT);
INSERT INTO t1 VALUES (1),(2);
INSERT INTO t2 VALUES (1),(2);
prepare s1 from 
'EXPLAIN SELECT 1  
 FROM (SELECT COUNT(DISTINCT t1.a) FROM t1,t2 GROUP BY t1.a) AS s1';
prepare s1 from 
'EXPLAIN FORMAT=JSON SELECT 1  
 FROM (SELECT COUNT(DISTINCT t1.a) FROM t1,t2 GROUP BY t1.a) AS s1';
prepare s1 from 
'EXPLAIN SELECT 1  
 FROM (SELECT COUNT(DISTINCT t1.a) FROM t1,t2 GROUP BY t1.a) AS s1';
DROP TABLE t1,t2;
CREATE TABLE t1 (a INT PRIMARY KEY);
DROP TABLE t1;
CREATE TABLE t1(a LONGTEXT);
INSERT INTO t1 VALUES (repeat('a',@@global.max_allowed_packet));
INSERT INTO t1 VALUES (repeat('b',@@global.max_allowed_packet));
DROP TABLE t1;
CREATE TABLE t1 (f1 INT);
SELECT @@session.sql_mode INTO @old_sql_mode;
DROP TABLE t1;
create table t1 (dt datetime not null, t time not null);
create table t2 (dt datetime not null);
insert into t1 values ('2001-01-01 1:1:1', '1:1:1'),
('2001-01-01 1:1:1', '1:1:1');
insert into t2 values ('2001-01-01 1:1:1'), ('2001-01-01 1:1:1');
SELECT outr.dt FROM t1 AS outr WHERE outr.dt IN (SELECT innr.dt FROM t2 AS innr WHERE outr.dt IS NULL );
SELECT outr.dt FROM t1 AS outr WHERE outr.dt IN ( SELECT innr.dt FROM t2 AS innr WHERE outr.t < '2005-11-13 7:41:31' );
drop tables t1, t2;
CREATE TABLE t1 (c int);
INSERT INTO t1 VALUES (NULL);
CREATE TABLE t2 (d int);
INSERT INTO t2 VALUES (NULL), (0);
DROP TABLE t1, t2;
create table t1(f1 int);
create table t2(f2 int);
insert into t1 values(1);
insert into t2 values(1),(2);
drop table t1,t2;
CREATE TABLE t1 (a INT);
CREATE TABLE t2 (b BLOB, KEY b(b(100)));
INSERT INTO t2 VALUES ('1'), ('2'), ('3');
DROP TABLE t1, t2;
CREATE TABLE t1(c1 INT, c2 INT, c4 INT, c5 INT, KEY(c2, c5), KEY(c2, c4, c5));
INSERT INTO t1 VALUES(4, 1, 1, 1);
INSERT INTO t1 VALUES(3, 1, 1, 1);
INSERT INTO t1 VALUES(2, 1, 1, 1);
INSERT INTO t1 VALUES(1, 1, 1, 1);
DROP TABLE t1;
CREATE TABLE t1(f1 VARCHAR(6) NOT NULL,
FULLTEXT KEY(f1),UNIQUE(f1));
INSERT INTO t1 VALUES ('test');
PREPARE stmt FROM
'EXPLAIN SELECT 1 FROM t1
 WHERE 1 > ALL((SELECT 1 FROM t1 RIGHT OUTER JOIN t1 a
 ON (MATCH(t1.f1) AGAINST (""))
 WHERE t1.f1 GROUP BY t1.f1))';
DEALLOCATE PREPARE stmt;
PREPARE stmt FROM
'EXPLAIN SELECT 1 FROM t1
 WHERE 1 > ALL((SELECT 1 FROM t1 JOIN t1 a
 ON (MATCH(t1.f1) AGAINST (""))
 WHERE t1.f1 GROUP BY t1.f1))';
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
drop table if exists t1;
create table `t1` (`a` int);
drop table t1;
SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1;
CREATE TABLE t1 (url char(1) PRIMARY KEY) charset latin1;
INSERT INTO t1 VALUES ('1'),('2'),('3'),('4'),('5');
SELECT * FROM t1 WHERE url=1;
SELECT * FROM t1 WHERE url>3;
DROP TABLE t1;
CREATE TABLE t1(a INT);
INSERT INTO t1 VALUES (0), (0);
PREPARE s FROM 
'EXPLAIN
SELECT SUBSTRING(1, (SELECT 1 FROM t1 a1 RIGHT OUTER JOIN t1 ON 0)) AS d
FROM t1 WHERE 0 > ANY (SELECT @a FROM t1)';
DEALLOCATE PREPARE s;
DROP TABLE t1;
CREATE TABLE t1 (a INT);
INSERT INTO t1 VALUES (1),(2),(3);
CREATE TABLE t2 (a INT);
INSERT INTO t2 VALUES (3),(4),(5);
DROP TABLE t1, t2;
CREATE TABLE t1(a INT);
DROP TABLE t1;
CREATE TABLE t1(c1 INT PRIMARY KEY) ENGINE=INNODB;
INSERT INTO t1 VALUES (1),(2),(3);
DROP TABLE t1;
CREATE TABLE t1 (a INT, b INT) ENGINE=INNODB PARTITION BY KEY (b) PARTITIONS 2;
CREATE TABLE t2 (c INT) ENGINE=INNODB;
UPDATE t1 SET a=(SELECT c from t2) WHERE 0;
DELETE FROM t1 WHERE 0 AND a IN (SELECT c from t2);
DROP TABLE t1, t2;
CREATE TABLE t1 (a INT);
INSERT INTO t1 VALUES (1),(NULL);
SELECT COUNT(*) FROM t1 WHERE a<>a;
SELECT a<>a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a>a;
SELECT a>a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a<a;
SELECT a<a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a<=>a;
SELECT a<=>a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a<=a;
SELECT a<=a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a>=a;
SELECT a>=a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a=a;
SELECT a=a FROM t1;
SELECT COUNT(*) FROM t1 WHERE a<>a IS NOT FALSE;
SELECT COUNT(*) FROM t1 WHERE (a=1 AND a<>a IS NOT FALSE);
SELECT * FROM t1 WHERE (a= 1 OR a<>a);
SELECT * FROM t1 WHERE (a=1 AND a<>a);
UPDATE t1 SET a = 2 WHERE a IS NULL;
ALTER TABLE t1 MODIFY a INT NOT NULL;
SELECT COUNT(*) FROM t1 WHERE a<>a;
SELECT COUNT(*) FROM t1 WHERE a>a;
SELECT COUNT(*) FROM t1 WHERE a<a;
SELECT COUNT(*) FROM t1 WHERE a<=>a;
SELECT COUNT(*) FROM t1 WHERE a<=a;
SELECT COUNT(*) FROM t1 WHERE a>=a;
SELECT COUNT(*) FROM t1 WHERE a=a;
SELECT COUNT(*) FROM t1 WHERE a<>a IS NOT FALSE;
SELECT COUNT(*) FROM t1 WHERE (a=1 AND a<>a IS NOT FALSE);
SELECT * FROM t1 WHERE (a=1 OR a<>a);
SELECT * FROM t1 WHERE (a=1 AND a<>a);
DROP TABLE t1;
CREATE TABLE r(a INT);
INSERT INTO r VALUES (1), (2), (-1), (-2);
CREATE TABLE s(a INT);
INSERT INTO s VALUES (1), (10), (20), (-10), (-20);
CREATE TABLE t(a INT);
INSERT INTO t VALUES (10), (100), (200), (-100), (-200);
DROP TABLE r, s, t;