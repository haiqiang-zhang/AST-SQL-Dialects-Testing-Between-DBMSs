SET DateStyle = 'Postgres, MDY';
SHOW TimeZone;
set datestyle to dmy;
reset datestyle;
SELECT timestamp with time zone 'J2452271+08';
SELECT timestamp with time zone 'J2452271-08';
SELECT timestamp with time zone 'J2452271.5+08';
SELECT timestamp with time zone 'J2452271.5-08';
SELECT timestamp with time zone 'J2452271 04:05:06+08';
SELECT timestamp with time zone 'J2452271 04:05:06-08';
SELECT timestamp with time zone 'J2452271T040506+08';
SELECT timestamp with time zone 'J2452271T040506-08';
SELECT timestamp with time zone 'J2452271T040506.789+08';
SELECT timestamp with time zone 'J2452271T040506.789-08';
SELECT timestamp with time zone '12.27.2001 04:05:06.789+08';
SELECT timestamp with time zone '12.27.2001 04:05:06.789-08';
SET DateStyle = 'German';
SET DateStyle = 'ISO';
SELECT time without time zone '040506.789+08';
SELECT time without time zone '040506.789-08';
SELECT time without time zone 'T040506.789+08';
SELECT time without time zone 'T040506.789-08';
SELECT time with time zone '040506.789+08';
SELECT time with time zone '040506.789-08';
SELECT time with time zone 'T040506.789+08';
SELECT time with time zone 'T040506.789-08';
SELECT time with time zone 'T040506.789 +08';
SELECT time with time zone 'T040506.789 -08';
SELECT time with time zone '2001-12-27 T040506.789 America/Los_Angeles';
SELECT time with time zone 'J2452271 T040506.789 America/Los_Angeles';
SET DateStyle = 'Postgres, MDY';
SELECT timestamp without time zone '12/31/294276' - timestamp without time zone '12/23/1999' AS "106751991 Days";
SELECT (timestamp without time zone 'today' = (timestamp without time zone 'yesterday' + interval '1 day')) as "True";
SELECT (timestamp without time zone 'today' = (timestamp without time zone 'tomorrow' - interval '1 day')) as "True";
SELECT (timestamp without time zone 'today 10:30' = (timestamp without time zone 'yesterday' + interval '1 day 10 hr 30 min')) as "True";
SELECT (timestamp without time zone '10:30 today' = (timestamp without time zone 'yesterday' + interval '1 day 10 hr 30 min')) as "True";
SELECT (timestamp without time zone 'tomorrow' = (timestamp without time zone 'yesterday' + interval '2 days')) as "True";
SELECT (timestamp without time zone 'tomorrow 16:00:00' = (timestamp without time zone 'today' + interval '1 day 16 hours')) as "True";
SELECT (timestamp without time zone '16:00:00 tomorrow' = (timestamp without time zone 'today' + interval '1 day 16 hours')) as "True";
SELECT (timestamp without time zone 'yesterday 12:34:56' = (timestamp without time zone 'tomorrow' - interval '2 days - 12:34:56')) as "True";
SELECT (timestamp without time zone '12:34:56 yesterday' = (timestamp without time zone 'tomorrow' - interval '2 days - 12:34:56')) as "True";
SELECT (timestamp without time zone 'tomorrow' > 'now') as "True";
SELECT (timestamp with time zone 'today' = (timestamp with time zone 'yesterday' + interval '1 day')) as "True";
SELECT (timestamp with time zone 'today' = (timestamp with time zone 'tomorrow' - interval '1 day')) as "True";
SELECT (timestamp with time zone 'tomorrow' = (timestamp with time zone 'yesterday' + interval '2 days')) as "True";
SELECT (timestamp with time zone 'tomorrow' > 'now') as "True";
SET TIME ZONE 'CST7CDT,M4.1.0,M10.5.0';
RESET TIME ZONE;
SELECT CAST(time '01:02' AS interval) AS "+01:02";
SELECT CAST(interval '02:03' AS time) AS "02:03:00";
SELECT CAST(interval '-02:03' AS time) AS "21:57:00";
SELECT time '01:30' + interval '02:01' AS "03:31:00";
SELECT time '01:30' - interval '02:01' AS "23:29:00";
SELECT time '02:30' + interval '36:01' AS "14:31:00";
SELECT time '03:30' + interval '1 month 04:01' AS "07:31:00";
SELECT time with time zone '01:30-08' - interval '02:01' AS "23:29:00-08";
SELECT time with time zone '02:30-08' + interval '36:01' AS "14:31:00-08";
SELECT CAST(CAST(date 'today' + time with time zone '05:30'
            + interval '02:01' AS time with time zone) AS time) AS "07:31:00";
