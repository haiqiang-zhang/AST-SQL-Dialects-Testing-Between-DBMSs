SET immediate_transaction_mode=true;
CREATE SCHEMA test;
CREATE OR REPLACE SCHEMA test;
CREATE TABLE test.hello(i INTEGER);
BEGIN TRANSACTION;
DROP TABLE test.hello;
DROP SCHEMA test;
COMMIT;
CREATE SCHEMA test;
CREATE TABLE test.hello(i INTEGER);
INSERT INTO test.hello VALUES (2), (3), (4);
BEGIN TRANSACTION;
COMMIT;
SELECT * FROM test.hello;
SELECT * FROM test.hello;
