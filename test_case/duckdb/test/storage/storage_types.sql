CREATE TABLE a_${type} AS SELECT range::${type} i FROM range(100);
CREATE TABLE a_interval AS SELECT interval (range) year i FROM range(1,1001);
CREATE TABLE a_bool AS SELECT range%2=0 i FROM range(1000);
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_${type};
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_${type} WHERE i=1;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_interval;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_interval WHERE i=interval 1 year;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_bool;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_bool WHERE not i;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_${type};
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_${type} WHERE i=1;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_interval;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_interval WHERE i=interval 1 year;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_bool;
SELECT MIN(i), MAX(i), COUNT(*), COUNT(i) FROM a_bool WHERE not i;