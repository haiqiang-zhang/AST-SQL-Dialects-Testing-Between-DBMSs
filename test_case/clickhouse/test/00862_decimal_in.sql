SELECT * FROM temp WHERE x IN (toDecimal128(128, 1));
SELECT * FROM temp WHERE x IN (toDecimal128(128, 2));
SELECT * FROM temp WHERE x IN (toDecimal128(128, 3));
SELECT * FROM temp WHERE y IN (toDecimal128(128, 1));
SELECT * FROM temp WHERE y IN (toDecimal128(128, 2));
SELECT * FROM temp WHERE y IN (toDecimal128(128, 3));
SELECT * FROM temp WHERE x IN (toDecimal32(32, 1));
SELECT * FROM temp WHERE x IN (toDecimal32(32, 2));
SELECT * FROM temp WHERE x IN (toDecimal32(32, 3));
SELECT * FROM temp WHERE y IN (toDecimal32(32, 1));
SELECT * FROM temp WHERE y IN (toDecimal32(32, 2));
SELECT * FROM temp WHERE y IN (toDecimal32(32, 3));
SELECT * FROM temp WHERE x IN (toDecimal64(64, 1));
SELECT * FROM temp WHERE x IN (toDecimal64(64, 2));
SELECT * FROM temp WHERE x IN (toDecimal64(64, 3));
SELECT * FROM temp WHERE y IN (toDecimal64(64, 1));
SELECT * FROM temp WHERE y IN (toDecimal64(64, 2));
SELECT * FROM temp WHERE y IN (toDecimal64(64, 3));
SELECT * FROM temp WHERE x IN (toDecimal256(256, 1));
SELECT * FROM temp WHERE x IN (toDecimal256(256, 2));
SELECT * FROM temp WHERE x IN (toDecimal256(256, 3));
SELECT * FROM temp WHERE y IN (toDecimal256(256, 1));
SELECT * FROM temp WHERE y IN (toDecimal256(256, 2));
SELECT * FROM temp WHERE y IN (toDecimal256(256, 3));
DROP TABLE IF EXISTS temp;
