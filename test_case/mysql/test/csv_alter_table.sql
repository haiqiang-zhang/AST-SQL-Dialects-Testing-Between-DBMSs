DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (a int NOT NULL) ENGINE = CSV;
ALTER TABLE t1 ADD COLUMN b CHAR(5) NOT NULL;
ALTER TABLE t1 DROP COLUMN b;
ALTER TABLE t1 MODIFY a BIGINT NOT NULL;
ALTER TABLE t1 CHANGE a a INT NOT NULL;
DROP TABLE t1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (a int NOT NULL) ENGINE = CSV;
DROP TABLE t1;
