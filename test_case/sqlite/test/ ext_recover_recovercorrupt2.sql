PRAGMA page_size = 512;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b, c);
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 VALUES(2, hex(randomblob(100)), randomblob(200));
CREATE INDEX i1 ON t1(b, c);
CREATE TABLE t2(a PRIMARY KEY, b, c) WITHOUT ROWID;
INSERT INTO t2 VALUES(1, 2, 3);
INSERT INTO t2 VALUES(2, hex(randomblob(100)), randomblob(200));
ANALYZE;
PRAGMA writable_schema = 1;
UPDATE sqlite_schema SET sql = 'CREATE INDEX i1 ON o(world)' WHERE name='i1';
DELETE FROM sqlite_schema WHERE name='sqlite_stat4';
SELECT sql FROM sqlite_schema;
PRAGMA writable_schema = 1;
UPDATE sqlite_schema SET sql = 'CREATE TABLE t2 syntax error!' WHERE name='t2';
SELECT sql FROM sqlite_schema;
SELECT sql FROM sqlite_schema;
SELECT * FROM t1;