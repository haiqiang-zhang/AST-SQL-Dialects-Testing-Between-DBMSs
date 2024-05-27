DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1 (x Nullable(Int64), y Nullable(UInt64)) ENGINE = TinyLog;
CREATE TABLE t2 (x Nullable(Int64), y Nullable(UInt64)) ENGINE = TinyLog;
INSERT INTO t1 VALUES (1,42), (2,2), (3,3), (NULL,NULL);
INSERT INTO t2 VALUES (NULL,NULL), (2,2), (3,33), (4,42);
SET allow_experimental_analyzer = 1;