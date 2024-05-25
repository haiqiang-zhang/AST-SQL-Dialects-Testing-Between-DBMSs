CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
SELECT * FROM t1, t2 WHERE a=c AND b=d GROUP BY b HAVING a>5 ORDER BY a;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
SELECT * FROM t1, t2 WHERE a=c AND b=d GROUP BY b HAVING a>5 ORDER BY a;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
PRAGMA foreign_keys = OFF;
PRAGMA foreign_keys = OFF;
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
PRAGMA recursive_triggers = 1;
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
PRAGMA recursive_triggers = 1;
CREATE TABLE t2(a, b);
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
SELECT * FROM t1, t2 WHERE a=c AND b=d GROUP BY b HAVING a>5 ORDER BY a;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
PRAGMA foreign_keys = OFF;
PRAGMA foreign_keys = OFF;
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
PRAGMA recursive_triggers = 1;
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
PRAGMA recursive_triggers = 1;
CREATE TABLE t2(a, b);
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a PRIMARY KEY, b REFERENCES t1, c UNIQUE);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
SELECT * FROM t1, t2 WHERE a=c AND b=d GROUP BY b HAVING a>5 ORDER BY a;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS SELECT * FROM t1 UNION SELECT * FROM t2;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
PRAGMA foreign_keys = OFF;
PRAGMA foreign_keys = OFF;
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b);
CREATE TABLE t2(c, d);
CREATE VIEW v1 AS 
        SELECT * FROM t1 
        UNION 
        SELECT * FROM t2
        UNION ALL
        SELECT c||b, d||a FROM t2 LEFT OUTER JOIN t1 GROUP BY c, d
        ORDER BY 1, 2;
UPDATE t1 SET a=5, b=(SELECT c FROM t2);
SELECT * FROM v1;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP view "v1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b, UNIQUE(a, b));
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE t1(a, b);
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 SELECT * FROM t1;
UPDATE t1 SET a=5;
DELETE FROM t1;
PRAGMA recursive_triggers = 1;
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
INSERT INTO t1 VALUES(5, 'x');
PRAGMA recursive_triggers = 1;
CREATE TABLE t2(a, b);
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
INSERT INTO t1 VALUES(10, 'x');
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t1 WHERE upper(a)='ABC';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
SELECT count(*) FROM t2;
SELECT * FROM t2 WHERE b>5;
SELECT * FROM t2 WHERE b='abcdefg';
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);