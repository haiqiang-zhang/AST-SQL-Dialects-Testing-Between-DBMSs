CREATE TABLE t1(seq INTEGER PRIMARY KEY, val TEXT);
INSERT INTO t1 VALUES
    (1, '-9999e99'),
    (2, '-9998.000e+99'),
    (3, '-9999.0'),
    (4, '-1'),
    (5, '-9999e-20'),
    (6, '0'),
    (7, '1e-30'),
    (8, '1e-29'),
    (9, '1'),
    (10,'1.00000000000000001'),
    (11,'+1.00001'),
    (12,'99e+99');
CREATE TABLE t3(seq INTEGER PRIMARY KEY, val TEXT);
WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<10)
    INSERT INTO t3(seq, val) SELECT x, x FROM c;
CREATE TABLE pow2(x INTEGER PRIMARY KEY, v TEXT);