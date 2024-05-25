DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
INSERT INTO test_table VALUES (0, 'Value');
DROP ROW POLICY IF EXISTS test_row_policy ON test_table;
EXPLAIN header = 1, actions = 1 SELECT id, value FROM test_table PREWHERE id = 5 settings allow_experimental_analyzer=0;
EXPLAIN header = 1, actions = 1 SELECT id, value FROM test_table PREWHERE id = 5 settings allow_experimental_analyzer=1;
DROP TABLE test_table;
