CREATE TABLE test (a INTEGER, b VARCHAR);
INSERT INTO test VALUES (NULL, 'hello'), (13, 'abcdefgh'), (12, NULL);
PRAGMA enable_verification;
INSERT INTO test SELECT CASE WHEN i%2=0 THEN i ELSE NULL END, CASE WHEN i%2=0 THEN 'hello'||i::VARCHAR ELSE NULL END FROM range(10000) tbl(i);
SELECT a, b FROM test ORDER BY a;
SELECT a, b FROM test ORDER BY a;
SELECT COUNT(*), SUM(a), MIN(a), MAX(a), MIN(b), MAX(b), COUNT(a), COUNT(b) FROM test;
