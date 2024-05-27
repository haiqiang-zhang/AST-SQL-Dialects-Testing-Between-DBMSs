drop table if exists tab_00484;
create table tab_00484 (date Date, x UInt64, s FixedString(128)) engine = MergeTree PARTITION BY date ORDER BY (date, x) SETTINGS min_bytes_for_wide_part = 0, ratio_of_defaults_for_sparse_serialization = 1;
insert into tab_00484 select today(), number, toFixedString('', 128) from system.numbers limit 8192;
set preferred_block_size_bytes = 2000000;
set preferred_max_column_in_block_size_bytes = 0;