DROP TABLE IF EXISTS local_00952;
DROP TABLE IF EXISTS distributed_00952;

SELECT 'insert_allow_materialized_columns=0';
SET insert_allow_materialized_columns=0;

SELECT 'distributed_foreground_insert=0';
SET distributed_foreground_insert=0;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE local_00952 (date Date, value Date MATERIALIZED toDate('2017-08-01')) ENGINE = MergeTree(date, date, 8192);
SELECT * FROM local_00952;
SELECT date, value FROM local_00952;
DROP TABLE local_00952;

SELECT 'distributed_foreground_insert=1';
SET distributed_foreground_insert=1;

SELECT 'insert_allow_materialized_columns=1';
SET insert_allow_materialized_columns=1;

SELECT 'distributed_foreground_insert=0';
SET distributed_foreground_insert=0;

SELECT 'distributed_foreground_insert=1';
SET distributed_foreground_insert=1;
