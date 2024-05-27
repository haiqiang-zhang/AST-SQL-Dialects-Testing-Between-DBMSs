DROP TABLE IF EXISTS src_01019;
DROP TABLE IF EXISTS dest_01019;
DROP TABLE IF EXISTS pipe_01019;
CREATE TABLE src_01019(v UInt64) ENGINE = Null;
CREATE TABLE dest_01019(v UInt64) Engine = MergeTree() ORDER BY v;
CREATE MATERIALIZED VIEW pipe_01019 TO dest_01019 AS
SELECT v FROM src_01019;
INSERT INTO src_01019 VALUES (1), (2), (3);
SET allow_experimental_alter_materialized_view_structure = 1;
ALTER TABLE pipe_01019
    MODIFY QUERY
    SELECT
        v * 2 as v,
        1 as v2
    FROM src_01019;
INSERT INTO src_01019 VALUES (1), (2), (3);