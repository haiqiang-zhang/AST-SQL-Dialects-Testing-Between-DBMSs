drop table if exists local;
drop table if exists distr;
create table local (a UInt64, b UInt64, c UInt64, d UInt64, e UInt64, f UInt64, g UInt64, h UInt64) engine = Log;
insert into local (a) select number from numbers(10);
set max_columns_to_read=1;
drop table if exists local;
drop table if exists distr;