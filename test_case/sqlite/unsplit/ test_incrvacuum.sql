pragma auto_vacuum;
pragma auto_vacuum = 'full';
pragma auto_vacuum;
pragma auto_vacuum = 'incremental';
pragma auto_vacuum;
pragma auto_vacuum = 'invalid';
pragma auto_vacuum;
pragma auto_vacuum = 1;
pragma auto_vacuum;
pragma auto_vacuum = '2';
pragma auto_vacuum;
pragma auto_vacuum = 5;
pragma auto_vacuum;
pragma auto_vacuum = 1;
CREATE TABLE abc(a, b, c);
pragma auto_vacuum = 'none';
pragma auto_vacuum;
pragma auto_vacuum;
pragma auto_vacuum = 'incremental';
pragma auto_vacuum;
pragma auto_vacuum = 'full';
pragma auto_vacuum;
pragma auto_vacuum;
PRAGMA auto_vacuum = 2;
BEGIN;
CREATE TABLE tbl2(str);
DROP TABLE abc;
DELETE FROM tbl2;
PRAGMA auto_vacuum = 1;
INSERT INTO tbl2 VALUES('hello world');
PRAGMA auto_vacuum = 2;
CREATE TABLE tbl1(a, b, c);
DELETE FROM tbl2;
DROP TABLE tbl1;
BEGIN;
DROP TABLE tbl2;
PRAGMA incremental_vacuum;
BEGIN;
CREATE TABLE tbl1(a);
PRAGMA incremental_vacuum;
BEGIN;
INSERT INTO tbl1 SELECT * FROM tbl1;
DELETE FROM tbl1 WHERE oid%2;
BEGIN;
PRAGMA incremental_vacuum;
CREATE TABLE tbl2(b);
INSERT INTO tbl2 VALUES('a nice string');
SELECT * FROM tbl2;
DROP TABLE tbl1;
DROP TABLE tbl2;
PRAGMA incremental_vacuum;
PRAGMA auto_vacuum = 'none';
PRAGMA auto_vacuum = 'incremental';
BEGIN;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b);
CREATE INDEX t1_i ON t1(a);
CREATE INDEX t2_i ON t2(a);
BEGIN;
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t2;
PRAGMA integrity_check;
PRAGMA integrity_check;
INSERT INTO t2 SELECT b, a FROM t1;
INSERT INTO t2 SELECT a, b FROM t1;
INSERT INTO t1 SELECT b, a FROM t2;
UPDATE t2 SET b = '';
PRAGMA incremental_vacuum;
INSERT INTO t2 SELECT b, a FROM t1;
INSERT INTO t2 SELECT a, b FROM t1;
INSERT INTO t1 SELECT b, a FROM t2;
UPDATE t2 SET b = '';
PRAGMA incremental_vacuum;
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t2;
PRAGMA integrity_check;
PRAGMA integrity_check;
UPDATE t2 SET b = (SELECT b FROM t1 WHERE t1.oid = t2.oid);
PRAGMA incremental_vacuum;
UPDATE t2 SET b = (SELECT b FROM t1 WHERE t1.oid = t2.oid);
PRAGMA incremental_vacuum;
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t2;
PRAGMA integrity_check;
PRAGMA integrity_check;
CREATE TABLE t3(a, b);
INSERT INTO t3 SELECT * FROM t2;
DROP TABLE t2;
PRAGMA incremental_vacuum;
PRAGMA incremental_vacuum;
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t3;
SELECT * FROM t3;
PRAGMA integrity_check;
PRAGMA integrity_check;
CREATE INDEX t3_i ON t3(a);
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t3;
SELECT * FROM t3;
PRAGMA integrity_check;
PRAGMA integrity_check;
BEGIN;
DROP INDEX t3_i;
PRAGMA incremental_vacuum;
INSERT INTO t3 VALUES('hello', 'world');
BEGIN;
PRAGMA incremental_vacuum;
INSERT INTO t3 VALUES('hello', 'world');
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t3;
SELECT * FROM t3;
PRAGMA integrity_check;
PRAGMA integrity_check;
INSERT INTO t3 VALUES('hello', 'world');
INSERT INTO t3 VALUES('hello', 'world');
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t3;
SELECT * FROM t3;
PRAGMA integrity_check;
PRAGMA integrity_check;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
DROP TABLE tbl1;
PRAGMA incremental_vacuum(50);
PRAGMA auto_vacuum = 'incremental';
CREATE TABLE t2(a, b, c);
PRAGMA synchronous = 'OFF';
BEGIN;
DROP TABLE t2;
PRAGMA incremental_vacuum(10);
PRAGMA cache_size = 10;
BEGIN;
PRAGMA incremental_vacuum(10);
DROP TABLE t1;
PRAGMA incremental_vacuum(1);
PRAGMA incremental_vacuum(5);
PRAGMA incremental_vacuum('1');
PRAGMA incremental_vacuum("+3");
PRAGMA incremental_vacuum = 1;
PRAGMA incremental_vacuum(2147483649);
PRAGMA incremental_vacuum=-1;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = incremental;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = 'full';
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = 1;
BEGIN EXCLUSIVE;
PRAGMA auto_vacuum = 2;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
SELECT * FROM sqlite_master;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = none;
PRAGMA default_cache_size = 1024;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
PRAGMA incremental_vacuum(10);
PRAGMA cache_size = 10;
PRAGMA auto_vacuum = incremental;
CREATE TABLE t1(x, y);
CREATE TABLE t2(x PRIMARY KEY, y);
DELETE FROM t2;
PRAGMA incremental_vacuum;
INSERT INTO t2 SELECT * FROM t1;
PRAGMA integrity_check;
PRAGMA mmap_size = 1000000;
BEGIN;
DELETE FROM t2;
PRAGMA incremental_vacuum = 1000;
PRAGMA writable_schema=ON;
PRAGMA incremental_vacuum(10);
