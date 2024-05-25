SET session_timezone = 'UTC';
SELECT '-- Original issue with max_insert_delayed_streams_for_parallel_write <= 1';
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 0;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Original issue with deduplicate_blocks_in_dependent_materialized_views = 0 AND max_insert_delayed_streams_for_parallel_write > 1';
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 1000;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Original issue with deduplicate_blocks_in_dependent_materialized_views = 1 AND max_insert_delayed_streams_for_parallel_write > 1';
SET deduplicate_blocks_in_dependent_materialized_views = 1, max_insert_delayed_streams_for_parallel_write = 1000;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Regression introduced in https://github.com/ClickHouse/ClickHouse/pull/54184';
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 0;
SELECT '-- Landing (Agg/Replacing)MergeTree';
SELECT '--- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS ds SYNC;
DROP TABLE IF EXISTS mv SYNC;
