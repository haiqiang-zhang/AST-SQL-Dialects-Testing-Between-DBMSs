DROP TABLE IF EXISTS t1;
CREATE TABLE t1( a INT, b INT );
INSERT INTO t1 VALUES (1, 1), (2, 2), (3, 3), (4, 4);
ALTER TABLE t1 ADD COLUMN (c INT);
ALTER TABLE t1 DROP COLUMN c;
PREPARE stmt FROM
'UPDATE t1, (SELECT DISTINCT b FROM t1 t1i) d SET a = 0 WHERE 1=0';
ALTER TABLE t1 ADD COLUMN (c INT);
ALTER TABLE t1 DROP COLUMN c;
UPDATE t1 SET a=b;
ALTER TABLE t1 DROP COLUMN a;
ALTER TABLE t1 ADD COLUMN a INT;
UPDATE t1 SET a=b;
PREPARE stmt FROM
'UPDATE t1, (SELECT DISTINCT b FROM t1 t1i) d SET a = 0 WHERE 1=0';
ALTER TABLE t1 DROP COLUMN a;
ALTER TABLE t1 ADD COLUMN a INT;
ALTER TABLE t1 ADD COLUMN (c INT);
ALTER TABLE t1 DROP COLUMN c;
PREPARE stmt FROM 'UPDATE t1, ((SELECT 1 FROM t1 t1i) UNION (SELECT 2 FROM t1 t1ii)) e SET a = 0 WHERE 1=0';
ALTER TABLE t1 ADD COLUMN (c INT);
ALTER TABLE t1 DROP COLUMN c;
UPDATE t1 SET a=b;
ALTER TABLE t1 DROP COLUMN a;
ALTER TABLE t1 ADD COLUMN a INT;
UPDATE t1 SET a=b;
PREPARE stmt FROM 'UPDATE t1, ((SELECT 1 FROM t1 t1i) UNION (SELECT 2 FROM t1 t1ii)) e SET a = 0 WHERE 1=0';
ALTER TABLE t1 DROP COLUMN a;
DROP TABLE t1;
