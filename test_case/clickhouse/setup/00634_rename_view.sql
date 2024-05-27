DROP TABLE IF EXISTS test1_00634;
DROP TABLE IF EXISTS test2_00634;
DROP TABLE IF EXISTS v_test1;
DROP TABLE IF EXISTS v_test2;
DROP TABLE IF EXISTS v_test11;
DROP TABLE IF EXISTS v_test22;
create table test1_00634 (id UInt8) engine = TinyLog;
create table test2_00634 (id UInt8) engine = TinyLog;
create view v_test1 as select id from test1_00634;
create view v_test2 as select id from test2_00634;