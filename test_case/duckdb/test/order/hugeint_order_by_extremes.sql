PRAGMA enable_verification;
CREATE TABLE test (a hugeint);;
INSERT INTO test values ((-170141183460469231731687303715884105728)::hugeint), (-1111::hugeint), (-1::hugeint), (0::hugeint), (1::hugeint), (1111::hugeint);;
SELECT * FROM test order by a;;
SELECT * FROM test order by a DESC;;