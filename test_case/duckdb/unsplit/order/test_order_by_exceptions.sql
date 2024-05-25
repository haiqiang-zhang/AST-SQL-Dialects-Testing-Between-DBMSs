PRAGMA enable_verification;
CREATE TABLE test (a INTEGER, b INTEGER);
INSERT INTO test VALUES (11, 22), (12, 21), (13, 22);
SELECT a FROM test ORDER BY 'hello', a;
SELECT a AS k, b FROM test UNION SELECT a, b AS k FROM test ORDER BY k;
SELECT a AS k, b FROM test UNION SELECT a AS k, b FROM test ORDER BY k;
SELECT a % 2, b FROM test UNION SELECT a % 2 AS k, b FROM test ORDER BY a % 2;
