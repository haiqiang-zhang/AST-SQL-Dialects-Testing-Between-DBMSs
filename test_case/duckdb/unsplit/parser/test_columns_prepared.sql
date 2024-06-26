PRAGMA enable_verification;
create or replace table my_table as
select 'test1' as column1, 1 as column2, 'quack' as column3
union all
select 'test2' as column1, 2 as column2, 'quacks' as column3
union all
select 'test3' as column1, 3 as column2, 'quacking' as column3;
prepare v1 as
select
	COLUMNS(?)
from my_table;
EXECUTE v1('col.*1');
EXECUTE v1('col.*2');
EXECUTE v1('col.*3');
EXECUTE v1(['column1', 'column2']);
