CREATE TYPE greeting AS ENUM('hi', 'bonjour', 'konnichiwa', 'howdy');
CREATE TABLE integral_values (
    j smallint,
    k integer,
    l bigint,
    i real,
    z double precision,
    m DECIMAL(4, 1),
    n DECIMAL(9, 2),
    o DECIMAL(18, 4),
    p DECIMAL(37, 2),
    q varchar,
    r bytea,
    s date,
    t time,
    u timestamp,
	v date[],
	w greeting
);;
CREATE SEQUENCE seq;
SELECT EXISTS (
	SELECT * FROM pg_catalog.pg_type t, pg_catalog.pg_namespace n
	WHERE t.typnamespace = n.oid
	AND t.typname = 'INTEGER'
	AND n.nspname = 'main'
	);
SELECT EXISTS (
	SELECT * FROM pg_catalog.pg_type t, pg_catalog.pg_namespace n
	WHERE t.typnamespace = n.oid
	AND t.typname = 'INTEGER'
	AND n.nspname = 'main'
	);
SELECT nspname FROM pg_namespace
WHERE nspname NOT LIKE 'pg_%'
ORDER BY nspname;
SELECT c.relname FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'main' AND c.relkind = 'f';
CREATE SCHEMA myschema;
CREATE VIEW myschema.v1 AS SELECT 42;;
SELECT a.attname
FROM
	pg_class t
	join pg_index ix on t.oid = ix.indrelid
	join pg_attribute a
		on t.oid=a.attrelid
	WHERE
	t.oid = (SELECT MIN(table_oid) FROM duckdb_tables) and ix.indisprimary = 't'
ORDER BY a.attnum;
SELECT a.attname
FROM pg_attribute a JOIN (
	SELECT unnest(ix.indkey) attnum,
			generate_subscripts(ix.indkey, 1) ord
	FROM pg_index ix
	WHERE ix.indrelid = (SELECT MIN(table_oid) FROM duckdb_tables) AND ix.indisprimary
	) k ON a.attnum=k.attnum
WHERE a.attrelid = (SELECT MIN(table_oid) FROM duckdb_tables)
ORDER BY k.ord;
SELECT r.conname,
	pg_catalog.pg_get_constraintdef(r.oid, true) as condef,
	n.nspname as conschema
FROM  pg_catalog.pg_constraint r,
	pg_namespace n,
	pg_class c
WHERE r.conrelid = (SELECT MIN(table_oid) FROM duckdb_tables) AND
	r.contype = 'f' AND
	c.oid = confrelid AND
	n.oid = c.relnamespace
ORDER BY 1;
SELECT
	cons.conname as name,
	cons.conkey as key,
	a.attnum as col_num,
	a.attname as col_name
FROM
	pg_catalog.pg_constraint cons
	join pg_attribute a
		on cons.conrelid = a.attrelid AND
		a.attnum = ANY(cons.conkey)
WHERE
	cons.conrelid = (SELECT MIN(table_oid) FROM duckdb_tables) AND
	cons.contype = 'u';
SELECT
	i.relname as relname,
	ix.indisunique, ix.indexprs, ix.indpred,
	a.attname, a.attnum, NULL, ix.indkey,
	am.amname,
	NULL as indnkeyatts
FROM
	pg_class t
		join pg_index ix on t.oid = ix.indrelid
		join pg_class i on i.oid = ix.indexrelid
		left outer join
			pg_attribute a
			on t.oid = a.attrelid
		left outer join
			pg_am am
			on i.relam = am.oid
WHERE
	t.relkind IN ('r', 'v', 'f', 'm')
	and t.oid = (SELECT MIN(table_oid) FROM duckdb_tables)
	and ix.indisprimary = 'f'
ORDER BY
	t.relname,
	i.relname;
SELECT
	i.relname as relname,
	ix.indisunique, ix.indexprs,
	a.attname, a.attnum, c.conrelid, ix.indkey::varchar,
	ix.indoption::varchar, i.reloptions, am.amname,
	pg_get_expr(ix.indpred, ix.indrelid)
