attach table file from '01188_attach/file' (s String, n UInt8) engine=File(TSV);
select * from file;
detach table file;
attach table file;
select * from file;
attach table mt from '01188_attach/file' (n UInt8, s String) engine=MergeTree order by n;
select * from mt;
insert into mt values (42, 'mt');
select * from mt;
detach table mt;
attach table mt;
select * from mt;
drop table file;
drop table mt;
