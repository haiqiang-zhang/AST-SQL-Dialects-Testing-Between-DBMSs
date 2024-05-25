SELECT roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).1, 16) as z_stat, roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).2, 16) as p_value, roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).3, 16) as ci_low, roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).4, 16) as ci_high FROM mean_ztest;
DROP TABLE IF EXISTS mean_ztest;
