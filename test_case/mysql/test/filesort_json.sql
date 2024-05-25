SELECT
table3 . `col_varchar_255_utf8_key` AS field1 ,
table2 . `col_varchar_255_latin1_key` AS field3 ,
table3 . `col_varchar_255_latin1` AS field4 ,
JSON_EXTRACT(JSON_ARRAY(table3. `col_date_key`), CONCAT('$[',0,']' )) AS field5
FROM  H AS table1
LEFT JOIN  H AS table2
LEFT OUTER JOIN F AS table3
ON  table2 . `pk` <  table3 . `col_int_key`
ON  table1 . `pk` =  table3 . `pk`
WHERE    table1.`col_varchar_255_utf8_key` >= table3.`col_varchar_10_utf8`
GROUP BY
field1, field3, field4, field5;
DROP TABLE F, H;
CREATE TABLE t1 (
  pk INTEGER,
  j JSON
);
DROP TABLE t1;
