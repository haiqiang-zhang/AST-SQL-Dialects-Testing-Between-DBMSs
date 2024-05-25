select pg_input_is_valid('(1,4)', 'int4range');
select pg_input_is_valid('(1,4', 'int4range');
select * from pg_input_error_info('(1,4', 'int4range');
select pg_input_is_valid('(4,1)', 'int4range');
select * from pg_input_error_info('(4,1)', 'int4range');
select pg_input_is_valid('(4,zed)', 'int4range');
select * from pg_input_error_info('(4,zed)', 'int4range');
select pg_input_is_valid('[1,2147483647]', 'int4range');
select * from pg_input_error_info('[1,2147483647]', 'int4range');
select pg_input_is_valid('[2000-01-01,5874897-12-31]', 'daterange');
select * from pg_input_error_info('[2000-01-01,5874897-12-31]', 'daterange');
CREATE TABLE numrange_test (nr NUMRANGE);
create index numrange_test_btree on numrange_test(nr);
INSERT INTO numrange_test VALUES('[,)');
INSERT INTO numrange_test VALUES('[3,]');
INSERT INTO numrange_test VALUES('[, 5)');
INSERT INTO numrange_test VALUES(numrange(1.1, 2.2));
INSERT INTO numrange_test VALUES('empty');
INSERT INTO numrange_test VALUES(numrange(1.7, 1.7, '[]'));
SELECT nr, isempty(nr), lower(nr), upper(nr) FROM numrange_test;
SELECT nr, lower_inc(nr), lower_inf(nr), upper_inc(nr), upper_inf(nr) FROM numrange_test;
SELECT * FROM numrange_test WHERE range_contains(nr, numrange(1.9,1.91));
SELECT * FROM numrange_test WHERE nr @> numrange(1.0,10000.1);
SELECT * FROM numrange_test WHERE range_contained_by(numrange(-1e7,-10000.1), nr);
SELECT * FROM numrange_test WHERE 1.9 <@ nr;
select * from numrange_test where nr = 'empty';
select * from numrange_test where nr = '(1.1, 2.2)';
select * from numrange_test where nr = '[1.1, 2.2)';
select * from numrange_test where nr < 'empty';
select * from numrange_test where nr < numrange(-1000.0, -1000.0,'[]');
select * from numrange_test where nr < numrange(0.0, 1.0,'[]');
select * from numrange_test where nr < numrange(1000.0, 1001.0,'[]');
select * from numrange_test where nr <= 'empty';
select * from numrange_test where nr >= 'empty';
select * from numrange_test where nr > 'empty';
select * from numrange_test where nr > numrange(-1001.0, -1000.0,'[]');
select * from numrange_test where nr > numrange(0.0, 1.0,'[]');
select * from numrange_test where nr > numrange(1000.0, 1000.0,'[]');
select numrange(2.0, 3.0) -|- numrange(3.0, 4.0);
select range_adjacent(numrange(2.0, 3.0), numrange(3.1, 4.0));
select range_adjacent(numrange(2.0, 3.0), numrange(3.1, null));
select numrange(2.0, 3.0, '[]') -|- numrange(3.0, 4.0, '()');
select numrange(1.0, 2.0) -|- numrange(2.0, 3.0,'[]');
select range_adjacent(numrange(2.0, 3.0, '(]'), numrange(1.0, 2.0, '(]'));
select numrange(1.1, 3.3) <@ numrange(0.1,10.1);
select numrange(0.1, 10.1) <@ numrange(1.1,3.3);
select numrange(1.1, 2.2) - numrange(2.0, 3.0);
select numrange(1.1, 2.2) - numrange(2.2, 3.0);
select numrange(1.1, 2.2,'[]') - numrange(2.0, 3.0);
select range_minus(numrange(10.1,12.2,'[]'), numrange(110.0,120.2,'(]'));
select range_minus(numrange(10.1,12.2,'[]'), numrange(0.0,120.2,'(]'));
select numrange(4.5, 5.5, '[]') && numrange(5.5, 6.5);
select numrange(1.0, 2.0) << numrange(3.0, 4.0);
select numrange(1.0, 3.0,'[]') << numrange(3.0, 4.0,'[]');
select numrange(1.0, 3.0,'()') << numrange(3.0, 4.0,'()');
select numrange(1.0, 2.0) >> numrange(3.0, 4.0);
select numrange(3.0, 70.0) &< numrange(6.6, 100.0);
select numrange(1.1, 2.2) < numrange(1.0, 200.2);
select numrange(1.1, 2.2) < numrange(1.1, 1.2);
select numrange(1.0, 2.0) + numrange(2.0, 3.0);
select numrange(1.0, 2.0) + numrange(1.5, 3.0);
select range_merge(numrange(1.0, 2.0), numrange(2.0, 3.0));
select range_merge(numrange(1.0, 2.0), numrange(1.5, 3.0));
select range_merge(numrange(1.0, 2.0), numrange(2.5, 3.0));
select numrange(1.0, 2.0) * numrange(2.0, 3.0);
select numrange(1.0, 2.0) * numrange(1.5, 3.0);
select numrange(1.0, 2.0) * numrange(2.5, 3.0);
select range_intersect_agg(nr) from numrange_test;
select range_intersect_agg(nr) from numrange_test where false;
select range_intersect_agg(nr) from numrange_test where nr @> 4.0;
analyze numrange_test;
create table numrange_test2(nr numrange);
create index numrange_test2_hash_idx on numrange_test2 using hash (nr);
INSERT INTO numrange_test2 VALUES('[, 5)');
INSERT INTO numrange_test2 VALUES(numrange(1.1, 2.2));
INSERT INTO numrange_test2 VALUES(numrange(1.1, 2.2));
INSERT INTO numrange_test2 VALUES(numrange(1.1, 2.2,'()'));
INSERT INTO numrange_test2 VALUES('empty');
select * from numrange_test2 where nr = 'empty'::numrange;
select * from numrange_test2 where nr = numrange(1.1, 2.2);
select * from numrange_test2 where nr = numrange(1.1, 2.3);
set enable_nestloop=t;
set enable_hashjoin=f;
set enable_mergejoin=f;
select * from numrange_test natural join numrange_test2 order by nr;
set enable_nestloop=f;
set enable_hashjoin=t;
set enable_mergejoin=f;
select * from numrange_test natural join numrange_test2 order by nr;
set enable_nestloop=f;
set enable_hashjoin=f;
set enable_mergejoin=t;
select * from numrange_test natural join numrange_test2 order by nr;
set enable_nestloop to default;
set enable_hashjoin to default;
set enable_mergejoin to default;
DROP TABLE numrange_test2;
select int4range(1, 10, '[]');
select int4range(1, 10, '[)');
select int4range(1, 10, '(]');
select int4range(1, 10, '()');
select int4range(1, 2, '()');
select daterange('2000-01-10'::date, '2000-01-20'::date, '[]');
select daterange('2000-01-10'::date, '2000-01-20'::date, '[)');
select daterange('2000-01-10'::date, '2000-01-20'::date, '(]');
select daterange('2000-01-10'::date, '2000-01-20'::date, '()');
select daterange('2000-01-10'::date, '2000-01-11'::date, '()');
select daterange('2000-01-10'::date, '2000-01-11'::date, '(]');
select daterange('-infinity'::date, '2000-01-01'::date, '()');
select daterange('-infinity'::date, '2000-01-01'::date, '[)');
select daterange('2000-01-01'::date, 'infinity'::date, '[)');
select daterange('2000-01-01'::date, 'infinity'::date, '[]');
create table test_range_gist(ir int4range);
create index test_range_gist_idx on test_range_gist using gist (ir);
insert into test_range_gist select int4range(g, g+10) from generate_series(1,2000) g;
insert into test_range_gist select 'empty'::int4range from generate_series(1,500) g;
insert into test_range_gist select int4range(g, g+10000) from generate_series(1,1000) g;
insert into test_range_gist select 'empty'::int4range from generate_series(1,500) g;
insert into test_range_gist select int4range(NULL,g*10,'(]') from generate_series(1,100) g;
insert into test_range_gist select int4range(g*10,NULL,'(]') from generate_series(1,100) g;
insert into test_range_gist select int4range(g, g+10) from generate_series(1,2000) g;
analyze test_range_gist;
SET enable_seqscan    = t;
SET enable_indexscan  = f;
SET enable_bitmapscan = f;
select count(*) from test_range_gist where ir @> 'empty'::int4range;
select count(*) from test_range_gist where ir = int4range(10,20);
select count(*) from test_range_gist where ir @> 10;
select count(*) from test_range_gist where ir @> int4range(10,20);
select count(*) from test_range_gist where ir && int4range(10,20);
select count(*) from test_range_gist where ir <@ int4range(10,50);
select count(*) from test_range_gist where ir << int4range(100,500);
select count(*) from test_range_gist where ir >> int4range(100,500);
select count(*) from test_range_gist where ir &< int4range(100,500);
select count(*) from test_range_gist where ir &> int4range(100,500);
select count(*) from test_range_gist where ir -|- int4range(100,500);
select count(*) from test_range_gist where ir @> '{}'::int4multirange;
select count(*) from test_range_gist where ir @> int4multirange(int4range(10,20), int4range(30,40));
select count(*) from test_range_gist where ir && '{(10,20),(30,40),(50,60)}'::int4multirange;
select count(*) from test_range_gist where ir <@ '{(10,30),(40,60),(70,90)}'::int4multirange;
select count(*) from test_range_gist where ir << int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir >> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &< int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir -|- int4multirange(int4range(100,200), int4range(400,500));
SET enable_seqscan    = f;
SET enable_indexscan  = t;
SET enable_bitmapscan = f;
select count(*) from test_range_gist where ir @> 'empty'::int4range;
select count(*) from test_range_gist where ir = int4range(10,20);
select count(*) from test_range_gist where ir @> 10;
select count(*) from test_range_gist where ir @> int4range(10,20);
select count(*) from test_range_gist where ir && int4range(10,20);
select count(*) from test_range_gist where ir <@ int4range(10,50);
select count(*) from test_range_gist where ir << int4range(100,500);
select count(*) from test_range_gist where ir >> int4range(100,500);
select count(*) from test_range_gist where ir &< int4range(100,500);
select count(*) from test_range_gist where ir &> int4range(100,500);
select count(*) from test_range_gist where ir -|- int4range(100,500);
select count(*) from test_range_gist where ir @> '{}'::int4multirange;
select count(*) from test_range_gist where ir @> int4multirange(int4range(10,20), int4range(30,40));
select count(*) from test_range_gist where ir && '{(10,20),(30,40),(50,60)}'::int4multirange;
select count(*) from test_range_gist where ir <@ '{(10,30),(40,60),(70,90)}'::int4multirange;
select count(*) from test_range_gist where ir << int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir >> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &< int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir -|- int4multirange(int4range(100,200), int4range(400,500));
drop index test_range_gist_idx;
create index test_range_gist_idx on test_range_gist using gist (ir);
select count(*) from test_range_gist where ir @> 'empty'::int4range;
select count(*) from test_range_gist where ir = int4range(10,20);
select count(*) from test_range_gist where ir @> 10;
select count(*) from test_range_gist where ir @> int4range(10,20);
select count(*) from test_range_gist where ir && int4range(10,20);
select count(*) from test_range_gist where ir <@ int4range(10,50);
select count(*) from test_range_gist where ir << int4range(100,500);
select count(*) from test_range_gist where ir >> int4range(100,500);
select count(*) from test_range_gist where ir &< int4range(100,500);
select count(*) from test_range_gist where ir &> int4range(100,500);
select count(*) from test_range_gist where ir -|- int4range(100,500);
select count(*) from test_range_gist where ir @> '{}'::int4multirange;
select count(*) from test_range_gist where ir @> int4multirange(int4range(10,20), int4range(30,40));
select count(*) from test_range_gist where ir && '{(10,20),(30,40),(50,60)}'::int4multirange;
select count(*) from test_range_gist where ir <@ '{(10,30),(40,60),(70,90)}'::int4multirange;
select count(*) from test_range_gist where ir << int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir >> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &< int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir &> int4multirange(int4range(100,200), int4range(400,500));
select count(*) from test_range_gist where ir -|- int4multirange(int4range(100,200), int4range(400,500));
create table test_range_spgist(ir int4range);
create index test_range_spgist_idx on test_range_spgist using spgist (ir);
insert into test_range_spgist select int4range(g, g+10) from generate_series(1,2000) g;
insert into test_range_spgist select 'empty'::int4range from generate_series(1,500) g;
insert into test_range_spgist select int4range(g, g+10000) from generate_series(1,1000) g;
insert into test_range_spgist select 'empty'::int4range from generate_series(1,500) g;
insert into test_range_spgist select int4range(NULL,g*10,'(]') from generate_series(1,100) g;
insert into test_range_spgist select int4range(g*10,NULL,'(]') from generate_series(1,100) g;
insert into test_range_spgist select int4range(g, g+10) from generate_series(1,2000) g;
SET enable_seqscan    = t;
SET enable_indexscan  = f;
SET enable_bitmapscan = f;
select count(*) from test_range_spgist where ir @> 'empty'::int4range;
select count(*) from test_range_spgist where ir = int4range(10,20);
select count(*) from test_range_spgist where ir @> 10;
select count(*) from test_range_spgist where ir @> int4range(10,20);
select count(*) from test_range_spgist where ir && int4range(10,20);
select count(*) from test_range_spgist where ir <@ int4range(10,50);
select count(*) from test_range_spgist where ir << int4range(100,500);
select count(*) from test_range_spgist where ir >> int4range(100,500);
select count(*) from test_range_spgist where ir &< int4range(100,500);
select count(*) from test_range_spgist where ir &> int4range(100,500);
select count(*) from test_range_spgist where ir -|- int4range(100,500);
SET enable_seqscan    = f;
SET enable_indexscan  = t;
SET enable_bitmapscan = f;
select count(*) from test_range_spgist where ir @> 'empty'::int4range;
select count(*) from test_range_spgist where ir = int4range(10,20);
select count(*) from test_range_spgist where ir @> 10;
select count(*) from test_range_spgist where ir @> int4range(10,20);
select count(*) from test_range_spgist where ir && int4range(10,20);
select count(*) from test_range_spgist where ir <@ int4range(10,50);
select count(*) from test_range_spgist where ir << int4range(100,500);
select count(*) from test_range_spgist where ir >> int4range(100,500);
select count(*) from test_range_spgist where ir &< int4range(100,500);
select count(*) from test_range_spgist where ir &> int4range(100,500);
select count(*) from test_range_spgist where ir -|- int4range(100,500);
drop index test_range_spgist_idx;
create index test_range_spgist_idx on test_range_spgist using spgist (ir);
select count(*) from test_range_spgist where ir @> 'empty'::int4range;
select count(*) from test_range_spgist where ir = int4range(10,20);
select count(*) from test_range_spgist where ir @> 10;
select count(*) from test_range_spgist where ir @> int4range(10,20);
select count(*) from test_range_spgist where ir && int4range(10,20);
select count(*) from test_range_spgist where ir <@ int4range(10,50);
select count(*) from test_range_spgist where ir << int4range(100,500);
select count(*) from test_range_spgist where ir >> int4range(100,500);
select count(*) from test_range_spgist where ir &< int4range(100,500);
select count(*) from test_range_spgist where ir &> int4range(100,500);
select count(*) from test_range_spgist where ir -|- int4range(100,500);
explain (costs off)
select ir from test_range_spgist where ir -|- int4range(10,20) order by ir;
select ir from test_range_spgist where ir -|- int4range(10,20) order by ir;
RESET enable_seqscan;
RESET enable_indexscan;
RESET enable_bitmapscan;
create table test_range_elem(i int4);
create index test_range_elem_idx on test_range_elem (i);
insert into test_range_elem select i from generate_series(1,100) i;
SET enable_seqscan    = f;
select count(*) from test_range_elem where i <@ int4range(10,50);
create index on test_range_elem using spgist(int4range(i,i+10));
explain (costs off)
select count(*) from test_range_elem where int4range(i,i+10) <@ int4range(10,30);
select count(*) from test_range_elem where int4range(i,i+10) <@ int4range(10,30);
RESET enable_seqscan;
drop table test_range_elem;
create table test_range_excl(
  room int4range,
  speaker int4range,
  during tsrange,
  exclude using gist (room with =, during with &&),
  exclude using gist (speaker with =, during with &&)
);
insert into test_range_excl
  values(int4range(123, 123, '[]'), int4range(1, 1, '[]'), '[2010-01-02 10:00, 2010-01-02 11:00)');
