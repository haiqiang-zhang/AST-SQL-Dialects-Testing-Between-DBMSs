SET extra_float_digits = 0;
CREATE TABLE aggtest (
	a 			int2,
	b			float4
);
ANALYZE aggtest;
SELECT avg(a) AS avg_32 FROM aggtest WHERE a < 100;
SELECT any_value(v) FROM (VALUES (1), (2), (3)) AS v (v);
SELECT any_value(v) FROM (VALUES (NULL)) AS v (v);
SELECT any_value(v) FROM (VALUES (NULL), (1), (2)) AS v (v);
SELECT any_value(v) FROM (VALUES (array['hello', 'world'])) AS v (v);
SELECT avg(b)::numeric(10,3) AS avg_107_943 FROM aggtest;
SELECT sum(a) AS sum_198 FROM aggtest;
SELECT sum(b) AS avg_431_773 FROM aggtest;
SELECT max(a) AS max_100 FROM aggtest;
SELECT max(aggtest.b) AS max_324_78 FROM aggtest;
SELECT stddev_pop(b) FROM aggtest;
SELECT stddev_samp(b) FROM aggtest;
SELECT var_pop(b) FROM aggtest;
SELECT var_samp(b) FROM aggtest;
SELECT stddev_pop(b::numeric) FROM aggtest;
SELECT stddev_samp(b::numeric) FROM aggtest;
SELECT var_pop(b::numeric) FROM aggtest;
SELECT var_samp(b::numeric) FROM aggtest;
SELECT var_pop(1.0::float8), var_samp(2.0::float8);
SELECT stddev_pop(3.0::float8), stddev_samp(4.0::float8);
SELECT var_pop('inf'::float8), var_samp('inf'::float8);
SELECT stddev_pop('inf'::float8), stddev_samp('inf'::float8);
SELECT var_pop('nan'::float8), var_samp('nan'::float8);
SELECT stddev_pop('nan'::float8), stddev_samp('nan'::float8);
SELECT var_pop(1.0::float4), var_samp(2.0::float4);
SELECT stddev_pop(3.0::float4), stddev_samp(4.0::float4);
SELECT var_pop('inf'::float4), var_samp('inf'::float4);
SELECT stddev_pop('inf'::float4), stddev_samp('inf'::float4);
SELECT var_pop('nan'::float4), var_samp('nan'::float4);
SELECT stddev_pop('nan'::float4), stddev_samp('nan'::float4);
SELECT var_pop(1.0::numeric), var_samp(2.0::numeric);
SELECT stddev_pop(3.0::numeric), stddev_samp(4.0::numeric);
SELECT var_pop('inf'::numeric), var_samp('inf'::numeric);
SELECT stddev_pop('inf'::numeric), stddev_samp('inf'::numeric);
SELECT var_pop('nan'::numeric), var_samp('nan'::numeric);
SELECT stddev_pop('nan'::numeric), stddev_samp('nan'::numeric);
select sum(null::int4) from generate_series(1,3);
select sum(null::int8) from generate_series(1,3);
select sum(null::numeric) from generate_series(1,3);
select sum(null::float8) from generate_series(1,3);
select avg(null::int4) from generate_series(1,3);
select avg(null::int8) from generate_series(1,3);
select avg(null::numeric) from generate_series(1,3);
select avg(null::float8) from generate_series(1,3);
select sum('NaN'::numeric) from generate_series(1,3);
select avg('NaN'::numeric) from generate_series(1,3);
SELECT sum(x::float8), avg(x::float8), var_pop(x::float8)
FROM (VALUES ('1'), ('infinity')) v(x);
SELECT sum(x::float8), avg(x::float8), var_pop(x::float8)
FROM (VALUES ('infinity'), ('1')) v(x);
SELECT sum(x::float8), avg(x::float8), var_pop(x::float8)
FROM (VALUES ('infinity'), ('infinity')) v(x);
SELECT sum(x::float8), avg(x::float8), var_pop(x::float8)
FROM (VALUES ('-infinity'), ('infinity')) v(x);
SELECT sum(x::float8), avg(x::float8), var_pop(x::float8)
FROM (VALUES ('-infinity'), ('-infinity')) v(x);
SELECT sum(x::numeric), avg(x::numeric), var_pop(x::numeric)
FROM (VALUES ('1'), ('infinity')) v(x);
SELECT sum(x::numeric), avg(x::numeric), var_pop(x::numeric)
FROM (VALUES ('infinity'), ('1')) v(x);
SELECT sum(x::numeric), avg(x::numeric), var_pop(x::numeric)
FROM (VALUES ('infinity'), ('infinity')) v(x);
SELECT sum(x::numeric), avg(x::numeric), var_pop(x::numeric)
FROM (VALUES ('-infinity'), ('infinity')) v(x);
SELECT sum(x::numeric), avg(x::numeric), var_pop(x::numeric)
FROM (VALUES ('-infinity'), ('-infinity')) v(x);
SELECT avg(x::float8), var_pop(x::float8)
FROM (VALUES (100000003), (100000004), (100000006), (100000007)) v(x);
SELECT avg(x::float8), var_pop(x::float8)
FROM (VALUES (7000000000005), (7000000000007)) v(x);
SELECT regr_count(b, a) FROM aggtest;
SELECT regr_sxx(b, a) FROM aggtest;
SELECT regr_syy(b, a) FROM aggtest;
SELECT regr_sxy(b, a) FROM aggtest;
SELECT regr_avgx(b, a), regr_avgy(b, a) FROM aggtest;
SELECT regr_r2(b, a) FROM aggtest;
SELECT regr_slope(b, a), regr_intercept(b, a) FROM aggtest;
SELECT covar_pop(b, a), covar_samp(b, a) FROM aggtest;
SELECT corr(b, a) FROM aggtest;
SELECT covar_pop(1::float8,2::float8), covar_samp(3::float8,4::float8);
SELECT covar_pop(1::float8,'inf'::float8), covar_samp(3::float8,'inf'::float8);
SELECT covar_pop(1::float8,'nan'::float8), covar_samp(3::float8,'nan'::float8);
CREATE TABLE regr_test (x float8, y float8);
INSERT INTO regr_test VALUES (10,150),(20,250),(30,350),(80,540),(100,200);
SELECT count(*), sum(x), regr_sxx(y,x), sum(y),regr_syy(y,x), regr_sxy(y,x)
FROM regr_test WHERE x IN (10,20,30,80);
SELECT count(*), sum(x), regr_sxx(y,x), sum(y),regr_syy(y,x), regr_sxy(y,x)
FROM regr_test;
SELECT float8_accum('{4,140,2900}'::float8[], 100);
SELECT float8_regr_accum('{4,140,2900,1290,83075,15050}'::float8[], 200, 100);
SELECT count(*), sum(x), regr_sxx(y,x), sum(y),regr_syy(y,x), regr_sxy(y,x)
FROM regr_test WHERE x IN (10,20,30);
SELECT count(*), sum(x), regr_sxx(y,x), sum(y),regr_syy(y,x), regr_sxy(y,x)
FROM regr_test WHERE x IN (80,100);
SELECT float8_combine('{3,60,200}'::float8[], '{0,0,0}'::float8[]);
SELECT float8_combine('{0,0,0}'::float8[], '{2,180,200}'::float8[]);
SELECT float8_combine('{3,60,200}'::float8[], '{2,180,200}'::float8[]);
SELECT float8_regr_combine('{3,60,200,750,20000,2000}'::float8[],
                           '{0,0,0,0,0,0}'::float8[]);
