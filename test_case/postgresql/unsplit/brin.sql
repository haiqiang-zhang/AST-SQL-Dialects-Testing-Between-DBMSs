CREATE TABLE brintest (byteacol bytea,
	charcol "char",
	namecol name,
	int8col bigint,
	int2col smallint,
	int4col integer,
	textcol text,
	oidcol oid,
	tidcol tid,
	float4col real,
	float8col double precision,
	macaddrcol macaddr,
	inetcol inet,
	cidrcol cidr,
	bpcharcol character,
	datecol date,
	timecol time without time zone,
	timestampcol timestamp without time zone,
	timestamptzcol timestamp with time zone,
	intervalcol interval,
	timetzcol time with time zone,
	bitcol bit(10),
	varbitcol bit varying(16),
	numericcol numeric,
	uuidcol uuid,
	int4rangecol int4range,
	lsncol pg_lsn,
	boxcol box
) WITH (fillfactor=10, autovacuum_enabled=off);
CREATE INDEX brinidx ON brintest USING brin (
	byteacol,
	charcol,
	namecol,
	int8col,
	int2col,
	int4col,
	textcol,
	oidcol,
	tidcol,
	float4col,
	float8col,
	macaddrcol,
	inetcol inet_inclusion_ops,
	inetcol inet_minmax_ops,
	cidrcol inet_inclusion_ops,
	cidrcol inet_minmax_ops,
	bpcharcol,
	datecol,
	timecol,
	timestampcol,
	timestamptzcol,
	intervalcol,
	timetzcol,
	bitcol,
	varbitcol,
	numericcol,
	uuidcol,
	int4rangecol,
	lsncol,
	boxcol
) with (pages_per_range = 1);
CREATE TABLE brinopers (colname name, typ text,
	op text[], value text[], matches int[],
	check (cardinality(op) = cardinality(value)),
	check (cardinality(op) = cardinality(matches)));
