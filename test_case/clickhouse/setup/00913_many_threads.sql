SET max_block_size = 1, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;
CREATE TEMPORARY TABLE t (x UInt64);
INSERT INTO t SELECT * FROM system.numbers LIMIT 1500;