SELECT float8_regr_combine('{0,0,0,0,0,0}'::float8[],
                           '{2,180,200,740,57800,-3400}'::float8[]);
SELECT float8_regr_combine('{3,60,200,750,20000,2000}'::float8[],
                           '{2,180,200,740,57800,-3400}'::float8[]);
DROP TABLE regr_test;
explain (verbose, costs off)
select s1, s2, sm
from generate_series(1, 3) s1,
     lateral (select s2, sum(s1 + s2) sm
              from generate_series(1, 3) s2 group by s2) ss
order by 1, 2;
select s1, s2, sm
from generate_series(1, 3) s1,
     lateral (select s2, sum(s1 + s2) sm
              from generate_series(1, 3) s2 group by s2) ss
order by 1, 2;
explain (verbose, costs off)
select array(select sum(x+y) s
            from generate_series(1,3) y group by y order by s)
  from generate_series(1,3) x;
select array(select sum(x+y) s
            from generate_series(1,3) y group by y order by s)
  from generate_series(1,3) x;
CREATE TEMPORARY TABLE bitwise_test(
  i2 INT2,
  i4 INT4,
  i8 INT8,
  i INTEGER,
  x INT2,
  y BIT(4)
);
SELECT
  BIT_AND(i2) AS "?",
  BIT_OR(i4)  AS "?",
  BIT_XOR(i8) AS "?"
