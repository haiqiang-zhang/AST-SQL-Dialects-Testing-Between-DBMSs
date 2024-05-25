DROP TABLE IF EXISTS codecTest;
SET cross_to_inner_join_rewrite = 1;
CREATE TABLE codecTest (
    key      UInt64,
    name     String,
    ref_valueF64 Float64,
    ref_valueF32 Float32,
    valueF64 Float64  CODEC(Gorilla),
    valueF32 Float32  CODEC(Gorilla)
) Engine = MergeTree ORDER BY key;
INSERT INTO codecTest (key, name, ref_valueF64, valueF64, ref_valueF32, valueF32)
	SELECT number AS n, 'e()', e() AS v, v, v, v FROM system.numbers LIMIT 1, 100;
INSERT INTO codecTest (key, name, ref_valueF64, valueF64, ref_valueF32, valueF32)
	SELECT number AS n, 'log2(n)', log2(n) AS v, v, v, v FROM system.numbers LIMIT 101, 100;
INSERT INTO codecTest (key, name, ref_valueF64, valueF64, ref_valueF32, valueF32)
	SELECT number AS n, 'n*sqrt(n)', n*sqrt(n) AS v, v, v, v FROM system.numbers LIMIT 201, 100;
INSERT INTO codecTest (key, name, ref_valueF64, valueF64, ref_valueF32, valueF32)
	SELECT number AS n, 'sin(n*n*n)*n', sin(n * n * n * n* n) AS v, v, v, v FROM system.numbers LIMIT 301, 100;
SELECT 'F64';
SELECT
	c1.key, c1.name,
	c1.ref_valueF64, c1.valueF64, c1.ref_valueF64 - c1.valueF64 AS dF64,
	'prev:',
	c2.key, c2.ref_valueF64
FROM
	codecTest as c1, codecTest as c2
WHERE
	dF64 != 0
AND
	c2.key = c1.key - 1
LIMIT 10;
SELECT 'F32';
SELECT
	c1.key, c1.name,
	c1.ref_valueF32, c1.valueF32, c1.ref_valueF32 - c1.valueF32 AS dF32,
	'prev:',
	c2.key, c2.ref_valueF32
FROM
	codecTest as c1, codecTest as c2
WHERE
	dF32 != 0
AND
	c2.key = c1.key - 1
LIMIT 10;
DROP TABLE IF EXISTS codecTest;
