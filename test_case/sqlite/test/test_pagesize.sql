PRAGMA page_size;
EXPLAIN PRAGMA page_size;
CREATE TABLE t1(a);
PRAGMA page_size=2048;
PRAGMA page_size;
PRAGMA page_size=511;
PRAGMA page_size;
PRAGMA page_size=512;
PRAGMA page_size;
PRAGMA page_size=8192;
PRAGMA page_size;
PRAGMA page_size=65537;
PRAGMA page_size;
PRAGMA page_size=1234;
PRAGMA page_size;
PRAGMA page_size=512;
PRAGMA page_size;
PRAGMA page_size;
SELECT * FROM t1;
PRAGMA page_size=512;
PRAGMA page_size;
PRAGMA page_size;
VACUUM;
PRAGMA integrity_check;
PRAGMA page_size;
BEGIN;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
PRAGMA page_size;
SELECT count(*) FROM t1;
BEGIN;
DELETE FROM t1 WHERE rowid%5!=0;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
DELETE FROM t1 WHERE rowid%5!=0;
VACUUM;
SELECT count(*) FROM t1;
DROP TABLE t1;
VACUUM;
PRAGMA integrity_check;
CREATE TABLE t1(x);
PRAGMA temp.page_size=512;
CREATE TEMP TABLE t2(y);
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=512;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=2048;
PRAGMA page_size;
PRAGMA page_size;
SELECT * FROM t1;
PRAGMA page_size=2048;
PRAGMA page_size;
PRAGMA page_size;
VACUUM;
PRAGMA integrity_check;
PRAGMA page_size;
BEGIN;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
PRAGMA page_size;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
BEGIN;
DELETE FROM t1 WHERE rowid%5!=0;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
DELETE FROM t1 WHERE rowid%5!=0;
VACUUM;
SELECT count(*) FROM t1;
DROP TABLE t1;
VACUUM;
PRAGMA integrity_check;
CREATE TABLE t1(x);
PRAGMA temp.page_size=2048;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=2048;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=4096;
PRAGMA page_size;
PRAGMA page_size;
SELECT * FROM t1;
PRAGMA page_size=4096;
PRAGMA page_size;
PRAGMA page_size;
VACUUM;
PRAGMA integrity_check;
PRAGMA page_size;
BEGIN;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
PRAGMA page_size;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
BEGIN;
DELETE FROM t1 WHERE rowid%5!=0;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
DELETE FROM t1 WHERE rowid%5!=0;
VACUUM;
SELECT count(*) FROM t1;
DROP TABLE t1;
VACUUM;
PRAGMA integrity_check;
CREATE TABLE t1(x);
PRAGMA temp.page_size=4096;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=4096;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=8192;
PRAGMA page_size;
PRAGMA page_size;
SELECT * FROM t1;
PRAGMA page_size=8192;
PRAGMA page_size;
PRAGMA page_size;
VACUUM;
PRAGMA integrity_check;
PRAGMA page_size;
BEGIN;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
PRAGMA page_size;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
INSERT INTO t1 SELECT x||x FROM t1;
SELECT count(*) FROM t1;
BEGIN;
DELETE FROM t1 WHERE rowid%5!=0;
SELECT count(*) FROM t1;
SELECT count(*) FROM t1;
PRAGMA integrity_check;
DELETE FROM t1 WHERE rowid%5!=0;
VACUUM;
SELECT count(*) FROM t1;
DROP TABLE t1;
VACUUM;
PRAGMA integrity_check;
CREATE TABLE t1(x);
PRAGMA temp.page_size=8192;
PRAGMA main.page_size;
PRAGMA temp.page_size;
PRAGMA page_size=8192;
PRAGMA main.page_size;
PRAGMA temp.page_size;
BEGIN;
SELECT * FROM sqlite_master;
PRAGMA page_size=2048;
PRAGMA main.page_size;
BEGIN;
PRAGMA page_size = 2048;
PRAGMA main.page_size;
