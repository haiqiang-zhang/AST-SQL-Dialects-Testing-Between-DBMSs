SET insert_keeper_fault_injection_probability=0;
drop table if exists rmt2;
system stop replicated sends rmt1;
system start replicated sends rmt1;
set receive_timeout=5;
set receive_timeout=300;
system stop replicated sends rmt2;
system start replicated sends rmt2;
set receive_timeout=5;
set receive_timeout=300;
system stop fetches rmt1;
system start fetches rmt1;
system stop replicated sends rmt1;
system start replicated sends rmt1;
set receive_timeout=5;
set receive_timeout=300;
system stop fetches rmt2;
system start fetches rmt2;
system stop replicated sends rmt2;
system start replicated sends rmt2;
