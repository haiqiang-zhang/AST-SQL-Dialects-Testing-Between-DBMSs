-- Must use `system` database and these tables - they're configured in tests/*_dictionary.xml
use system;
drop table if exists ints;
drop table if exists strings;
drop table if exists decimals;
create table ints (key UInt64, i8 Int8, i16 Int16, i32 Int32, i64 Int64, u8 UInt8, u16 UInt16, u32 UInt32, u64 UInt64) Engine = Memory;
create table strings (key UInt64, str String) Engine = Memory;
create table decimals (key UInt64, d32 Decimal32(4), d64 Decimal64(6), d128 Decimal128(1)) Engine = Memory;
insert into ints values (1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into strings values (1, '1');
insert into decimals values (1, 1, 1, 1);
