PRAGMA auto_vacuum=OFF;
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
CREATE TABLE t2(a, b);
CREATE TABLE t3(a, b);
CREATE TABLE t4(a, b);
CREATE TABLE t5(a, b);
CREATE TABLE t6(a, b);
CREATE TABLE t7(a, b);
CREATE TABLE t8(a, b);
CREATE TABLE t9(a, b);
CREATE TABLE t10(a, b);
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA synchronous = off;
BEGIN;
DELETE FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
PRAGMA journal_mode = persist;
CREATE TABLE ab(a, b);
INSERT INTO ab VALUES(0, 'abc');
INSERT INTO ab VALUES(1, NULL);
INSERT INTO ab VALUES(2, NULL);
INSERT INTO ab VALUES(3, NULL);
INSERT INTO ab VALUES(4, NULL);
INSERT INTO ab VALUES(5, NULL);
INSERT INTO ab VALUES(6, NULL);
ATTACH 'test2.db' AS aux;
PRAGMA aux.journal_mode = persist;
BEGIN;
UPDATE main.ab SET b = 'def' WHERE a = 0;
SELECT b FROM main.ab WHERE a = 0;
SELECT b FROM main.ab WHERE a = 0;
/* 64 rows */;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;
PRAGMA integrity_check;
PRAGMA cache_size = 10;
/* 64 rows */
        BEGIN;
PRAGMA integrity_check;