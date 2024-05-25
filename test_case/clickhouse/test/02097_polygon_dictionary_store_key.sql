DROP DICTIONARY IF EXISTS polygons_test_dictionary_no_option;
CREATE DICTIONARY polygons_test_dictionary_no_option
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE 'polygons_test_table'))
LAYOUT(POLYGON())
LIFETIME(0);
DROP DICTIONARY IF EXISTS polygons_test_dictionary;
CREATE DICTIONARY polygons_test_dictionary
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE 'polygons_test_table'))
LAYOUT(POLYGON(STORE_POLYGON_KEY_COLUMN 1))
LIFETIME(0);
SELECT * FROM polygons_test_dictionary;
DROP DICTIONARY polygons_test_dictionary_no_option;
DROP DICTIONARY polygons_test_dictionary;
DROP TABLE polygons_test_table;
