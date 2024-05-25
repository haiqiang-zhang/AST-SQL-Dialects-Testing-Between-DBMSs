select @iv;
DROP TABLE t5;
CREATE TABLE t6
(pk INTEGER PRIMARY KEY,
 t1 TIME(0),
 t2 TIME(6));
INSERT INTO t6 VALUES
(0, '-838:59:59', '-838:59:59.000000'),
(1, '-23:59:59', '-23:59:59.999999'),
(2, '00:00:00', '00:00:00.000000'),
(3, '23:59:59', '23:59:59.999999'),
(4, '838:59:59', '838:59:59.000000');
DROP TABLE t6;
CREATE TABLE t7
(pk INTEGER PRIMARY KEY,
 dt1 DATETIME(0),
 dt2 DATETIME(6));
INSERT INTO t7 VALUES
(0, '0001-01-01 00:00:00', '0001-01-01 00:00:00.000000'),
(1, '2017-01-01 11:59.59', '2017-01-01 11:59.59.555555'),
(2, '9999-12-31 23:59.59', '9999-12-31 23:59.59.999999');
DROP TABLE t7;
