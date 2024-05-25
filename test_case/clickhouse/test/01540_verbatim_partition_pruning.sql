-- minmax index for the first partition is 0 <= x <= 8
-- minmax index for the second partition is 2 <= x <= 9

SET max_rows_to_read = 2;
select * from xy where intHash64(x) % 2 = intHash64(2) % 2;
-- minmax index is not enough.
select * from xy where x = 8;
drop table if exists xy;
drop table if exists xyz;
create table xyz(x int, y int, z int) engine MergeTree partition by if(toUInt8(x), y, z) order by x settings index_granularity = 1;
insert into xyz values (1, 2, 3);
select * from xyz where y = 2;
drop table if exists xyz;
drop table if exists test;
create table test(d Date, k Int64, s String) Engine=MergeTree partition by (toYYYYMM(d),k) order by (d, k);
insert into test values ('2020-01-01', 1, '');
insert into test values ('2020-01-02', 1, '');
select * from test where d != '2020-01-01';
drop table test;
drop table if exists myTable;
CREATE TABLE myTable (myDay Date, myOrder Int32, someData String) ENGINE = ReplacingMergeTree PARTITION BY floor(toYYYYMMDD(myDay), -1) ORDER BY (myOrder);
INSERT INTO myTable (myDay, myOrder) VALUES ('2021-01-01', 1);
INSERT INTO myTable (myDay, myOrder) VALUES ('2021-01-02', 2);
// This row should be returned
INSERT INTO myTable (myDay, myOrder) VALUES ('2021-01-03', 3);
SELECT * FROM myTable mt WHERE myDay = '2021-01-02';
drop table myTable;
