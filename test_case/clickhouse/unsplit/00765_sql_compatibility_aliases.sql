SET send_logs_level = 'fatal';
select lcase('FOO');
select ucase('foo');
select LOWER('Foo');
select UPPER('Foo');
select REPLACE('bar', 'r', 'z');
select REGEXP_REPLACE('bar', '.', 'z');
select SUBSTRING('foo', 1, 2);
select Substr('foo', 2);
select mid('foo', 3);
select IF(3>2, 1, 0);
select substring('foo' from 1 + 1);
select SUBSTRING('foo' FROM 2 FOR 1);
select left('foo', 2);
select LEFT('foo', 123);
select RIGHT('bar', 1);
select right('bar', 123);
select ltrim('') || rtrim('') || trim('');
select ltrim('   foo');
select RTRIM('   foo   ');
select trim(TRAILING 'x' FROM 'xxfooxx');
select Trim(LEADING 'ab' FROM 'abbafooabba');
select TRIM(both 'ab' FROM 'abbafooabbafooabba');
select trim(LEADING '*[]{}|\\' FROM '\\|[[[}}}*foo*');
select DATE_DIFF(MONTH, toDate('2018-12-18'), toDate('2018-01-01'));
select DATE_DIFF(QQ, toDate('2018-12-18'), toDate('2018-01-01'));
select DATE_ADD(YEAR, 3, toDate('2018-01-01'));
select timestamp_sub(SQL_TSI_MONTH, 5, toDateTime('2018-12-18 01:02:03'));
select timestamp_ADD(toDate('2018-01-01'), INTERVAL 3 MONTH);
