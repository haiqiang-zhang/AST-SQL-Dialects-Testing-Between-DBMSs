DROP TABLE IF EXISTS t_sparse_mutation;
CREATE TABLE t_sparse_mutation (id UInt64, v UInt64)
ENGINE = MergeTree ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;
INSERT INTO t_sparse_mutation select number, if (number % 21 = 0, number, 0) FROM numbers(10000);
SET mutations_sync = 2;
DELETE FROM t_sparse_mutation WHERE id % 2 = 0;