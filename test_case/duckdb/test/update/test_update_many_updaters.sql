SET immediate_transaction_mode=true;
CREATE TABLE test (a INTEGER);;
INSERT INTO test VALUES (1), (2), (3);
BEGIN TRANSACTION;
UPDATE test SET a=4 WHERE a=1;
BEGIN TRANSACTION;
UPDATE test SET a=5 WHERE a=2;
BEGIN TRANSACTION;
UPDATE test SET a=6 WHERE a=3;
BEGIN TRANSACTION;
UPDATE test SET a=99 WHERE a=1;
UPDATE test SET a=99 WHERE a=2;
UPDATE test SET a=99 WHERE a=3;
UPDATE test SET a=a-3;
ROLLBACK;
ROLLBACK;
ROLLBACK;
ROLLBACK;
BEGIN TRANSACTION;
UPDATE test SET a=4 WHERE a=1;
BEGIN TRANSACTION;
UPDATE test SET a=5 WHERE a=2;
BEGIN TRANSACTION;
UPDATE test SET a=6 WHERE a=3;
BEGIN TRANSACTION;
UPDATE test SET a=7 WHERE a=4;
UPDATE test SET a=8 WHERE a=5;
UPDATE test SET a=9 WHERE a=6;
COMMIT;
COMMIT;
COMMIT;
COMMIT;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;
SELECT * FROM test ORDER BY a;