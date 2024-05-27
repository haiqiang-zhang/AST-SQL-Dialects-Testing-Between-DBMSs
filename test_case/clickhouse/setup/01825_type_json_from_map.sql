DROP TABLE IF EXISTS t_json;
DROP TABLE IF EXISTS t_map;
SET allow_experimental_object_type = 1;
CREATE TABLE t_json(id UInt64, obj JSON) ENGINE = MergeTree ORDER BY id;
CREATE TABLE t_map(id UInt64, m Map(String, UInt64)) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_map
SELECT
    number,
    (
        arrayMap(x -> 'col' || toString(x), range(number % 10)),
        range(number % 10)
    )::Map(String, UInt64)
FROM numbers(1000000);
INSERT INTO t_json SELECT id, m FROM t_map;