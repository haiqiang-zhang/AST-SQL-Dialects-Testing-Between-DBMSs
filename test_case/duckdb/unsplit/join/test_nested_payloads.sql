SET default_null_order='nulls_first';
PRAGMA enable_verification;
PRAGMA verify_external;
CREATE TABLE integers(fk INTEGER);
INSERT INTO integers VALUES (1), (2), (3), (5), (NULL);
CREATE VIEW intlists AS SELECT * FROM (VALUES
	(1, [1]),
	(2, [NULL]),
	(3, []),
	(4, [2, 3]),
	(5, [9,10,11]),
	(NULL::INTEGER, [13])
	) lv(pk, p);
CREATE VIEW strlists AS SELECT * FROM (VALUES
	(1, ['a']),
	(2, [NULL]),
	(3, []),
	(4, ['Branta Canadensis', 'c']),
	(5, ['i','j','k']),
	(NULL::INTEGER, ['Somateria mollissima'])
	) lv(pk, p);
CREATE VIEW structs AS SELECT * FROM (VALUES
	(1, {'x': 1, 'y': 'a'}),
	(2, {'x': NULL, 'y': NULL}),
	(3, {'x': 0, 'y': ''}),
	(4, {'x': 2, 'y': 'c'}),
	(5, {'x': 9, 'y': 'i'}),
	(NULL::INTEGER, {'x': 13, 'y': 'Somateria mollissima'})
	) sv(pk, p);
CREATE VIEW struct_lint_lstr AS SELECT * FROM (VALUES
	(1, {'x': [1], 'y': ['a']}),
	(2, {'x': [NULL], 'y': [NULL]}),
	(3, {'x': [], 'y': []}),
	(4, {'x': [2, 3], 'y': ['Branta Canadensis', 'c']}),
	(5, {'x': [9,10,11], 'y': ['i','j','k']}),
	(NULL::INTEGER, {'x': [13], 'y': ['Somateria mollissima']})
	) lv(pk, p);
CREATE VIEW r2l3r4l5i4i2l3v AS SELECT * FROM (VALUES
	(1, {'x': [{'l4': [51], 'i4': 41}], 'y': ['a']}),
	(2, {'x': [NULL], 'y': [NULL]}),
	(3, {'x': [], 'y': []}),
	(4, {'x': [{'l4': [52, 53], 'i4': 42}, {'l4': [54, 55], 'i4': 43}], 'y': ['Branta Canadensis', 'c']}),
	(5, {'x': [{'l4': [56], 'i4': 44}, {'l4': [57, 58], 'i4': 45}, {'l4': [59, 60, 61], 'i4': 46}], 'y': ['i','j','k']}),
	(NULL::INTEGER, {'x': [{'l4': [62], 'i4': 47}], 'y': ['Somateria mollissima']})
	) lv(pk, p);
