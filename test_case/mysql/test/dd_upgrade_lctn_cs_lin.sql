--   will use l_c_t_n = 2 instead, unless 0 was explicitly requested by the user,
--   in which case the server will fail with an error.
-- - l_c_t_n = 1 is supported with any file system case sensitivity.
-- - l_c_t_n = 2 on a case sensitive file system is not supported, the server will
--   use l_c_t_n = 0 instead, and there is a warning in error log.
--
-- Entities affected by l_c_t_n:
-- - Schema names.
-- - Table names.
--
-- There are six zip files containing data directories from 5.7 for the
-- following use cases regarding combinations of l_c_t_n and file system case
-- sensitivity (lctn2_cs and lctn0_ci are not supported, see above). For case
-- insensitive file systems, we also distinguish between Windows and MacOS
-- since there are some differences in the server implementation for these
-- two variants:
--
-- - data_57_lctn0_cs_lin
-- - data_57_lctn1_cs_lin
-- - data_57_lctn1_ci_mac
-- - data_57_lctn2_ci_mac
-- - data_57_lctn1_ci_win
-- - data_57_lctn2_ci_win
--
-- All zip files are created by running mtr with default options, setting the
-- relevant l_c_t_n, and then creating schemas and tables with the following
-- definitions:
--
-- CREATE SCHEMA Upper_s;
--   FOREIGN KEY (i) REFERENCES lower_s.Upper_fk_parent(i));
--   PARTITION BY RANGE(i)
--   PARTITIONS 2 (
--     PARTITION lower_p0 VALUES LESS THAN(0),
--     PARTITION lower_p1 VALUES LESS THAN MAXVALUE
--   );
--   PARTITION BY RANGE(i)
--   PARTITIONS 2 (
--     PARTITION lower_p0 VALUES LESS THAN(0),
--     PARTITION Upper_p1 VALUES LESS THAN MAXVALUE
--   );
--   PARTITION BY RANGE(i)
--   PARTITIONS 2 (
--     PARTITION lower_p0 VALUES LESS THAN(0),
--     PARTITION lower_p1 VALUES LESS THAN MAXVALUE
--   );
--   PARTITION BY RANGE(i)
--   PARTITIONS 2 (
--     PARTITION lower_p0 VALUES LESS THAN(0),
--     PARTITION Upper_p1 VALUES LESS THAN MAXVALUE
--   );