DROP TABLE IF EXISTS normal;
CREATE TABLE normal
(
    `key` UInt32,
    `ts` DateTime,
    `value` UInt32,
    PROJECTION aaaa
    (
        SELECT
            ts,
            key,
            value
        ORDER BY ts, key
    )
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO normal SELECT
    number,
    toDateTime('2021-12-06 00:00:00') + number,
    number
FROM numbers(100000);
SET optimize_use_projections=1, optimize_aggregation_in_order=1, force_optimize_projection=1;