CREATE MATERIALIZED VIEW v1 to t1 AS SELECT * FROM t2;
CREATE MATERIALIZED VIEW v2 to t2 AS SELECT * FROM t1;
DROP TABLE IF EXISTS t;
DROP TABLE IF EXISTS v;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS v1;
DROP TABLE IF EXISTS v2;
