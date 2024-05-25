

DROP TABLE IF EXISTS execute_on_single_replica_r1 SYNC;
DROP TABLE IF EXISTS execute_on_single_replica_r2 SYNC;
SET optimize_throw_if_noop=1;
SELECT '****************************';
SELECT '*** emulate normal feature operation - merges are distributed between replicas';
SELECT '****************************';
SELECT '*** emulate execute_merges_on_single_replica_time_threshold timeout';
SYSTEM STOP REPLICATION QUEUES execute_on_single_replica_r2;
SET function_sleep_max_microseconds_per_block = 10000000;
SELECT '****************************';
SELECT '*** timeout not exceeded, r1 waits for r2';
SELECT '****************************';
SELECT '*** timeout exceeded, r1 failed to get the merged part from r2 and did the merge by its own';
SYSTEM START REPLICATION QUEUES execute_on_single_replica_r2;
SELECT '****************************';
SELECT '*** queue unfreeze';
SELECT '****************************';
SELECT '*** disable the feature';
SET replication_alter_partitions_sync=2;
SYSTEM FLUSH LOGS;
SELECT '****************************';
SELECT '*** part_log';