insert into test_range_excl
  values(int4range(123, 123, '[]'), int4range(2, 2, '[]'), '[2010-01-02 11:00, 2010-01-02 12:00)');
insert into test_range_excl
  values(int4range(124, 124, '[]'), int4range(3, 3, '[]'), '[2010-01-02 10:10, 2010-01-02 11:10)');
select int8range(10000000000::int8, 20000000000::int8,'(]');
set timezone to '-08';
select '[2010-01-01 01:00:00 -05, 2010-01-01 02:00:00 -08)'::tstzrange;
set timezone to default;
create domain mydomain as int4;
create type mydomainrange as range(subtype=mydomain);
select '[4,50)'::mydomainrange @> 7::mydomain;
drop domain mydomain cascade;
create domain restrictedrange as int4range check (upper(value) < 10);
select '[4,5)'::restrictedrange @> 7;
drop domain restrictedrange;
create type textrange1 as range(subtype=text, collation="C");
create type textrange2 as range(subtype=text, collation="C");
select textrange2('a','z') @> 'b'::text;
drop type textrange1;
drop type textrange2;
create function range_add_bounds(anyrange)
  returns anyelement as 'select lower($1) + upper($1)' language sql;
select range_add_bounds(int4range(1, 17));
select range_add_bounds(numrange(1.0001, 123.123));
create function rangetypes_sql(q anyrange, b anyarray, out c anyelement)
  as $$ select upper($1) + $2[1] $$
  language sql;
