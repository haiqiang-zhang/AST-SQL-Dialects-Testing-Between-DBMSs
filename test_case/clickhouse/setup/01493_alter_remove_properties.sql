DROP TABLE IF EXISTS prop_table;
CREATE TABLE prop_table
(
    column_default UInt64 DEFAULT 42,
    column_materialized UInt64 MATERIALIZED column_default * 42,
    column_alias UInt64 ALIAS column_default + 1,
    column_codec String CODEC(ZSTD(10)),
    column_comment Date COMMENT 'Some comment',
    column_ttl UInt64 TTL column_comment + INTERVAL 1 MONTH
)
ENGINE MergeTree()
ORDER BY tuple()
TTL column_comment + INTERVAL 2 MONTH;