FROM bitwise_test;
SELECT
  booland_statefunc(NULL, NULL)  IS NULL AS "t",
  booland_statefunc(TRUE, NULL)  IS NULL AS "t",
  booland_statefunc(FALSE, NULL) IS NULL AS "t",
  booland_statefunc(NULL, TRUE)  IS NULL AS "t",
  booland_statefunc(NULL, FALSE) IS NULL AS "t",
  booland_statefunc(TRUE, TRUE) AS "t",
  NOT booland_statefunc(TRUE, FALSE) AS "t",
  NOT booland_statefunc(FALSE, TRUE) AS "t",
  NOT booland_statefunc(FALSE, FALSE) AS "t";
SELECT
  boolor_statefunc(NULL, NULL)  IS NULL AS "t",
  boolor_statefunc(TRUE, NULL)  IS NULL AS "t",
  boolor_statefunc(FALSE, NULL) IS NULL AS "t",
  boolor_statefunc(NULL, TRUE)  IS NULL AS "t",
  boolor_statefunc(NULL, FALSE) IS NULL AS "t",
  boolor_statefunc(TRUE, TRUE) AS "t",
  boolor_statefunc(TRUE, FALSE) AS "t",
  boolor_statefunc(FALSE, TRUE) AS "t",
  NOT boolor_statefunc(FALSE, FALSE) AS "t";
CREATE TEMPORARY TABLE bool_test(
  b1 BOOL,
  b2 BOOL,
  b3 BOOL,
  b4 BOOL);
SELECT
  BOOL_AND(b1)   AS "n",
  BOOL_OR(b3)    AS "n"
FROM bool_test;
SELECT
  EVERY(b1)     AS "f",
  EVERY(b2)     AS "t",
  EVERY(b3)     AS "f",
  EVERY(b4)     AS "n",
  EVERY(NOT b2) AS "f",
  EVERY(NOT b3) AS "t"
FROM bool_test;
SELECT
  BOOL_OR(b1)      AS "t",
  BOOL_OR(b2)      AS "t",
  BOOL_OR(b3)      AS "f",
  BOOL_OR(b4)      AS "n",
  BOOL_OR(NOT b2)  AS "f",
  BOOL_OR(NOT b3)  AS "t"
FROM bool_test;
begin;
set local max_parallel_workers_per_gather = 0;
rollback;
create table minmaxtest(f1 int);
create table minmaxtest1() inherits (minmaxtest);
create table minmaxtest2() inherits (minmaxtest);
create table minmaxtest3() inherits (minmaxtest);
create index minmaxtesti on minmaxtest(f1);
create index minmaxtest1i on minmaxtest1(f1);
create index minmaxtest2i on minmaxtest2(f1 desc);
create index minmaxtest3i on minmaxtest3(f1) where f1 is not null;
insert into minmaxtest values(11), (12);
insert into minmaxtest1 values(13), (14);
insert into minmaxtest2 values(15), (16);
insert into minmaxtest3 values(17), (18);
explain (costs off)
  select min(f1), max(f1) from minmaxtest;
select min(f1), max(f1) from minmaxtest;
explain (costs off)
  select distinct min(f1), max(f1) from minmaxtest;
