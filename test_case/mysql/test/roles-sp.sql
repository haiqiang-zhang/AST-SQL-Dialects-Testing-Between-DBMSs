CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE TABLE db1.t1 (c1 int);
CREATE TABLE db1.t2 (c1 int);
CREATE TABLE db2.t1 (c1 int);
CREATE TABLE db2.t2 (c1 int);
CREATE SCHEMA world;
SELECT CURRENT_ROLE();
DROP SCHEMA world;
DROP DATABASE db1;
DROP DATABASE db2;
