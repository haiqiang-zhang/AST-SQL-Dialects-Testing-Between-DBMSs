select '12.7e1'::TINYINT, '-12.8e1'::TINYINT;
select '3276.7e1'::SMALLINT, '-3276.8e1'::SMALLINT;
select '214748364.7e1'::INTEGER, '-214748364.8e1'::INTEGER;
select '922337203685477580.7e1'::BIGINT, '-922337203685477580.8e1'::BIGINT;
select '17014118346046923173168730371588410572.7e1'::HUGEINT, '-17014118346046923173168730371588410572.8e1'::HUGEINT;
select '25.5e1'::UTINYINT;
select '6553.5e1'::USMALLINT;
select '429496729.5e1'::UINTEGER;
select '1844674407370955161.5e1'::UBIGINT;
select '34028236692093846346337460743176821145.5e1'::UHUGEINT;
select '0.00000000000000000000000000000009223372036854775807e50'::BIGINT;
select '-0.00000000000000000000000000000009223372036854775807e50'::BIGINT;
select '0.00000000000170141183460469231731687303715884105727e50'::HUGEINT;
select '-0.00000000000170141183460469231731687303715884105727e50'::HUGEINT;
select '15123456789e-32768'::int;
select '0e32767'::int;