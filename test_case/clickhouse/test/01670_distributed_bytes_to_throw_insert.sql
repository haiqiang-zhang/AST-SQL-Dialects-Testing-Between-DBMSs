drop table if exists dist_01670;
drop table if exists data_01670;
create table data_01670 (key Int) engine=Null();
create table dist_01670 (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data_01670) settings bytes_to_throw_insert=1;
system stop distributed sends dist_01670;
insert into dist_01670 select * from numbers(1) settings prefer_localhost_replica=0;
-- (previous block definitelly takes more, since it has header)
insert into dist_01670 select * from numbers(1) settings prefer_localhost_replica=0;
system flush distributed dist_01670;
drop table dist_01670;
drop table data_01670;