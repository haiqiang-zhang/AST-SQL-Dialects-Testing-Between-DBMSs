DROP TABLE IF EXISTS t_sparse_pk;
DROP TABLE IF EXISTS t_full_pk;
CREATE TABLE t_sparse_pk (k UInt64, s String)
ENGINE = MergeTree ORDER BY k
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.0, index_granularity = 1;
INSERT INTO t_sparse_pk VALUES (0, 'a'), (0, 'b'), (1, ''), (2, ''), (2, 'e'), (3, 'f'), (4, 'g');
SET force_primary_key = 1;