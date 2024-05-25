DROP TABLE IF EXISTS hits;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS hits_layer;
DROP TABLE IF EXISTS visits_layer;
CREATE TABLE visits(StartDate Date) ENGINE MergeTree ORDER BY(StartDate);
CREATE TABLE hits(EventDate Date, WatchID UInt8) ENGINE MergeTree ORDER BY(EventDate);
SET distributed_product_mode = 'local';
DROP TABLE hits;
DROP TABLE visits;