INSERT INTO brinopers VALUES
	('byteacol', 'bytea',
	 '{>, >=, =, <=, <}',
	 '{AAAAAA, AAAAAA, BNAAAABNAAAABNAAAABNAAAABNAAAABNAAAABNAAAABNAAAA, ZZZZZZ, ZZZZZZ}',
	 '{100, 100, 1, 100, 100}'),
	('charcol', '"char"',
	 '{>, >=, =, <=, <}',
	 '{A, A, M, Z, Z}',
	 '{97, 100, 6, 100, 98}'),
	('namecol', 'name',
	 '{>, >=, =, <=, <}',
	 '{AAAAAA, AAAAAA, MAAAAA, ZZAAAA, ZZAAAA}',
	 '{100, 100, 2, 100, 100}'),
	('int2col', 'int2',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 999, 999}',
	 '{100, 100, 1, 100, 100}'),
	('int2col', 'int4',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 999, 1999}',
	 '{100, 100, 1, 100, 100}'),
	('int2col', 'int8',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 999, 1428427143}',
	 '{100, 100, 1, 100, 100}'),
	('int4col', 'int2',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 1999, 1999}',
	 '{100, 100, 1, 100, 100}'),
	('int4col', 'int4',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 1999, 1999}',
	 '{100, 100, 1, 100, 100}'),
	('int4col', 'int8',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 800, 1999, 1428427143}',
	 '{100, 100, 1, 100, 100}'),
	('int8col', 'int2',
	 '{>, >=}',
	 '{0, 0}',
	 '{100, 100}'),
	('int8col', 'int4',
	 '{>, >=}',
	 '{0, 0}',
	 '{100, 100}'),
	('int8col', 'int8',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 1257141600, 1428427143, 1428427143}',
	 '{100, 100, 1, 100, 100}'),
	('textcol', 'text',
	 '{>, >=, =, <=, <}',
	 '{ABABAB, ABABAB, BNAAAABNAAAABNAAAABNAAAABNAAAABNAAAABNAAAABNAAAA, ZZAAAA, ZZAAAA}',
	 '{100, 100, 1, 100, 100}'),
	('oidcol', 'oid',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 8800, 9999, 9999}',
	 '{100, 100, 1, 100, 100}'),
	('tidcol', 'tid',
	 '{>, >=, =, <=, <}',
	 '{"(0,0)", "(0,0)", "(8800,0)", "(9999,19)", "(9999,19)"}',
	 '{100, 100, 1, 100, 100}'),
	('float4col', 'float4',
	 '{>, >=, =, <=, <}',
	 '{0.0103093, 0.0103093, 1, 1, 1}',
	 '{100, 100, 4, 100, 96}'),
	('float4col', 'float8',
	 '{>, >=, =, <=, <}',
	 '{0.0103093, 0.0103093, 1, 1, 1}',
	 '{100, 100, 4, 100, 96}'),
	('float8col', 'float4',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 0, 1.98, 1.98}',
	 '{99, 100, 1, 100, 100}'),
	('float8col', 'float8',
	 '{>, >=, =, <=, <}',
	 '{0, 0, 0, 1.98, 1.98}',
	 '{99, 100, 1, 100, 100}'),
	('macaddrcol', 'macaddr',
	 '{>, >=, =, <=, <}',
	 '{00:00:01:00:00:00, 00:00:01:00:00:00, 2c:00:2d:00:16:00, ff:fe:00:00:00:00, ff:fe:00:00:00:00}',
	 '{99, 100, 2, 100, 100}'),
	('inetcol', 'inet',
	 '{&&, =, <, <=, >, >=, >>=, >>, <<=, <<}',
	 '{10/8, 10.2.14.231/24, 255.255.255.255, 255.255.255.255, 0.0.0.0, 0.0.0.0, 10.2.14.231/24, 10.2.14.231/25, 10.2.14.231/8, 0/0}',
	 '{100, 1, 100, 100, 125, 125, 2, 2, 100, 100}'),
	('inetcol', 'inet',
	 '{&&, >>=, <<=, =}',
	 '{fe80::6e40:8ff:fea9:a673/32, fe80::6e40:8ff:fea9:8c46, fe80::6e40:8ff:fea9:a673/32, fe80::6e40:8ff:fea9:8c46}',
	 '{25, 1, 25, 1}'),
	('inetcol', 'cidr',
	 '{&&, <, <=, >, >=, >>=, >>, <<=, <<}',
	 '{10/8, 255.255.255.255, 255.255.255.255, 0.0.0.0, 0.0.0.0, 10.2.14/24, 10.2.14/25, 10/8, 0/0}',
	 '{100, 100, 100, 125, 125, 2, 2, 100, 100}'),
	('inetcol', 'cidr',
	 '{&&, >>=, <<=, =}',
	 '{fe80::/32, fe80::6e40:8ff:fea9:8c46, fe80::/32, fe80::6e40:8ff:fea9:8c46}',
	 '{25, 1, 25, 1}'),
	('cidrcol', 'inet',
	 '{&&, =, <, <=, >, >=, >>=, >>, <<=, <<}',
	 '{10/8, 10.2.14/24, 255.255.255.255, 255.255.255.255, 0.0.0.0, 0.0.0.0, 10.2.14.231/24, 10.2.14.231/25, 10.2.14.231/8, 0/0}',
	 '{100, 2, 100, 100, 125, 125, 2, 2, 100, 100}'),
	('cidrcol', 'inet',
	 '{&&, >>=, <<=, =}',
	 '{fe80::6e40:8ff:fea9:a673/32, fe80::6e40:8ff:fea9:8c46, fe80::6e40:8ff:fea9:a673/32, fe80::6e40:8ff:fea9:8c46}',
	 '{25, 1, 25, 1}'),
	('cidrcol', 'cidr',
	 '{&&, =, <, <=, >, >=, >>=, >>, <<=, <<}',
	 '{10/8, 10.2.14/24, 255.255.255.255, 255.255.255.255, 0.0.0.0, 0.0.0.0, 10.2.14/24, 10.2.14/25, 10/8, 0/0}',
	 '{100, 2, 100, 100, 125, 125, 2, 2, 100, 100}'),
	('cidrcol', 'cidr',
	 '{&&, >>=, <<=, =}',
	 '{fe80::/32, fe80::6e40:8ff:fea9:8c46, fe80::/32, fe80::6e40:8ff:fea9:8c46}',
	 '{25, 1, 25, 1}'),
	('bpcharcol', 'bpchar',
	 '{>, >=, =, <=, <}',
	 '{A, A, W, Z, Z}',
	 '{97, 100, 6, 100, 98}'),
	('datecol', 'date',
	 '{>, >=, =, <=, <}',
	 '{1995-08-15, 1995-08-15, 2009-12-01, 2022-12-30, 2022-12-30}',
	 '{100, 100, 1, 100, 100}'),
	('timecol', 'time',
	 '{>, >=, =, <=, <}',
	 '{01:20:30, 01:20:30, 02:28:57, 06:28:31.5, 06:28:31.5}',
	 '{100, 100, 1, 100, 100}'),
	('timestampcol', 'timestamp',
	 '{>, >=, =, <=, <}',
	 '{1942-07-23 03:05:09, 1942-07-23 03:05:09, 1964-03-24 19:26:45, 1984-01-20 22:42:21, 1984-01-20 22:42:21}',
	 '{100, 100, 1, 100, 100}'),
	('timestampcol', 'timestamptz',
	 '{>, >=, =, <=, <}',
	 '{1942-07-23 03:05:09, 1942-07-23 03:05:09, 1964-03-24 19:26:45, 1984-01-20 22:42:21, 1984-01-20 22:42:21}',
	 '{100, 100, 1, 100, 100}'),
	('timestamptzcol', 'timestamptz',
	 '{>, >=, =, <=, <}',
	 '{1972-10-10 03:00:00-04, 1972-10-10 03:00:00-04, 1972-10-19 09:00:00-07, 1972-11-20 19:00:00-03, 1972-11-20 19:00:00-03}',
	 '{100, 100, 1, 100, 100}'),
	('intervalcol', 'interval',
	 '{>, >=, =, <=, <}',
	 '{00:00:00, 00:00:00, 1 mons 13 days 12:24, 2 mons 23 days 07:48:00, 1 year}',
	 '{100, 100, 1, 100, 100}'),
	('timetzcol', 'timetz',
	 '{>, >=, =, <=, <}',
	 '{01:30:20+02, 01:30:20+02, 01:35:50+02, 23:55:05+02, 23:55:05+02}',
	 '{99, 100, 2, 100, 100}'),
	('bitcol', 'bit(10)',
	 '{>, >=, =, <=, <}',
	 '{0000000010, 0000000010, 0011011110, 1111111000, 1111111000}',
	 '{100, 100, 1, 100, 100}'),
	('varbitcol', 'varbit(16)',
	 '{>, >=, =, <=, <}',
	 '{0000000000000100, 0000000000000100, 0001010001100110, 1111111111111000, 1111111111111000}',
	 '{100, 100, 1, 100, 100}'),
	('numericcol', 'numeric',
	 '{>, >=, =, <=, <}',
	 '{0.00, 0.01, 2268164.347826086956521739130434782609, 99470151.9, 99470151.9}',
	 '{100, 100, 1, 100, 100}'),
	('uuidcol', 'uuid',
	 '{>, >=, =, <=, <}',
	 '{00040004-0004-0004-0004-000400040004, 00040004-0004-0004-0004-000400040004, 52225222-5222-5222-5222-522252225222, 99989998-9998-9998-9998-999899989998, 99989998-9998-9998-9998-999899989998}',
	 '{100, 100, 1, 100, 100}'),
	('int4rangecol', 'int4range',
	 '{<<, &<, &&, &>, >>, @>, <@, =, <, <=, >, >=}',
	 '{"[10000,)","[10000,)","(,]","[3,4)","[36,44)","(1500,1501]","[3,4)","[222,1222)","[36,44)","[43,1043)","[367,4466)","[519,)"}',
	 '{53, 53, 53, 53, 50, 22, 72, 1, 74, 75, 34, 21}'),
	('int4rangecol', 'int4range',
	 '{@>, <@, =, <=, >, >=}',
	 '{empty, empty, empty, empty, empty, empty}',
	 '{125, 72, 72, 72, 53, 125}'),
	('int4rangecol', 'int4',
	 '{@>}',
	 '{1500}',
	 '{22}'),
	('lsncol', 'pg_lsn',
	 '{>, >=, =, <=, <, IS, IS NOT}',
	 '{0/1200, 0/1200, 44/455222, 198/1999799, 198/1999799, NULL, NULL}',
	 '{100, 100, 1, 100, 100, 25, 100}'),
	('boxcol', 'point',
	 '{@>}',
	 '{"(500,43)"}',
	 '{11}'),
	('boxcol', 'box',
	 '{<<, &<, &&, &>, >>, <<|, &<|, |&>, |>>, @>, <@, ~=}',
	 '{"((1000,2000),(3000,4000))","((1,2),(3000,4000))","((1,2),(3000,4000))","((1,2),(3000,4000))","((1,2),(3,4))","((1000,2000),(3000,4000))","((1,2000),(3,4000))","((1000,2),(3000,4))","((1,2),(3,4))","((1,2),(300,400))","((1,2),(3000,4000))","((222,1222),(44,45))"}',
	 '{100, 100, 100, 99, 96, 100, 100, 99, 96, 1, 99, 1}');