select distinct min(f1), max(f1) from minmaxtest;
drop table minmaxtest cascade;
create temp table t1 (a int, b int, c int, d int, primary key (a, b));
create temp table t2 (x int, y int, z int, primary key (x, y));
create temp table t3 (a int, b int, c int, primary key(a, b) deferrable);
explain (costs off) select * from t1 group by a,b,c,d;
explain (costs off) select a,c from t1 group by a,c,d;
explain (costs off) select *
from t1 inner join t2 on t1.a = t2.x and t1.b = t2.y
group by t1.a,t1.b,t1.c,t1.d,t2.x,t2.y,t2.z;
explain (costs off) select t1.*,t2.x,t2.z
from t1 inner join t2 on t1.a = t2.x and t1.b = t2.y
group by t1.a,t1.b,t1.c,t1.d,t2.x,t2.z;
explain (costs off) select * from t3 group by a,b,c;
create temp table t1c () inherits (t1);
explain (costs off) select * from t1 group by a,b,c,d;
explain (costs off) select * from only t1 group by a,b,c,d;
create temp table p_t1 (
  a int,
  b int,
  c int,
  d int,
  primary key(a,b)
) partition by list(a);
create temp table p_t1_1 partition of p_t1 for values in(1);
create temp table p_t1_2 partition of p_t1 for values in(2);
explain (costs off) select * from p_t1 group by a,b,c,d;
drop table t1 cascade;
drop table t2;
drop table t3;
drop table p_t1;
create temp table t1(f1 int, f2 int);
create temp table t2(f1 bigint, f2 oid);
select f1 from t1 left join t2 using (f1) group by f1;
select f1 from t1 left join t2 using (f1) group by t1.f1;
select t1.f1 from t1 left join t2 using (f1) group by t1.f1;
select f1, count(*) from
t1 x(x0,x1) left join (t1 left join t2 using(f1)) on (x0 = 0)
group by f1;
select f2, count(*) from
t1 x(x0,x1) left join (t1 left join t2 using(f2)) on (x0 = 0)
group by f2;
drop table t1, t2;
select array_agg(distinct val)
from (select null as val from generate_series(1, 2));
set enable_presorted_aggregate to off;
reset enable_presorted_aggregate;
select array_agg(a order by b)
  from (values (1,4),(2,3),(3,1),(4,2)) v(a,b);
select array_agg(a order by a)
  from (values (1,4),(2,3),(3,1),(4,2)) v(a,b);
select array_agg(a order by a desc)
  from (values (1,4),(2,3),(3,1),(4,2)) v(a,b);
select array_agg(b order by a desc)
  from (values (1,4),(2,3),(3,1),(4,2)) v(a,b);
select array_agg(distinct a)
  from (values (1),(2),(1),(3),(null),(2)) v(a);
select array_agg(distinct a order by a)
  from (values (1),(2),(1),(3),(null),(2)) v(a);
select array_agg(distinct a order by a desc)
  from (values (1),(2),(1),(3),(null),(2)) v(a);
select array_agg(distinct a order by a desc nulls last)
  from (values (1),(2),(1),(3),(null),(2)) v(a);
select
    string_agg(distinct 'a', ','),
    sum((
        select sum(1)
        from (values(1)) b(id)
        where a.id = b.id
)) from unnest(array[1]) a(id);
select string_agg(a,',') from (values('aaaa'),('bbbb'),('cccc')) g(a);
select string_agg(a,',') from (values('aaaa'),(null),('bbbb'),('cccc')) g(a);
select string_agg(a,'AB') from (values(null),(null),('bbbb'),('cccc')) g(a);
select string_agg(a,',') from (values(null),(null)) g(a);
create table bytea_test_table(v bytea);
select string_agg(v, '') from bytea_test_table;
insert into bytea_test_table values(decode('ff','hex'));
select string_agg(v, '') from bytea_test_table;
insert into bytea_test_table values(decode('aa','hex'));
select string_agg(v, '') from bytea_test_table;
select string_agg(v, NULL) from bytea_test_table;
select string_agg(v, decode('ee', 'hex')) from bytea_test_table;
drop table bytea_test_table;
create table pagg_test (x int, y int);
insert into pagg_test
select (case x % 4 when 1 then null else x end), x % 10
from generate_series(1,5000) x;
set parallel_setup_cost TO 0;
set parallel_tuple_cost TO 0;
set parallel_leader_participation TO 0;
set min_parallel_table_scan_size = 0;
set bytea_output = 'escape';
set max_parallel_workers_per_gather = 2;
create view v_pagg_test AS
select
	y,
	min(t) AS tmin,max(t) AS tmax,count(distinct t) AS tndistinct,
	min(b) AS bmin,max(b) AS bmax,count(distinct b) AS bndistinct,
	min(a) AS amin,max(a) AS amax,count(distinct a) AS andistinct,
	min(aa) AS aamin,max(aa) AS aamax,count(distinct aa) AS aandistinct
