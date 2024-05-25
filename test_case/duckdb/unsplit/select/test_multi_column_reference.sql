PRAGMA enable_verification;
CREATE SCHEMA test;
CREATE TABLE test.tbl(col INTEGER);
INSERT INTO test.tbl VALUES (1), (2), (3);
CREATE SCHEMA t;
CREATE TABLE t.t(t ROW(t INTEGER));
INSERT INTO t.t VALUES ({'t': 42});
DROP SCHEMA t CASCADE;
CREATE SCHEMA t;
CREATE TABLE t.t AS SELECT {'t': {'t': {'t': {'t': {'t': 42}}}}} t;
DROP SCHEMA t CASCADE;
CREATE SCHEMA s1;
CREATE SCHEMA s2;
CREATE TABLE s1.t1 AS SELECT 42 t;
CREATE TABLE s2.t1 AS SELECT 84 t;
SELECT test.tbl.col FROM test.tbl;