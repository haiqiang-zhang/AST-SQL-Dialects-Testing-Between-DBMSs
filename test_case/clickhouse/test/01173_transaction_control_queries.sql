select 'commit', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
insert into mt1 values (2);
insert into mt2 values (20);
insert into mt1 values (3);
insert into mt2 values (30);
insert into mt1 values (4);
insert into mt2 values (40);
insert into mt1 values (5);
insert into mt2 values (50);
select 1;
insert into mt1 values (6);
insert into mt2 values (60);
insert into mt1 values (7);
insert into mt2 values (70);
select 'snapshot', count(), sum(n) from mt1;
set throw_on_unsupported_query_inside_transaction=0;
select 'snapshot3', count() = (select count() from system.parts where database=currentDatabase() and table='mt1' and _state in ('Active', 'Outdated')) from mt1;
set throw_on_unsupported_query_inside_transaction=1;
create table m (n int) engine=Memory;
insert into m values (1);
select * from m;
select * from m;
drop table m;
drop table mt1;
drop table mt2;
