SET insert_keeper_fault_injection_probability=0;
system flush logs;
select 'log';
select 'parts';
select 'blocks';
system flush logs;
select 'duration_microseconds';