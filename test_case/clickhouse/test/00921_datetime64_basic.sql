DROP TABLE IF EXISTS A;
SELECT CAST(1 as DateTime64('abc'));
SELECT CAST(1 as DateTime64(100));
SELECT CAST(1 as DateTime64(-1));
SELECT CAST(1 as DateTime64(3, 'qqq'));
SELECT toDateTime64('2019-09-16 19:20:11.234', 'abc');
SELECT toDateTime64('2019-09-16 19:20:11.234', 100);
SELECT toDateTime64(CAST([['CLb5Ph ']], 'String'), uniqHLL12('2Gs1V', 752));
SELECT toDateTime64('2019-09-16 19:20:11.234', 3, 'qqq');
SELECT ignore(now64(gccMurmurHash()));
SELECT ignore(now64('abcd'));
SELECT ignore(now64(number)) FROM system.numbers LIMIT 10;
SELECT ignore(now64(3, 'invalid timezone'));
SELECT ignore(now64(3, 1111));
WITH 'UTC' as timezone SELECT timezone, timeZoneOf(now64(3, timezone)) == timezone;
WITH 'Europe/Minsk' as timezone SELECT timezone, timeZoneOf(now64(3, timezone)) == timezone;
SELECT toDateTime64('2019-09-16 19:20:11', 3, 'UTC');
CREATE TABLE A(t DateTime64(3, 'UTC')) ENGINE = MergeTree() ORDER BY t;
INSERT INTO A(t) VALUES ('2019-05-03 11:25:25.123456789');
SELECT toString(t, 'UTC'), toDate(t), toStartOfDay(t), toStartOfQuarter(t), toTime(t), toStartOfMinute(t) FROM A ORDER BY t;
SELECT toDateTime64('2019-09-16 19:20:11.234', 3, 'Europe/Minsk');
DROP TABLE A;