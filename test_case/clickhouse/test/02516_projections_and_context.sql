DROP TABLE IF EXISTS test1__fuzz_37;
CREATE TABLE test1__fuzz_37 (`i` Date) ENGINE = MergeTree ORDER BY i;
insert into test1__fuzz_37 values ('2020-10-10');
set allow_experimental_analyzer = 0;
set allow_experimental_analyzer = 1;
DROP TABLE test1__fuzz_37;