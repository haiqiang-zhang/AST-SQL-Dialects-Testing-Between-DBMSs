CREATE TABLE t1 (i INT PRIMARY KEY) ENGINE=MyISAM;
CREATE TABLE t2 (i INT PRIMARY KEY) ENGINE=MyISAM;
SELECT * FROM t1;
SELECT * FROM t2;
SELECT CONVERT_TZ('2015-01-01 00:00:00', 'UTC', 'No-such-time-zone');
DROP TABLES t1, t2;