CREATE TEMPORARY VIEW v1 AS SELECT 42 AS a;
CREATE VIEW v2 AS SELECT 42 AS b;
CREATE SCHEMA s1;;
CREATE VIEW s1.v3 AS SELECT 42 AS c;
SET schema='s1';;
SHOW TABLES;
SHOW ALL TABLES;
SHOW TABLES;
SHOW ALL TABLES;
FROM v2;
SHOW TABLES;