from (
	select
		y,
		unnest(regexp_split_to_array(a1.t, ','))::int AS t,
		unnest(regexp_split_to_array(a1.b::text, ',')) AS b,
		unnest(a1.a) AS a,
		unnest(a1.aa) AS aa
	from (
		select
			y,
			string_agg(x::text, ',') AS t,
			string_agg(x::text::bytea, ',') AS b,
			array_agg(x) AS a,
			array_agg(ARRAY[x]) AS aa
		from pagg_test
		group by y
	) a1
) a2
group by y;
select * from v_pagg_test order by y;
explain (costs off) select * from v_pagg_test order by y;
set max_parallel_workers_per_gather = 0;
select * from v_pagg_test order by y;
reset max_parallel_workers_per_gather;
reset bytea_output;
reset min_parallel_table_scan_size;
reset parallel_leader_participation;
reset parallel_tuple_cost;
reset parallel_setup_cost;
drop view v_pagg_test;
drop table pagg_test;
select max(foo COLLATE "C") filter (where (bar collate "POSIX") > '0')
from (values ('a', 'b')) AS v(foo,bar);
select any_value(v) filter (where v > 2) from (values (1), (2), (3)) as v (v);
select (select count(*)
        from (values (1)) t0(inner_c))
from (values (2),(3)) t1(outer_c);
select (select count(*) filter (where outer_c <> 0)
        from (values (1)) t0(inner_c))
from (values (2),(3)) t1(outer_c);
select (select count(inner_c) filter (where outer_c <> 0)
        from (values (1)) t0(inner_c))
from (values (2),(3)) t1(outer_c);
select max(0) filter (where b1) from bool_test;
select (select max(0) filter (where b1)) from bool_test;
select p, percentile_cont(p) within group (order by x::float8)
from generate_series(1,5) x,
     (values (0::float8),(0.1),(0.25),(0.4),(0.5),(0.6),(0.75),(0.9),(1)) v(p)
group by p order by p;
select percentile_cont(0.5) within group (order by b) from aggtest;
select percentile_cont(0.5) within group (order by b), sum(b) from aggtest;
select rank(3) within group (order by x)
from (values (1),(1),(2),(2),(3),(3),(4)) v(x);
select cume_dist(3) within group (order by x)
from (values (1),(1),(2),(2),(3),(3),(4)) v(x);
select percent_rank(3) within group (order by x)
from (values (1),(1),(2),(2),(3),(3),(4),(5)) v(x);
select dense_rank(3) within group (order by x)
from (values (1),(1),(2),(2),(3),(3),(4)) v(x);
select percentile_cont(array[0,1,0.25,0.75,0.5,1,0.3,0.32,0.35,0.38,0.4]) within group (order by x)
from generate_series(1,6) x;
select percentile_disc(array[0.25,0.5,0.75]) within group (order by x)
from unnest('{fred,jim,fred,jack,jill,fred,jill,jim,jim,sheila,jim,sheila}'::text[]) u(x);
select pg_collation_for(percentile_disc(1) within group (order by x collate "POSIX"))
  from (values ('fred'),('jim')) v(x);
select rank('adam'::varchar) within group (order by x) from (values ('fred'),('jim')) v(x);
select rank('3') within group (order by x) from generate_series(1,5) x;
select percent_rank(0) within group (order by x) from generate_series(1,0) x;
begin work;
create type avg_state as (total bigint, count bigint);
rollback;
begin work;
rollback;
BEGIN;
ROLLBACK;
CREATE TABLE btg AS SELECT
  i % 10 AS x,
  i % 10 AS y,
  'abc' || i % 10 AS z,
  i AS w
FROM generate_series(1, 100) AS i;
CREATE INDEX btg_x_y_idx ON btg(x, y);
ANALYZE btg;
SET enable_hashagg = off;
SET enable_seqscan = off;
EXPLAIN (COSTS OFF)
SELECT count(*) FROM btg GROUP BY y, x;
EXPLAIN (COSTS OFF)
SELECT count(*) FROM btg GROUP BY z, y, w, x;
EXPLAIN (COSTS OFF) SELECT count(*)
FROM (SELECT * FROM btg ORDER BY x, y, w, z) AS q1
GROUP BY w, x, z, y;
SET enable_hashjoin = off;
SET enable_nestloop = off;
EXPLAIN (COSTS OFF)
SELECT count(*)
  FROM btg t1 JOIN btg t2 ON t1.z = t2.z AND t1.w = t2.w AND t1.x = t2.x
  GROUP BY t1.x, t1.y, t1.z, t1.w;
