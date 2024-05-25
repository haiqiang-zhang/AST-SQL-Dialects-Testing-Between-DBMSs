drop table if exists t1;
create table t1 (Zeit time, Tag tinyint not null, Monat tinyint not null,
Jahr smallint not null, index(Tag), index(Monat), index(Jahr) );
insert into t1 values ("09:26:00",16,9,1998),("09:26:00",16,9,1998);
SELECT CONCAT(Jahr,'-',Monat,'-',Tag,' ',Zeit) AS Date,
   UNIX_TIMESTAMP(CONCAT(Jahr,'-',Monat,'-',Tag,' ',Zeit)) AS Unix
FROM t1;
drop table t1;
