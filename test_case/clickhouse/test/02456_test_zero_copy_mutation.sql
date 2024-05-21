DROP TABLE IF EXISTS mutation_1;
DROP TABLE IF EXISTS mutation_2;
INSERT INTO mutation_1 VALUES (1, 'Hello');
SYSTEM SYNC REPLICA mutation_2;
SYSTEM STOP REPLICATION QUEUES mutation_2;
ALTER TABLE mutation_1 UPDATE a = 2 WHERE b = 'xxxxxx' SETTINGS mutations_sync=1;
SELECT * from mutation_1;
SELECT * from mutation_2;
DROP TABLE mutation_1 SYNC;
SELECT * from mutation_2;
DROP TABLE IF EXISTS mutation_1;
DROP TABLE IF EXISTS mutation_2;