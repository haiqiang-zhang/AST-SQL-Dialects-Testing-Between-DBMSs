set send_logs_level = 'fatal';
drop table if exists ttl;
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d) settings remove_empty_parts = 0;
alter table ttl modify ttl d + interval 1 day;
show create table ttl;
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 1);
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 2);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 3);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 4);
optimize table ttl partition 10 final;
select * from ttl order by d, a;
drop table if exists ttl;
create table ttl (d Date, a Int) engine = MergeTree order by tuple() partition by toDayOfMonth(d) settings remove_empty_parts = 0;
alter table ttl modify column a Int ttl d + interval 1 day;
desc table ttl;
drop table if exists ttl;
