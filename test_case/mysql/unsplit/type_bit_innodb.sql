select 0 + b'1';
select 0 + b'0';
select 0 + b'000001';
select 0 + b'000011';
select 0 + b'000101';
select 0 + b'000000';
select 0 + b'10000000';
select 0 + b'11111111';
select 0 + b'10000001';
select 0 + b'1000000000000000';
select 0 + b'1111111111111111';
select 0 + b'1000000000000001';
drop table if exists t1;
create table t1 (a bit(64)) engine=innodb;
insert into t1 values 
(b'1111111111111111111111111111111111111111111111111111111111111111'),
(b'1000000000000000000000000000000000000000000000000000000000000000'),
(b'0000000000000000000000000000000000000000000000000000000000000001'),
(b'1010101010101010101010101010101010101010101010101010101010101010'),
(b'0101010101010101010101010101010101010101010101010101010101010101');
select hex(a) from t1;
drop table t1;
create table t1 (a bit) engine=innodb;
insert ignore into t1 values (b'0'), (b'1'), (b'000'), (b'100'), (b'001');
select hex(a) from t1;
drop table t1;
create table t1 (a bit(2)) engine=innodb;
insert ignore into t1 values (b'00'), (b'01'), (b'10'), (b'100');
select a+0 from t1;
alter table t1 add key (a);
select a+0 from t1;
drop table t1;
create table t1 (a bit(7), b bit(9), key(a, b)) engine=innodb;
insert into t1 values 
(94, 46), (31, 438), (61, 152), (78, 123), (88, 411), (122, 118), (0, 177),    
(75, 42), (108, 67), (79, 349), (59, 188), (68, 206), (49, 345), (118, 380),   
(111, 368), (94, 468), (56, 379), (77, 133), (29, 399), (9, 363), (23, 36),    
(116, 390), (119, 368), (87, 351), (123, 411), (24, 398), (34, 202), (28, 499),
(30, 83), (5, 178), (60, 343), (4, 245), (104, 280), (106, 446), (127, 403),   
(44, 307), (68, 454), (57, 135);
select a+0 from t1;
select b+0 from t1;
select a+0, b+0 from t1;
select a+0, b+0 from t1 where a > 40 and b > 200 order by 1;
select a+0, b+0 from t1 where a > 40 and a < 70 order by 2;
select hex(min(a)) from t1;
select hex(min(b)) from t1;
select hex(min(a)), hex(max(a)), hex(min(b)), hex(max(b)) from t1;
drop table t1;
create table t1 (a int not null, b bit, c bit(9), key(a, b, c)) engine=innodb;
insert into t1 values
(4, NULL, 1), (4, 0, 3), (2, 1, 4), (1, 1, 100), (4, 0, 23), (4, 0, 54),
(56, 0, 22), (4, 1, 100), (23, 0, 1), (4, 0, 34);
select a+0, b+0, c+0 from t1;
select hex(min(b)) from t1 where a = 4;
select hex(min(c)) from t1 where a = 4 and b = 0;
select hex(max(b)) from t1;
select a+0, b+0, c+0 from t1 where a = 4 and b = 0 limit 2;
select a+0, b+0, c+0 from t1 where a = 4 and b = 1;
select a+0, b+0, c+0 from t1 where a = 4 and b = 1 and c=100;
select b+0, a+0, c+0 from t1 order by b desc;
select c+0, a+0, b+0 from t1 order by c;
drop table t1;
create table t1(a bit(2), b bit(2)) engine=innodb;
insert into t1 (a) values (0x01), (0x03), (0x02);
update t1 set b= concat(a);
select a+0, b+0 from t1;
drop table t1;
create table t1 (a bit(7), key(a)) engine=innodb;
insert into t1 values (44), (57);
select a+0 from t1;
drop table t1;
create table t1 (a bit(3), b bit(12)) engine=innodb;
insert into t1 values (7,(1<<12)-2), (0x01,0x01ff);
select hex(a),hex(b) from t1;
select hex(concat(a)),hex(concat(b)) from t1;
drop table t1;
create table t1(a int, b bit not null) engine=innodb;
alter table t1 add primary key (a);
drop table t1;
create table t1 (a bit, b bit(10)) engine=innodb;
alter table t1 engine=heap;
alter table t1 engine=innodb;
drop table t1;
create table t1 (a bit(7)) engine=innodb;
insert into t1 values (0x60);
select * from t1;
drop table t1;
CREATE TABLE t1 (a BIT(64));
INSERT INTO t1 VALUES
(b'1111111111111111111111111111111111111111111111111111111111111111');
SELECT HEX(a) FROM t1 WHERE a =
 b'1111111111111111111111111111111111111111111111111111111111111111';
DROP TABLE t1;
CREATE TABLE t_double (a double not null);
INSERT INTO t_double (a) VALUES
(-20000000000000000000000000000.0001), (20000000000000000000000000000.0001);
CREATE TABLE t_bit (
  b bit(3)
);
INSERT IGNORE INTO t_bit (b) SELECT a from t_double;
SELECT HEX(b) FROM t_bit;
DROP TABLE t_double, t_bit;