SELECT CAST(cast(date 'today' + time with time zone '03:30'
  + interval '1 month 04:01' as timestamp without time zone) AS time) AS "07:31:00";
SELECT (timestamp with time zone '2000-11-27', timestamp with time zone '2000-11-28')
  OVERLAPS (timestamp with time zone '2000-11-27 12:00', timestamp with time zone '2000-11-30') AS "True";
SELECT (timestamp with time zone '2000-11-26', timestamp with time zone '2000-11-27')
  OVERLAPS (timestamp with time zone '2000-11-27 12:00', timestamp with time zone '2000-11-30') AS "False";
SELECT (timestamp with time zone '2000-11-27', timestamp with time zone '2000-11-28')
  OVERLAPS (timestamp with time zone '2000-11-27 12:00', interval '1 day') AS "True";
SELECT (timestamp with time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp with time zone '2000-11-27 12:00', timestamp with time zone '2000-11-30') AS "False";
SELECT (timestamp with time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp with time zone '2000-11-27', interval '12 hours') AS "True";
SELECT (timestamp with time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp with time zone '2000-11-27 12:00', interval '12 hours') AS "False";
SELECT (timestamp without time zone '2000-11-27', timestamp without time zone '2000-11-28')
  OVERLAPS (timestamp without time zone '2000-11-27 12:00', timestamp without time zone '2000-11-30') AS "True";
SELECT (timestamp without time zone '2000-11-26', timestamp without time zone '2000-11-27')
  OVERLAPS (timestamp without time zone '2000-11-27 12:00', timestamp without time zone '2000-11-30') AS "False";
SELECT (timestamp without time zone '2000-11-27', timestamp without time zone '2000-11-28')
  OVERLAPS (timestamp without time zone '2000-11-27 12:00', interval '1 day') AS "True";
SELECT (timestamp without time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp without time zone '2000-11-27 12:00', timestamp without time zone '2000-11-30') AS "False";
SELECT (timestamp without time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp without time zone '2000-11-27', interval '12 hours') AS "True";
SELECT (timestamp without time zone '2000-11-27', interval '12 hours')
  OVERLAPS (timestamp without time zone '2000-11-27 12:00', interval '12 hours') AS "False";
SELECT (time '00:00', time '01:00')
  OVERLAPS (time '00:30', time '01:30') AS "True";
SELECT (time '00:00', interval '1 hour')
  OVERLAPS (time '00:30', interval '1 hour') AS "True";
SELECT (time '00:00', interval '1 hour')
  OVERLAPS (time '01:30', interval '1 hour') AS "False";
SELECT (time '00:00', interval '1 hour')
  OVERLAPS (time '01:30', interval '1 day') AS "False";
CREATE TABLE TEMP_TIMESTAMP (f1 timestamp with time zone);
SELECT f1 AS "timestamp"
  FROM TEMP_TIMESTAMP
  ORDER BY "timestamp";
SELECT d.f1 AS "timestamp",
   timestamp with time zone '1980-01-06 00:00 GMT' AS gpstime_zero,
   d.f1 - timestamp with time zone '1980-01-06 00:00 GMT' AS difference
  FROM TEMP_TIMESTAMP d
  ORDER BY difference;
SELECT d1.f1 AS timestamp1, d2.f1 AS timestamp2, d1.f1 - d2.f1 AS difference
  FROM TEMP_TIMESTAMP d1, TEMP_TIMESTAMP d2
  ORDER BY timestamp1, timestamp2, difference;
SELECT f1 AS "timestamp", date(f1) AS date
  FROM TEMP_TIMESTAMP
  WHERE f1 <> timestamp 'now'
  ORDER BY date, "timestamp";
