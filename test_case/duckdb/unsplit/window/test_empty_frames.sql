PRAGMA enable_verification;
CREATE TABLE t1 (id INTEGER, ch CHAR(1));
INSERT INTO t1 VALUES (1, 'A');
INSERT INTO t1 VALUES (2, 'B');
INSERT INTO t1 VALUES (NULL, 'B');
PRAGMA disable_verification;
SELECT id, string_agg(id, ' ') OVER (PARTITION BY ch ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING) 
FROM t1
ORDER BY 1;
SELECT id, bitstring_agg(id, 1, 3) OVER (PARTITION BY ch ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING) 
FROM t1
ORDER BY 1;
