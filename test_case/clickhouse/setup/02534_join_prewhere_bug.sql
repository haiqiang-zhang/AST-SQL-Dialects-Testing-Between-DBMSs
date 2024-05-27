DROP TABLE IF EXISTS test1;
DROP TABLE IF EXISTS test2;
CREATE TABLE test1 ( `col1` UInt64, `col2` Int8 ) ENGINE = MergeTree ORDER BY col1;
CREATE TABLE test2 ( `col1` UInt64, `col3` Int16 ) ENGINE = MergeTree ORDER BY col1;
INSERT INTO test1 VALUES (123, 123), (12321, -30), (321, -32);
INSERT INTO test2 VALUES (123, 5600), (321, 5601);
SET join_use_nulls = 1;