select rangetypes_sql(int4range(1,10), ARRAY[2,20]);
select ARRAY[numrange(1.1, 1.2), numrange(12.3, 155.5)];
create table i8r_array (f1 int, f2 int8range[]);
insert into i8r_array values (42, array[int8range(1,10), int8range(2,20)]);
select * from i8r_array;
drop table i8r_array;
create type arrayrange as range (subtype=int4[]);
select arrayrange(ARRAY[1,2], ARRAY[2,1]);
select array[1,1] <@ arrayrange(array[1,2], array[2,1]);
select array[1,3] <@ arrayrange(array[1,2], array[2,1]);
create type two_ints as (a int, b int);
create type two_ints_range as range (subtype = two_ints);
select *, row_to_json(upper(t)) as u from
  (values (two_ints_range(row(1,2), row(3,4))),
          (two_ints_range(row(5,6), row(7,8)))) v(t);
drop type two_ints cascade;
create type varbitrange as range (subtype = varbit);
set enable_sort = off;
select '(01,10)'::varbitrange except select '(10,11)'::varbitrange;
reset enable_sort;
create function outparam_succeed(i anyrange, out r anyrange, out t text)
  as $$ select $1, 'foo'::text $$ language sql;
select * from outparam_succeed(int4range(1,2));
create function outparam2_succeed(r anyrange, out lu anyarray, out ul anyarray)
  as $$ select array[lower($1), upper($1)], array[upper($1), lower($1)] $$
  language sql;
