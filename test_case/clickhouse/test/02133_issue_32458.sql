SELECT * FROM t1 ANY INNER JOIN t2 ON ((NULL = t1.key) = t2.id) AND (('' = t1.key) = t2.id);
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
