SET max_parallel_replicas=3, allow_experimental_parallel_reading_from_replicas=1, cluster_for_parallel_replicas='parallel_replicas';
SET parallel_replicas_for_non_replicated_merge_tree = 1;
SET allow_experimental_parallel_reading_from_replicas=2;
DROP TABLE IF EXISTS parallel_replicas_final;