DROP TABLE TEMP_TIMESTAMP;
SELECT '2202020-10-05'::date > '2020-10-05'::timestamp as t;
SELECT '2020-10-05'::timestamp > '2202020-10-05'::date as f;
SELECT '2202020-10-05'::date > '2020-10-05'::timestamptz as t;
SELECT '2020-10-05'::timestamptz > '2202020-10-05'::date as f;
SET TimeZone = 'UTC-2';
SELECT '4714-11-24 BC'::date < '2020-10-05'::timestamptz as t;
SELECT '2020-10-05'::timestamptz >= '4714-11-24 BC'::date as t;
SELECT '4714-11-24 BC'::timestamp < '2020-10-05'::timestamptz as t;
SELECT '2020-10-05'::timestamptz >= '4714-11-24 BC'::timestamp as t;
RESET TimeZone;
SET DateStyle TO 'US,Postgres';
SHOW DateStyle;
SET DateStyle TO 'US,ISO';
SET DateStyle TO 'US,SQL';
SHOW DateStyle;
SET DateStyle TO 'European,Postgres';
SHOW DateStyle;
SET DateStyle TO 'European,ISO';
SHOW DateStyle;
SET DateStyle TO 'European,SQL';
SHOW DateStyle;
RESET DateStyle;
SELECT to_timestamp('2011$03!18 23_38_15', 'YYYY-MM-DD HH24:MI:SS');
SELECT to_timestamp('1985 January 12', 'YYYY FMMonth DD');
SELECT to_timestamp('1985 FMMonth 12', 'YYYY "FMMonth" DD');
SELECT to_timestamp('1985 \ 12', 'YYYY \\ DD');
SELECT to_timestamp('My birthday-> Year: 1976, Month: May, Day: 16',
                    '"My birthday-> Year:" YYYY, "Month:" FMMonth, "Day:" DD');
SELECT to_timestamp('1,582nd VIII 21', 'Y,YYYth FMRM DD');
SELECT to_timestamp('15 "text between quote marks" 98 54 45',
                    E'HH24 "\\"text between quote marks\\"" YY MI SS');
