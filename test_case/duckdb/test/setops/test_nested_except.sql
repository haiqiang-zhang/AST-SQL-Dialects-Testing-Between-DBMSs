create table a (i integer);
create table b(i integer);
create table c (i integer);
insert into a values(42), (43), (44);
insert into b values(43);
insert into c values(44);
select * from a except select * from b except select * from c;