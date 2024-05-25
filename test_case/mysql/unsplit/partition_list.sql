drop table if exists t1;
CREATE TABLE t1 (a INT);
ALTER TABLE t1
PARTITION BY LIST(a)
(PARTITION p1 VALUES IN (1,2,3,4,5,6,7,8,9,10,
                         11,12,13,14,15,16,17,18,19,20));
ALTER TABLE t1 ADD PARTITION
(PARTITION p2 VALUES IN (21,22,23,24,25,26,27,28,29,30,
                         31,32,33,34,35,36,37,38,39,40));
ALTER TABLE t1
PARTITION BY LIST COLUMNS (a)
(PARTITION p1 VALUES IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20));
ALTER TABLE t1 ADD PARTITION
(PARTITION p2 VALUES IN (21,22,23,24,25,26,27,28,29,30,
                         31,32,33,34,35,36,37,38,39,40));
DROP TABLE t1;
CREATE TABLE t1
(a INT,
 b CHAR(2))
PARTITION BY LIST COLUMNS (a, b)
(PARTITION p0_a VALUES IN
((0, "a0"), (0, "a1"), (0, "a2"), (0, "a3"), (0, "a4"), (0, "a5"), (0, "a6"),
 (0, "a7"), (0, "a8"), (0, "a9"), (0, "aa"), (0, "ab"), (0, "ac"), (0, "ad"),
 (0, "ae"), (0, "af"), (0, "ag"), (0, "ah"), (0, "ai"), (0, "aj"), (0, "ak"),
 (0, "al")));
ALTER TABLE t1 ADD PARTITION
(PARTITION p1_a VALUES IN
((1, "a0"), (1, "a1"), (1, "a2"), (1, "a3"), (1, "a4"), (1, "a5"), (1, "a6"),
 (1, "a7"), (1, "a8"), (1, "a9"), (1, "aa"), (1, "ab"), (1, "ac"), (1, "ad"),
 (1, "ae"), (1, "af"), (1, "ag"), (1, "ah"), (1, "ai"), (1, "aj"), (1, "ak"),
 (1, "al")));
ALTER TABLE t1 ADD PARTITION
(PARTITION p2_a VALUES IN
(((1 + 1), "a0"), (2, "a1"), (2, "a2"), (2, "a3"), (2, "a4"), (2, "a5"),
 (2, "a6"), (2, "a7"), (2, "a8"), (2, "a9"), (2, "aa"), (2, "ab"), (2, "ac"),
 (2, "ad"), (2, "ae"), (2, "af"), (2, "ag"), (2, "ah"), (2, "ai"), (2, "aj"),
 (2, "ak"), (2, "al")));
ALTER TABLE t1 ADD PARTITION
(PARTITION p3_a VALUES IN ((1 + 1 + 1, "a0")));
DROP TABLE t1;
create table t1 (a int unsigned)
partition by list (a)
(partition p0 values in (0),
 partition p1 values in (1),
 partition pnull values in (null),
 partition p2 values in (2));
insert into t1 values (null),(0),(1),(2);
select * from t1 where a < 2;
select * from t1 where a <= 0;
select * from t1 where a < 1;
select * from t1 where a > 0;
select * from t1 where a > 1;
select * from t1 where a >= 0;
select * from t1 where a >= 1;
select * from t1 where a is null;
select * from t1 where a is not null;
select * from t1 where a is null or a > 0;
drop table t1;
create table t1 (a int unsigned, b int)
partition by list (a)
subpartition by hash (b)
subpartitions 2
(partition p0 values in (0),
 partition p1 values in (1),
 partition pnull values in (null, 2),
 partition p3 values in (3));
select partition_method, partition_expression, partition_description
  from information_schema.partitions where table_name = "t1";
insert into t1 values (0,0),(0,1),(1,0),(1,1),(null,0),(null,1);
insert into t1 values (2,0),(2,1),(3,0),(3,1);
select * from t1 where a is null;
select * from t1 where a = 2;
select * from t1 where a <= 0;
select * from t1 where a < 3;
select * from t1 where a >= 1 or a is null;
drop table t1;
CREATE TABLE t1 (
a int not null,
b int not null,
c int not null)
partition by list(a)
partitions 2
(partition x123 values in (1,5,6),
 partition x234 values in (4,7,8));
INSERT into t1 VALUES (1,1,1);
INSERT into t1 VALUES (4,1,1);
INSERT into t1 VALUES (5,1,1);
INSERT into t1 VALUES (6,1,1);
INSERT into t1 VALUES (7,1,1);
INSERT into t1 VALUES (8,1,1);
INSERT into t1 VALUES (1,2,1);
INSERT into t1 VALUES (1,3,1);
INSERT into t1 VALUES (1,4,1);
INSERT into t1 VALUES (7,2,1);
INSERT into t1 VALUES (7,3,1);
INSERT into t1 VALUES (7,4,1);
SELECT * from t1;
SELECT * from t1 WHERE a=1;
SELECT * from t1 WHERE a=7;
SELECT * from t1 WHERE b=2;
UPDATE t1 SET a=8 WHERE a=7 AND b=3;
SELECT * from t1;
UPDATE t1 SET a=8 WHERE a=5 AND b=1;
SELECT * from t1;
DELETE from t1 WHERE a=8;
SELECT * from t1;
DELETE from t1 WHERE a=2;
SELECT * from t1;
DELETE from t1 WHERE a=5 OR a=6;
SELECT * from t1;
ALTER TABLE t1
partition by list(a)
partitions 2
(partition x123 values in (1,5,6),
 partition x234 values in (4,7,8));