FROM
	pg_class t
		join pg_index ix on t.oid = ix.indrelid
		join pg_class i on i.oid = ix.indexrelid
		left outer join
			pg_attribute a
			on t.oid = a.attrelid and a.attnum = ANY(ix.indkey)
		left outer join
			pg_constraint c
			on (ix.indrelid = c.conrelid and
				ix.indexrelid = c.conindid and
				c.contype in ('p', 'u', 'x'))
		left outer join
			pg_am am
			on i.relam = am.oid
WHERE
	t.relkind IN ('r', 'v', 'f', 'm', 'p')
	and t.oid = (SELECT MIN(table_oid) FROM duckdb_tables)
	and ix.indisprimary = 'f'
ORDER BY
	t.relname,
	i.relname;
SELECT
	pgd.description as table_comment
FROM
	pg_catalog.pg_description pgd
WHERE
	pgd.objsubid = 0 AND
	pgd.objoid = (SELECT MIN(table_oid) FROM duckdb_tables);
SELECT
	cons.conname as name,
	pg_get_constraintdef(cons.oid) as src
FROM
	pg_catalog.pg_constraint cons
WHERE
	cons.conrelid = (SELECT MIN(table_oid) FROM duckdb_tables) AND
	cons.contype = 'c';
SELECT t.typname as "name",
	pg_catalog.format_type(t.typbasetype, t.typtypmod) as "attype",
	not t.typnotnull as "nullable",
	t.typdefault as "default",
	pg_catalog.pg_type_is_visible(t.oid) as "visible",
	n.nspname as "schema"
FROM pg_catalog.pg_type t
	LEFT JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
WHERE t.typtype = 'd';
select distinct nspname from pg_namespace " "where lower(nspname)='main';
select relname from pg_class c join pg_namespace n on
n.oid=c.relnamespace where
pg_catalog.pg_table_is_visible(c.oid)
and relname='integral_values';
select relname from pg_class c join pg_namespace n on
n.oid=c.relnamespace where
pg_catalog.pg_table_is_visible(c.oid)
and relname='f';
select relname from pg_class c join pg_namespace n on
n.oid=c.relnamespace where n.nspname='main' and
relname='integral_values';
select relname from pg_class c join pg_namespace n on
n.oid=c.relnamespace where n.nspname='main' and
relname='f';
SELECT relname FROM pg_class c join pg_namespace n on
n.oid=c.relnamespace where relkind='S' and
n.nspname='main' and relname='seq';
SELECT relname FROM pg_class c join pg_namespace n on
n.oid=c.relnamespace where relkind='S' and
n.nspname='main' and relname='f';
SELECT COUNT(c.oid)
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE (pg_catalog.pg_table_is_visible(c.oid))
AND c.relname = 'integral_values' AND c.relkind in
('r', 'v', 'm', 'f', 'p');
SELECT c.relname FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'main' AND c.relkind in ('r', 'p');
SELECT c.relname FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'myschema' AND c.relkind IN ('v', 'm');
SELECT relname FROM pg_class c join pg_namespace n on
n.oid=c.relnamespace where relkind='S' and
n.nspname='main';
SELECT string_split_regex(pg_get_viewdef(c.oid), '\n')[1] view_def FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'myschema' AND c.relname = 'v1'
AND c.relkind IN ('v', 'm');
SELECT a.attname,
	pg_catalog.format_type(a.atttypid, a.atttypmod),
	(
	SELECT pg_catalog.pg_get_expr(d.adbin, d.adrelid)
	FROM pg_catalog.pg_attrdef d
	WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum
	AND a.atthasdef
	) AS DEFAULT,
	a.attnotnull
FROM pg_catalog.pg_attribute a
LEFT JOIN pg_catalog.pg_description pgd ON (
	pgd.objoid = a.attrelid AND pgd.objsubid = a.attnum)
WHERE a.attrelid = (SELECT MIN(oid) FROM pg_class WHERE relname='integral_values')
AND a.attnum > 0 AND NOT a.attisdropped
ORDER BY a.attnum;;
SELECT t.typname as "name",
	-- no enum defaults in 8.4 at least
	-- t.typdefault as "default",
	pg_catalog.pg_type_is_visible(t.oid) as "visible",
	n.nspname as "schema",
	e.enumlabel as "label"
FROM pg_catalog.pg_type t
		LEFT JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
		LEFT JOIN pg_catalog.pg_enum e ON t.oid = e.enumtypid
WHERE t.typtype = 'e'
ORDER BY e.enumsortorder;