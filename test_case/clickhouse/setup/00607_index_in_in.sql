DROP TABLE IF EXISTS merge_tree;
CREATE TABLE merge_tree (x UInt32) ENGINE = MergeTree ORDER BY x SETTINGS index_granularity = 1;
INSERT INTO merge_tree VALUES (0), (1);
SET force_primary_key = 1;
SET max_rows_to_read = 1;