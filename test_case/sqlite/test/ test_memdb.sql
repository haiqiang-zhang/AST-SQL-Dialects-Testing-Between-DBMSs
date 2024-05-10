BEGIN;
CREATE TABLE t3(x TEXT);
SELECT count(*) FROM t3;
PRAGMA synchronous=FULL;
PRAGMA synchronous=NORMAL;
PRAGMA synchronous=FULL;
PRAGMA synchronous=NORMAL;
PRAGMA synchronous=FULL;
PRAGMA synchronous=NORMAL;
PRAGMA synchronous=FULL;
PRAGMA synchronous=NORMAL;
PRAGMA synchronous=FULL;
PRAGMA integrity_check;
CREATE TABLE t4(a,b,c,d);
BEGIN;
INSERT INTO t4 VALUES(1,2,3,4);
SELECT * FROM t4;
SELECT name FROM sqlite_master WHERE type='table';
DROP TABLE t4;
SELECT name FROM sqlite_master WHERE type='table';
SELECT name FROM sqlite_master WHERE type='table';
CREATE TABLE t1(a, b, c, UNIQUE(a,b));
CREATE TABLE t2(x);
SELECT c FROM t1 ORDER BY c;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
INSERT OR IGNORE INTO t1 VALUES(1,2,4);
SELECT c FROM t1;
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
INSERT OR REPLACE INTO t1 VALUES(1,2,4);
SELECT c FROM t1;
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
REPLACE INTO t1 VALUES(1,2,4);
SELECT c FROM t1;
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
SELECT x FROM t2;
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(1,2,3);
BEGIN;
INSERT INTO t2 VALUES(1);
SELECT x FROM t2;
DROP TABLE t2;
DROP TABLE t3;
CREATE TABLE t2(a,b,c);
INSERT INTO t2 VALUES(1,2,1);
INSERT INTO t2 VALUES(2,3,2);
INSERT INTO t2 VALUES(3,4,1);
INSERT INTO t2 VALUES(4,5,4);
SELECT c FROM t2 ORDER BY b;
CREATE TABLE t3(x);
INSERT INTO t3 VALUES(1);
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT REPLACE);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
UPDATE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT IGNORE);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
UPDATE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT FAIL);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT ABORT);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT ROLLBACK);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE t3 SET x=1;
UPDATE t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT REPLACE);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR IGNORE t3 SET x=1;
UPDATE OR IGNORE t1 SET b=b*2;
UPDATE OR IGNORE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT IGNORE);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR REPLACE t3 SET x=1;
UPDATE OR REPLACE t1 SET b=b*2;
UPDATE OR REPLACE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT FAIL);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR IGNORE t3 SET x=1;
UPDATE OR IGNORE t1 SET b=b*2;
UPDATE OR IGNORE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT ABORT);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR REPLACE t3 SET x=1;
UPDATE OR REPLACE t1 SET b=b*2;
UPDATE OR REPLACE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) ON CONFLICT ROLLBACK);
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR IGNORE t3 SET x=1;
UPDATE OR IGNORE t1 SET b=b*2;
UPDATE OR IGNORE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR IGNORE t3 SET x=1;
UPDATE OR IGNORE t1 SET b=b*2;
UPDATE OR IGNORE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR REPLACE t3 SET x=1;
UPDATE OR REPLACE t1 SET b=b*2;
UPDATE OR REPLACE t1 SET a=c+5;
SELECT a FROM t1 ORDER BY b;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR FAIL t3 SET x=1;
UPDATE OR FAIL t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR ABORT t3 SET x=1;
UPDATE OR ABORT t1 SET b=b*2;
SELECT x FROM t3;
DROP TABLE t1;
CREATE TABLE t1(a,b,c, UNIQUE(a) );
INSERT INTO t1 SELECT * FROM t2;
UPDATE t3 SET x=0;
BEGIN;
UPDATE OR ROLLBACK t3 SET x=1;
UPDATE OR ROLLBACK t1 SET b=b*2;
SELECT x FROM t3;
SELECT * FROM t2;
BEGIN;
DROP TABLE t2;
SELECT name FROM sqlite_master WHERE type='table' ORDER BY 1;
SELECT name FROM sqlite_master WHERE type='table' ORDER BY 1;
BEGIN;
CREATE TABLE t5(x,y);
INSERT INTO t5 VALUES(1,2);
SELECT * FROM t5;
SELECT name FROM sqlite_master WHERE type='table' ORDER BY 1;
SELECT name FROM sqlite_master WHERE type='table' ORDER BY 1;
SELECT * FROM t5;
SELECT * FROM t5 ORDER BY y DESC;
INSERT INTO t5 VALUES(1,2);
INSERT INTO t5 VALUES(3,4);
REPLACE INTO t5 VALUES(1,4);
SELECT rowid,* FROM t5;
DELETE FROM t5 WHERE x>5;
SELECT * FROM t5;
DELETE FROM t5 WHERE y<3;
SELECT * FROM t5;
DELETE FROM t5 WHERE x>0;
SELECT * FROM t5;
CREATE TABLE t6(x);
SELECT count(*) FROM (SELECT DISTINCT x FROM t6);
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
SELECT count(*) FROM t6;
PRAGMA auto_vacuum=TRUE;
SELECT count(*) FROM t1;
DELETE FROM t1;
SELECT count(*) FROM t1;
PRAGMA auto_vacuum = full;
DELETE FROM t1;
