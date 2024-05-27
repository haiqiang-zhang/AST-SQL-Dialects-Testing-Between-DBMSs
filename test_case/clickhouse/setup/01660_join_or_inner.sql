SET joined_subquery_requires_alias = 0;
drop table if exists tab2;
drop table if exists tab3;
create table tab2 (a2 Int32, b2 Int32) engine = MergeTree order by a2;
create table tab3 (a3 Int32, b3 Int32) engine = MergeTree order by a3;
insert into tab2 values (2, 3);
insert into tab2 values (6, 4);
insert into tab2 values (998, 999);
insert into tab3 values (2, 3);
insert into tab3 values (5, 4);
insert into tab3 values (100, 4);
insert into tab3 values (1998, 1999);
set max_threads = 1;
SET any_join_distinct_right_table_keys = 0;