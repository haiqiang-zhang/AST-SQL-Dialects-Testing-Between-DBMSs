drop table if exists table_1;
drop table if exists table_2;
drop table if exists v_numbers;
drop table if exists mv_table;
create table table_1 (x UInt32, y String) engine = MergeTree order by x;
insert into table_1 values (1, 'a'), (2, 'bb'), (3, 'ccc'), (4, 'dddd');