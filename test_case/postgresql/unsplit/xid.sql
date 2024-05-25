select '010'::xid,
       '42'::xid,
       '0xffffffff'::xid,
       '-1'::xid,
	   '010'::xid8,
	   '42'::xid8,
	   '0xffffffffffffffff'::xid8,
	   '-1'::xid8;
SELECT pg_input_is_valid('42', 'xid');
SELECT pg_input_is_valid('asdf', 'xid');
SELECT * FROM pg_input_error_info('0xffffffffff', 'xid');
SELECT pg_input_is_valid('42', 'xid8');
SELECT pg_input_is_valid('asdf', 'xid8');
SELECT * FROM pg_input_error_info('0xffffffffffffffffffff', 'xid8');
select '1'::xid = '1'::xid;
select '1'::xid != '1'::xid;
select '1'::xid8 = '1'::xid8;
select '1'::xid8 != '1'::xid8;
select '1'::xid = '1'::xid8::xid;
select '1'::xid != '1'::xid8::xid;
select '1'::xid8 < '2'::xid8, '2'::xid8 < '2'::xid8, '2'::xid8 < '1'::xid8;
select '1'::xid8 <= '2'::xid8, '2'::xid8 <= '2'::xid8, '2'::xid8 <= '1'::xid8;
select '1'::xid8 > '2'::xid8, '2'::xid8 > '2'::xid8, '2'::xid8 > '1'::xid8;
select '1'::xid8 >= '2'::xid8, '2'::xid8 >= '2'::xid8, '2'::xid8 >= '1'::xid8;
select xid8cmp('1', '2'), xid8cmp('2', '2'), xid8cmp('2', '1');
create table xid8_t1 (x xid8);
insert into xid8_t1 values ('0'), ('010'), ('42'), ('0xffffffffffffffff'), ('-1');
select min(x), max(x) from xid8_t1;
create index on xid8_t1 using btree(x);
create index on xid8_t1 using hash(x);
drop table xid8_t1;
select '12:13:'::pg_snapshot;
select '12:18:14,16'::pg_snapshot;
select '12:16:14,14'::pg_snapshot;
select pg_input_is_valid('12:13:', 'pg_snapshot');
select pg_input_is_valid('31:12:', 'pg_snapshot');
select * from pg_input_error_info('31:12:', 'pg_snapshot');
select pg_input_is_valid('12:16:14,13', 'pg_snapshot');
select * from pg_input_error_info('12:16:14,13', 'pg_snapshot');
create temp table snapshot_test (
	nr	integer,
	snap	pg_snapshot
);
insert into snapshot_test values (1, '12:13:');
insert into snapshot_test values (2, '12:20:13,15,18');
insert into snapshot_test values (3, '100001:100009:100005,100007,100008');
insert into snapshot_test values (4, '100:150:101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131');
select snap from snapshot_test order by nr;
select  pg_snapshot_xmin(snap),
	pg_snapshot_xmax(snap),
	pg_snapshot_xip(snap)
from snapshot_test order by nr;
select id, pg_visible_in_snapshot(id::text::xid8, snap)
from snapshot_test, generate_series(11, 21) id
where nr = 2;
select id, pg_visible_in_snapshot(id::text::xid8, snap)
from snapshot_test, generate_series(90, 160) id
where nr = 4;
select pg_current_xact_id() >= pg_snapshot_xmin(pg_current_snapshot());
select pg_visible_in_snapshot(pg_current_xact_id(), pg_current_snapshot());
select pg_snapshot '1000100010001000:1000100010001100:1000100010001012,1000100010001013';
select pg_visible_in_snapshot('1000100010001012', '1000100010001000:1000100010001100:1000100010001012,1000100010001013');
select pg_visible_in_snapshot('1000100010001015', '1000100010001000:1000100010001100:1000100010001012,1000100010001013');
SELECT pg_snapshot '1:9223372036854775807:3';
BEGIN;
SELECT pg_current_xact_id_if_assigned() IS NULL;
COMMIT;
BEGIN;
COMMIT;
BEGIN;
CREATE FUNCTION test_future_xid_status(xid8)
RETURNS void
LANGUAGE plpgsql
AS
$$
BEGIN
  PERFORM pg_xact_status($1);
  RAISE EXCEPTION 'didn''t ERROR at xid in the future as expected';
EXCEPTION
  WHEN invalid_parameter_value THEN
    RAISE NOTICE 'Got expected error for xid in the future';
END;
$$;
ROLLBACK;