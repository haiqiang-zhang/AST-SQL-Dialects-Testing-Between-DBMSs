CREATE DATABASE db1;
CREATE TABLE db1.t1 (c1 INT);
SELECT CURRENT_ROLE();
SELECT CURRENT_USER(), CURRENT_ROLE();
DROP DATABASE db1;
SELECT current_role();
SELECT CURRENT_ROLE();
