--               main code t/innodb_concurrent.test -> include/concurrent.inc
--               new wrapper t/concurrent_innodb.test
-- 2008-06-03 KP test refactored;
--               renamed wrapper t/concurrent_innodb.test ->
--                           t/concurrent_innodb_unsafelog.test
--               new wrapper t/concurrent_innodb_safelog.test
--


let $engine_type= InnoDB;

SET GLOBAL TRANSACTION ISOLATION LEVEL REPEATABLE READ;