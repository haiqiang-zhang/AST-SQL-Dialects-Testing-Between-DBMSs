SET send_logs_level = 'fatal';
SELECT 'value vs value';
SELECT toInt8(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt8(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt16(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt32(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toInt64(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt8(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt16(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt32(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toUInt64(0) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toDate(0) AS x, toDate(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toDate('2000-01-01') AS x, toDateTime('2000-01-01 00:00:01', 'Asia/Istanbul') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x, toDate('2000-01-02') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT toDateTime(0, 'Asia/Istanbul') AS x, toDateTime(1, 'Asia/Istanbul') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT 'column vs value';
SELECT materialize(toInt8(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt8(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt16(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt32(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toInt64(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt8(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt16(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toFloat32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toFloat64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt32(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toUInt8(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toUInt16(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toUInt32(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toUInt64(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toDecimal32(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toDecimal64(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toUInt64(0)) AS x, toDecimal128(1, 0) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toDate(0)) AS x, toDate(1) AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toDate('2000-01-01')) AS x, toDateTime('2000-01-01 00:00:01', 'Asia/Istanbul') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x, toDate('2000-01-02') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
SELECT materialize(toDateTime(0, 'Asia/Istanbul')) AS x, toDateTime(1, 'Asia/Istanbul') AS y, ((x > y) ? x : y) AS z, toTypeName(x), toTypeName(y), toTypeName(z);
