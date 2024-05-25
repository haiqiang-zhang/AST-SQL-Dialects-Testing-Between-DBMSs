ALTER TABLE t1 RENAME COLUMN b TO d;
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
CREATE INDEX t1i ON t1(a, c);
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
INSERT INTO t1 VALUES(1, 2, 3);
SELECT * FROM t1;
SELECT sql FROM sqlite_master WHERE tbl_name='t1' AND sql!='';
CREATE TABLE t3(a, b, c, d, e, f, g, h, i, j, k, l, m, FOREIGN KEY (b, c, d, e, f, g, h, i, j, k, l, m) REFERENCES t4);
SELECT b FROM t3;
ALTER TABLE t3 RENAME b TO biglongname;
SELECT sql FROM sqlite_master WHERE name='t3';
SELECT biglongname FROM t3;
CREATE TABLE t4(x, y, z);
DELETE FROM t4 WHERE y=32;
UPDATE t4 SET x=y+1, y=0 WHERE y=32;
INSERT INTO t4(x, y, z) SELECT 4, 5, 6 WHERE 0;
INSERT INTO t4 VALUES(3, 2, 1);
ALTER TABLE t4 RENAME y TO abc;
SELECT sql FROM sqlite_master WHERE name='t4';
SELECT * FROM t4;
INSERT INTO t4 VALUES(6, 5, 4);
SELECT sql FROM sqlite_master WHERE type='trigger';
CREATE TABLE c1(a, b, FOREIGN KEY (a, b) REFERENCES p1(c, d));
CREATE TABLE p1(c, d, PRIMARY KEY(c, d));
PRAGMA foreign_keys = 1;
INSERT INTO p1 VALUES(1, 2);
INSERT INTO p1 VALUES(3, 4);
ALTER TABLE p1 RENAME d TO "silly name";
SELECT sql FROM sqlite_master WHERE name IN ('c1', 'p1');
INSERT INTO c1 VALUES(1, 2);
CREATE TABLE c2(a, b, FOREIGN KEY (a, b) REFERENCES p1);
ALTER TABLE p1 RENAME "silly name" TO reasonable;
SELECT sql FROM sqlite_master WHERE name IN ('c1', 'c2', 'p1');
CREATE TABLE t5(a, b, c);
CREATE INDEX t5a ON t5(a);
INSERT INTO t5 VALUES(1, 2, 3), (4, 5, 6);
ANALYZE;
ALTER TABLE t5 RENAME b TO big;
SELECT big FROM t5;
CREATE TABLE blob(
    rid INTEGER PRIMARY KEY,
    rcvid INTEGER,
    size INTEGER,
    uuid TEXT UNIQUE NOT NULL,
    content BLOB,
    CHECK( length(uuid)>=40 AND rid>0 )
  );
ALTER TABLE "blob" RENAME COLUMN "rid" TO "a1";
ALTER TABLE "blob" RENAME COLUMN "a1" TO [where];
SELECT "where" FROM blob;
CREATE TABLE c(x);
INSERT INTO c VALUES(0);
CREATE TABLE t6("col a", "col b", "col c");
INSERT INTO t6 VALUES(0, 0, 0);
UPDATE t6 SET "col c" = 1;
SELECT * FROM c;
ALTER TABLE t6 RENAME "col c" TO "col 3";
UPDATE t6 SET "col 3" = 0;
SELECT * FROM c;
CREATE TABLE a1(x INTEGER, y TEXT, z BLOB, PRIMARY KEY(x));
CREATE TABLE a2(a, b, c);
CREATE VIEW v1 AS SELECT x, y, z FROM a1;
ALTER TABLE a1 RENAME y TO yyy;
SELECT sql FROM sqlite_master WHERE type='view';
DROP VIEW v1;
CREATE VIEW v2 AS SELECT x, x+x, a, a+a FROM a1, a2;
ALTER TABLE a1 RENAME x TO xxx;
SELECT sql FROM sqlite_master WHERE type='view';
DROP TABLE a2;
DROP VIEW v2;
CREATE TABLE a2(a INTEGER PRIMARY KEY, b, c);
CREATE VIEW v2 AS SELECT xxx, xxx+xxx, a, a+a FROM a1, a2;
ALTER TABLE a1 RENAME xxx TO x;
SELECT sql FROM sqlite_master WHERE type='view';
CREATE TABLE b1(a, b, c);
CREATE TABLE b2(x, y, z);
CREATE VIEW vvv AS SELECT c+c || coalesce(c, c) FROM b1, b2 WHERE x=c GROUP BY c HAVING c>0;
SELECT sql FROM sqlite_master WHERE name='vvv';
CREATE VIEW www AS SELECT b FROM b1 UNION ALL SELECT y FROM b2;
ALTER TABLE b1 RENAME b TO bbb;
SELECT sql FROM sqlite_master WHERE name='www';
CREATE VIEW xxx AS SELECT a FROM b1 UNION SELECT x FROM b2 ORDER BY 1 COLLATE nocase;
ALTER TABLE b2 RENAME x TO hello;
SELECT sql FROM sqlite_master WHERE name='xxx';
CREATE VIEW zzz AS SELECT george, ringo FROM b1;
DROP VIEW zzz;
CREATE VIEW vt5(x) AS SELECT group_concat(a ORDER BY b) FROM t5;
SELECT sql FROM sqlite_schema WHERE name='vt5';
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
CREATE TABLE t2(c, d, e);
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
CREATE VIEW s1 AS SELECT a, b, _x_ FROM t1 WHERE _x_='abc' COLLATE xyz;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
CREATE VIEW v1 AS SELECT a, b, _x_ FROM t1 WHERE scalar(_x_);
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
SELECT sql FROM sqlite_master WHERE sql!='' ORDER BY 1;
SELECT sql FROM sqlite_master ORDER BY 1;
CREATE TABLE x1(a, b, c);
SELECT sql FROM sqlite_master;
CREATE INDEX t1a ON t1(a);
ANALYZE;
SELECT sql FROM sqlite_master WHERE tbl_name = 'sqlite_stat1';
SELECT sql FROM sqlite_master WHERE name='x1i';
PRAGMA writable_schema = ON;
UPDATE sqlite_master SET sql = 'CREATE INDEX x1i ON x1(j)' WHERE name='x1i';
PRAGMA writable_schema = OFF;
PRAGMA writable_schema = ON;
UPDATE sqlite_master SET sql = '' WHERE name='x1i';
PRAGMA writable_schema = OFF;
PRAGMA writable_schema = ON;
DELETE FROM sqlite_master WHERE name = 'x1i';
PRAGMA writable_schema = OFF;
CREATE TABLE data(x UNIQUE, y, z);
DROP TRIGGER IF EXISTS tr1;
DROP TRIGGER IF EXISTS tr1;
DROP TRIGGER IF EXISTS tr1;
DROP TRIGGER IF EXISTS tr1;
CREATE TABLE ddd(sql, type, object, db, tbl, icol, znew, bquote);
INSERT INTO ddd VALUES(
      'CREATE TABLE x1(i INTEGER, t TEXT)',
      'table', 'x1', 'main', 'x1', -1, 'zzz', 0
  ), (
      'CREATE TABLE x1(i INTEGER, t TEXT)',
      'table', 'x1', 'main', 'x1', 2, 'zzz', 0
  ), (
      'CREATE TABLE x1(i INTEGER, t TEXT)',
      'table', 'x1', 'main', 'notable', 0, 'zzz', 0
  ), (
      'CREATE TABLE x1(i INTEGER, t TEXT)',
      'table', 'x1', 'main', 'ddd', -1, 'zzz', 0
  );