SET enable_seqscan = 0;
SET enable_bitmapscan = 1;
SET enable_seqscan = 1;
SET enable_bitmapscan = 0;
SET enable_seqscan = 1;
SET enable_bitmapscan = 0;
SET enable_seqscan = 0;
SET enable_bitmapscan = 1;
END;
RESET enable_seqscan;
RESET enable_bitmapscan;
SELECT brin_desummarize_range('brinidx', 0);
VACUUM brintest;
UPDATE brintest SET int8col = int8col * int4col;
UPDATE brintest SET textcol = '' WHERE textcol IS NOT NULL;
SELECT brin_summarize_new_values('brinidx');
CREATE TABLE brin_summarize (
    value int
) WITH (fillfactor=10, autovacuum_enabled=false);
CREATE INDEX brin_summarize_idx ON brin_summarize USING brin (value) WITH (pages_per_range=2);
SELECT brin_summarize_range('brin_summarize_idx', 0);
CREATE TABLE brintest_2 (n numrange);
CREATE INDEX brinidx_2 ON brintest_2 USING brin (n);
INSERT INTO brintest_2 VALUES ('empty');
INSERT INTO brintest_2 VALUES (numrange(0, 2^1000::numeric));
INSERT INTO brintest_2 VALUES ('(-1, 0)');
DROP TABLE brintest_2;
CREATE TABLE brin_test (a INT, b INT);
INSERT INTO brin_test SELECT x/100,x%100 FROM generate_series(1,10000) x(x);
CREATE INDEX brin_test_a_idx ON brin_test USING brin (a) WITH (pages_per_range = 2);
CREATE INDEX brin_test_b_idx ON brin_test USING brin (b) WITH (pages_per_range = 2);
VACUUM ANALYZE brin_test;
EXPLAIN (COSTS OFF) SELECT * FROM brin_test WHERE a = 1;
EXPLAIN (COSTS OFF) SELECT * FROM brin_test WHERE b = 1;
CREATE TABLE brintest_3 (a text, b text, c text, d text);
CREATE INDEX brin_test_toast_idx ON brintest_3 USING brin (b, c);
DELETE FROM brintest_3;
CREATE INDEX CONCURRENTLY brin_test_temp_idx ON brintest_3(a);
DROP INDEX brin_test_temp_idx;
VACUUM brintest_3;
SET enable_seqscan = off;
EXPLAIN (COSTS OFF)
SELECT * FROM brintest_3 WHERE b < '0';
SELECT * FROM brintest_3 WHERE b < '0';
DROP TABLE brintest_3;
RESET enable_seqscan;
CREATE UNLOGGED TABLE brintest_unlogged (n numrange);
CREATE INDEX brinidx_unlogged ON brintest_unlogged USING brin (n);
INSERT INTO brintest_unlogged VALUES (numrange(0, 2^1000::numeric));
DROP TABLE brintest_unlogged;
CREATE TABLE brin_insert_optimization (a int);
INSERT INTO brin_insert_optimization VALUES (1);
CREATE INDEX ON brin_insert_optimization USING brin (a);
UPDATE brin_insert_optimization SET a = a;
DROP TABLE brin_insert_optimization;
