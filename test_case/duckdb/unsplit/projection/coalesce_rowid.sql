PRAGMA enable_verification;
create table tbl as select case when i%2=0 then null else i end as i from range(10) tbl(i);
select i, coalesce(rowid+i, rowid) from tbl ORDER BY rowid;
select i, rowid, rowid+i, COALESCE(rowid+i, NULL) IS NULL OR rowid+3=6 from tbl ORDER BY rowid;
