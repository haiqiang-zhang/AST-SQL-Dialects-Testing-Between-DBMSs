DROP TABLE IF EXISTS bug_13492;
CREATE TABLE bug_13492 (`d` DateTime) ENGINE = MergeTree
PARTITION BY toYYYYMMDD(d) ORDER BY tuple();
INSERT INTO bug_13492 SELECT addDays(now(), number) FROM numbers(100);
SET max_threads = 5;