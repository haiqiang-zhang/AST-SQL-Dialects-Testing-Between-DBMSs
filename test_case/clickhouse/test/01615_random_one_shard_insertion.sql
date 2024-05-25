set distributed_foreground_insert = 1;
set insert_distributed_one_random_shard = 1;
set max_block_size = 1;
set max_insert_block_size = 1;
set min_insert_block_size_rows = 1;
select count() != 0 from shard_0.tbl;
select count() != 0 from shard_1.tbl;
drop table if exists shard_0.tbl;
drop table if exists shard_1.tbl;
drop database shard_0;
drop database shard_1;
