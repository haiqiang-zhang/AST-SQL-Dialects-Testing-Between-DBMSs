CALL dbgen(sf=0.001);
PRAGMA enable_verification;
PRAGMA verify_external;
SELECT quantile_disc(0.1::decimal(4,1), [0.1, 0.5, 0.9]);
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "l_extendedprice") FROM lineitem;
SET default_null_order='nulls_first';