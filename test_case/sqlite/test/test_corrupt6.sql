PRAGMA auto_vacuum=OFF;
PRAGMA page_size=1024;
CREATE TABLE t1(x);
INSERT INTO t1(x) VALUES('varint32-01234567890123456789012345678901234567890123456789');
INSERT INTO t1(x) VALUES('varint32-01234567890123456789012345678901234567890123456789');
PRAGMA integrity_check;
SELECT substr(x,1,8) FROM t1;
PRAGMA integrity_check;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
PRAGMA integrity_check;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
PRAGMA integrity_check;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
SELECT substr(x,1,8) FROM t1;
