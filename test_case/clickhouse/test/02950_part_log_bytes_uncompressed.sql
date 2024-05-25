OPTIMIZE TABLE part_log_bytes_uncompressed FINAL;
ALTER TABLE part_log_bytes_uncompressed UPDATE value = 3 WHERE 1 = 1 SETTINGS mutations_sync=2;
INSERT INTO part_log_bytes_uncompressed SELECT 3, 1 FROM numbers(1000);
ALTER TABLE part_log_bytes_uncompressed DROP PART 'all_4_4_0' SETTINGS mutations_sync=2;
SYSTEM FLUSH LOGS;
DROP TABLE part_log_bytes_uncompressed;
