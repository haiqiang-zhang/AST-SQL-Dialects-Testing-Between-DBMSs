SELECT d::DATE FROM range(DATE '1992-01-01', DATE '1992-10-01', INTERVAL (1) MONTH) tbl(d);
SELECT * FROM range(date '1992-01-01', date '1992-01-01', interval '1' month);
SELECT d::DATE FROM generate_series(DATE '1992-01-01', DATE '1992-10-01', INTERVAL (1) MONTH) tbl(d);
SELECT d FROM range(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '1992-01-01 12:00:00', INTERVAL (1) HOUR) tbl(d);
SELECT * FROM range(timestamp '1992-01-01 00:00:00', timestamp '1992-01-01 00:00:00', interval '1' month);
SELECT * FROM range(timestamp '1992-01-01 00:00:00', timestamp '1992-01-01 00:00:01', interval '1' month);
SELECT d FROM range(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '1991-06-01 00:00:00', INTERVAL '1 MONTH ago') tbl(d);
SELECT d FROM generate_series(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '1991-06-01 00:00:00', -INTERVAL '1 MONTH') tbl(d);
SELECT d FROM range(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '1992-12-31 12:00:00', INTERVAL '1 MONTH 1 DAY 1 HOUR') tbl(d);
SELECT COUNT(*) FROM range(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '2020-01-01 00:00:00', INTERVAL '1 DAY') tbl(d);
SELECT COUNT(*) FROM generate_series(TIMESTAMP '1992-01-01 00:00:00', TIMESTAMP '2020-01-01 00:00:00', INTERVAL '1 DAY') tbl(d);