RESET enable_nestloop;
RESET enable_hashjoin;
EXPLAIN (COSTS OFF)
SELECT count(*) FROM btg GROUP BY w, x, z, y ORDER BY y, x, z, w;
EXPLAIN (COSTS OFF)
SELECT count(*) FROM btg GROUP BY w, x, y, z ORDER BY x*x, z;
CREATE INDEX btg_y_x_w_idx ON btg(y, x, w);
EXPLAIN (VERBOSE, COSTS OFF)
SELECT y, x, array_agg(distinct w)
  FROM btg WHERE y < 0 GROUP BY x, y;
CREATE TABLE group_agg_pk AS SELECT
  i % 10 AS x,
  i % 2 AS y,
  i % 2 AS z,
  2 AS w,
  i % 10 AS f
FROM generate_series(1,100) AS i;
ANALYZE group_agg_pk;
SET enable_nestloop = off;
SET enable_hashjoin = off;
EXPLAIN (COSTS OFF)
SELECT avg(c1.f ORDER BY c1.x, c1.y)
FROM group_agg_pk c1 JOIN group_agg_pk c2 ON c1.x = c2.x
GROUP BY c1.w, c1.z;
SELECT avg(c1.f ORDER BY c1.x, c1.y)
FROM group_agg_pk c1 JOIN group_agg_pk c2 ON c1.x = c2.x
GROUP BY c1.w, c1.z;
RESET enable_nestloop;
RESET enable_hashjoin;
DROP TABLE group_agg_pk;
CREATE TABLE agg_sort_order (c1 int PRIMARY KEY, c2 int);
CREATE UNIQUE INDEX agg_sort_order_c2_idx ON agg_sort_order(c2);
INSERT INTO agg_sort_order SELECT i, i FROM generate_series(1,100)i;
ANALYZE agg_sort_order;
EXPLAIN (COSTS OFF)
SELECT array_agg(c1 ORDER BY c2),c2
FROM agg_sort_order WHERE c2 < 100 GROUP BY c1 ORDER BY 2;
DROP TABLE agg_sort_order CASCADE;
DROP TABLE btg;
RESET enable_hashagg;
RESET enable_seqscan;
BEGIN;
CREATE FUNCTION balkifnull(int8, int8)
RETURNS int8
PARALLEL SAFE
STRICT
LANGUAGE plpgsql AS $$
BEGIN
    IF $1 IS NULL THEN
       RAISE 'erroneously called with NULL argument';
    END IF;
    RETURN NULL;
END$$;
CREATE AGGREGATE balk(int4)
(
    SFUNC = int4_sum(int8, int4),
    STYPE = int8,
    COMBINEFUNC = balkifnull(int8, int8),
    PARALLEL = SAFE,
    INITCOND = '0'
);
ROLLBACK;
BEGIN;
CREATE FUNCTION rwagg_sfunc(x anyarray, y anyarray) RETURNS anyarray
LANGUAGE plpgsql IMMUTABLE AS $$
BEGIN
    RETURN array_fill(y[1], ARRAY[4]);
END;
$$;
CREATE FUNCTION rwagg_finalfunc(x anyarray) RETURNS anyarray
LANGUAGE plpgsql STRICT IMMUTABLE AS $$
DECLARE
    res x%TYPE;
BEGIN
    res := array_fill(x[1], ARRAY[4]);
    RETURN res;
END;
$$;
CREATE AGGREGATE rwagg(anyarray) (
    STYPE = anyarray,
    SFUNC = rwagg_sfunc,
    FINALFUNC = rwagg_finalfunc
);
CREATE FUNCTION eatarray(x real[]) RETURNS real[]
LANGUAGE plpgsql STRICT IMMUTABLE AS $$
BEGIN
    x[1] := x[1] + 1;
    RETURN x;