SELECT * from t1;
INSERT into t1 VALUES (6,2,1);
drop table t1;
CREATE TABLE t1 (
a int not null,
b int not null,
c int not null,
primary key (a,b))
partition by list (a)
subpartition by hash (a+b)
( partition x1 values in (1,2,3)
  ( subpartition x11 nodegroup 0,
    subpartition x12 nodegroup 1),
  partition x2 values in (4,5,6)
  ( subpartition x21 nodegroup 0,
    subpartition x22 nodegroup 1)
);
INSERT into t1 VALUES (1,1,1);
INSERT into t1 VALUES (4,1,1);
UPDATE t1 SET a=5 WHERE a=1;
SELECT * from t1;
UPDATE t1 SET a=6 WHERE a=4;
SELECT * from t1;
DELETE from t1 WHERE a=6;
SELECT * from t1;
drop table t1;
CREATE TABLE t1 (
a int not null,
b int not null,
c int not null,
primary key(a,b))
partition by list (a)
(partition x1 values in (1,2,9,4));
drop table t1;
CREATE TABLE t1 (s1 int) PARTITION BY LIST (s1)
(PARTITION p1 VALUES IN (1),
PARTITION p2 VALUES IN (2),
PARTITION p3 VALUES IN (3),
PARTITION p4 VALUES IN (4),
PARTITION p5 VALUES IN (5));
INSERT INTO t1 VALUES (1), (2), (3), (4), (5);
SELECT COUNT(*) FROM t1 WHERE s1 < 3;
DROP TABLE t1;
create table t1 (a int auto_increment primary key)
auto_increment=100
partition by list (a)
(partition p0 values in (1, 100));
create index inx on t1 (a);
insert into t1 values (null);
select * from t1;
drop table t1;
CREATE TABLE t1 (c1 varbinary(64) NOT NULL) PARTITION BY LIST COLUMNS (c1) (PARTITION custom_p1 VALUES IN (0x98000));
SELECT TABLE_NAME, PARTITION_DESCRIPTION FROM information_schema.partitions WHERE table_name = 't1';
CREATE TABLE t2 (c1 varbinary(64) NOT NULL) PARTITION BY LIST COLUMNS (c1) (PARTITION custom_p1 VALUES IN (0x24212b2b));
SELECT TABLE_NAME, PARTITION_DESCRIPTION FROM information_schema.partitions WHERE table_name = 't2';
CREATE TABLE `t3` (
  `c1` varbinary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO t1 VALUES (0x98000);
INSERT INTO t2 VALUES (0x24212b2b);
INSERT INTO t3 VALUES (0x24212b2b);
DROP TABLE t3;
DROP TABLE t2;
DROP TABLE t1;
CREATE TABLE t1 (c1 INT) PARTITION BY LIST
(c1)( PARTITION p0 VALUES IN
(3089,86,2283,283,1872,3255,1376,2558,289,3098,1522,2829,337,968,3938,190,743,
1141,3257,3461,3496,312,2757,2646,2284,765,662,2088,1880,3616,1388,1910,915,
3390,2387,3357,1264,578,3666,2168,3640,1876,1042,890,459,1771,787,1930,2003,1346
,2917,34,850,2027,1010,2702,3407,235,1672,647,2485,2438,954,1295,425,3561,2068
,3169,1920,885,629,818,2511,2732,2188,642,2630,2047,597,3958,3013,599,909,206,
2084,3597,3150,2871,97,1262,1318,1584,3491,342,3382,1427,2170,4,3470,2521,3811
,821,3308,2522,3418,1306,412,203,2620,2899,2825,3044,2455,1634,3206,2827,150,
2359,3090,3890,2929,1233,1058,1274,1047,927,2546,2699,1399,3124,3193,2051,1795,
2475,3140,194,3967,1793,1220,3881,591,1458,3607,2224,2175,1652,3908,3870,2561,
829,3979,3974,2192,2644,2106,3245,556,1837,1437,3548,116,2137,659,2324,2982,
3677,132,1271,1481,2906,3447,3226,2778,1923,2771,1951,766,3368,1768,2230,2341,
1093,3962,1947,830,1119,1004,914,1064,2598,3002,3690,1831,810,243,3519,2031,1866
,862,2902,3200,1227,1205,1958,122,827,2392,371,3378,679,1537,2012,3003,3159,
2044,3620,2173,893,3843,2953,3223,1045,140,2266,2844,539,1861,1500,3794,349,901,
2021,1087,2788,344,1830,1722,1460,451,3278,2553,195,3222,1560,2799,1839,3074,
2945,1377,3646,3392,1127,1723,3284,3304,2633,2520,43,586,2942,329,2425,80,2726,
282,2353,1836,2306,469,1457,123,3842,3029,3950,1586,1555,2990,3352,1812,3933,
1802,2361,1916,2692,1902,364,3224,3970,1610,3123,3624,3981,162,2622,3102,165,
516,2878,2484,2755,40,2444,2153,444,12,1138,3812,3112,3626,3559,3188,2038,3665,
2862,604,331,651,2469,762,3356,2501,2789,3627,2220,3961,3445,2846) );
DROP TABLE t1;
