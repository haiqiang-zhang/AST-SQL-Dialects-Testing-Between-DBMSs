--                                             #
--  Prepared Statements test on InnoDB tables  #
--                                             #
--##############################################

--    
-- NOTE: PLEASE SEE ps_1general.test (bottom) 
--       BEFORE ADDING NEW TEST CASES HERE !!!

use test;


let $type= 'InnoDB' ;

-- source include/ps_query.inc
-- source include/ps_modify.inc
-- source include/ps_modify1.inc
-- source include/ps_conv.inc

drop table t1, t9;