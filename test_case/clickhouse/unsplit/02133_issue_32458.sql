DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1 (`id` Int32, `key` String) ENGINE = Memory;
CREATE TABLE t2 (`id` Int32, `key` String) ENGINE = Memory;
INSERT INTO t1 VALUES (0, '');
INSERT INTO t2 VALUES (0, '');
SELECT * FROM t1 ANY INNER JOIN t2 ON ((NULL = t1.key) = t2.id) AND (('' = t1.key) = t2.id);
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;