SET mutations_sync = 0;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Delete 100K rows using lightweight DELETE';
DELETE FROM lwd_test WHERE id < 100000;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Force merge to cleanup deleted rows';
OPTIMIZE TABLE lwd_test FINAL SETTINGS mutations_sync = 2;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Delete 100K more rows using lightweight DELETE';
DELETE FROM lwd_test WHERE id < 200000;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Do UPDATE mutation';
ALTER TABLE lwd_test UPDATE value = 'v' WHERE id % 2 == 0 SETTINGS mutations_sync = 2;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Force merge to cleanup deleted rows';
OPTIMIZE TABLE lwd_test FINAL SETTINGS mutations_sync = 2;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Delete 100K more rows using lightweight DELETE';
DELETE FROM lwd_test WHERE id < 300000;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Do ALTER DELETE mutation that does a "heavyweight" delete';
ALTER TABLE lwd_test DELETE WHERE id % 3 == 0 SETTINGS mutations_sync = 2;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
SELECT 'Delete 100K more rows using lightweight DELETE';
DELETE FROM lwd_test WHERE id >= 300000 and id < 400000;
SELECT 'Force merge to cleanup deleted rows';
OPTIMIZE TABLE lwd_test FINAL SETTINGS mutations_sync = 2;
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test' AND active;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
DROP TABLE lwd_test;
