drop table if exists test;
drop table if exists file;
drop table if exists mt;
insert into table function file('01188_attach/file/data.TSV', 'TSV', 's String, n UInt8') values ('file', 42);