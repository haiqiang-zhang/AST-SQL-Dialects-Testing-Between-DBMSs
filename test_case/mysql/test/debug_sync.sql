--                                                                      #
-- Testing of the Debug Sync Facility.                                  #
--                                                                      #
-- There is important documentation within sql/debug_sync.cc            #
--                                                                      #
-- Used objects in this test case:                                      #
-- p0 - synchronization point 0. Non-existent dummy sync point.         #
-- s1 - signal 1.                                                       #
-- s2 - signal 2.                                                       #
--                                                                      #
-- Creation:                                                            #
-- 2008-02-18 istruewing                                                #
--                                                                      #
--#######################################################################

--
-- We need the Debug Sync Facility.
--
--source include/have_debug_sync.inc

--
-- Preparative cleanup.
--
--disable_warnings
SET DEBUG_SYNC= 'RESET';
DROP TABLE IF EXISTS t1;

--
-- Show the special system variable.
-- It shows ON or OFF depending on the command line option --debug-sync.
-- The test case assumes it is ON (command line option present).
--
SHOW VARIABLES LIKE 'DEBUG_SYNC';

--
-- Syntax. Valid forms.
--
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6 EXECUTE 2';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6           HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2           EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2           EXECUTE 2';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2                     HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2';
SET DEBUG_SYNC='p0 SIGNAL s1                       EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1                       EXECUTE 2';
SET DEBUG_SYNC='p0 SIGNAL s1                                 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1';
SET DEBUG_SYNC='p0           WAIT_FOR s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0           WAIT_FOR s2 TIMEOUT 6 EXECUTE 2';
SET DEBUG_SYNC='p0           WAIT_FOR s2 TIMEOUT 6           HIT_LIMIT 3';
SET DEBUG_SYNC='p0           WAIT_FOR s2 TIMEOUT 6';
SET DEBUG_SYNC='p0           WAIT_FOR s2           EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0           WAIT_FOR s2           EXECUTE 2';
SET DEBUG_SYNC='p0           WAIT_FOR s2                     HIT_LIMIT 3';
SET DEBUG_SYNC='p0           WAIT_FOR s2';
SET DEBUG_SYNC='p0                                           HIT_LIMIT 3';
SET DEBUG_SYNC='p0 CLEAR';
SET DEBUG_SYNC='p0 TEST';
SET DEBUG_SYNC='RESET';

--
-- Syntax. Valid forms. Lower case.
--
set debug_sync='p0 signal s1 wait_for s2 timeout 6 execute 2 hit_limit 3';
set debug_sync='p0 signal s1 wait_for s2 timeout 6 execute 2';
set debug_sync='p0 signal s1 wait_for s2 timeout 6           hit_limit 3';
set debug_sync='p0 signal s1 wait_for s2 timeout 6';
set debug_sync='p0 signal s1 wait_for s2           execute 2 hit_limit 3';
set debug_sync='p0 signal s1 wait_for s2           execute 2';
set debug_sync='p0 signal s1 wait_for s2                     hit_limit 3';
set debug_sync='p0 signal s1 wait_for s2';
set debug_sync='p0 signal s1                       execute 2 hit_limit 3';
set debug_sync='p0 signal s1                       execute 2';
set debug_sync='p0 signal s1                                 hit_limit 3';
set debug_sync='p0 signal s1';
set debug_sync='p0           wait_for s2 timeout 6 execute 2 hit_limit 3';
set debug_sync='p0           wait_for s2 timeout 6 execute 2';
set debug_sync='p0           wait_for s2 timeout 6           hit_limit 3';
set debug_sync='p0           wait_for s2 timeout 6';
set debug_sync='p0           wait_for s2           execute 2 hit_limit 3';
set debug_sync='p0           wait_for s2           execute 2';
set debug_sync='p0           wait_for s2                     hit_limit 3';
set debug_sync='p0           wait_for s2';
set debug_sync='p0                                           hit_limit 3';
set debug_sync='p0 clear';
set debug_sync='p0 test';
set debug_sync='reset';

--
-- Syntax. Valid forms. Line wrap, leading, mid, trailing space.
--
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6
                EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='   p0 SIGNAL s1 WAIT_FOR s2';
SET DEBUG_SYNC='p0    SIGNAL    s1    WAIT_FOR    s2';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2   ';
SET DEBUG_SYNC='   p0 SIGNAL s1 WAIT_FOR s2   ';
SET DEBUG_SYNC='   p0    SIGNAL    s1    WAIT_FOR    s2   ';

