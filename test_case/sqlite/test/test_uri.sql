ATTACH 'file:test.db2?vfs=tvfs2' AS aux;
PRAGMA main.journal_mode = PERSIST;
PRAGMA aux.journal_mode = PERSIST;
CREATE TABLE t1(a, b);
PRAGMA main.journal_mode = WAL;
PRAGMA aux.journal_mode = WAL;
INSERT INTO t1 VALUES('x', 'y');
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES('a', 'b');
INSERT INTO t1 VALUES(3, 4);