SELECT a AS d FROM xxx WHERE d=0;
SELECT sql FROM sqlite_master WHERE type='view';
INSERT INTO t1 VALUES(1,2,3);
INSERT INTO t2 VALUES(4,5,6);
CREATE VIEW v4 AS SELECT a, d FROM t1, t2;
CREATE UNIQUE INDEX t2d ON t2(d);
INSERT INTO t1 VALUES(4, 8, 456);
SELECT * FROM t2;
INSERT INTO t1 VALUES(4, 0, 20456);
SELECT * FROM t2;
INSERT INTO t1 VALUES(4, 0, 0);
SELECT * FROM t2;
CREATE VIEW temp.v5 AS SELECT "big c" FROM t1;
SELECT * FROM v5;
SELECT * FROM v5;
CREATE TABLE u7(x, y, z);
CREATE TEMP TABLE uu7(x, y, z);
ALTER TABLE uu7 RENAME x TO xxx;
ATTACH 'test.db2' AS aux;
CREATE TABLE aux.log(v);
SELECT v FROM log;
SELECT sql FROM sqlite_master WHERE name = 'v2';
SELECT sql FROM sqlite_master WHERE name='t1';
DROP TABLE t1;
CREATE TABLE t1(aaa,b,c,UNIQUE(aaA),PRIMARY KEY(aAa),UNIQUE(aAA))WITHOUT ROWID;
SELECT sql FROM sqlite_master WHERE name='t1';
DROP TABLE t1;
CREATE TABLE t1(aa UNIQUE,bb UNIQUE,cc UNIQUE,UNIQUE(aA),PRIMARY KEY(bB),UNIQUE(cC));
SELECT sql FROM sqlite_master WHERE name='t1';
SELECT sql FROM sqlite_schema WHERE name IS 'tr1';
SELECT sql FROM sqlite_schema;
PRAGMA integrity_check;
PRAGMA integrity_check;
SELECT sql FROM sqlite_schema WHERE name='t1';
-- unknown column "xyz"
  CREATE TABLE schema_copy(name TEXT, sql TEXT);
INSERT INTO schema_copy(name,sql) SELECT name, sql FROM sqlite_schema WHERE sql IS NOT NULL;
SELECT name, sql FROM sqlite_master
    EXCEPT SELECT name, sql FROM schema_copy;
BEGIN;
PRAGMA writable_schema=ON;
PRAGMA writable_schema=OFF;
SELECT name FROM sqlite_master
     WHERE (name, sql) NOT IN (SELECT name, sql FROM schema_copy);
DELETE FROM schema_copy;
INSERT INTO schema_copy(name,sql) SELECT name, sql FROM sqlite_schema WHERE sql IS NOT NULL;
SELECT name, sql FROM sqlite_master
    EXCEPT SELECT name, sql FROM schema_copy;
BEGIN;
PRAGMA writable_schema=ON;
PRAGMA writable_schema=OFF;
SELECT name FROM sqlite_master
     WHERE (name, sql) NOT IN (SELECT name, sql FROM schema_copy);
CREATE VIEW t4v1 AS SELECT id, c1, c99 FROM t4;
DELETE FROM schema_copy;
INSERT INTO schema_copy SELECT name, sql FROM sqlite_schema;
BEGIN;
PRAGMA writable_schema=ON;
ALTER TABLE t4 RENAME to t4new;
SELECT name FROM sqlite_schema WHERE (name,sql) NOT IN (SELECT * FROM schema_copy);