--
-- Syntax. Invalid forms.
--
--error ER_PARSE_ERROR
SET DEBUG_SYNC='';
SET DEBUG_SYNC=' ';
SET DEBUG_SYNC='p0';
SET DEBUG_SYNC='p0                                          EXECUTE 2';
SET DEBUG_SYNC='p0                                TIMEOUT 6 EXECUTE 2';
SET DEBUG_SYNC='p0                                TIMEOUT 6';
SET DEBUG_SYNC='p0 WAIT_FOR s2 SIGNAL s1';
SET DEBUG_SYNC='p0 WAIT_FOR s2 SIGNAL s1           EXECUTE 2';
SET DEBUG_SYNC='p0 WAIT_FOR s2 SIGNAL s1 TIMEOUT 6 EXECUTE 2';
SET DEBUG_SYNC='p0 WAIT_FOR s2 SIGNAL s1 TIMEOUT 6';
SET DEBUG_SYNC='p0 WAIT_FOR s2 TIMEOUT 6 SIGNAL s1 EXECUTE 2';
SET DEBUG_SYNC='p0 WAIT_FOR s2 TIMEOUT 6 SIGNAL s1';
SET DEBUG_SYNC='p0 TIMEOUT 6 WAIT_FOR s2 EXECUTE 2';
SET DEBUG_SYNC='p0 TIMEOUT 6 WAIT_FOR s2';
SET DEBUG_SYNC='p0                  SIGNAL s1 TIMEOUT 6 EXECUTE 2';
SET DEBUG_SYNC='p0                  SIGNAL s1 TIMEOUT 6';
SET DEBUG_SYNC='p0 EXECUTE 2 SIGNAL s1 TIMEOUT 6';
SET DEBUG_SYNC='p0 TIMEOUT 6 SIGNAL s1';
SET DEBUG_SYNC='p0 EXECUTE 2 TIMEOUT 6 SIGNAL s1';
SET DEBUG_SYNC='p0 CLEAR HIT_LIMIT 3';
SET DEBUG_SYNC='CLEAR';
SET DEBUG_SYNC='p0 CLEAR p0';
SET DEBUG_SYNC='TEST';
SET DEBUG_SYNC='p0 TEST p0';
SET DEBUG_SYNC='p0 RESET';
SET DEBUG_SYNC='RESET p0';
SET DEBUG_SYNC='p0 RESET p0';
SET DEBUG_SYNC='p0 SIGNAL ';
SET DEBUG_SYNC='p0 WAIT_FOR ';
SET DEBUG_SYNC='p0 SIGNAL s1 EXECUTE ';

--
-- Syntax. Invalid keywords used.
--
--error ER_UNKNOWN_SYSTEM_VARIABLE
SET DEBUG_SYNCx='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAx s1 WAIT_FOR s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOx s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUx 0 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6 EXECUTx 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 SIGNAL s1 WAIT_FOR s2 TIMEOUT 6 EXECUTE 2 HIT_LIMIx 3';
SET DEBUG_SYNC='p0 CLEARx';
SET DEBUG_SYNC='p0 TESTx';
SET DEBUG_SYNC='RESETx';

--
-- Syntax. Invalid numbers. Decimal only.
--
--error ER_PARSE_ERROR
SET DEBUG_SYNC='p0 WAIT_FOR s2 TIMEOUT 0x6 EXECUTE 2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 WAIT_FOR s2 TIMEOUT 6 EXECUTE 0x2 HIT_LIMIT 3';
SET DEBUG_SYNC='p0 WAIT_FOR s2 TIMEOUT 7 EXECUTE 2 HIT_LIMIT 0x3';

--
-- Syntax. Invalid value type.
--
--error ER_WRONG_TYPE_FOR_VAR
SET DEBUG_SYNC= 7;

--
-- Syntax. DEBUG_SYNC is a SESSION-only variable.
--
--error ER_LOCAL_VARIABLE
SET GLOBAL DEBUG_SYNC= 'p0 CLEAR';

--
-- Syntax. The variable value does not need to be a string literal.
--
SET @myvar= 'now SIGNAL from_myvar';
SET DEBUG_SYNC= @myvar;
SET DEBUG_SYNC= LEFT('now SIGNAL from_function_cut_here', 24);

--
-- Functional tests.
--
-- NOTE: There is the special synchronization point 'now'. It is placed
--       immediately after setting of the DEBUG_SYNC variable.
--       So it is executed before the SET statement ends.
--
-- NOTE: There is only one global signal (say "signal post" or "flag mast").
--       A SIGNAL action writes its signal into it ("sets a flag").
--       The signal persists until explicitly overwritten.
--       To avoid confusion for later tests, it is recommended to clear
--       the signal by signalling "empty" ("setting the 'empty' flag"):
--       SET DEBUG_SYNC= 'now SIGNAL empty';
--       Preferably you can reset the whole facility with:
--       SET DEBUG_SYNC= 'RESET';
--       The signal is then '' (really empty) which connot be done otherwise.
--

