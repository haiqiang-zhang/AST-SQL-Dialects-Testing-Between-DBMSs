SET session_timezone = 'UTC';
SELECT '-- Original issue with max_insert_delayed_streams_for_parallel_write <= 1';
/*

    This is the expected behavior when mv deduplication is set to false.

    - 1st insert works for landing and mv tables
    - 2nd insert gets first block 20220901 deduplicated and second one inserted in landing table
    - 2nd insert gets both blocks inserted in mv table

*/
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 0;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Original issue with deduplicate_blocks_in_dependent_materialized_views = 0 AND max_insert_delayed_streams_for_parallel_write > 1';
/*

    This is the unexpected behavior due to setting max_insert_delayed_streams_for_parallel_write > 1.

    This unexpected behavior was present since version 21.9 or earlier but due to this PR https://github.com/ClickHouse/ClickHouse/pull/34780
    when max_insert_delayed_streams_for_parallel_write gets disabled by default the issue was mitigated.

    This is what happens:

    - 1st insert works for landing and mv tables
    - 2nd insert gets first block 20220901 deduplicated and second one inserted in landing table
    - 2nd insert is not inserting anything in mv table due to a bug computing blocks to be discarded

*/
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 1000;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Original issue with deduplicate_blocks_in_dependent_materialized_views = 1 AND max_insert_delayed_streams_for_parallel_write > 1';
/*

    By setting deduplicate_blocks_in_dependent_materialized_views = 1 we can make the code go through a different path getting an expected
    behavior again, even with max_insert_delayed_streams_for_parallel_write > 1.

    This is what happens now:

    - 1st insert works for landing and mv tables
    - 2nd insert gets first block 20220901 deduplicated and second one inserted for landing and mv tables

*/
SET deduplicate_blocks_in_dependent_materialized_views = 1, max_insert_delayed_streams_for_parallel_write = 1000;
SELECT '-- Landing';
SELECT '-- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS mv SYNC;
SELECT '-- Regression introduced in https://github.com/ClickHouse/ClickHouse/pull/54184';
/*

    This is a test to prevent regression introduced in https://github.com/ClickHouse/ClickHouse/pull/54184 from happening again.

    The PR was trying to fix the unexpected behavior when deduplicate_blocks_in_dependent_materialized_views = 0 AND
    max_insert_delayed_streams_for_parallel_write > 1 but it ended up adding a new regression.

*/
SET deduplicate_blocks_in_dependent_materialized_views = 0, max_insert_delayed_streams_for_parallel_write = 0;
SELECT '-- Landing (Agg/Replacing)MergeTree';
SELECT '--- MV';
DROP TABLE IF EXISTS landing SYNC;
DROP TABLE IF EXISTS ds SYNC;
DROP TABLE IF EXISTS mv SYNC;
