PRAGMA enable_verification;
ATTACH DATABASE ':memory:' AS new_database;
CREATE SCHEMA new_database.s1;
CREATE TABLE tbl(a INTEGER);
CREATE TABLE new_database.tbl(b INTEGER);
CREATE TABLE new_database.s1.tbl(c INTEGER);
SHOW ALL TABLES;