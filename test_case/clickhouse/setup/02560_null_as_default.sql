drop table if exists test;
create table test (x UInt64) engine=Memory();
set insert_null_as_default=1;
insert into test select number % 2 ? NULL : 42 as x from numbers(2);