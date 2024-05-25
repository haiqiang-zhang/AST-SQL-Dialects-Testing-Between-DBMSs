SELECT name FROM system.table_functions WHERE length(description) < 10
AND name NOT IN (
    'cosn', 'oss', 'hdfs', 'hdfsCluster', 'hive', 'mysql', 'postgresql', 's3', 's3Cluster', 'sqlite', 'urlCluster' -- these functions are not enabled in fast test
) ORDER BY name;
