SET send_logs_level = 'fatal';
SET replication_alter_partitions_sync = 2;
DROP TABLE IF EXISTS alter_compression_codec1;
DROP TABLE IF EXISTS alter_compression_codec2;
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
SET allow_suspicious_codecs = 1;
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
DROP TABLE IF EXISTS alter_compression_codec1;
DROP TABLE IF EXISTS alter_compression_codec2;
