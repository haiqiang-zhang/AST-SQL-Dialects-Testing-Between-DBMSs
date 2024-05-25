
set send_logs_level='error';
set database_atomic_wait_for_drop_and_detach_synchronously=1;
drop table if exists rep_fsync_r1;
drop table if exists rep_fsync_r2;
select 'default';
select 'compact fsync_after_insert';
select 'compact fsync_after_insert,fsync_part_directory';
select 'wide fsync_after_insert';
select 'wide fsync_after_insert,fsync_part_directory';
select 'wide fsync_part_directory,vertical';
