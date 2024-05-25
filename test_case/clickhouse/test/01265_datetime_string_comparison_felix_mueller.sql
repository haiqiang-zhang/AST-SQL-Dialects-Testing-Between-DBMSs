SELECT
    toUnixTimestamp(timeBerlin),
    toUnixTimestamp(timeLA)
FROM tztest;
SELECT 1
FROM tztest
WHERE timeBerlin = '2019-05-06 12:00:00';
SELECT 1
FROM tztest
WHERE timeLA = '2019-05-06 12:00:00';
SELECT 1
FROM tztest
WHERE '2019-05-06 12:00:00' = timeBerlin;
DROP TABLE tztest;
