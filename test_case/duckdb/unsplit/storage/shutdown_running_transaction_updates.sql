CREATE TABLE test (a INTEGER, b INTEGER);
INSERT INTO test VALUES (11, 22), (13, 22);
BEGIN TRANSACTION;
UPDATE test SET a=a+1;
SELECT * FROM test ORDER BY a;
