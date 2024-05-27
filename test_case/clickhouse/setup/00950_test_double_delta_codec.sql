DROP TABLE IF EXISTS codecTest;
CREATE TABLE codecTest (
    key      UInt64,
    ref_valueU64 UInt64,
    ref_valueU32 UInt32,
    ref_valueU16 UInt16,
    ref_valueU8  UInt8,
    ref_valueI64 Int64,
    ref_valueI32 Int32,
    ref_valueI16 Int16,
    ref_valueI8  Int8,
    ref_valueDT  DateTime,
    ref_valueD   Date,
    valueU64 UInt64   CODEC(DoubleDelta),
    valueU32 UInt32   CODEC(DoubleDelta),
    valueU16 UInt16   CODEC(DoubleDelta),
    valueU8  UInt8    CODEC(DoubleDelta),
    valueI64 Int64    CODEC(DoubleDelta),
    valueI32 Int32    CODEC(DoubleDelta),
    valueI16 Int16    CODEC(DoubleDelta),
    valueI8  Int8     CODEC(DoubleDelta),
    valueDT  DateTime CODEC(DoubleDelta),
    valueD   Date     CODEC(DoubleDelta)
) Engine = MergeTree ORDER BY key SETTINGS min_bytes_for_wide_part = 0, ratio_of_defaults_for_sparse_serialization = 1;
INSERT INTO codecTest (key, ref_valueU64, valueU64, ref_valueI64, valueI64)
    VALUES (1, 18446744073709551615, 18446744073709551615, 9223372036854775807, 9223372036854775807), (2, 0, 0, -9223372036854775808, -9223372036854775808), (3, 18446744073709551615, 18446744073709551615, 9223372036854775807, 9223372036854775807);
INSERT INTO codecTest (key, ref_valueU64, valueU64, ref_valueU32, valueU32, ref_valueU16, valueU16, ref_valueU8, valueU8, ref_valueI64, valueI64, ref_valueI32, valueI32, ref_valueI16, valueI16, ref_valueI8, valueI8, ref_valueDT, valueDT, ref_valueD, valueD)
    SELECT number as n, n * n * n as v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, toDateTime(v), toDateTime(v), toDate(v), toDate(v)
    FROM system.numbers LIMIT 101, 1000;
INSERT INTO codecTest (key, ref_valueU64, valueU64, ref_valueU32, valueU32, ref_valueU16, valueU16, ref_valueU8, valueU8, ref_valueI64, valueI64, ref_valueI32, valueI32, ref_valueI16, valueI16, ref_valueI8, valueI8, ref_valueDT, valueDT, ref_valueD, valueD)
    SELECT number as n, n as v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, toDateTime(v), toDateTime(v), toDate(v), toDate(v)
    FROM system.numbers LIMIT 2001, 1000;
INSERT INTO codecTest (key, ref_valueU64, valueU64, ref_valueU32, valueU32, ref_valueU16, valueU16, ref_valueU8, valueU8, ref_valueI64, valueI64, ref_valueI32, valueI32, ref_valueI16, valueI16, ref_valueI8, valueI8, ref_valueDT, valueDT, ref_valueD, valueD)
    SELECT number as n, n + (rand64() - 9223372036854775807)/1000 as v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, toDateTime(v), toDateTime(v), toDate(v), toDate(v)
    FROM system.numbers LIMIT 3001, 1000;