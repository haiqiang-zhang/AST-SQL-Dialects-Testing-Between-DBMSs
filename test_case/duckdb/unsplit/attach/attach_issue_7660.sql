PRAGMA enable_verification;
attach ':memory:' as test;
use test;
create table tbl1 as select 1 as a;
export database '__TEST_DIR__/test_issue_7660';
FROM test.tbl1;
FROM tbl1;
