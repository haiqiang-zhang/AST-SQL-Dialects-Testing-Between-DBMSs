DROP TABLE test.t1;
CREATE VIEW v1 AS SELECT 1 FROM DUAL;
CREATE TABLE t1(c INT,d INT,KEY(c));
ALTER TABLE t1 KEY_BLOCK_SIZE=8;
DROP TABLE t1;
DROP VIEW v1;
