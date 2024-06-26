SELECT * FROM t1;
DELETE FROM t1;
INSERT INTO t1 SELECT 4, 8;
SELECT * FROM t1;
DELETE FROM t1;
INSERT INTO t1 SELECT * FROM v2;
SELECT * FROM t1;
DELETE FROM t2;
INSERT INTO t2 VALUES(9,1);
INSERT INTO t2 SELECT y, x FROM t2;
INSERT INTO t3 SELECT * FROM t2 LIMIT 1;
SELECT * FROM t3;
DELETE FROM t1;
SELECT * FROM t1;
DELETE FROM t3;
INSERT INTO t3 SELECT DISTINCT * FROM t2;
SELECT * FROM t3;
DELETE FROM t1;
CREATE TABLE dest(a int, b int CHECK(b>a));
CREATE TABLE src(x int, y int CHECK(y>x));
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int CHECK(b>a));
CREATE TABLE src(x int CHECK(y>x), y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int);
CREATE TABLE src(x int, y int CHECK(y>x));
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int CHECK(b>a));
CREATE TABLE src(x int, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int NOT NULL);
CREATE TABLE src(x int, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int NOT NULL);
CREATE TABLE src(x int NOT NULL, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int NOT NULL, b int NOT NULL);
CREATE TABLE src(x int NOT NULL, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int NOT NULL, b int);
CREATE TABLE src(x int, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int);
CREATE TABLE src(x int NOT NULL, y int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int);
CREATE TABLE src(x int NOT NULL, y int NOT NULL);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int NOT NULL, b int);
CREATE TABLE src(x int NOT NULL, y int NOT NULL);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int NOT NULL);
CREATE TABLE src(x int NOT NULL, y int NOT NULL);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a text, b int);
CREATE TABLE src(x int, b int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int);
CREATE TABLE src(x text, b int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE dest(a int, b int);
CREATE TABLE src(x integer, b int);
INSERT INTO src VALUES(1,9);
INSERT INTO dest SELECT * FROM src;
SELECT * FROM dest;
DROP TABLE dest;
DROP TABLE src;
CREATE TABLE t4(a, b, UNIQUE(a,b));
INSERT INTO t4 VALUES(NULL,0);
INSERT INTO t4 VALUES(NULL,1);
INSERT INTO t4 VALUES(NULL,1);
VACUUM;
CREATE TABLE t5(a, b, c);
CREATE INDEX t2_i2 ON t2(x, y COLLATE nocase);
CREATE INDEX t2_i1 ON t2(x ASC, y DESC);
CREATE INDEX t3_i1 ON t3(a, b);
INSERT INTO t2 SELECT * FROM t3;
DROP INDEX t2_i2;
INSERT INTO t2 SELECT * FROM t3;
DROP INDEX t2_i1;
CREATE INDEX t2_i1 ON t2(x ASC, y ASC);
INSERT INTO t2 SELECT * FROM t3;
DROP INDEX t2_i1;
CREATE INDEX t2_i1 ON t2(x ASC, y COLLATE RTRIM);
INSERT INTO t2 SELECT * FROM t3;
CREATE TABLE t6a(x CHECK( x<>'abc' ));
INSERT INTO t6a VALUES('ABC');
SELECT * FROM t6a;
CREATE TABLE t6b(x CHECK( x<>'abc' COLLATE nocase ));
DROP TABLE t6b;
CREATE TABLE t6b(x CHECK( x COLLATE nocase <>'abc' ));
CREATE TABLE t7a(x INTEGER PRIMARY KEY);
INSERT INTO t7a VALUES(123);
CREATE TABLE t7b(y INTEGER REFERENCES t7a);
CREATE TABLE t7c(z INT);
INSERT INTO t7c VALUES(234);
INSERT INTO t7b SELECT * FROM t7c;
SELECT * FROM t7b;
DELETE FROM t7b;
PRAGMA foreign_keys=ON;
SELECT * FROM t7b;
DELETE FROM t7b;
DELETE FROM t7c;
INSERT INTO t7c VALUES(123);
INSERT INTO t7b SELECT * FROM t7c;
SELECT * FROM t7b;
PRAGMA foreign_keys=OFF;
DELETE FROM t7b;
INSERT INTO t7b SELECT * FROM t7c;
SELECT * FROM t7b;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT REPLACE, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT REPLACE, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT REPLACE, b);
CREATE TABLE t2(x, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT IGNORE, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT IGNORE, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT IGNORE, b);
CREATE TABLE t2(x, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT FAIL, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT FAIL, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(-99,100);
INSERT INTO t2 VALUES(1,3);
SELECT * FROM t1;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT ABORT, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT ABORT, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(-99,100);
INSERT INTO t2 VALUES(1,3);
SELECT * FROM t1;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT ROLLBACK, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT ROLLBACK, y);
INSERT INTO t1 VALUES(1,2);
INSERT INTO t2 VALUES(-99,100);
INSERT INTO t2 VALUES(1,3);
SELECT * FROM t1;
BEGIN;
INSERT INTO t1 VALUES(2,3);
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT REPLACE, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT REPLACE, y);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT IGNORE, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT IGNORE, y);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT ABORT, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT ABORT, y);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT FAIL, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT FAIL, y);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a INTEGER PRIMARY KEY ON CONFLICT ROLLBACK, b);
CREATE TABLE t2(x INTEGER PRIMARY KEY ON CONFLICT ROLLBACK, y);
INSERT INTO t2 VALUES(1,3);
INSERT INTO t1 SELECT * FROM t2;
SELECT * FROM t1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(x);
CREATE TABLE t8(
    rid INTEGER,
    pid INTEGER,
    mid INTEGER,
    px INTEGER DEFAULT(0) CHECK(px IN(0, 1))
  );
CREATE TEMP TABLE x(
    rid INTEGER,
    pid INTEGER,
    mid INTEGER,
    px INTEGER DEFAULT(0) CHECK(px IN(0, 1))
  );
INSERT INTO x SELECT * FROM t8;
PRAGMA integrity_check;
INSERT INTO x     SELECT * FROM t8;
PRAGMA integrity_check;
INSERT INTO x     SELECT * FROM t8  RETURNING *;
CREATE TABLE t9(a, b, c);
CREATE INDEX t9a ON t9(a);
CREATE INDEX t9b ON t9(b) WHERE c=0;
INSERT INTO t9 VALUES(1, 1, 1);
INSERT INTO t9 VALUES(2, 2, 2);
INSERT INTO t9 VALUES(3, 3, 3);
CREATE TABLE t10(a, b, c);
CREATE INDEX t10a ON t10(a);
CREATE INDEX t10b ON t10(b) WHERE c=0;
INSERT INTO t10 SELECT * FROM t9;
SELECT * FROM t10;
PRAGMA integrity_check;
