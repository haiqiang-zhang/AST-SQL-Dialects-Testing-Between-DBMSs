DROP TABLE IF EXISTS wrong_metadata;
SYSTEM STOP REPLICATION QUEUES wrong_metadata;
SYSTEM START REPLICATION QUEUES wrong_metadata;
DROP TABLE IF EXISTS wrong_metadata;
SYSTEM STOP REPLICATION QUEUES wrong_metadata_wide;
SYSTEM START REPLICATION QUEUES wrong_metadata_wide;
DROP TABLE IF EXISTS wrong_metadata_wide;
