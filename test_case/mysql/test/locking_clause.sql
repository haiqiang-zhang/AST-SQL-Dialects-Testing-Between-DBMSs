CREATE VIEW v1 AS SELECT * FROM t1;
CREATE TABLE t2 ( a INT );
INSERT INTO t2 VALUES (1);
CREATE TABLE t0 ( skip INT, locked INT, nowait INT );
DROP TABLE t0;
SELECT * FROM t1 FOR UPDATE;
SELECT * FROM t1 FOR UPDATE NOWAIT;
SELECT * FROM t1 FOR UPDATE SKIP LOCKED;
SELECT * FROM t1 FOR SHARE;
SELECT * FROM t1 FOR SHARE NOWAIT;
SELECT * FROM t1 FOR SHARE SKIP LOCKED;
SELECT * FROM t1 FOR SHARE OF t1;
SELECT * FROM t1 FOR SHARE OF t1 NOWAIT;
SELECT * FROM t1 FOR SHARE OF t1 SKIP LOCKED;
SELECT * FROM t1 FOR UPDATE OF t1;
SELECT * FROM t1 FOR UPDATE OF t1 NOWAIT;
SELECT * FROM t1 FOR UPDATE OF t1 SKIP LOCKED;
SELECT * FROM t1, t2 FOR SHARE OF t1, t2;
SELECT * FROM t1, t2 FOR SHARE OF t1, t2 NOWAIT;
SELECT * FROM t1, t2 FOR SHARE OF t1, t2 SKIP LOCKED;
SELECT * FROM t1, t2 FOR UPDATE OF t1, t2;
SELECT * FROM t1, t2 FOR UPDATE OF t1, t2 NOWAIT;
SELECT * FROM t1, t2 FOR UPDATE OF t1, t2 SKIP LOCKED;
SELECT * FROM t1 JOIN t2 FOR UPDATE;
SELECT * FROM t1 JOIN t2 FOR SHARE;
SELECT * FROM t1 STRAIGHT_JOIN t2 FOR UPDATE;
SELECT * FROM t1 STRAIGHT_JOIN t2 AS t12 FOR UPDATE OF t12;
SELECT * FROM t1 STRAIGHT_JOIN t2 FOR SHARE;
SELECT * FROM t1 STRAIGHT_JOIN t2 FOR SHARE OF t1;
SELECT * FROM t1 STRAIGHT_JOIN t2 FOR SHARE OF t1 FOR UPDATE OF t2;
SELECT * FROM t1 STRAIGHT_JOIN t2 AS t12 FOR UPDATE OF t12, t1;
SELECT * FROM t1 JOIN t2 FOR SHARE OF t1 FOR UPDATE OF t2;
SELECT * FROM t1 NATURAL JOIN t2 FOR SHARE OF t1 FOR UPDATE OF t2;
SELECT * FROM t1, t2 FOR SHARE OF t1 FOR UPDATE OF t2;
SELECT * FROM t1, t2 FOR SHARE OF t1 FOR SHARE OF t2;
SELECT * FROM t1 FOR SHARE OF t1 NOWAIT;
SELECT * FROM t1 FOR SHARE OF t1 SKIP LOCKED;
SELECT * FROM t1, t2 FOR SHARE OF t1 NOWAIT FOR SHARE OF t2 NOWAIT;
SELECT 1 FROM ( SELECT 1 ) AS t2 FOR UPDATE;
SELECT 1 FROM v1 FOR UPDATE;
SELECT MIN(a) FROM t1 FOR UPDATE;
SELECT MAX(a) FROM t1 FOR UPDATE;
SELECT SUM(a) FROM t1 FOR UPDATE;
SELECT DISTINCT * FROM t1 FOR UPDATE;
SELECT MIN(b) FROM t1 GROUP BY a FOR UPDATE;
SELECT MIN(a) FROM t1 LOCK IN SHARE MODE;
SELECT MAX(a) FROM t1 LOCK IN SHARE MODE;
SELECT SUM(a) FROM t1 LOCK IN SHARE MODE;
SELECT DISTINCT * FROM t1 LOCK IN SHARE MODE;
SELECT MIN(b) FROM t1 GROUP BY a LOCK IN SHARE MODE;
SELECT 1 UNION SELECT 2 FOR UPDATE;
SELECT 1 UNION SELECT 2 LOCK IN SHARE MODE;
CREATE DATABASE db1;
CREATE TABLE db1.t1 ( a INT, b INT );
INSERT INTO t1 VALUES (10, 10);
SELECT MIN(a) FROM t1 FOR UPDATE SKIP LOCKED;
SELECT MAX(a) FROM t1 FOR UPDATE SKIP LOCKED;
SELECT SUM(a) FROM t1 FOR UPDATE SKIP LOCKED;
SELECT MIN(a) FROM t1 FOR UPDATE NOWAIT;
SELECT MAX(a) FROM t1 FOR UPDATE NOWAIT;
SELECT SUM(a) FROM t1 FOR UPDATE NOWAIT;
SELECT DISTINCT * FROM t1 FOR UPDATE SKIP LOCKED;
SELECT DISTINCT * FROM t1 FOR UPDATE NOWAIT;
SELECT MIN(b) FROM t1 GROUP BY a FOR UPDATE OF t1;
SELECT MIN(b) FROM t1 GROUP BY a FOR UPDATE SKIP LOCKED;
SELECT MIN(b) FROM t1 GROUP BY a FOR SHARE;
DROP DATABASE db1;
DROP VIEW v1;
DROP TABLE t1, t2;
CREATE TABLE t1 ( a INT ) ENGINE=InnoDB;
INSERT INTO t1 VALUES ( 1 );
SELECT * FROM t1 WHERE a = 2 FOR UPDATE;
SELECT * FROM t1 FOR UPDATE NOWAIT;
DROP TABLE t1;
CREATE TABLE t1 (a INT);
INSERT INTO t1 VALUES (1);
SELECT * FROM t1 FOR UPDATE NOWAIT;
DROP TABLE t1;
SELECT 1 FROM DUAL LIMIT 1 INTO @var FOR UPDATE;
SELECT 1 FROM DUAL LIMIT 1 FOR UPDATE INTO @var;
SELECT 1 UNION SELECT 1 FOR UPDATE INTO @var;
SELECT 1 UNION SELECT 1 INTO @var FOR UPDATE;
CREATE TABLE tt (id INT PRIMARY KEY, age INT);
INSERT INTO tt VALUES (1,1),(2,2);
SELECT * FROM tt WHERE id = 2 FOR UPDATE;
SELECT * FROM tt WHERE id = 2 FOR UPDATE NOWAIT;
SELECT * FROM tt WHERE id = 2 FOR UPDATE NOWAIT;
SELECT * FROM tt WHERE id = 2 FOR UPDATE NOWAIT;
DROP TABLE tt;