--
-- Time out immediately. This gives just a warning.
--
SET DEBUG_SYNC= 'now SIGNAL something';
SET DEBUG_SYNC= 'now WAIT_FOR nothing TIMEOUT 0';
SET DEBUG_SYNC= 'now SIGNAL nothing';
SET DEBUG_SYNC= 'now WAIT_FOR nothing TIMEOUT 0';

--
-- EXECUTE 0 is effectively a no-op.
--
SET DEBUG_SYNC= 'now SIGNAL something EXECUTE 0';
SET DEBUG_SYNC= 'now WAIT_FOR anotherthing TIMEOUT 0 EXECUTE 0';

--
-- Run into HIT_LIMIT. This gives an error.
--
--error ER_DEBUG_SYNC_HIT_LIMIT
SET DEBUG_SYNC= 'now HIT_LIMIT 1';

--
-- Many actions. Watch the array growing and shrinking in the debug trace:
-- egrep 'query:|debug_sync_action:' mysql-test/var/log/master.trace
--
SET DEBUG_SYNC= 'RESET';
SET DEBUG_SYNC= 'p1abcd   SIGNAL s1 EXECUTE 2';
SET DEBUG_SYNC= 'p2abc    SIGNAL s2 EXECUTE 2';
SET DEBUG_SYNC= 'p9abcdef SIGNAL s9 EXECUTE 2';
SET DEBUG_SYNC= 'p4a      SIGNAL s4 EXECUTE 2';
SET DEBUG_SYNC= 'p5abcde  SIGNAL s5 EXECUTE 2';
SET DEBUG_SYNC= 'p6ab     SIGNAL s6 EXECUTE 2';
SET DEBUG_SYNC= 'p7       SIGNAL s7 EXECUTE 2';
SET DEBUG_SYNC= 'p8abcdef SIGNAL s8 EXECUTE 2';
SET DEBUG_SYNC= 'p3abcdef SIGNAL s3 EXECUTE 2';
SET DEBUG_SYNC= 'p4a      TEST';
SET DEBUG_SYNC= 'p1abcd   TEST';
SET DEBUG_SYNC= 'p7       TEST';
SET DEBUG_SYNC= 'p9abcdef TEST';
SET DEBUG_SYNC= 'p3abcdef TEST';
SET DEBUG_SYNC= 'p1abcd   CLEAR';
SET DEBUG_SYNC= 'p2abc    CLEAR';
SET DEBUG_SYNC= 'p5abcde  CLEAR';
SET DEBUG_SYNC= 'p6ab     CLEAR';
SET DEBUG_SYNC= 'p8abcdef CLEAR';
SET DEBUG_SYNC= 'p9abcdef CLEAR';
SET DEBUG_SYNC= 'p3abcdef CLEAR';
SET DEBUG_SYNC= 'p4a      CLEAR';
SET DEBUG_SYNC= 'p7       CLEAR';
SET DEBUG_SYNC= 'p1abcd   TEST';
SET DEBUG_SYNC= 'p7       TEST';
SET DEBUG_SYNC= 'p9abcdef TEST';
SET DEBUG_SYNC= 'RESET';

--
-- Facility requires SUPER privilege.
--
CREATE USER mysqltest_1@localhost;
SET DEBUG_SYNC= 'RESET';
DROP USER mysqltest_1@localhost;
CREATE USER mysqltest_2@localhost;
SET DEBUG_SYNC= 'RESET';
DROP USER mysqltest_2@localhost;

--
-- Example 1.
--
-- Preparative cleanup.
--disable_warnings
SET DEBUG_SYNC= 'RESET';
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (c1 INT);
    --echo connection con1
    connect (con1,localhost,root,,);
    SET DEBUG_SYNC= 'before_lock_tables_takes_lock
      SIGNAL opened WAIT_FOR flushed';
    send INSERT INTO t1 VALUES(1);
SET DEBUG_SYNC= 'now WAIT_FOR opened';
SET DEBUG_SYNC= 'after_flush_unlock SIGNAL flushed';
    --echo connection con1
    connection con1;
    reap;
    disconnect con1;
DROP TABLE t1;

--
-- Cleanup after test case.
-- Otherwise signal would contain 'flushed' here,
-- which could confuse the next test.
--
SET DEBUG_SYNC= 'RESET';