ATTACH 'test.db2' AS aux;
ATTACH 'test.db3' AS aux2;
ATTACH 'test.db4' AS aux3;
CREATE TABLE t1(x);
PRAGMA main.journal_mode = WAL;
PRAGMA aux.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
/* Leave aux4 in rollback mode */;
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES('xyz');
CREATE TABLE t2(a, b);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA main.journal_mode = WAL;
PRAGMA aux.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
/* Leave aux4 in rollback mode */;
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES('xyz');
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA main.journal_mode = WAL;
PRAGMA aux.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
/* Leave aux4 in rollback mode */;
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES('xyz');
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA journal_mode = wal;
BEGIN;
INSERT INTO t2 VALUES(7, 8);
BEGIN;
INSERT INTO t2 VALUES(9, 10);
PRAGMA main.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
PRAGMA aux3.journal_mode = WAL;
CREATE TABLE aux2.t2(x,y);
CREATE TABLE aux3.t3(x,y);
INSERT INTO t2 VALUES('a', 'b');
INSERT INTO t3 VALUES('a', 'b');
PRAGMA main.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
PRAGMA aux3.journal_mode = WAL;
INSERT INTO t2 VALUES('a', 'b');
INSERT INTO t3 VALUES('a', 'b');
PRAGMA main.journal_mode = WAL;
PRAGMA aux2.journal_mode = WAL;
PRAGMA aux3.journal_mode = WAL;
INSERT INTO t2 VALUES('a', 'b');
INSERT INTO t3 VALUES('a', 'b');
PRAGMA auto_vacuum = 0;
PRAGMA journal_mode = WAL;
