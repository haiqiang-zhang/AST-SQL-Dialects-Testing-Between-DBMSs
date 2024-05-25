-- Tag no-replicated-database: Different query_id

SET prefer_localhost_replica = 1;
DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp ENGINE = TinyLog AS SELECT queryID();
SYSTEM FLUSH LOGS;
DROP TABLE tmp;
CREATE TABLE tmp ENGINE = TinyLog AS SELECT initialQueryID();
SYSTEM FLUSH LOGS;
DROP TABLE tmp;
CREATE TABLE tmp (str String) ENGINE = Log;
DROP TABLE tmp;
