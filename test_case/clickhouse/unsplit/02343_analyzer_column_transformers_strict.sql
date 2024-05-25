SET allow_experimental_analyzer = 1;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT * EXCEPT (id) FROM test_table;
SELECT * REPLACE STRICT (1 AS id, 2 AS value) FROM test_table;
DROP TABLE IF EXISTS test_table;