SELECT to_timestamp('05121445482000', 'MMDDHH24MISSYYYY');
SELECT to_timestamp('2000January09Sunday', 'YYYYFMMonthDDFMDay');
SELECT to_timestamp('97/Feb/16', 'YY:Mon:DD');
SELECT to_timestamp('97/Feb/16', 'FXYY:Mon:DD');
SELECT to_timestamp('97/Feb/16', 'FXYY/Mon/DD');
SELECT to_timestamp('19971116', 'YYYYMMDD');
SELECT to_timestamp('1997 AD 11 16', 'YYYY BC MM DD');
SELECT to_timestamp('1997 A.D. 11 16', 'YYYY B.C. MM DD');
SELECT to_timestamp('9-1116', 'Y-MMDD');
SELECT to_timestamp('95-1116', 'YY-MMDD');
SELECT to_timestamp('995-1116', 'YYY-MMDD');
SELECT to_timestamp('2005426', 'YYYYWWD');
SELECT to_timestamp('2005300', 'YYYYDDD');
SELECT to_timestamp('2005527', 'IYYYIWID');
SELECT to_timestamp('005527', 'IYYIWID');
SELECT to_timestamp('05527', 'IYIWID');
SELECT to_timestamp('5527', 'IIWID');
SELECT to_timestamp('2005364', 'IYYYIDDD');
SELECT to_timestamp('20050302', 'YYYYMMDD');
SELECT to_timestamp('2005 03 02', 'YYYYMMDD');
SELECT to_timestamp(' 2005 03 02', 'YYYYMMDD');
SELECT to_timestamp('  20050302', 'YYYYMMDD');
SELECT to_timestamp('2011-12-18 11:38 AM', 'YYYY-MM-DD HH12:MI PM');
SELECT to_timestamp('2011-12-18 11:38 PM', 'YYYY-MM-DD HH12:MI PM');
SELECT to_timestamp('2011-12-18 11:38 A.M.', 'YYYY-MM-DD HH12:MI P.M.');
SELECT to_timestamp('2011-12-18 11:38 P.M.', 'YYYY-MM-DD HH12:MI P.M.');
SELECT to_timestamp('2011-12-18 11:38 +05',    'YYYY-MM-DD HH12:MI TZH');
SELECT to_timestamp('2011-12-18 11:38 -05',    'YYYY-MM-DD HH12:MI TZH');
SELECT to_timestamp('2011-12-18 11:38 +05:20', 'YYYY-MM-DD HH12:MI TZH:TZM');
SELECT to_timestamp('2011-12-18 11:38 -05:20', 'YYYY-MM-DD HH12:MI TZH:TZM');
SELECT to_timestamp('2011-12-18 11:38 20',     'YYYY-MM-DD HH12:MI TZM');
SELECT to_timestamp('2018-11-02 12:34:56.025', 'YYYY-MM-DD HH24:MI:SS.MS');
SELECT i, to_timestamp('2018-11-02 12:34:56', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.1', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.12', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.123', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.1234', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.12345', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT i, to_timestamp('2018-11-02 12:34:56.123456', 'YYYY-MM-DD HH24:MI:SS.FF' || i) FROM generate_series(1, 6) i;
SELECT to_date('1 4 1902', 'Q MM YYYY');
SELECT to_date('3 4 21 01', 'W MM CC YY');
SELECT to_date('2458872', 'J');
SELECT to_date('-44-02-01 BC','YYYY-MM-DD BC');
SELECT to_timestamp('-44-02-01 11:12:13 BC','YYYY-MM-DD HH24:MI:SS BC');
SELECT to_timestamp('2011-12-18 23:38:15', 'YYYY-MM-DD  HH24:MI:SS');
SELECT to_timestamp('2011-12-18  23:38:15', 'YYYY-MM-DD  HH24:MI:SS');
SELECT to_timestamp('2011-12-18   23:38:15', 'YYYY-MM-DD  HH24:MI:SS');
SELECT to_timestamp('2011-12-18  23:38:15', 'YYYY-MM-DD HH24:MI:SS');
SELECT to_timestamp('2011-12-18  23:38:15', 'YYYY-MM-DD  HH24:MI:SS');
SELECT to_timestamp('2011-12-18  23:38:15', 'YYYY-MM-DD   HH24:MI:SS');
SELECT to_timestamp('2000+   JUN', 'YYYY/MON');
SELECT to_timestamp('  2000 +JUN', 'YYYY/MON');
SELECT to_timestamp(' 2000 +JUN', 'YYYY//MON');
SELECT to_timestamp('2000  +JUN', 'YYYY//MON');
SELECT to_timestamp('2000 + JUN', 'YYYY MON');
SELECT to_timestamp('2000 ++ JUN', 'YYYY  MON');
SELECT to_timestamp('2000 + + JUN', 'YYYY   MON');
SELECT to_timestamp('2000 -10', 'YYYY TZH');
SELECT to_timestamp('2000 -10', 'YYYY  TZH');
SELECT to_date('2011 12  18', 'YYYY MM DD');
SELECT to_date('2011 12  18', 'YYYY MM  DD');
SELECT to_date('2011 12  18', 'YYYY MM   DD');
SELECT to_date('2011 12 18', 'YYYY  MM DD');
SELECT to_date('2011  12 18', 'YYYY  MM DD');
SELECT to_date('2011   12 18', 'YYYY  MM DD');
SELECT to_date('2011 12 18', 'YYYYxMMxDD');
SELECT to_date('2011x 12x 18', 'YYYYxMMxDD');
SELECT to_timestamp('Fri 1-Jan-1999', 'DY DD MON YYYY');
SELECT to_timestamp('2016-06-13 15:50:55', 'YYYY-MM-DD HH24:MI:SS');
SELECT to_timestamp('2016-02-29 15:50:55', 'YYYY-MM-DD HH24:MI:SS');
SELECT to_timestamp('2015-02-11 86000', 'YYYY-MM-DD SSSS');
SELECT to_timestamp('2015-02-11 86000', 'YYYY-MM-DD SSSSS');
SELECT to_date('2016-02-29', 'YYYY-MM-DD');
SELECT to_date('2015 365', 'YYYY DDD');
SELECT to_date('2016 365', 'YYYY DDD');
SELECT to_date('2016 366', 'YYYY DDD');
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD HH:MI:SS TZ');
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD HH:MI:SS tz');
SET TIME ZONE 'America/New_York';
SET TIME ZONE '-1.5';
SHOW TIME ZONE;
SELECT '2012-12-12 12:00'::timestamptz;
SELECT '2012-12-12 12:00 America/New_York'::timestamptz;
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD HH:MI:SS TZ');
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD SSSS');
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD SSSSS');
SET TIME ZONE '+2';
SELECT to_char('2012-12-12 12:00'::timestamptz, 'YYYY-MM-DD HH:MI:SS TZ');
RESET TIME ZONE;
