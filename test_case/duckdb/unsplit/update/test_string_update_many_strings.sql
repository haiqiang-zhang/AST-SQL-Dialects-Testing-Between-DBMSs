SET default_null_order='nulls_first';
CREATE TABLE test (a VARCHAR);
INSERT INTO test VALUES ('a'), ('b'), ('c'), (NULL);
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
INSERT INTO test SELECT * FROM test;
BEGIN TRANSACTION;
UPDATE test SET a='aa' WHERE a='a';
ROLLBACK;
UPDATE test SET a='aa' WHERE a='a';
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
SELECT DISTINCT a FROM test ORDER BY a;
