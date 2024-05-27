DROP TABLE IF EXISTS invalid_min_index_granularity_bytes_setting;
DROP TABLE IF EXISTS valid_min_index_granularity_bytes_setting;
CREATE TABLE valid_min_index_granularity_bytes_setting
(
  id UInt64,
  value String
) ENGINE MergeTree()
ORDER BY id SETTINGS index_granularity_bytes = 2024, min_index_granularity_bytes = 1024;
INSERT INTO valid_min_index_granularity_bytes_setting SELECT number, concat('xxxxxxxxxx', toString(number)) FROM numbers(1000,1000);