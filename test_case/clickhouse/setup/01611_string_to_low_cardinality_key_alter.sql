DROP TABLE IF EXISTS table_with_lc_key;
CREATE TABLE table_with_lc_key
(
    enum_key Enum8('x' = 2, 'y' = 1),
    lc_key LowCardinality(String),
    value String
)
ENGINE MergeTree()
ORDER BY (enum_key, lc_key);
INSERT INTO table_with_lc_key VALUES(1, 'hello', 'world');
ALTER TABLE table_with_lc_key MODIFY COLUMN lc_key String;