select * from outparam2_succeed(int4range(1,11));
create function outparam_succeed2(i anyrange, out r anyarray, out t text)
  as $$ select ARRAY[upper($1)], 'foo'::text $$ language sql;
select * from outparam_succeed2(int4range(int4range(1,2)));
create function inoutparam_succeed(out i anyelement, inout r anyrange)
  as $$ select upper($1), $1 $$ language sql;
select * from inoutparam_succeed(int4range(1,2));
create function table_succeed(r anyrange)
  returns table(l anyelement, u anyelement)
  as $$ select lower($1), upper($1) $$
  language sql;
select * from table_succeed(int4range(1,11));
explain (verbose, costs off)
select current_date <@ daterange 'empty';
explain (verbose, costs off)
select current_date <@ daterange(NULL, NULL);
explain (verbose, costs off)
select current_date <@ daterange('2000-01-01', NULL, '[)');
explain (verbose, costs off)
select current_date <@ daterange(NULL, '2000-01-01', '(]');
explain (verbose, costs off)
select current_date <@ daterange('-Infinity', '1997-04-10'::date, '()');
explain (verbose, costs off)
select current_date <@ daterange('-Infinity', '1997-04-10'::date, '[)');
explain (verbose, costs off)
select current_date <@ daterange('2002-09-25'::date, 'Infinity', '[)');
explain (verbose, costs off)
select current_date <@ daterange('2002-09-25'::date, 'Infinity', '[]');
explain (verbose, costs off)
select daterange('-Infinity', '1997-04-10'::date, '()') @> current_date;
explain (verbose, costs off)
select daterange('2002-09-25'::date, 'Infinity', '[]') @> current_date;
explain (verbose, costs off)
select now() <@ tstzrange('2024-01-20 00:00', '2024-01-21 00:00');
explain (verbose, costs off)  
select clock_timestamp() <@ tstzrange('2024-01-20 00:00', '2024-01-21 00:00');
explain (verbose, costs off)
select clock_timestamp() <@ tstzrange('2024-01-20 00:00', NULL);
create type textrange_supp as range (
   subtype = text,
   subtype_opclass = text_pattern_ops
);
create temp table text_support_test (t text collate "C");
insert into text_support_test values ('a'), ('c'), ('d'), ('ch');
explain (costs off)
select * from text_support_test where t <@ textrange_supp('a', 'd');
select * from text_support_test where t <@ textrange_supp('a', 'd');
drop table text_support_test;
drop type textrange_supp;