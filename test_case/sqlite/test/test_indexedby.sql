CREATE INDEX i1 ON t1(a);
CREATE INDEX i2 ON t1(b);
CREATE TABLE t2(c, d);
CREATE INDEX i3 ON t2(c);
CREATE INDEX i4 ON t2(d);
CREATE TABLE t3(e PRIMARY KEY, f);
CREATE VIEW v1 AS SELECT * FROM t1;
EXPLAIN QUERY PLAN 
  select * from t1 WHERE a = 10;
EXPLAIN QUERY PLAN 
  select * from t1;
SELECT * FROM t1 NOT INDEXED WHERE a = 'one' AND b = 'two';
SELECT * FROM main.t1 NOT INDEXED WHERE a = 'one' AND b = 'two';
SELECT * FROM t1 INDEXED BY i1 WHERE a = 'one' AND b = 'two';
SELECT * FROM main.t1 INDEXED BY i1 WHERE a = 'one' AND b = 'two';
SELECT * FROM t1 INDEXED BY i2 WHERE a = 'one' AND b = 'two';
SELECT b FROM t1 INDEXED BY i1 WHERE b = 'two';
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 WHERE a = 'one' AND b = 'two';
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 NOT INDEXED WHERE a = 'one' AND b = 'two';
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 NOT INDEXED WHERE rowid=1;
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 INDEXED BY i1 WHERE a = 'one' AND b = 'two';
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 INDEXED BY i2 WHERE a = 'one' AND b = 'two';
SELECT * FROM t1 INDEXED BY i2 WHERE a = 'one';
SELECT * FROM t1 INDEXED BY i2 ORDER BY a;
SELECT * FROM t1 INDEXED BY i1 WHERE a = 'one';
SELECT * FROM t1 INDEXED BY i1 ORDER BY a;
EXPLAIN QUERY PLAN 
  SELECT * FROM t3 INDEXED BY sqlite_autoindex_t3_1 ORDER BY e;
EXPLAIN QUERY PLAN 
  SELECT * FROM t3 INDEXED BY sqlite_autoindex_t3_1 WHERE e = 10;
SELECT * FROM t3 INDEXED BY sqlite_autoindex_t3_1 WHERE f = 10;
SELECT * FROM t1 INDEXED BY i1, t2 INDEXED BY i3 WHERE a=c;
SELECT * FROM t2 INDEXED BY i3, t1 INDEXED BY i1 WHERE a=c;
CREATE VIEW v2 AS SELECT * FROM t1 INDEXED BY i1 WHERE a > 5;
EXPLAIN QUERY PLAN SELECT * FROM v2;
EXPLAIN QUERY PLAN SELECT * FROM v2 WHERE b = 10;
DROP INDEX i1;
CREATE INDEX i1 ON t1(b);
SELECT * FROM v2;
DROP INDEX i1;
CREATE INDEX i1 ON t1(a);
SELECT * FROM v2;
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 WHERE b = 10 ORDER BY rowid;
EXPLAIN QUERY PLAN 
  SELECT * FROM t1 NOT INDEXED WHERE b = 10 ORDER BY rowid;
EXPLAIN QUERY PLAN 
  DELETE FROM t1 WHERE a = 5;
EXPLAIN QUERY PLAN 
  DELETE FROM t1 NOT INDEXED WHERE a = 5;
EXPLAIN QUERY PLAN 
  DELETE FROM t1 INDEXED BY i1 WHERE a = 5;
EXPLAIN QUERY PLAN 
  DELETE FROM t1 INDEXED BY i1 WHERE a = 5 AND b = 10;
EXPLAIN QUERY PLAN 
  DELETE FROM t1 INDEXED BY i2 WHERE a = 5 AND b = 10;
DELETE FROM t1 INDEXED BY i2 WHERE a = 5;
EXPLAIN QUERY PLAN 
  UPDATE t1 SET rowid=rowid+1 WHERE a = 5;
EXPLAIN QUERY PLAN 
  UPDATE t1 NOT INDEXED SET rowid=rowid+1 WHERE a = 5;
EXPLAIN QUERY PLAN 
  UPDATE t1 INDEXED BY i1 SET rowid=rowid+1 WHERE a = 5;
EXPLAIN QUERY PLAN 
  UPDATE t1 INDEXED BY i1 SET rowid=rowid+1 WHERE a = 5 AND b = 10;
EXPLAIN QUERY PLAN 
  UPDATE t1 INDEXED BY i2 SET rowid=rowid+1 WHERE a = 5 AND b = 10;
UPDATE t1 INDEXED BY i2 SET rowid=rowid+1 WHERE a = 5;
CREATE TABLE maintable( id integer);
CREATE TABLE joinme(id_int integer, id_text text);
CREATE INDEX joinme_id_text_idx on joinme(id_text);
CREATE INDEX joinme_id_int_idx on joinme(id_int);
select * from maintable as m inner join
    joinme as j indexed by joinme_id_text_idx
    on ( m.id  = j.id_int);
select * from maintable, joinme INDEXED by joinme_id_text_idx;
CREATE TABLE indexed(x,y);
INSERT INTO indexed VALUES(1,2);
SELECT * FROM indexed;
CREATE INDEX i10 ON indexed(x);
SELECT * FROM indexed indexed by i10 where x>0;
DROP TABLE indexed;
CREATE TABLE t10(indexed INTEGER);
INSERT INTO t10 VALUES(1);
CREATE INDEX indexed ON t10(indexed);
SELECT * FROM t10 indexed by indexed WHERE indexed>0;
CREATE TABLE x1(a, b TEXT);
CREATE INDEX x1i ON x1(a, b);
INSERT INTO x1 VALUES(1, 1);
INSERT INTO x1 VALUES(1, 1);
INSERT INTO x1 VALUES(1, 1);
INSERT INTO x1 VALUES(1, 1);
SELECT a,b,rowid FROM x1 INDEXED BY x1i WHERE a=1 AND b=1 AND rowid=3;
SELECT a,b,rowid FROM x1 INDEXED BY x1i WHERE a=1 AND b=1 AND rowid='3';
SELECT a,b,rowid FROM x1 INDEXED BY x1i WHERE a=1 AND b=1 AND rowid='3.0';
EXPLAIN QUERY PLAN 
  SELECT a,b,rowid FROM x1 INDEXED BY x1i WHERE a=1 AND b=1 AND rowid='3.0';
CREATE TABLE x2(c INTEGER PRIMARY KEY, a, b TEXT);
CREATE INDEX x2i ON x2(a, b);
INSERT INTO x2 VALUES(1, 1, 1);
INSERT INTO x2 VALUES(2, 1, 1);
INSERT INTO x2 VALUES(3, 1, 1);
INSERT INTO x2 VALUES(4, 1, 1);
SELECT a,b,c FROM x2 INDEXED BY x2i WHERE a=1 AND b=1 AND c=3;
SELECT a,b,c FROM x2 INDEXED BY x2i WHERE a=1 AND b=1 AND c='3';
SELECT a,b,c FROM x2 INDEXED BY x2i WHERE a=1 AND b=1 AND c='3.0';
EXPLAIN QUERY PLAN 
  SELECT a,b,c FROM x2 INDEXED BY x2i WHERE a=1 AND b=1 AND c='3.0';
CREATE TABLE o1(x INTEGER PRIMARY KEY, y, z);
CREATE INDEX p1 ON o1(z);
CREATE INDEX p2 ON o1(y) WHERE z=1;
DROP INDEX p1;
DROP INDEX p2;
CREATE INDEX p2 ON o1(y) WHERE z=1;
CREATE INDEX p1 ON o1(z);