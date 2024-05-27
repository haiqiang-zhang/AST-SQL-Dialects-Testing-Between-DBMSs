DROP TABLE IF EXISTS t;
CREATE TABLE t
(
    `key` Int64,
    `someCol` String,
    `eventTime` DateTime
)
ENGINE = ReplacingMergeTree(eventTime)
ORDER BY key;
INSERT INTO t Values (1, 'first', '2024-04-19 01:01:01');
INSERT INTO t Values (1, 'first', '2024-04-19 01:01:01');
SET allow_experimental_analyzer = 1;