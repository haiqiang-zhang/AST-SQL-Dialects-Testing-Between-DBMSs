DROP TABLE IF EXISTS t_json_mutations;
SET allow_experimental_object_type = 1;
SET mutations_sync = 2;
CREATE TABLE t_json_mutations(id UInt32, s String, obj JSON) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_json_mutations VALUES (1, 'q', '{"k1": 1, "k2": 2, "k3": [{"k4": "aaa"}, {"k4": "bbb"}]}');
INSERT INTO t_json_mutations VALUES (2, 'w', '{"k1": 3, "k2": 4, "k3": [{"k4": "ccc"}]}');
INSERT INTO t_json_mutations VALUES (3, 'e', '{"k1": 5, "k2": 6}');