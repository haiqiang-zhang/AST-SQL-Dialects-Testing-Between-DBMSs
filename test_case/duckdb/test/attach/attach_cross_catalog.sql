ATTACH DATABASE ':memory:' AS db1;
CREATE TABLE test(a INTEGER);
CREATE INDEX index ON test(a);
CREATE TYPE db1.mood AS ENUM('ok', 'sad', 'happy');
CREATE TABLE db1.integers(i mood);
USE db1;
SELECT 'happy'::mood;