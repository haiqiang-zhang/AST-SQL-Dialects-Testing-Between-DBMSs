-- Regression test for possible CHECKSUM_DOESNT_MATCH due to per-column TTL bug.
-- That had been fixed in https://github.com/ClickHouse/ClickHouse/pull/35820

drop table if exists ttl_02265;
drop table if exists ttl_02265_r2;
system flush logs;