END;
$$;
SELECT eatarray(rwagg(ARRAY[1.0::real])), eatarray(rwagg(ARRAY[1.0::real]));
ROLLBACK;
BEGIN;
SET parallel_setup_cost = 0;
SET parallel_tuple_cost = 0;
SET min_parallel_table_scan_size = 0;
SET max_parallel_workers_per_gather = 4;
SET parallel_leader_participation = off;
SET enable_indexonlyscan = off;
ROLLBACK;
SELECT dense_rank(x) WITHIN GROUP (ORDER BY x) FROM (VALUES (1),(1),(2),(2),(3),(3)) v(x) GROUP BY (x) ORDER BY 1;
SELECT min(x ORDER BY y) FROM (VALUES(1, NULL)) AS d(x,y);
SELECT min(x ORDER BY y) FROM (VALUES(1, 2)) AS d(x,y);
select v||'a', case v||'a' when 'aa' then 1 else 0 end, count(*)
  from unnest(array['a','b']) u(v)
 group by v||'a' order by 1;
select v||'a', case when v||'a' = 'aa' then 1 else 0 end, count(*)
  from unnest(array['a','b']) u(v)
 group by v||'a' order by 1;
set enable_memoize to off;
reset enable_memoize;
set enable_sort=false;
set work_mem='64kB';
set work_mem to default;
set enable_sort to default;
set work_mem='64kB';
create table agg_data_2k as
select g from generate_series(0, 1999) g;
analyze agg_data_2k;
create table agg_data_20k as
select g from generate_series(0, 19999) g;
analyze agg_data_20k;
set enable_hashagg = false;
set jit_above_cost = 0;
explain (costs off)
select g%10000 as c1, sum(g::numeric) as c2, count(*) as c3
  from agg_data_20k group by g%10000;
create table agg_group_1 as
select g%10000 as c1, sum(g::numeric) as c2, count(*) as c3
  from agg_data_20k group by g%10000;
create table agg_group_2 as
select * from
  (values (100), (300), (500)) as r(a),
  lateral (
    select (g/2)::numeric as c1,
           array_agg(g::numeric) as c2,
	   count(*) as c3
    from agg_data_2k
    where g < r.a
    group by g/2) as s;
set jit_above_cost to default;
create table agg_group_3 as
select (g/2)::numeric as c1, sum(7::int4) as c2, count(*) as c3
  from agg_data_2k group by g/2;
create table agg_group_4 as
select (g/2)::numeric as c1, array_agg(g::numeric) as c2, count(*) as c3
  from agg_data_2k group by g/2;
set enable_hashagg = true;
set enable_sort = false;
set jit_above_cost = 0;
explain (costs off)
select g%10000 as c1, sum(g::numeric) as c2, count(*) as c3
  from agg_data_20k group by g%10000;
create table agg_hash_1 as
select g%10000 as c1, sum(g::numeric) as c2, count(*) as c3
  from agg_data_20k group by g%10000;
create table agg_hash_2 as
select * from
  (values (100), (300), (500)) as r(a),
  lateral (
    select (g/2)::numeric as c1,
           array_agg(g::numeric) as c2,
	   count(*) as c3
    from agg_data_2k
    where g < r.a
    group by g/2) as s;
set jit_above_cost to default;
create table agg_hash_3 as
select (g/2)::numeric as c1, sum(7::int4) as c2, count(*) as c3
  from agg_data_2k group by g/2;
create table agg_hash_4 as
select (g/2)::numeric as c1, array_agg(g::numeric) as c2, count(*) as c3
  from agg_data_2k group by g/2;
set enable_sort = true;
set work_mem to default;
(select * from agg_hash_1 except select * from agg_group_1)
  union all
(select * from agg_group_1 except select * from agg_hash_1);
(select * from agg_hash_2 except select * from agg_group_2)
  union all
(select * from agg_group_2 except select * from agg_hash_2);
(select * from agg_hash_3 except select * from agg_group_3)
  union all
(select * from agg_group_3 except select * from agg_hash_3);
(select * from agg_hash_4 except select * from agg_group_4)
  union all
(select * from agg_group_4 except select * from agg_hash_4);
drop table agg_group_1;
drop table agg_group_2;
drop table agg_group_3;
drop table agg_group_4;
drop table agg_hash_1;
drop table agg_hash_2;
drop table agg_hash_3;
drop table agg_hash_4;
