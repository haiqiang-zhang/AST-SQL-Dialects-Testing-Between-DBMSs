SET allow_experimental_variant_type = 1;
CREATE TABLE test (v Variant(UInt64, String, Array(UInt64))) ENGINE = Memory;
INSERT INTO test VALUES (NULL), (42), ('Hello, World!'), ([1, 2, 3]);
SELECT variantType(v) as type FROM test;
SELECT toTypeName(variantType(v)) from test limit 1;