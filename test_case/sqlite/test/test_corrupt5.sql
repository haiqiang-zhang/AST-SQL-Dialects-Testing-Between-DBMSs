CREATE INDEX i1 ON t1(a,b);
PRAGMA writable_schema=ON;
UPDATE sqlite_master SET name=NULL, sql=NULL WHERE name='i1';
SELECT * FROM t1;
