SELECT * FROM system.warnings where message in ('The number of attached tables is more than 5', 'The number of attached databases is more than 2', 'The number of active parts is more than 10');
DROP DATABASE IF EXISTS test_max_num_to_warn_02931;
DROP DATABASE IF EXISTS test_max_num_to_warn_1;
DROP DATABASE IF EXISTS test_max_num_to_warn_2;
DROP DATABASE IF EXISTS test_max_num_to_warn_3;
DROP DATABASE IF EXISTS test_max_num_to_warn_4;
DROP DATABASE IF EXISTS test_max_num_to_warn_5;
DROP DATABASE IF EXISTS test_max_num_to_warn_6;
DROP DATABASE IF EXISTS test_max_num_to_warn_7;
DROP DATABASE IF EXISTS test_max_num_to_warn_8;
DROP DATABASE IF EXISTS test_max_num_to_warn_9;
DROP DATABASE IF EXISTS test_max_num_to_warn_10;
DROP DATABASE IF EXISTS test_max_num_to_warn_11;
