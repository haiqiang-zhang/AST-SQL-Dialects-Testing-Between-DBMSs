CREATE TABLE t1 (f1 int);
CREATE VIEW v1 AS SELECT * FROM t1;
ALTER VIEW v1 AS select 13;
DROP VIEW v1;
