SELECT toDate('2015-02-03') = '2015-02-03';
SELECT '2015-02-03' = toDate('2015-02-03');
SELECT toDate('2015-02-03') = '2015-02-04';
SELECT '2015-02-03' = toDate('2015-02-04');
SELECT toDate('2015-02-03') < '2015-02-04';
SELECT '2015-02-03' < toDate('2015-02-04');
SELECT toDate('2015-02-03') > '2015-02-04';
SELECT '2015-02-03' > toDate('2015-02-04');
SELECT toDate('2015-02-03') <= '2015-02-04';
SELECT '2015-02-03' <= toDate('2015-02-04');
SELECT toDate('2015-02-03') >= '2015-02-04';
SELECT '2015-02-03' >= toDate('2015-02-04');
SELECT toDate('2015-02-05') < '2015-02-04';
SELECT '2015-02-05' < toDate('2015-02-04');
SELECT toDate('2015-02-05') > '2015-02-04';
SELECT '2015-02-05' > toDate('2015-02-04');
SELECT toDate('2015-02-05') <= '2015-02-04';
SELECT '2015-02-05' <= toDate('2015-02-04');
SELECT toDate('2015-02-05') >= '2015-02-04';
SELECT '2015-02-05' >= toDate('2015-02-04');
SELECT materialize(toDate('2015-02-03')) = '2015-02-03';
SELECT '2015-02-03' = materialize(toDate('2015-02-03'));
SELECT materialize(toDate('2015-02-03')) = '2015-02-04';
SELECT '2015-02-03' = materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-03')) < '2015-02-04';
SELECT '2015-02-03' < materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-03')) > '2015-02-04';
SELECT '2015-02-03' > materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-03')) <= '2015-02-04';
SELECT '2015-02-03' <= materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-03')) >= '2015-02-04';
SELECT '2015-02-03' >= materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-05')) < '2015-02-04';
SELECT '2015-02-05' < materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-05')) > '2015-02-04';
SELECT '2015-02-05' > materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-05')) <= '2015-02-04';
SELECT '2015-02-05' <= materialize(toDate('2015-02-04'));
SELECT materialize(toDate('2015-02-05')) >= '2015-02-04';
SELECT '2015-02-05' >= materialize(toDate('2015-02-04'));
SELECT toDateTime('2015-02-03 04:05:06') = '2015-02-03 04:05:06';
SELECT '2015-02-03 04:05:06' = toDateTime('2015-02-03 04:05:06');
SELECT toDateTime('2015-02-03 04:05:06') = '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' = toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 04:05:06') < '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' < toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 04:05:06') > '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' > toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 04:05:06') <= '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' <= toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 04:05:06') >= '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' >= toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 06:07:08') < '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' < toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 06:07:08') > '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' > toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 06:07:08') <= '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' <= toDateTime('2015-02-03 05:06:07');
SELECT toDateTime('2015-02-03 06:07:08') >= '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' >= toDateTime('2015-02-03 05:06:07');
SELECT materialize(toDateTime('2015-02-03 04:05:06')) = '2015-02-03 04:05:06';
SELECT '2015-02-03 04:05:06' = materialize(toDateTime('2015-02-03 04:05:06'));
SELECT materialize(toDateTime('2015-02-03 04:05:06')) = '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' = materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 04:05:06')) < '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' < materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 04:05:06')) > '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' > materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 04:05:06')) <= '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' <= materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 04:05:06')) >= '2015-02-03 05:06:07';
SELECT '2015-02-03 04:05:06' >= materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 06:07:08')) < '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' < materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 06:07:08')) > '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' > materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 06:07:08')) <= '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' <= materialize(toDateTime('2015-02-03 05:06:07'));
SELECT materialize(toDateTime('2015-02-03 06:07:08')) >= '2015-02-03 05:06:07';
SELECT '2015-02-03 06:07:08' >= materialize(toDateTime('2015-02-03 05:06:07'));