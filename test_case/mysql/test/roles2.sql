DROP DATABASE db1;
CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE TABLE db1.t1 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db1.t2 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db1.t3 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db2.t1 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db2.t2 (c1 INT, c2 INT, c3 INT);
DROP DATABASE db1;
DROP DATABASE db2;
CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE TABLE db1.t1 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db1.t2 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db1.t3 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db2.t1 (c1 INT, c2 INT, c3 INT);
CREATE TABLE db2.t2 (c1 INT, c2 INT, c3 INT);
DROP DATABASE db1;
DROP DATABASE db2;
CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE DATABASE db1aaaa;
CREATE DATABASE dddddb1;
CREATE DATABASE secdb1;
CREATE DATABASE secdb2;
CREATE TABLE db1.t1 (c1 INT);
CREATE TABLE db2.t1 (c2 INT);
CREATE TABLE dddddb1.t1 (c2 INT);
CREATE TABLE db1aaaa.t1 (c2 INT);
CREATE TABLE secdb1.t1 (c1 INT);
CREATE TABLE secdb2.t1 (c2 INT);
DROP DATABASE db1;
DROP DATABASE db2;
DROP DATABASE db1aaaa;
DROP DATABASE dddddb1;
DROP DATABASE secdb1;
DROP DATABASE secdb2;
