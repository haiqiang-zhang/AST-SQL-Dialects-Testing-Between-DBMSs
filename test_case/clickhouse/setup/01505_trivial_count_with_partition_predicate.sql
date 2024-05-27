drop table if exists test1;
drop table if exists test_tuple;
drop table if exists test_two_args;
create table test1(p DateTime, k int) engine MergeTree partition by toDate(p) order by k settings index_granularity = 1;
insert into test1 values ('2020-09-01 00:01:02', 1), ('2020-09-01 20:01:03', 2), ('2020-09-02 00:01:03', 3);
set max_rows_to_read = 1;
set optimize_use_implicit_projections = 1;