CREATE VIEW longlists AS
SELECT *
FROM ((VALUES
	(1, [1]),
	(2, [NULL]),
	(3, []),
	(4, [2, 3]),
	(NULL::INTEGER, [13])
	)
UNION ALL
	select 5 as pk, list(i) as p from range(2000) tbl(i)
) lv(pk, p);
CREATE TABLE all_types("varchar" VARCHAR, nested_int_array INTEGER[][]);
INSERT INTO all_types VALUES('b',[[], NULL, [], [NULL]]);
CREATE TABLE nested(nested_int_array INTEGER[][]);
INSERT INTO nested VALUES([[42, 999]]);
SELECT (
	SELECT ref_1.nested_int_array
) AS c0
FROM range(3), nested AS ref_1;
SELECT DISTINCT * FROM intlists ORDER BY ALL;
SELECT pk, p FROM intlists ORDER BY pk;
SELECT fk, pk, p FROM integers, intlists WHERE fk = pk ORDER BY ALL;
SELECT fk, pk, p FROM integers LEFT OUTER JOIN intlists ON integers.fk=intlists.pk ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN intlists ON integers.fk=intlists.pk
WHERE pk < 5 AND fk > 1
ORDER BY ALL;
SELECT fk, pk, p FROM intlists RIGHT OUTER JOIN integers ON integers.fk=intlists.pk ORDER BY ALL;
SELECT fk, pk, p FROM integers FULL OUTER JOIN intlists ON integers.fk=intlists.pk ORDER BY ALL;
SELECT DISTINCT * FROM strlists ORDER BY ALL;
SELECT fk, pk, p FROM integers, strlists WHERE fk = pk ORDER BY fk;
SELECT fk, pk, p FROM integers LEFT OUTER JOIN strlists ON integers.fk=strlists.pk ORDER BY fk;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN strlists ON integers.fk=strlists.pk
WHERE pk < 5 AND fk > 1
ORDER BY fk;
SELECT fk, pk, p FROM strlists RIGHT OUTER JOIN integers ON integers.fk=strlists.pk ORDER BY fk;
SELECT fk, pk, p FROM integers FULL OUTER JOIN strlists ON integers.fk=strlists.pk ORDER BY ALL;
SELECT DISTINCT * FROM structs ORDER BY ALL;
SELECT pk, p FROM structs ORDER BY pk;
SELECT fk, pk, p FROM integers, structs WHERE fk = pk ORDER BY ALL;
SELECT fk, pk, p FROM integers LEFT OUTER JOIN structs ON integers.fk=structs.pk ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN structs ON integers.fk=structs.pk
WHERE pk < 5 AND fk > 1
ORDER BY ALL;
SELECT fk, pk, p FROM structs RIGHT OUTER JOIN integers ON integers.fk=structs.pk ORDER BY ALL;
SELECT fk, pk, p FROM integers FULL OUTER JOIN structs ON integers.fk=structs.pk ORDER BY ALL;
SELECT DISTINCT * FROM struct_lint_lstr ORDER BY ALL;
SELECT fk, pk, p FROM integers, struct_lint_lstr WHERE fk = pk ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN struct_lint_lstr ON integers.fk=struct_lint_lstr.pk
ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN struct_lint_lstr ON integers.fk=struct_lint_lstr.pk
WHERE pk < 5 AND fk > 1
ORDER BY ALL;
SELECT fk, pk, p
FROM struct_lint_lstr RIGHT OUTER JOIN integers ON integers.fk=struct_lint_lstr.pk
ORDER BY ALL;
SELECT fk, pk, p
FROM integers FULL OUTER JOIN struct_lint_lstr ON integers.fk=struct_lint_lstr.pk
ORDER BY ALL;
SELECT DISTINCT * FROM r2l3r4l5i4i2l3v ORDER BY ALL;
SELECT fk, pk, p FROM integers, r2l3r4l5i4i2l3v WHERE fk = pk ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN r2l3r4l5i4i2l3v ON integers.fk=r2l3r4l5i4i2l3v.pk
ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN r2l3r4l5i4i2l3v ON integers.fk=r2l3r4l5i4i2l3v.pk
WHERE pk < 5 AND fk > 1
ORDER BY ALL;
SELECT fk, pk, p
FROM r2l3r4l5i4i2l3v RIGHT OUTER JOIN integers ON integers.fk=r2l3r4l5i4i2l3v.pk
ORDER BY ALL;
SELECT fk, pk, p
FROM integers FULL OUTER JOIN r2l3r4l5i4i2l3v ON integers.fk=r2l3r4l5i4i2l3v.pk
ORDER BY ALL;
SELECT DISTINCT * FROM longlists ORDER BY ALL;
SELECT pk, p FROM longlists ORDER BY pk;
SELECT fk, pk, p FROM integers, longlists WHERE fk = pk ORDER BY ALL;
SELECT fk, pk, p FROM integers LEFT OUTER JOIN longlists ON integers.fk=longlists.pk ORDER BY ALL;
SELECT fk, pk, p
FROM integers LEFT OUTER JOIN longlists ON integers.fk=longlists.pk
WHERE pk < 5 AND fk > 1
ORDER BY ALL;
SELECT fk, pk, p FROM longlists RIGHT OUTER JOIN integers ON integers.fk=longlists.pk ORDER BY ALL;
SELECT fk, pk, p FROM integers FULL OUTER JOIN longlists ON integers.fk=longlists.pk ORDER BY ALL;
SELECT ref_1.nested_int_array AS c0
FROM all_types AS ref_1
INNER JOIN (SELECT NULL AS c8 FROM range(3)) AS subq_1 ON (ref_1."varchar" = ref_1."varchar")
INNER JOIN range(3) AS ref_4(time_tz) ON (subq_1.c8 = ref_4.time_tz);