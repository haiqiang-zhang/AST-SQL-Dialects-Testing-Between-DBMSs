CREATE TABLE test (a INTEGER, b INTEGER);
INSERT INTO test VALUES (11, 22), (13, 22), (12, 21), (NULL, NULL);
CREATE TABLE test2 (a INTEGER);
INSERT INTO test2 VALUES (13), (12), (11);
CHECKPOINT;
INSERT INTO test VALUES (14, 23);
DROP TABLE test;
DROP TABLE test2;
