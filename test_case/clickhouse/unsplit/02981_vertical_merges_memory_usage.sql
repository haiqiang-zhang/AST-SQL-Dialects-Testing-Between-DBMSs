DROP TABLE IF EXISTS t_vertical_merge_memory;
CREATE TABLE t_vertical_merge_memory (id UInt64, arr Array(String))
ENGINE = MergeTree ORDER BY id
SETTINGS
    min_bytes_for_wide_part = 0,
    vertical_merge_algorithm_min_rows_to_activate = 1,
    vertical_merge_algorithm_min_columns_to_activate = 1,
    index_granularity = 8192,
    index_granularity_bytes = '10M',
    merge_max_block_size = 8192,
    merge_max_block_size_bytes = '10M';
INSERT INTO t_vertical_merge_memory SELECT number, arrayMap(x -> repeat('a', 50), range(1000)) FROM numbers(3000);
INSERT INTO t_vertical_merge_memory SELECT number, arrayMap(x -> repeat('a', 50), range(1000)) FROM numbers(3001);
OPTIMIZE TABLE t_vertical_merge_memory FINAL;
SYSTEM FLUSH LOGS;
DROP TABLE IF EXISTS t_vertical_merge_memory;
