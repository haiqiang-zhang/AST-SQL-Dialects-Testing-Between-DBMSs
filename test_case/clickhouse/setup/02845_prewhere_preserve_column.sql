DROP TABLE IF EXISTS 02845_prewhere;
SET move_all_conditions_to_prewhere = 1;
CREATE TABLE  02845_prewhere  ( e String, c String, q String ) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO 02845_prewhere SELECT number, number, number from numbers(10);
