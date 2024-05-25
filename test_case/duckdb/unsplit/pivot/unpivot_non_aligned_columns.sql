PRAGMA enable_verification;
CREATE TABLE test(id BIGINT, metric_1 VARCHAR, value_x VARCHAR, metric_2 VARCHAR, value_q VARCHAR, metric_3 VARCHAR, value_j VARCHAR);
INSERT INTO test VALUES(1,'a','a_value','b','b_value','c','c_value');
INSERT INTO test VALUES(2,'d','d_value','e','e_value','f','f_value');
UNPIVOT test ON (metric_1, value_x), (metric_2, value_q), (metric_3, value_j) INTO NAME metric VALUES metric_value, metric_type;
