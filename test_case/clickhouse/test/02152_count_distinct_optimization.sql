set count_distinct_optimization=true;
select countDistinct(a) from table_02152;
select countDistinct(b) from table_02152;
select uniqExact(m) from (select number, (number / 2)::UInt64 as m from numbers(10));
select uniqExact(x) from numbers(10) group by number % 2 as x;
set count_distinct_optimization=false;
select countDistinct(a) from table_02152;
select countDistinct(b) from table_02152;
select uniqExact(m) from (select number, (number / 2)::UInt64 as m from numbers(10));
select uniqExact(x) from numbers(10) group by number % 2 as x;
drop table if exists table_02152;
