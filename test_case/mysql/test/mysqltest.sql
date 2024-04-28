
-- ----------------------------------------------------------------------------
-- $mysql_errno contains the return code of the last command
-- sent to the server.
-- ----------------------------------------------------------------------------
-- get $mysql_errno before the first statement
--     $mysql_errno should be -1
-- get $mysql_errname as well

echo $mysql_errno before test;

-- source include/have_log_bin.inc

-- This test uses chmod, can't be run with root permissions
-- source include/not_as_root.inc

-- Save the initial number of concurrent sessions
--source include/count_sessions.inc

-- ============================================================================
--
-- Test of mysqltest itself
--
-- There are three rules that determines what belong to each command
-- 1. A normal command is delimited by the <delimiter> which by default is
--    set to ';
--   ex: | select *
--       |   from t1;
--       |
--   Command: "select * from t1"
--
-- 2. Special case is a line that starts with "--", this is a comment
--    ended when the new line character is reached. But the first word
--    in the comment may contain a valid command, which then will be
--    executed. This can be useful when sending commands that
--    contains <delimiter>
--
-- 3. Special case is also a line that starts with '#' which is treated
--     as a comment and will be ended by new line character
--
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Positive case(statement)
-- ----------------------------------------------------------------------------

select otto from (select 1 as otto) as t1;
select otto from (select 1 as otto) as t1;

-- ----------------------------------------------------------------------------
-- Negative case(statement):
-- The derived table t1 does not contain a column named 'friedrich' .
-- --> ERROR 42S22: Unknown column 'friedrich' in 'field list and
-- --> 1054: Unknown column 'friedrich' in 'field list'
-- ----------------------------------------------------------------------------

-- expectation <> response
----error 0
--select friedrich from (select 1 as otto) as t1
--error 1
--exec echo "select friedrich from (select 1 as otto) as t1;

-- expectation = response
--error ER_BAD_FIELD_ERROR

select friedrich from (select 1 as otto) as t1;

-- The following unmasked unsuccessful statement must give
-- 1. mysqltest gives a 'failed'
-- 2. does not produce a r/<test case>.reject file !!!
-- PLEASE uncomment it and check its effect
--select friedrich from (select 1 as otto) as t1;


-- ----------------------------------------------------------------------------
-- Tests for the new feature - SQLSTATE error code matching
-- Positive case(statement)
-- ----------------------------------------------------------------------------

-- This syntax not allowed anymore, use --error S00000, see below
-- expectation = response
--!S00000 select otto from (select 1 as otto) as t1;
select otto from (select 1 as otto) as t1;

-- expectation <> response
--!S42S22 select otto from (select 1 as otto) as t1;

-- expecting a SQL-state for a command that can't give one should fail
--replace_result $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 1
--exec echo "error S00000;


-- ----------------------------------------------------------------------------
-- Negative case(statement)
-- ----------------------------------------------------------------------------

-- This syntax not allowed anymore, use --error S42S22, see below
-- expectation = response
--!S42S22 select friedrich from (select 1 as otto) as t1;
select friedrich from (select 1 as otto) as t1;

-- expectation !=response
--!S00000 select friedrich from (select 1 as otto) as t1;

-- ----------------------------------------------------------------------------
-- test cases for $mysql_errno
--
-- $mysql_errno is a builtin variable of mysqltest and contains the return code
-- of the last command sent to the server.
--
--      The following test cases often initialize $mysql_errno to 1064 by
--      a command with wrong syntax.
--      Example: --error 1064      To prevent the abort after the error.
--               garbage ;

-- ----------------------------------------------------------------------------
-- check mysql_errno = 0 after successful statement
-- ----------------------------------------------------------------------------
select otto from (select 1 as otto) as t1;

-- ----------------------------------------------------------------------------
-- check if let $my_var= 'abc' ;
let $my_var= 'abc' ;

-- ----------------------------------------------------------------------------
-- check if set @my_var= 'abc' ;
set @my_var= 'abc' ;

-- ----------------------------------------------------------------------------
--  check if the setting of --disable-warnings itself affects $mysql_errno
--  (May be --<whatever> modifies $mysql_errno.)
-- ----------------------------------------------------------------------------
--error ER_PARSE_ERROR

garbage ;

-- ----------------------------------------------------------------------------
-- check if --disable-warnings + command with warning affects the errno
-- stored within $mysql_errno
-- (May be disabled warnings affect $mysql_errno.)
-- ----------------------------------------------------------------------------
drop table if exists t1 ;
drop table if exists t1 ;

-- ----------------------------------------------------------------------------
-- check if masked errors affect $mysql_errno
-- ----------------------------------------------------------------------------
--error ER_PARSE_ERROR

garbage ;

select 3 from t1 ;

select 3 from t1 ;

-- ----------------------------------------------------------------------------
-- Will manipulations of $mysql_errno be possible and visible ?
-- ----------------------------------------------------------------------------
--error ER_PARSE_ERROR

garbage ;
let $mysql_errno= -1;

-- ----------------------------------------------------------------------------
-- How affect actions on prepared statements $mysql_errno ?
-- ----------------------------------------------------------------------------
-- failing prepare
--error ER_PARSE_ERROR

garbage ;
create table t1 ( f1 char(10));

-- successful prepare
--error ER_PARSE_ERROR

garbage ;

-- successful execute
--error ER_PARSE_ERROR

garbage ;

-- failing execute (table has been dropped)
drop table t1;

-- failing execute (unknown statement)
--error ER_PARSE_ERROR

garbage ;

-- successful deallocate
--error ER_PARSE_ERROR

garbage ;

-- failing deallocate ( statement handle does not exist )
--error ER_PARSE_ERROR

garbage ;


-- ----------------------------------------------------------------------------
-- test cases for "--disable_abort_on_error"
--
-- "--disable_abort_on_error" switches off the abort of mysqltest
-- after "unmasked" failing statements.
--
-- The default is "--enable_abort_on_error".
--
-- "Maskings" are
--   --error <error number>  and  --error <error number>
-- in the line before the failing statement.
--
-- There are some additional test cases for $mysql_errno
-- because "--disable_abort_on_error" enables a new situation.
-- Example: "unmasked" statement fails + analysis of $mysql_errno
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- Switch off the abort on error and check the effect on $mysql_errno
-- ----------------------------------------------------------------------------
--error ER_PARSE_ERROR

garbage ;

-- ----------------------------------------------------------------------------
-- "unmasked" failing statement should not cause an abort
-- ----------------------------------------------------------------------------
select 3 from t1 ;

-- ----------------------------------------------------------------------------
-- masked failing statements
-- ----------------------------------------------------------------------------
-- expected error = response
--error ER_NO_SUCH_TABLE

select 3 from t1 ;

select 3 from t1 ;

-- ----------------------------------------------------------------------------
-- Check some non-query statements that would fail
-- ----------------------------------------------------------------------------
--exec illegal_command
--cat_file does_not_exist
--perl
  exit(2);
EOF

-- ----------------------------------------------------------------------------
-- Check backtick and query_get_value, result should be empty
-- ----------------------------------------------------------------------------
let $empty= `garbage`;
let $empty= query_get_value(nonsense, blabla, 1);

-- ----------------------------------------------------------------------------
-- Switch the abort on error on and check the effect on $mysql_errno
-- ----------------------------------------------------------------------------
--error ER_PARSE_ERROR

garbage ;

-- ----------------------------------------------------------------------------
-- masked failing statements
-- ----------------------------------------------------------------------------
-- expected error = response
--error ER_NO_SUCH_TABLE

select 3 from t1 ;

-- ----------------------------------------------------------------------------
-- check that the old default behaviour is not changed
-- Please remove the '#' to get the abort on error
-- ----------------------------------------------------------------------------
----error 1064
--select 3 from t1 ;

-- ----------------------------------------------------------------------------
-- Test --enable and --disable with ONCE
-- ----------------------------------------------------------------------------

--disable_abort_on_error ONCE
garbage;
select 2;
select 3;
select 5;

-- ----------------------------------------------------------------------------
-- Test cumulative ONCE
-- ----------------------------------------------------------------------------

--disable_abort_on_error ONCE
--disable_query_log ONCE
select 3 from t1;
select 7;

-- ----------------------------------------------------------------------------
-- Test ONCE can be combined with --error or modifiers like lowercase
-- ----------------------------------------------------------------------------

--disable_result_log ONCE
--error ER_NO_SUCH_TABLE
select 5 from t1;
select "CASE" as "LOWER";
select "xyz" as name union select "abc" as name order by name desc;

-- ----------------------------------------------------------------------------
-- Test --error with backtick operator or query_get_value
-- ----------------------------------------------------------------------------

--error 0,ER_NO_SUCH_TABLE
let $empty= `SELECT foo from bar`;
let $empty= query_get_value(SELECT bar as foo, baz, 1);

-- ----------------------------------------------------------------------------
--test to check conversion between error numbers and error strings
-- ----------------------------------------------------------------------------
let $var=convert_error(1450);
let $var1=convert_error($var);
let $var2=convert_error($var1);

let $var=convert_error(ER_UNKNOWN_ERROR);
let $var1=convert_error($var);
let $var2=convert_error($var1);

let $var=convert_error(9999999);

let $var=convert_error(9ABC9);

let $var=convert_error(0);

let $var=convert_error();

let $var=;
let $var1=convert_error($var);

-- This is a comment
-- This is a ;

-- ----------------------------------------------------------------------------
-- Test comments with embedded command
-- ----------------------------------------------------------------------------

--echo hello
--     echo hello
--    echo ;

-- ----------------------------------------------------------------------------
-- Test detect end of line "junk"
-- Most likely caused by a missing delimiter
-- ----------------------------------------------------------------------------

-- Too many parameters to function
--error 1
--exec echo "sleep 5 6;

-- Too many parameters to function
--error 1
--exec echo "--sleep 5 6" | $MYSQL_TEST 2>&1

--
-- Missing delimiter
-- The comment will be "sucked into" the sleep command since
-- delimiter is missing until after "show status"
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
sleep 4
-- A comment
show status;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Missing delimiter until eof
-- The comment will be "sucked into" the sleep command since
-- delimiter is missing
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
sleep 7
-- Another comment
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Missing delimiter until "disable_query_log"
--
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
disconnect default

--
-- comment
-- comment 3
disable_query_log;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Missing delimiter until "disable_query_log"
--
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
disconnect default

--
-- comment

-- comment 3
disable_query_log;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Missing delimiter until eof
--
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
disconnect default

--
-- comment
-- comment2

-- comment 3
--disable_query_log
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Missing delimiter until eof
--
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
disconnect default -- comment
-- comment part2

-- comment 3
--disable_query_log
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1

remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

--
-- Extra delimiter
--
--error 1
--exec echo "--sleep 4;

--
-- Extra text after ``
--
-- Cannot use exec echo here as ` may or may not need to be escaped
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
let $x= `select 1` BOO ;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;
let $x= `select 1`
let $x= 2;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;


-- Allow trailing # comment
--sleep 1 -- Here is a trailing comment.
--sleep 1        -- Here is a trailing comment.

-- ----------------------------------------------------------------------------
-- Test error
-- ----------------------------------------------------------------------------

-- Missing argument
--error 1
--exec echo "error;

-- First char must be uppercase 'S' or 'E' or [0-9]
--error 1
--exec echo "--error s99999" | $MYSQL_TEST 2>&1
--error 1
--exec echo "--error e99999" | $MYSQL_TEST 2>&1
--error 1
--exec echo "--error 9eeeee" | $MYSQL_TEST 2>&1
--error 1
--exec echo "--error 1sssss" | $MYSQL_TEST 2>&1

-- First char 'S' but too long
--error 1
--exec echo "--error S999999" | $MYSQL_TEST 2>&1

-- First char 'S' but lowercase char found
--error 1
--exec echo "--error S99a99" | $MYSQL_TEST 2>&1

-- First char 'S' but too short
--error 1
--exec echo "--error S9999" | $MYSQL_TEST 2>&1

-- First char 'E' but not found in error array
--error 1
--exec echo "--error E9999" | $MYSQL_TEST 2>&1

-- First char [0-9] but contains chars
--error 1
--exec echo "--error 999e9" | $MYSQL_TEST 2>&1
--error 1
--exec echo "--error 9b" | $MYSQL_TEST 2>&1

-- Multiple errorcodes separated by ','
--error 1,1,1,1
----error 9,ER_PARSE_ERROR
----error ER_PARSE_ERROR
----error 9,ER_PARSE_ERROR,9,ER_PARSE_ERROR
----error 9, ER_PARSE_ERROR,  9,   ER_PARSE_ERROR
----error 9,S00000,9,ER_PARSE_ERROR
----error 9,S00000,9,ER_PARSE_ERROR,ER_PARSE_ERROR,ER_PARSE_ERROR,9,10,11,12
--error 9,S00000,9
--error 9,S00000,9,9,10,11,12
--error 9 ,10
--error 9 , 10
--error    9   ,   10
--error    9   ,   10

-- Too many errorcodes specified
--error 1
--exec echo "--error 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" | $MYSQL_TEST 2>&1

-- Bug#22135383 MYSQLTEST FAILS TO PROPERLY GROUP AN EXPECTED ERROR
--              CLAUSE AND ITS QUERY
if (1)
{
  --error ER_BAD_TABLE_ERROR
}
DROP TABLE table_does_not_exist;
{
  DROP TABLE table_does_not_exist;

if (1)
{
  if(1)
  {
    --error ER_BAD_TABLE_ERROR
  }
}
DROP TABLE table_does_not_exist;
{
  if(1)
  {
    DROP TABLE table_does_not_exist;
  }
}

-- BUG#13687542 MTR BEHAVES WRONG WHEN EXECUTING 'ERROR $VAR' IN A LOOP
--let $i= 0
--let $error= 0
while ($i < 3)
{
  --error $error
  CREATE TABLE t1 (a INT);

DROP TABLE t1;

-- ----------------------------------------------------------------------------
-- Test echo command
-- ----------------------------------------------------------------------------

echo MySQL;
     most popular open
     source database;

-- Illegal use of echo

----error 1
----exec echo "echo \$;


-- ----------------------------------------------------------------------------
-- Test exec command
-- ----------------------------------------------------------------------------

-- Illegal use of exec
--error 1
--exec echo "--exec " | $MYSQL_TEST 2>&1

-- Multi-line exec
exec $MYSQL
    test -e "select 1";
    2";
let $query = select 3
    as X;

-- ----------------------------------------------------------------------------
-- Test let command
-- ----------------------------------------------------------------------------

let $message=MySQL;

let $message="MySQL";

let $message= MySQL: The
 world''s most
 popular open
 source database;

let $message= -- MySQL: The
-- world''s most
-- popular open
-- source database;

let $message=  -- MySQL: The
-- world''s most
-- popular
-- open source database;

let $message=  -- MySQL: The
- world''s most
-- popular open
-- source database;

let $1=hej;

let   $1   =hej ;

let $1 = hej;

let $1=1;
let $2=$1;
let $5=$6;

let $where=a long variable content;

let $where2= $where;

let $where3=a long $where variable content;

let $where3=a long \\\$where variable content;

let $novar1= $novar2;

let $cat=na;
let $cat=ba$cat$cat;

-- ba\$cat\$cat should have been sufficient.
-- ba\\\$cat\\\$cat -> ba\$cat\$cat -> ba$cat$cat -> banana
-- Magnus' upcoming patch will fix the missing second interpretation.
let $cat=ba\\\$cat\\\$cat;

-- Bug #55413 would cause this to fail
let $escape= with\`some\"escaped\'quotes;

-- This only works with "--let" syntax
--let $tick= single'tick`backtick
echo $tick;

-- Test illegal uses of let

--error 1
--exec echo "let ;

-- More advanced test for Bug#17280
let $success= 1;


-- ----------------------------------------------------------------------------
-- Test to assign let from variable
-- let $<var_name>=$<var_name>;

-- Basic preparations:
--echo let \$A = initial value of A;
let $A = initial value of A;
let $B = initial value of B;

-- Assign $B to $A:
--echo let \$B = \$A
let $A = $B;

-- Changes of $B must NOT affect $A and Changes of $A must NOT affect $B !
--echo let \$A = changed value of A;
let $A = changed value of A;
let $B = changed value of B;

-- ----------------------------------------------------------------------------
-- Test let from query with $variable
-- let $<var_name>=`<query with $variable>`;

let $var1=content of variable 1;
let $var2= `select "$var1"`;
let $var3= `select concat("$var1", " ", "$var2")`;
{
  echo length of var3 is longer than 0;

-- ----------------------------------------------------------------------------
-- Test to assign let from query
-- let $<var_name>=`<query>`;
let $var1= `select "hi" as "Col", 1 as "Column1", "hi there" as Col3`;
let $var2= `select 2 as "Column num 2"`;
let $var2= `select 2 as "Column num 2"`;
let $var3= `select 1 as "Col", 2 as "Col", 3 as "var3"`;
let $var4= `select NULL`;
let $var5= `SHOW VARIABLES LIKE "nonexisting_variable"`;
let $var2= `failing query`;
EOF

create table t1 (a varchar(100)) charset utf8mb4;
insert into t1 values ('`select 42`');
let $a= `select * from t1`;
insert into t1 values ('$dollar');
let $a= query_get_value(select * from t1 order by a, a, 1);
let $a= query_get_value(select * from t1 order by a, a, 2);
drop table t1;


-- ----------------------------------------------------------------------------
-- Test source command
-- ----------------------------------------------------------------------------

-- Test illegal uses of source

--error 1
--exec echo "source ;

-- Fix win paths
--replace_result \\ /
-- Source a nonexisting file
--error 1
--exec echo "source non_existingFile;

-- Too many source
--exec echo "source $MYSQLTEST_VARDIR/tmp/recursive.sql;

-- Source a file with error
--exec echo "garbage ;

-- Test execution of source in a while loop
--write_file $MYSQLTEST_VARDIR/tmp/sourced.inc
echo here is the sourced script;
EOF
--disable_query_log
let $outer= 2;
{
  eval SELECT '$outer = outer loop variable after while' AS "";
  dec $outer;

-- Test source in an if in a while which is false on 1st iteration
-- Also test --error and --disable_abort_on_error in same context
let $outer= 2;
let $ifval= 0;
{
  echo outer=$outer ifval=$ifval;

  if ($ifval) {
    --source $MYSQLTEST_VARDIR/tmp/sourced.inc
    --error ER_NO_SUCH_TABLE
    SELECT * from nowhere;
    --disable_abort_on_error ONCE
-- Statement giving a different error, to make sure we don't mask it
    SELECT * FROM nowhere else;
  }
  dec $outer;
  inc $ifval;
}


-- Test execution of source in a while loop
--disable_abort_on_error
-- Sourcing of a file within while loop, sourced file will
-- source other file
let $num= 9;
{
   SELECT 'In loop' AS "";
   dec $num;

-- Test source $variable/<filename>
--source $MYSQLTEST_VARDIR/tmp/sourced.inc

--remove_file $MYSQLTEST_VARDIR/tmp/sourced.inc

--write_file $MYSQLTEST_VARDIR/tmp/sourced.inc
echo "hello";
EOF

let $x= sourced;

let $x= $MYSQLTEST_VARDIR;


-- ----------------------------------------------------------------------------
-- Test sleep command
-- ----------------------------------------------------------------------------

sleep 0.5;

-- Parameter from variable, legal and illegal
let $sleep_var= 0.1;
let $sleep_var= 1;
let $sleep_var= xyz;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQL_TMP_DIR/sleep.inc 2>&1
--remove_file $MYSQL_TMP_DIR/sleep.inc

-- Missing parameter
--error 1
--exec echo "sleep ;

-- Illegal parameter
--error 1
--exec echo "sleep abc;

-- ----------------------------------------------------------------------------
-- Test inc
-- ----------------------------------------------------------------------------
let $i= 0;
inc $i;
let $i=100;
inc $i;
let $i= -100;
inc $i;

inc $i;


-- ----------------------------------------------------------------------------
-- Test dec
-- ----------------------------------------------------------------------------

let $d= 0;
dec $d;
let $d=100;
dec $d;


-- ----------------------------------------------------------------------------
-- Test delimiter
-- ----------------------------------------------------------------------------

delimiter stop;

-- ----------------------------------------------------------------------------
-- Test that delimiter within if() works in in various combinations
-- ----------------------------------------------------------------------------

if (0)
{
  delimiter ||;
  if (0)
  {
    delimiter *||
    echo false-innerer*
    delimiter ||*
  }
  echo false-inner again||
}
echo outer;
{
  delimiter /;
  if (0)
  {
    delimiter %/
    echo true-innerer%
  }
  echo true-inner again/
}
echo true-outer/
delimiter ;


-- ----------------------------------------------------------------------------
-- Test if
-- ----------------------------------------------------------------------------

let $counter=10;
{
  echo Counter is greater than 0, (counter=10);
{
  echo Counter is not 0, (counter=10);
{
  let $counter=5;
let $counter=0;
{
  echo Counter is greater than 0, (counter=0);
{
  echo Counter is not 0, (counter=0);
{
  echo Not space var works;

-- ----------------------------------------------------------------------------
-- Test if with some non-numerics
-- ----------------------------------------------------------------------------

let $counter=alpha;
{
  echo Counter is true, (counter=alpha);
let $counter=   ;
{
  echo oops, space is true;
let $counter=-0;
{
  echo oops, -0 is true;
--   echo Beta is true;
let $counter=gamma;
{
  echo while with string, only once;
  let $counter=000;

-- ----------------------------------------------------------------------------
-- Test if with compare conditions
-- ----------------------------------------------------------------------------

let $ifvar= 5;
let $ifvar2= 6;

if ($ifvar < 7)
{
  echo 5<7;
{
  echo 5<7 again;
{
  echo 5<7 still;
{
  echo 5<6;
{
  echo 5<=4;
{
  echo 5>=5;
{
  echo 5>=5 again;
{
  echo 5>3;
{
  echo 5==4;
{
  echo 5==5;
{
  echo 5!=8;
{
  echo 5!=five;
{
  echo 5==3+2;
{
  echo 5   ==   5;
let $ifvar= hello;
{
  echo hello == hello there;
{
  echo hello == hello;
{
  echo hello == hell;
{
  echo hello   ==   hello;
{
  echo hello != goodbye;
let $ifvar= 'quoted';
{
  echo 'quoted' == ''quoted'';
let $ifvar= two words;
{
  echo two words;
{
  echo 'two words';
{
  echo "two words";
{
  echo two words are two words;
{
  echo right answer;
{
  echo wrong answer;
{
  echo anything goes;
let $ifvar= 0;
{
  echo 0 == string;
{
  echo 0 != string;
let $var= 5;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQL_TMP_DIR/mysqltest.sql 2>&1
remove_file $MYSQL_TMP_DIR/mysqltest.sql;
let $var= 5;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQL_TMP_DIR/mysqltest.sql 2>&1
remove_file $MYSQL_TMP_DIR/mysqltest.sql;
let $var= text;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQL_TMP_DIR/mysqltest.sql 2>&1
remove_file $MYSQL_TMP_DIR/mysqltest.sql;

-- ----------------------------------------------------------------------------
-- Test while with compare conditions
-- ----------------------------------------------------------------------------

let $counter= 2;
{
  echo counter is $counter;
  inc $counter;
let $ifvar=;
{
  if ($counter >= 7)
  {
    let $ifvar= stop;
  }
  echo counter is $counter;
  inc $counter;

-- ----------------------------------------------------------------------------
-- Test while, { and }
-- ----------------------------------------------------------------------------

let $i=1;
{
  echo $i;
  dec $i;

let $i=0;
{
  echo Testing while with not;
  inc $i;

-- Exceed max nesting level
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest_while.inc
let $1 = 10;
{
  echo $1;
  dec $1;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
EOF
-- Fix win path
--replace_result \\ / $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 1
--exec echo "source $MYSQLTEST_VARDIR/tmp/mysqltest_while.inc;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1
remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;
EOF
--error 1
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.sql 2>&1

remove_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

-- ----------------------------------------------------------------------------
-- Test error messages returned from comments starting with a command
-- ----------------------------------------------------------------------------
--error 1
--exec echo "--if the other server is down" | $MYSQL_TEST 2>&1

--error 1
--exec echo "-- end when ..." | $MYSQL_TEST 2>&1

-- ----------------------------------------------------------------------------
-- Test replace
-- ----------------------------------------------------------------------------
--replace_result a b
select "a" as col1, "c" as col2;
select "a" as col1, "c" as col2;
select "a" as col1, "c" as col2;
select "a" as col1, "c" as col2;

let $long_rep= 1234567890123456789012345678901234567890;
let $long_rep= $long_rep,$long_rep;
let $long_rep= $long_rep,$long_rep;
let $long_rep= $long_rep,$long_rep;
let $long_rep= $long_rep,$long_rep;
let $long_rep= $long_rep,$long_rep;

-- This tests from strings > 1024 (here 1311)

--replace_result $long_rep LONG_STRING
eval select "$long_rep" as x;

-- Test replace within ``

--replace_result cat dog
--let $animal= `select "cat" as pet`
--echo $animal

-- ----------------------------------------------------------------------------
-- Test sync_with_master
-- ----------------------------------------------------------------------------
--error 1
--exec echo "sync_with_master 10!;

-- ----------------------------------------------------------------------------
-- Test connect
-- ----------------------------------------------------------------------------

--error 1
--exec echo "connect;

-- Repeat connect/disconnect
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
let $i=200;
 dec $i;
EOF
--exec echo "source $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

-- Select disconnected connection
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
connect (test_con1,localhost,root,,);
EOF
--replace_result $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 1
--exec echo "source $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

-- Connection name already used
--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.sql
connect (test_con1,localhost,root,,);
EOF
--replace_result $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 1
--exec echo "source $MYSQLTEST_VARDIR/tmp/mysqltest.sql;

-- connect when "disable_abort_on_error" caused "connection not found"
--disable_abort_on_error
connect (con1,localhost,root,,);

-- Test connect without a database
connect (con2,localhost,root,,*NO-ONE*);

-- Test enable_connect_log
--enable_connect_log
connect (con1,localhost,root,,);

-- ----------------------------------------------------------------------------
-- Test mysqltest arguments
-- ----------------------------------------------------------------------------

-- -x <file_name>, use the file specified after -x as the test file
--exec $MYSQL_TEST < $MYSQL_TEST_DIR/include/mysqltest-x.inc
--exec $MYSQL_TEST -x $MYSQL_TEST_DIR/include/mysqltest-x.inc
--exec $MYSQL_TEST --test_file=$MYSQL_TEST_DIR/include/mysqltest-x.inc
-- Fix Win paths
--replace_result \\ /
--error 1
--exec $MYSQL_TEST -x non_existing_file.inc 2>&1


-- ----------------------------------------------------------------------------
-- TODO Test queries, especially their errormessages... so it's easy to debug
-- new scripts and diagnose errors
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- Test Bug#12386
-- ----------------------------------------------------------------------------
let $num= 2;
{
   --error ER_PARSE_ERROR

   failing_statement;

   dec $num;

SELECT 1 as a;


--
-- Bug#10251 Identifiers containing quotes not handled correctly
--
select 1 as `a'b`, 2 as `a"b`;

-- Test escaping of quotes
select 'aaa\\','aa''a',"aa""a";

--
-- Check of include/show_msg.inc and include/show_msg80.inc
--

-- The message contains in most cases a string with the default character set
let $message= Here comes a message;

-- The message could also contain a string with character set utf8mb3
let $message= `SELECT USER()`;

-- The message contains more then 80 characters on multiple lines
-- and is kept between double quotes.
let $message=
"Here comes a very very long message that
    - is longer then 80 characters    and
    - consists of several lines";

-- The message contains more then 80 characters on multiple lines
-- and uses the auxiliary character "." at the beginning of the message lines.
let $message= . Here comes a very very long message that
              .      - is longer then 80 characters    and
              .      - consists of several lines;

--
-- Test zero length result file. Should not pass
--
--exec echo '' > $MYSQLTEST_VARDIR/tmp/zero_length_file.result
--exec echo "echo ok;

--
-- Test that a test file that does not generate any output fails.
--
--exec echo "let \$i= 1;

--
-- Test that mysqltest fails when there are no queries executed
-- but a result file exists
-- NOTE! This will never happen as long as it's not allowed to have
-- test files that produce no output
----exec echo "something" > $MYSQLTEST_VARDIR/tmp/result_file.result
----exec echo "let \$i= 1;

--
-- Bug#11731 mysqltest in multi-statement queries ignores errors in
--           non-1st queries
--

echo Failing multi statement query;
drop table t1;
drop table t1;

-- These two should work since the error is expected
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/bug11731.sql  2>&1
drop table t1;
drop table t1;

--
-- Bug#19890 mysqltest "query" command is broken
--

-- It should be possible to use the command "query" to force mysqltest to
-- send the command to the server although it's a builtin mysqltest command.
--error ER_PARSE_ERROR

query sleep;

-- Just an empty query command
--error ER_EMPTY_QUERY

query ;

-- test for replace_regex
--replace_regex /at/b/
select "at" as col1, "c" as col2;
select "at" as col1, "AT" as col2, "c" as col3;
select "a" as col1, "ct" as col2;
select "strawberry","blueberry","potato";

-- REQUIREMENT
--   replace_regex should replace substitutions from left to right in output

create table t1 (a int, b int);
insert into t1 values (1,3);
insert into t1 values (2,4);
select * from t1;
drop table t1;

-- Test usage with ``

--replace_regex /x/y/
--let $result= `select "x" as col`
--echo $result

-- Test usage with a variable as pattern list

--disable_query_log
--let $patt= /a /b / /less/more/
--replace_regex $patt
select "a is a and less is more" as txt;
select "a is a and less is more" as txt;
create table t2 ( a char(10));
let $errno1=0;
let $errno2=ER_PARSE_ERROR;
let $errno3=ER_NO_SUCH_TABLE;
insert into t1 values ("Abcd");

drop table t2;


-- ----------------------------------------------------------------------------
-- Tests of send
-- ----------------------------------------------------------------------------

create table t1 ( f1 char(10));
insert into t1 values ("Abcd");

-- 1. Basic test

send select * from t1;

-- 2. Test with error

--send select * from t2;

-- 3. test send of next stmt

--send
select * from t1;

-- 4. Non-query stmt betwen send and reap allowed

--send select * from t1;

-- 5. Test of send_eval

--let $my_stmt= select * from t1;

-- 6. Test that mysqltest does not allow query stmt between send and reap
-- Untestable directly as it causes mysqltest to fail

--write_file $MYSQLTEST_VARDIR/tmp/mysqltest.in
--send select * from t1;
select 1;
EOF
--error 1
-- Must filter unpredictable extra warning from output
--exec $MYSQL_TEST < $MYSQLTEST_VARDIR/tmp/mysqltest.in > $MYSQL_TMP_DIR/mysqltest.out 2>&1
--perl
  my $dir= $ENV{'MYSQL_TMP_DIR'};
    print unless /Note: net_clear/;
  }
EOF
remove_file $MYSQL_TMP_DIR/mysqltest.out;

drop table t1;

-- ----------------------------------------------------------------------------
-- test for remove_file
-- ----------------------------------------------------------------------------

--error 1
--exec echo "remove_file ;

-- ----------------------------------------------------------------------------
-- test for remove_files_wildcard
-- ----------------------------------------------------------------------------

--error 1
--exec echo "remove_files_wildcard ;

-- Pattern is a mandatory argument
--error 1
--exec echo "remove_files_wildcard $MYSQLTEST_VARDIR/tmp/ ;

-- ----------------------------------------------------------------------------
-- test for write_file
-- ----------------------------------------------------------------------------
--error 1
--exec echo "write_file ;

-- Comment out this test as it confuses cmd.exe with unmatched "
----error 1
----exec echo "write_file filename \";
EOF
file_exists $MYSQLTEST_VARDIR/tmp/test_file1.tmp;

-- write to already exisiting file
--replace_result $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 1
--exec echo "write_file $MYSQLTEST_VARDIR/tmp/test_file1.tmp;

-- ----------------------------------------------------------------------------
-- test for append_file
-- ----------------------------------------------------------------------------

write_file $MYSQLTEST_VARDIR/tmp/test_file1.tmp;
EOF
file_exists $MYSQLTEST_VARDIR/tmp/test_file1.tmp;
EOF
file_exists $MYSQLTEST_VARDIR/tmp/test_file1.tmp;
EOF

remove_file $MYSQLTEST_VARDIR/tmp/test_file1.tmp;

-- Test append_file within while
let $outer= 2;
{
  append_file $MYSQLTEST_VARDIR/tmp/app_while.tmp;
EOF
  dec $outer;

-- ----------------------------------------------------------------------------
-- test for cat_file
-- ----------------------------------------------------------------------------

--write_file $MYSQLTEST_VARDIR/tmp/test_file1.tmp
Some data
for cat_file command
of mysqltest
EOF
cat_file $MYSQLTEST_VARDIR/tmp/test_file1.tmp;

-- ----------------------------------------------------------------------------
-- test for diff_files
-- ----------------------------------------------------------------------------

--write_file $MYSQLTEST_VARDIR/tmp/diff1.tmp
Some data
for diff_file command
of mysqltest
EOF

--write_file $MYSQLTEST_VARDIR/tmp/diff2.tmp
Some data
for diff_file command
of mysqltest
EOF

--write_file $MYSQLTEST_VARDIR/tmp/diff3.tmp
Some other data
for diff_file command
of mysqltest
EOF

--write_file $MYSQLTEST_VARDIR/tmp/diff4.tmp
Some data
for diff_file command
of musqltest
EOF

-- Compare equal files
--diff_files $MYSQLTEST_VARDIR/tmp/diff1.tmp $MYSQLTEST_VARDIR/tmp/diff2.tmp
--diff_files $MYSQLTEST_VARDIR/tmp/diff2.tmp $MYSQLTEST_VARDIR/tmp/diff1.tmp

-- Compare files that differ in size
--error 2
--diff_files $MYSQLTEST_VARDIR/tmp/diff1.tmp $MYSQLTEST_VARDIR/tmp/diff3.tmp
--error 2
--diff_files $MYSQLTEST_VARDIR/tmp/diff3.tmp $MYSQLTEST_VARDIR/tmp/diff1.tmp

-- Compare files that differ only in content
--error 1
--diff_files $MYSQLTEST_VARDIR/tmp/diff1.tmp $MYSQLTEST_VARDIR/tmp/diff4.tmp
--error 1
--diff_files $MYSQLTEST_VARDIR/tmp/diff4.tmp $MYSQLTEST_VARDIR/tmp/diff1.tmp

-- Compare equal files, again...
--diff_files $MYSQLTEST_VARDIR/tmp/diff1.tmp $MYSQLTEST_VARDIR/tmp/diff2.tmp

--remove_file $MYSQLTEST_VARDIR/tmp/diff1.tmp
--remove_file $MYSQLTEST_VARDIR/tmp/diff2.tmp
--remove_file $MYSQLTEST_VARDIR/tmp/diff3.tmp
--remove_file $MYSQLTEST_VARDIR/tmp/diff4.tmp


-- ----------------------------------------------------------------------------
-- test for file_exist
-- ----------------------------------------------------------------------------
--error 1
--exec echo "file_exists ;
EOF
file_exists $MYSQLTEST_VARDIR/tmp/test_file1.tmp;


-- ----------------------------------------------------------------------------
-- test for copy_file
-- ----------------------------------------------------------------------------
--write_file $MYSQLTEST_VARDIR/tmp/file1.tmp
file1
EOF

copy_file $MYSQLTEST_VARDIR/tmp/file1.tmp $MYSQLTEST_VARDIR/tmp/file2.tmp;


-- ----------------------------------------------------------------------------
-- test for move_file
-- ----------------------------------------------------------------------------

-- - Check that if source file does not exist, nothing will be created.

--error 1
file_exists $MYSQLTEST_VARDIR/tmp/file1.tmp;

-- - Check that if source file exists, everything works properly.

--write_file $MYSQLTEST_VARDIR/tmp/file1.tmp
file1
EOF

move_file $MYSQLTEST_VARDIR/tmp/file1.tmp $MYSQLTEST_VARDIR/tmp/file2.tmp;

-- - Check that if destination file exists, everything works properly.
--   (file2.tmp exists from the previous check;
EOF

move_file $MYSQLTEST_VARDIR/tmp/file1.tmp $MYSQLTEST_VARDIR/tmp/file2.tmp;

-- - Check usage.

--error 1
--exec echo "move_file ;

-- ----------------------------------------------------------------------------
-- test for chmod
-- ----------------------------------------------------------------------------
--write_file $MYSQLTEST_VARDIR/tmp/file1.tmp
file1
EOF

chmod 0000 $MYSQLTEST_VARDIR/tmp/file1.tmp;
EOF

remove_file $MYSQLTEST_VARDIR/tmp/file1.tmp;


-- ----------------------------------------------------------------------------
-- test for perl
-- ----------------------------------------------------------------------------
--perl
print "hello\n";
EOF

--perl EOF
print "hello\n";
EOF

--perl DELIMITER
print "hello\n";
EOF

perl;
  -- Print "hello"
  print "hello\n";
EOF

-- Test perl within while, also with if being false first iteration
let $outer= 3;
let $ifval= 0;
  if ($ifval) {
    perl UNTIL;
      my $val= 5;
      print "val is $val\n";
  }
  inc $ifval;
  dec $outer;

-- ----------------------------------------------------------------------------
-- test for die
-- ----------------------------------------------------------------------------

--error 1
--exec echo "die test of die;


-- ----------------------------------------------------------------------------
-- test for exit
-- ----------------------------------------------------------------------------

--exec echo "echo Some output;

-- ----------------------------------------------------------------------------
-- test for sorted_result
-- ----------------------------------------------------------------------------

create table t1( a int, b char(255), c timestamp);
insert into t1 values(1, 'Line 1', '2007-04-05'), (2, "Part 2", '2007-04-05');
insert into t1 values(1, 'Line 1', '2007-04-05'), (2, "Part 3", '2007-04-05');
select * from t1;
select * from t1;
select * from t1;
select * from t1;
select '';
select "h";
select "he";
select "hep";
select "hepp";

drop table t1;

-- 1. Assignment of result set sorting
sorted_result;
 SELECT 2 as "my_col"
UNION
SELECT 1;
SELECT 2 as "my_col" UNION SELECT 1;
SELECT 2 as "my_col"
UNION
SELECT 1;

-- 2. Ensure that the table header will be not sorted into the result
--sorted_result
SELECT '2' as "3"
UNION
SELECT '1';

-- 3. Ensure that an empty result set does not cause problems
CREATE TABLE t1( a CHAR);
SELECT * FROM t1;
DROP TABLE t1;

-- 4. Ensure that NULL values within the result set do not cause problems
SELECT NULL as "my_col1",2 AS "my_col2"
UNION
SELECT NULL,1;
SELECT NULL as "my_col1",2 AS "my_col2"
UNION
SELECT NULL,1;
SELECT 2 as "my_col1",NULL AS "my_col2"
UNION
SELECT 1,NULL;
SELECT 2 as "my_col1",NULL AS "my_col2"
UNION
SELECT 1,NULL;

-- 5. "sorted_result" changes nothing when applied to a non query statement.
sorted_result;
 SET @a = 17;
SELECT 2 as "my_col"
UNION
SELECT 1;

-- 7. Ensure that "sorted_result" in combination with $variables works
let $my_stmt=SELECT 2 as "my_col"
UNION
SELECT 1;

-- 8. Ensure that "sorted_result " does not change the semantics of
--    "--error ...." or the protocol output after such an expected failure
--sorted_result
--error ER_NO_SUCH_TABLE

SELECT '2' as "my_col1",2 as "my_col2"
UNION
SELECT '1',1 from t2;

-- 9. Ensure that several result formatting options including "sorted_result"
--    - have all an effect
--    - "--sorted_result" does not need to be direct before the statement
--    - Row sorting is applied after modification of the column content
--sorted_result
--replace_column 1 --
SELECT '1' as "my_col1",2 as "my_col2"
UNION
SELECT '2',1;

-- 10. Ensure that at least 1024 rows within a result set do not cause problems
--
CREATE TABLE t1 (f1 INT);
INSERT INTO t1 SET f1 = 1024;
INSERT INTO t1 SELECT f1 - 1 FROM t1;
INSERT INTO t1 SELECT f1 - 2 FROM t1;
INSERT INTO t1 SELECT f1 - 4 FROM t1;
INSERT INTO t1 SELECT f1 - 8 FROM t1;
INSERT INTO t1 SELECT f1 - 16 FROM t1;
INSERT INTO t1 SELECT f1 - 32 FROM t1;
INSERT INTO t1 SELECT f1 - 64 FROM t1;
INSERT INTO t1 SELECT f1 - 128 FROM t1;
INSERT INTO t1 SELECT f1 - 256 FROM t1;
INSERT INTO t1 SELECT f1 - 512 FROM t1;
SELECT * FROM t1;
DROP TABLE t1;

CREATE TABLE t1(a BINARY(32), b BINARY(32));
INSERT INTO t1 VALUES
('1abc', 'abc2'), ('\0', '\0'), ('1a', 'ba');
SELECT * FROM t1;
DROP TABLE t1;

CREATE TABLE t1(a CHAR(32), b CHAR(32));
INSERT INTO t1 VALUES
('\0', 'abc2'), ('abcd', '\0'), ('1a', 'ba');
SELECT * FROM t1;
DROP TABLE t1;

--
-- Tests for partially_sorted_result
--

CREATE TABLE t1(a CHAR(32), b CHAR(32), c CHAR(32));
INSERT INTO t1 VALUES
('abc', '1a', '2a'), ('abc', 'west', 'east'), ('\0', '1a', 'north'),
('\0', 'west', 'south'), ('abc', 'sun', 'moon');

-- Order on columns b,c also for deterministic results
--replace_regex /[^[:print:]]/--/
--partially_sorted_result 1
SELECT a, b, c FROM t1 ORDER by a;

-- Order on column c also for deterministic results
--replace_regex /[^[:print:]]/--/
--partially_sorted_result 2
SELECT a, b, c FROM t1 ORDER by a, b;

DROP TABLE t1;


CREATE TABLE t1(i INT, j INT, k INT);
INSERT INTO t1 VALUES
(1, 2, 1),
(1, 2, 4),
(1, 2, 3),
(2, 3, 1),
(3, 4, 1),
(2, 5, 0),
(1, 6, 0),
(1, 7, 1);

-- Sort on columns j,k also for deterministic results
--partially_sorted_result 1
SELECT i, j, k FROM t1 ORDER by i;

-- Sort on column k also for deterministic results
--partially_sorted_result 2
SELECT i, j, k FROM t1 ORDER by i, j;

DROP TABLE t1;

-- 1. Basic test
--lowercase_result
SELECT "500g BLÅBÆRSYLTETØY" AS "WILL BE lower cased";

-- 2. test that it does not apply to next statement
SELECT "UPPER" AS "WILL NOT BE lower cased";

-- 3. test that it does not affect non-SQL or the following statement
--lowercase_result
--echo UP
SELECT 0 as "UP AGAIN";

-- 4. test that it works with eval and variables
let $lower_stmt=SELECT "ABCdef" AS "uvwXYZ";

-- 5. test that it works in combination with sort
sorted_result;
SELECT "Xyz" AS Name UNION SELECT "Abc" as Name ORDER BY Name DESC;

-- 6. Test combination with replace, and that lower casing is done first
--lowercase_result
--replace_result old new
SELECT 1 as "SOME OLD TEXT";

-- 7. Test that it still works for latin1
--character_set latin1
set names latin1;
SELECT 0 as "WILL Lower CASE �";
set names utf8mb4;

-- ----------------------------------------------------------------------------
-- Some coverage tests
-- ----------------------------------------------------------------------------

--disable_query_log
--exec $MYSQL_TEST --help 2>&1 > /dev/null
--exec $MYSQL_TEST --version 2>&1 > /dev/null
--enable_query_log
--disable_abort_on_error ONCE
--error 1
--exec $MYSQL_TEST a b c 2>&1 > /dev/null

-- ----------------------------------------------------------------------------
-- test for query_get_value
-- ----------------------------------------------------------------------------

CREATE TABLE t1(
 a int, b varchar(255), c datetime
);
--    value is simple string without spaces
let $value= query_get_value(SHOW COLUMNS FROM t1, Type, 1);
let $value= query_get_value("SHOW COLUMNS FROM t1", Type, 1);
--    value IS NULL
let $my_show= SHOW COLUMNS FROM t1;
let $column_name= Default;
let $row_number= 1;
let $value= query_get_value($my_show, $column_name, $row_number);
--         selection could be done much better by pure SELECT functionality)
--    value is string with space in the middle
let $value= query_get_value(SELECT 'A B' AS "MyColumn", MyColumn, 1);
let $value= query_get_value(SELECT 1 AS "My Column", My Column, 1);
let $value= query_get_value('SELECT 1 as a, 2 as b', "b", 1);
let $value= initialized;
let $value= query_get_value(SHOW COLUMNS FROM t1, Field, 0);
let $value= initialized;
let $value= query_get_value(SHOW COLUMNS FROM t1, Field, 10);
--      Note: There is no need to improve this, because we need query_get_value
--            for SHOW commands only.
--error 1
--exec echo "let \$value= query_get_value(SELECT 1 AS "A", 1 AS "B", 1);
let $value= initialized;
let $value= query_get_value(SELECT a FROM t1, a, 1);
let $show_statement= SHOW COLUMNS FROM t1;
let $rowno= 1;
let $run=1;
let $count= 0;
{
   let $Field=   query_get_value($show_statement, Field,   $rowno);
   if ($Field == No such row)
   {
      let $run= 0;
   }
   if ($Field != No such row)
   {
      let $Type=    query_get_value($show_statement, Type,    $rowno);
      let $Null=    query_get_value($show_statement, Null,    $rowno);
      if ($Null == YES)
      {
         inc $count;
      }
      let $Key=     query_get_value($show_statement, Key,     $rowno);
      let $Default= query_get_value($show_statement, Default, $rowno);
      let $Extra=   query_get_value($show_statement, Extra,   $rowno);
      --echo $Field $Type $Null ->$Key<- $Default $Extra
      inc $rowno;
   }
}
--echo
--echo Number of columns with Default NULL: $count
--echo
eval $show_statement;

drop table t1;

-- ----------------------------------------------------------------------------
-- Test change_user command
-- ----------------------------------------------------------------------------

--connect(change_user_conn, localhost, root,,,,)

--error ER_BAD_DB_ERROR
--change_user root,,inexistent

--error ER_ACCESS_DENIED_ERROR
--change_user inexistent,,test

--error ER_ACCESS_DENIED_ERROR
--change_user root,inexistent,test

--change_user
--change_user root
--change_user root,,
--change_user root,,test

--connection default
--disconnect change_user_conn

-- ----------------------------------------------------------------------------
-- Test mkdir and rmdir command
-- ----------------------------------------------------------------------------

mkdir $MYSQLTEST_VARDIR/tmp/testdir;

-- Directory already exist
mkdir $MYSQLTEST_VARDIR/tmp/testdir;

-- Remove dir with file inside
write_file $MYSQLTEST_VARDIR/tmp/testdir/file1.txt;
EOF

-- Verify that --replace_result also work on list_files
--replace_result file REPLACED_FILE
list_files $MYSQLTEST_VARDIR/tmp/testdir;

-- Test replace_result and that it does not affect next SQL stmt
replace_result file prefix;
SELECT "bla bla file" as x;

--
-- Bug#36041 mysql-test-run doesn't seem to string match 100% effectively
--           on Windows
--

--replace_result c:\\a.txt z
SELECT 'c:\\a.txt' AS col;

-- ----------------------------------------------------------------------------
-- Test that -- is not allowed as comment, only as mysqltest builtin command
-- ----------------------------------------------------------------------------

-- valid
select 1;

-- Not valid, "select" is not a mysqltest command
--error 1
--exec echo "--select 1;


-- ----------------------------------------------------------------------------
-- BUG#35701 please allow test language variables in connection and sync_slave_with_master
-- Test that "connection $variable" works and that $CURRENT_CONNECTION has the right value.
-- ----------------------------------------------------------------------------

connect (con1,localhost,root,,);

let $x= con1;
let $y= con2;

-- Disconnect the not selected connection
disconnect $x;

-- Disconnect the selected connection
disconnect $y;

-- To test \r\n in cat_file
--cat_file std_data/cat_file.txt

--echo
--echo Bug--21963113 MYSQLTESTS REPLACE_REGEX CANNOT
--echo              MATCH ^ (BEGINNING OF LINE) ATOM
--echo

--replace_regex /^a/R/
select "a" as a;
select "a" as a;
select "a" as a;
jan feb mar
apr may jun
jul aug sept
oct nov dec
jan feb mar
apr may jun
jul aug sept
oct nov dec
jan feb mar
apr may jun
jul aug sept
oct nov dec
jan feb mar
apr may jun
jul aug sept
oct nov dec
jan feb oct
EOF

-- No matches will be echoed to console.
--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = NONE
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= jan feb
--let SEARCH_ECHO=    NONE
--source include/search_pattern.inc

-- First match is echoed to console.
--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = FIRST
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= jan feb
--let SEARCH_ECHO=    FIRST
--source include/search_pattern.inc

-- ALL matches are echoed to console.
--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = ALL
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= jan feb
--let SEARCH_ECHO=    ALL
--source include/search_pattern.inc

-- If a line matches search pattern and if it also matches
-- ignore pattern, then it will be ignored.
--echo -- SEARCH_PATTERN = 'apr may', SEARCH_ECHO = FIRST, IGNORE_PATTERN = 'jun'
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= apr may
--let SEARCH_ECHO=    FIRST
--let IGNORE_PATTERN= jun
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'apr may', SEARCH_ECHO = ALL, IGNORE_PATTERN = 'jun'
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= apr may
--let SEARCH_ECHO=    ALL
--let IGNORE_PATTERN= jun
--source include/search_pattern.inc

-- If a line matches search pattern and if it doesn't match the
-- ignore pattern, then it will be echoed to console.
--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = ALL, IGNORE_PATTERN = 'mar'
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= jan feb
--let SEARCH_ECHO=    ALL
--let IGNORE_PATTERN= mar
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = ALL, IGNORE_PATTERN = 'march'
--let SEARCH_FILE=    $file
--let SEARCH_PATTERN= jan feb
--let SEARCH_ECHO=    ALL
--let IGNORE_PATTERN= march
--source include/search_pattern.inc

-- If SEARCH_ECHO_CTX value is greater than 0, then succeding
-- number of lines and lines above the matching line (up to the
-- number specified by SEARCH_ECHO_CTX) will be echoed to console.
--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = FIRST, SEARCH_ECHO_CTX = 1
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  jan feb
--let SEARCH_ECHO=     FIRST
--let SEARCH_ECHO_CTX= 1
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = FIRST, SEARCH_ECHO_CTX = 2
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  jan feb
--let SEARCH_ECHO=     FIRST
--let SEARCH_ECHO_CTX= 2
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'jan feb', SEARCH_ECHO = ALL, SEARCH_ECHO_CTX = 3
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  jan feb
--let SEARCH_ECHO=     ALL
--let SEARCH_ECHO_CTX= 3
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'nov dec', SEARCH_ECHO = FIRST, IGNORE_PATTERN = 'oct', SEARCH_ECHO_CTX = 3
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  nov dec
--let SEARCH_ECHO=     FIRST
--let IGNORE_PATTERN=  oct
--let SEARCH_ECHO_CTX= 3
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'nov dec', SEARCH_ECHO = ALL, IGNORE_PATTERN = 'oct', SEARCH_ECHO_CTX = 3
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  nov dec
--let SEARCH_ECHO=     ALL
--let IGNORE_PATTERN=  oct
--let SEARCH_ECHO_CTX= 3
--source include/search_pattern.inc

--echo -- SEARCH_PATTERN = 'nov dec', SEARCH_ECHO = ALL, IGNORE_PATTERN = 'october', SEARCH_ECHO_CTX = 3
--let SEARCH_FILE=     $file
--let SEARCH_PATTERN=  nov dec
--let SEARCH_ECHO=     ALL
--let IGNORE_PATTERN=  october
--let SEARCH_ECHO_CTX= 3
--source include/search_pattern.inc

-- clean up
--remove_file $file

--echo --
--echo -- Bug#17944190 : MYSQLTEST CANNOT PARSE PERL BLOCK INSIDE IF THAT EVALUATES TO FALSE
--echo --

if(1) {
  --perl
  -- True block
  print "True block\n";
  EOF
}

if(0) {
  --perl
  -- False block
  print "False block\n";
  EOF
}

--let $i = 2
while($i) {
  --dec $i
  if (!$i) {
    --perl
    print "Hello\n";
    EOF
  }
}

--echo --
--echo -- Bug#23035906 : MTR: MYSQLTEST PARSES QUOTES IN SQL COMMENTS LITERALLY LEADING TO EOL JUNK ERROR
--echo --

SELECT 100 + /* Shouldn't fail */ 1 AS result;
SELECT 100 /* Shouldn't fail */ + 1 AS result;

SELECT 100 +
/*
Shouldn't
fail
*/
1 AS result;

SELECT 100
/*
Shouldn't
fail
*/
+ 1 AS result;

SELECT 100 /* shouldn't / fail */ + 1 AS result;
SELECT 100 /* shouldn't * fail */ + 1 AS result;
SELECT 100 /* shouldn't /* fail */ + 1 AS result;
SELECT 100 /* shouldn't /* fail */ + 1 AS res1, 'ABC' AS res2;

SELECT 100 + /* "shouldnt fail */ 1 AS result;
SELECT 100 + /* "shouldn't fail" */ 1 AS result;
SELECT 100 + /* `shouldn't fail */ 1 AS result;
SELECT 100 + /* `shouldn't fail` */ 1 AS result;
SELECT 100 + /*  + shouldn't fail */ 1 AS result;
SELECT 100 + /*  ! shouldn't fail */ 1 AS result;
SELECT 1 /*!,"\'" */;

SELECT 100 + /***/ 1 AS result;
SELECT 100 + /**'*/ 1 AS result;
SELECT 100 + /*/*/ 1 AS result;
SELECT 100 + /*/'*/ 1 AS result;
SELECT 100 + /* should */ fail */ 1 AS result;
SELECT 100 + /* shoul'd */ fail */ 1 AS result;

CREATE TABLE t1(a INT PRIMARY KEY);
INSERT INTO t1 values (1),(5),(10) /* doesn't throw error */;
SELECT * FROM t1 /* shouldn't throw error */;
DROP TABLE t1;

-- Variant of C style comment(/*! ... */)
-- Server should be able to parse the code inside the comment
SELECT COUNT(*) FROM INFORMATION_SCHEMA.INNODB_TEMP_TABLE_INFO;

-- Should create a temporary table
CREATE /*! TEMPORARY */ TABLE t1 /* shouldn't fail */ (a INT) CHARSET utf8mb4;

SELECT COUNT(*) FROM INFORMATION_SCHEMA.INNODB_TEMP_TABLE_INFO;
DROP TEMPORARY TABLE t1;
SELECT 1 AS res;
SELECT 1 AS res;

-- Copy multiple files using a pattern
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy1/ word*
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy1/ load*
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy1/ *.txt
--list_files $MYSQLTEST_VARDIR/copy1/

-- Copy all the files from the directory by specifying *
--copy_files_wildcard $MYSQLTEST_VARDIR/copy1/ $MYSQLTEST_VARDIR/copy2/ *
--list_files $MYSQLTEST_VARDIR/copy2/

-- Overwriting of files is allowed
--copy_files_wildcard $MYSQLTEST_VARDIR/copy2/ $MYSQLTEST_VARDIR/copy1/ *.txt

-- Files in the directory are not matched by the pattern provided
--error 1
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy1/ abc*

-- Source directory does not exist
--error 1
--copy_files_wildcard $MYSQLTEST_VARDIR/abc/ $MYSQLTEST_VARDIR/copy1/ *

--remove_files_wildcard $MYSQLTEST_VARDIR/copy2/ *
-- Source directory does not have any files in it
--error 1
--copy_files_wildcard $MYSQLTEST_VARDIR/copy2/ $MYSQLTEST_VARDIR/copy1/ *

--remove_files_wildcard $MYSQLTEST_VARDIR/copy1/ *
--rmdir $MYSQLTEST_VARDIR/copy1/

-- Destination directory does not exist
--error 1
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy1/ *

-- Pattern is a mandatory argument
--error 1
--exec echo "copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/copy2/ ;

-- Delete an empty directory, should succeed
--mkdir $MYSQLTEST_VARDIR/bug24316799
--force-rmdir $MYSQLTEST_VARDIR/bug24316799

-- Delete a directory recursively, should succeed
--mkdir $MYSQLTEST_VARDIR/bug24316799
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/bug24316799 loaddata*

--mkdir $MYSQLTEST_VARDIR/bug24316799/bug24316799_subdir
--copy_files_wildcard $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/bug24316799/bug24316799_subdir bug*

--force-rmdir $MYSQLTEST_VARDIR/bug24316799

-- Directory doesn't exist, should fail
--error 1
--force-rmdir $MYSQLTEST_VARDIR/bug24316799

--echo --
--echo -- Bug#21046241 : MTR CONNECT() NOT WORKING FOR TCP AND SOCKET PROTOCOL OPTIONS
--echo --

-- TCP protocol, should pass
--connect(tcp_con,localhost,root,,,,,TCP)

-- Disabling the query log and result log to make the test run on
-- both non-windows and windows platforms without any result mismatch.
--disable_query_log
--disable_result_log
--let $os_version = `SELECT CONVERT(@@version_compile_os using latin1) NOT IN ("Win32","Win64","Windows")`

-- Socket protocol on non-windows platform, should pass
if ($os_version)
{
  --connect(sock_con,localhost,root,,,,$MASTER_MYSOCK,SOCKET)
}

-- Socket protocol on windows, should fail
if (!$os_version)
{
  --error CR_CONN_UNKNOW_PROTOCOL
  --connect(sock_con,localhost,root,,,,$MASTER_MYSOCK,SOCKET)
}

-- Checking windows connection protocols on non-windows platforms
-- Should throw 'Wrong protocol' error
if ($os_version)
{
  --let $shm_name= query_get_value("SHOW GLOBAL VARIABLES LIKE 'shared_memory_base_name'", Value, 1)
  --error CR_CONN_UNKNOW_PROTOCOL
  --connect(shm_con,localhost,root,,,,$shm_name,SHM)

  --error CR_CONN_UNKNOW_PROTOCOL
  --connect(pipe_con,localhost,root,,,,,PIPE)
}

--enable_result_log
--enable_query_log

--echo --
--echo -- Bug#24466969 : MTR CONNECT() ACCEPTS CONNECTION OPTIONS WITH ADDITIONAL TRAILING CHARACTERS
--echo --

--error 1
--exec echo "connect(invalid_con,localhost,root,,,,,SOCKETNEW);
EOF
--force-cpdir $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/bug24806681
--list_files $MYSQLTEST_VARDIR/bug24806681/std_data/Europe
--force-rmdir $MYSQLTEST_VARDIR/bug24806681

--echo -- Source directory doesn't exist, should fail
--error 1
--force-cpdir $MYSQLTEST_VARDIR/bug24806681 $MYSQLTEST_VARDIR/bug24806681_1

--echo -- Destination contains a file with the same name as a
--echo -- subdirectory in source, should fail
--mkdir $MYSQLTEST_VARDIR/bug24806681
--mkdir $MYSQLTEST_VARDIR/bug24806681/std_data
--write_file $MYSQLTEST_VARDIR/bug24806681/std_data/Europe
Test case for "force-cpdir <source> <destination>" command
EOF
--error 1
--force-cpdir $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/bug24806681
--force-rmdir $MYSQLTEST_VARDIR/bug24806681

--echo -- Source directory path and destination directory path are same, should fail
--error 1
--force-cpdir $MYSQLTEST_VARDIR/std_data/ $MYSQLTEST_VARDIR/std_data/

--echo --
--echo -- BUG#24806741 : MTR: INTRODUCE "EXPR" COMMAND
--echo --

--let $var1= 10
--let $var2= 20
--let $var3= -10
--let $var4= 10.5
--let $var5= -3.5
--let $var6= 1e10
--let $var7= 1e8
--let $var8= 0
--let $var9= 2
--let $var10= 3

--echo --
--echo -- Arithmetic operation
--echo --

--echo -- Addition operation
--echo expr \$res= $var1 + $var2
--expr $res= $var1 + $var2
--echo $res

--echo expr \$res= $var2 + ($var3)
--expr $res= $var2 + $var3
--echo $res

--echo expr \$res= $var3 + $var4
--expr $res= $var3 + $var4
--echo $res

--echo expr \$res= $var5 + $var4
--expr $res= $var5 + $var4
--echo $res

--echo expr \$res= $var6 + $var6
--expr $res= $var6 + $var6
--echo $res

--echo expr \$res= $var6 + $var7
--expr $res= $var6 + $var7
--echo $res

--echo -- Subtraction operation
--echo expr \$res= $var1 - $var2
--expr $res= $var1 - $var2
--echo $res

--echo expr \$res= $var2 - ($var3)
--expr $res= $var2 - $var3
--echo $res

--echo expr \$res= $var3 - $var1
--expr $res= $var3 - $var1
--echo $res

--echo expr \$res= $var4 - $var1
--expr $res= $var4 - $var1
--echo $res

--echo expr \$res= $var6 - $var7
--expr $res= $var6 - $var7
--echo $res

--echo expr \$res= $var7 - $var6
--expr $res= $var7 - $var6
--echo $res

--echo -- Multiplication operation
--echo expr \$res= $var1 * $var2
--expr $res= $var1 * $var2
--echo $res

--echo expr \$res= $var1 * ($var3)
--expr $res= $var1 * $var3
--echo $res

--echo expr \$res= $var3 * $var4
--expr $res= $var3 * $var4
--echo $res

--echo expr \$res= $var4 * ($var5)
--expr $res= $var4 * $var5
--echo $res

--echo expr \$res= $var6 * $var7
--expr $res= $var6 * $var7
--echo $res

--echo -- Division operation
--echo expr \$res= $var1 / $var2
--expr $res= $var1 / $var2
--echo $res

--echo expr \$res= $var2 / ($var3)
--expr $res= $var2 / $var3
--echo $res

--echo expr \$res= $var4 / ($var5)
--expr $res= $var4 / $var5
--echo $res

--echo expr \$res= $var6 / $var7
--expr $res= $var6 / $var7
--echo $res

--echo -- Modulo operation
--echo expr \$res= $var1 % $var2
--expr $res= $var1 % $var2
--echo $res

--echo expr \$res= $var2 % ($var3)
--expr $res= $var2 % $var3
--echo $res

--echo expr \$res= $var4 % $var5
--expr $res= $var4 % $var5
--echo $res

--echo --
--echo -- Logical operation
--echo --

--echo -- Logical AND operation
--echo expr \$res= $var1 && $var2
--expr $res= $var1 && $var2
--echo $res

--echo expr \$res= $var3 && $var8
--expr $res= $var3 && $var8
--echo $res

--echo expr \$res= $var2 && $var3
--expr $res= $var2 && $var3
--echo $res

--echo expr \$res= $var4 && $var5
--expr $res= $var4 && $var5
--echo $res

--echo expr \$res= $var5 && $var8
--expr $res= $var5 && $var8
--echo $res

--echo expr \$res= $var8 && $var8
--expr $res= $var8 && $var8
--echo $res

--echo -- Logical OR operation
--echo expr \$res= $var1 || $var2
--expr $res= $var1 || $var2
--echo $res

--echo expr \$res= $var3 || $var8
--expr $res= $var3 || $var8
--echo $res

--echo expr \$res= $var3 || $var5
--expr $res= $var3 || $var5
--echo $res

--echo expr \$res= $var4 || $var8
--expr $res= $var4 || $var8
--echo $res

--echo expr \$res= $var8 || $var8
--expr $res= $var8 || $var8
--echo $res

--echo --
--echo -- Bitwise operation
--echo --

--echo -- Binary AND operation
--echo expr \$res= $var1 & $var2
--expr $res= $var1 & $var2
--echo $res

--echo expr \$res= $var2 & $var4
--expr $res= $var2 & $var4
--echo $res

--echo expr \$res= $var2 & $var8
--expr $res= $var2 & $var8
--echo $res

--echo expr \$res= $var1 & $var9
--expr $res= $var1 & $var9
--echo $res

--echo -- Binary OR operation
--echo expr \$res= $var1 | $var2
--expr $res= $var1 | $var2
--echo $res

--echo expr \$res= $var2 | $var4
--expr $res= $var2 | $var4
--echo $res

--echo expr \$res= $var2 | $var8
--expr $res= $var2 | $var8
--echo $res

--echo expr \$res= $var8 | $var8
--expr $res= $var8 | $var8
--echo $res

--echo -- Binary XOR operation
--echo expr \$res= $var1 ^ $var2
--expr $res= $var1 ^ $var2
--echo $res

--echo expr \$res= $var2 ^ $var4
--expr $res= $var2 ^ $var4
--echo $res

--echo expr \$res= $var2 ^ $var8
--expr $res= $var2 ^ $var8
--echo $res

--echo -- Binary right shift operation
--echo expr \$res= $var1 >> $var9
--expr $res= $var1 >> $var9
--echo $res

--echo expr \$res= $var2 >> $var10
--expr $res= $var2 >> $var10
--echo $res

--echo expr \$res= $var2 >> $var8
--expr $res= $var2 >> $var8
--echo $res

--echo -- Binary left shift operation
--echo expr \$res= $var1 << $var9
--expr $res= $var1 << $var9
--echo $res

--echo expr \$res= $var2 << $var10
--expr $res= $var2 << $var10
--echo $res

--echo expr \$res= $var2 << $var8
--expr $res= $var2 << $var8
--echo $res

--echo -- Infinite result
--let $var= 1e308
--echo expr \$res= $var + $var
--expr $res= $var + $var
--echo $res

--echo -- Division by 0, result will be an infinite value and MTR will print 'inf' keyword.
--echo expr \$res= $var1 / $var8
--expr $res= $var1 / $var8
--echo $res

--echo -- 0.0 / 0.0, result will be NaN and MTR will print 'nan' keyword.
--echo expr \$res= $var8 / $var8
--expr $res= $var8 / $var8
--echo $res

--echo -- Invalid mathematical expressions
--echo expr
--error 1
--exec echo "expr;
SELECT 100 AS res;
EOF
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/a_b.test
--remove_file $MYSQLTEST_VARDIR/tmp/a_b.test

--echo -- Test file name 'a-b.test'
--write_file $MYSQLTEST_VARDIR/tmp/a-b.test
SELECT 100 AS res;
EOF
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/a-b.test
--remove_file $MYSQLTEST_VARDIR/tmp/a-b.test

--echo -- Test file name '-ab.test'
--write_file $MYSQLTEST_VARDIR/tmp/-ab.test
SELECT 100;
EOF
--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/-ab.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/-ab.test

--echo -- Test file name '_ab.test'
--write_file $MYSQLTEST_VARDIR/tmp/_ab.test
SELECT 100;
EOF
--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/_ab.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/_ab.test

--echo -- Test file name 'a=bc.test'
--write_file $MYSQLTEST_VARDIR/tmp/a=bc.test
SELECT 100;
EOF
--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/a=bc.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/a=bc.test

--echo -- Test file name 'abc@.test'
--write_file $MYSQLTEST_VARDIR/tmp/abc@.test
SELECT 100;
EOF
--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/abc@.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/abc@.test

--echo -- Result file name 'ab#c.result'
--write_file $MYSQLTEST_VARDIR/tmp/ab--c.result
SELECT 100;
EOF
--error 1
--exec $MYSQL_TEST -R $MYSQLTEST_VARDIR/tmp/ab--c.result 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/ab--c.result

--echo -- Bug#23280117: 5.7 BUG XXXXX TEST REPLACE NUMBER ROUND+GIS PRECISION
--echo -- DIFFERENCES (CONTRIBUTION)
--echo --

--echo -- Insert values to be tested into a table
CREATE TABLE t1(f FLOAT, k DOUBLE);
INSERT INTO t1 VALUES(124.7892,1.23456e200);
INSERT INTO t1 VALUES(6.9999999,1.000000000);
INSERT INTO t1 VALUES(12900.019,37489e-12);
SELECT * FROM t1;

DROP TABLE t1;
SELECT 'aaaa(12.123484502750487)';
SELECT 19.955934879;
{
  --write_file $MYSQL_TMP_DIR/bug25840940.inc
  Hello
  EOF
}

--echo -- File shouldn't be created by write_file command inside
--echo -- the if block, cat_file command should fail.
--error 1
--cat_file $MYSQL_TMP_DIR/bug25840940.inc

--echo -- while condition evalutes to false
while (0)
{
  --write_file $MYSQL_TMP_DIR/bug25840940.inc
  Hello
  EOF
}

--echo -- File shouldn't be created by write_file command inside
--echo -- the while block, cat_file command should fail
--error 1
--cat_file $MYSQL_TMP_DIR/bug25840940.inc

-- Create a file
--write_file $MYSQL_TMP_DIR/bug25840940.inc
Hello
EOF

--echo -- Outer if condition evalutes to false
if (0)
{
  if (1)
  {
    --append_file $MYSQL_TMP_DIR/bug25840940.inc
    Hello
    EOF
  }
}

--echo -- "Hello" shouldn't be repeated
--cat_file $MYSQL_TMP_DIR/bug25840940.inc

--echo -- Outer while condition evalutes to false
while (0)
{
  if (1)
  {
    --append_file $MYSQL_TMP_DIR/bug25840940.inc
    Hello
    EOF
  }
}

--echo -- "Hello" shouldn't be repeated
--cat_file $MYSQL_TMP_DIR/bug25840940.inc

-- Cleanup
--remove_file $MYSQL_TMP_DIR/bug25840940.inc

--echo --
--echo -- BUG#11766444 : MTR PRINTS WRONG FILE AND LINE NUMBER WHEN TESTS FAIL
--echo --

--write_file $MYSQLTEST_VARDIR/tmp/bug11766444.test
--let $counter= 2
while ($counter)
{
  --dec $counter
  if (!$counter)
  {
    execute this invalid query;
  }
}
EOF

-- Invalid query at line 7
--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/bug11766444.test 2>&1

-- Cleanup
--remove_file $MYSQLTEST_VARDIR/tmp/bug11766444.test

--echo --
--echo -- BUG#25821838 : --ERROR IS NOT PROPERLY WORKING IF IT IS USED INSIDE WHILE LOOP
--echo --

-- '--error' command should be evaluated only during the first iteration
--let $counter= 0

while ($counter <= 1)
{
  if ($counter == 0)
  {
    --error ER_BAD_TABLE_ERROR
  }
  DROP TABLE t1;
  CREATE TABLE t1(c1 INT);

DROP TABLE t1;

-- '--error' command should be evaluated only during the second iteration
--let $counter= 0

while ($counter <= 1)
{
  if ($counter == 1)
  {
    --error ER_TABLE_EXISTS_ERROR
  }
  CREATE TABLE t1(c1 INT);

DROP TABLE t1;
EOF

-- Run the test
--error 63
--exec $MYSQL_TEST --no-skip -x $MYSQLTEST_VARDIR/tmp/bug26090322.test 2>&1

-- Cleanup
--remove_file $MYSQLTEST_VARDIR/tmp/bug26090322.test

--echo --
--echo -- BUG#25929826 : SKIP COMMAND DOES NOT EXPAND VARIABLES
--echo --

--write_file $MYSQLTEST_VARDIR/tmp/bug25929826.test
--let $skip_message= Skipping bug25929826.test
--skip $skip_message
EOF

-- Run the test, test should get skipped and exit with status 62
--replace_result $MYSQLTEST_VARDIR MYSQLTEST_VARDIR
--error 62
--exec $MYSQL_TEST --no-skip-exclude-list=bug25929826.test -x $MYSQLTEST_VARDIR/tmp/bug25929826.test 2>&1

-- Cleanup
--remove_file $MYSQLTEST_VARDIR/tmp/bug25929826.test

--echo --
--echo -- BUG#26630826: MTR: REPLACE_RESULT IS NOT ABLE TO REPLACE LONG
--echo --               STRINGS IN PATH NAME
--echo --

-- Check whether replace_result replaces a matching long string pattern
-- when used with exec mysqltest command.
--let $replace_string= `SELECT REPEAT('A', 550)`
--replace_result $replace_string REPLACE_STRING
--exec echo $replace_string

-- replace_result with long string pattern as argument used with exec
-- command which fails with error 1, pattern should get replaced.
--replace_result $replace_string REPLACE_STRING tab1 t1
--error 1
--exec echo "SELECT $replace_string FROM tab1;
bug fixes in MTR
EOF
--copy_file $MYSQLTEST_VARDIR/tmp/24671890.txt $MYSQLTEST_VARDIR/tmp/24671890_2.txt 1

-- Test invalid values of retry
--write_file $MYSQLTEST_VARDIR/tmp/invalid.txt
Test invalid values of retry parameter
EOF

--error 1
--exec echo "copy_file $MYSQLTEST_VARDIR/tmp/invalid.txt $MYSQLTEST_VARDIR/tmp/invalidated.txt 5abc;

-- Test invalid values of retry
--error 1
--exec echo "copy_files_wildcard $MYSQLTEST_VARDIR/tmp/ $MYSQLTEST_VARDIR/tmp/tmp1 in* 1oo1;

-- Test invalid values of retry
--error 1
--exec echo "move_file $MYSQLTEST_VARDIR/tmp/invalid.txt $MYSQLTEST_VARDIR/tmp/invalidated.txt 11a;

-- Test invalid values of retry
--error 1
--exec echo "file_exists $MYSQLTEST_VARDIR/tmp/invalid.txt a10a;

-- Test invalid values of retry
--error 1
--exec echo "remove_files_wildcard $MYSQLTEST_VARDIR/tmp/ in* blah;

-- Clean up
--rmdir $MYSQLTEST_VARDIR/tmp/tmp1/
--remove_file $MYSQLTEST_VARDIR/tmp/invalid.txt
--remove_file $MYSQLTEST_VARDIR/tmp/24671890_2.txt
--remove_files_wildcard $MYSQLTEST_VARDIR tmp*

--echo --
--echo -- BUG#27136445: MTR: EXPORT AND USE # OF AVAILABLE CPUS IN TESTS
--echo --

-- Print the value of environment variable storing number of CPUs
--replace_result $NUMBER_OF_CPUS NUMBER_OF_CPUS
--eval SELECT $NUMBER_OF_CPUS

--echo --
--echo -- WL#11811: Rename and enhance [disable|enable]_parser test commands
--echo --

--disable_query_log
--disable_testcase BUG--0000
-- Since the test case is already disabled, the following will not
-- enable query logging
--enable_query_log
SELECT "this will not be executed" AS not_executed;
SELECT "this will be executed" AS executed;

-- Bug number argument should follow BUG#XXXX format, where "BUG" keyword
-- is case-insensitive and  "XXXX" should contain only digits.
--disable_testcase Bug--0000
--enable_query_log
SELECT "this will not be executed" AS not_executed;
SELECT "this will be executed" AS executed;
SELECT "this will not be executed" AS not_executed;
SELECT "this will be executed" AS executed;

-- Invalid scenarios
-- Invalid bug number format 'BUGG#0000'
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUGG--0000
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

-- Invalid bug number format 'BUG#A00A'
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUG--A00A
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

-- Invalid bug number format 'BUG#AAAA'
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUG--AAAA
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

-- Test case is already disabled
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUG--0000
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

-- Test case is already enabled
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUG--0000
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

-- Test ends with test case execution disabled
--write_file $MYSQLTEST_VARDIR/tmp/wl11811.test
--disable_testcase BUG--0000
SELECT 1 AS res;
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQLTEST_VARDIR/tmp/wl11811.test 2>&1
--remove_file $MYSQLTEST_VARDIR/tmp/wl11811.test

--echo --
--echo -- BUG#28358835: MYSQLTEST: --ERROR IGNORES '0' IF ITS NOT THE FIRST
--echo --               ERROR CODE
--echo --

-- Execute a command using exec
--error 1,0
--exec exit 0

-- SQL query
--error ER_NO,ER_YES,0
SELECT 1 AS res;

-- mysqltest command
--write_file $MYSQLTEST_VARDIR/tmp/bug28358835.tmp
BUG--28358835
EOF

--error 1,0
--remove_file $MYSQLTEST_VARDIR/tmp/bug28358835.tmp

--echo --
--echo -- WL11832: MTR: Enhance [disable|enable]_warnings commands to
--echo --          disable or enable a specific list of warnings
--echo --

SET @old_sql_mode = @@sql_mode;
SET @@sql_mode = 'NO_ENGINE_SUBSTITUTION';

CREATE TABLE t1 (
  c1 DOUBLE NOT NULL AUTO_INCREMENT,
  c2 INT,
  c3 DECIMAL(2) UNSIGNED,
  c4 DECIMAL,
  PRIMARY KEY (c1)
);

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 1, -500, "aaa");
DELETE FROM t1;

-- disable_warnings should disable all the warnings
--disable_warnings
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 2, -500, "aaa");
DELETE FROM t1;

-- enable_warning should enable all the disable warnings
--enable_warnings
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 3, -500, "aaa");
DELETE FROM t1;

-- disable_warnings with warning list argument, should suppress only
-- the specified warnings.
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 4, -500, "aaa");
DELETE FROM t1;

-- If there exist disabled warnings, new disabled warnings specified
-- will get appended to the existing list of disabled_warnings.
-- All three warnings should be disabled now.
--disable_warnings ER_TRUNCATED_WRONG_VALUE,ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 5, -500, "aaa");
DELETE FROM t1;

-- enable_warnings with warning list argument, should enable only
-- the specified warnings.
--enable_warnings ER_TRUNCATED_WRONG_VALUE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 6, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 7, -500, "aaa");
DELETE FROM t1;

-- Enable all the warnings
--enable_warnings ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 8, -500, "aaa");
DELETE FROM t1;

-- Disable all the warnings
--disable_warnings
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 9, -500, "aaa");
DELETE FROM t1;

-- enable_warnings with warning list argument
--enable_warnings ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 10, -500, "aaa");
DELETE FROM t1;

-- If there exist enabled warnings, new enabled warnings specified
-- will get appended to the existing list of enabled_warnings.
-- All three warnings should be enabled now.
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 11, -500, "aaa");
DELETE FROM t1;

-- disable_warnings with "ONCE" argument
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 12, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 13, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 14, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 15, -500, "aaa");
DELETE FROM t1;

-- enable_warnings with "ONCE" argument
--disable_warnings
--enable_warnings ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 16, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 17, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 18, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 19, -500, "aaa");
DELETE FROM t1;

-- Disabling a warning more than once WILL NOT have any effect, attempts
-- to disable it after the first one WILL be ignored.
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 20, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 21, -500, "aaa");
DELETE FROM t1;

-- ER_WARN_DATA_OUT_OF_RANGE is disaled twice, enabling it ONLY ONCE is
-- enough since disabling of the same warning again will be ignored.
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 22, -500, "aaa");
DELETE FROM t1;

-- $DISABLED_WARNINGS_LIST contains list of currently disabled warnings.
-- All the warnings are enabled, $DISABLED_WARNINGS_LIST should be empty
--echo $DISABLED_WARNINGS_LIST

-- Disable ER_WARN_DATA_OUT_OF_RANGE and ER_TRUNCATED_WRONG_VALUE warnings
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 23, -500, "aaa");
DELETE FROM t1;

-- $DISABLED_WARNINGS_LIST should contains 2 warnings
--echo $DISABLED_WARNINGS_LIST

-- Disable ER_TRUNCATED_WRONG_VALUE_FOR_FIELD warning
--disable_warnings ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 24, -500, "aaa");
DELETE FROM t1;

-- $DISABLED_WARNINGS_LIST should contains 3 warnings now
--echo $DISABLED_WARNINGS_LIST

-- ER_WARN_DATA_OUT_OF_RANGE warning is enabled, $DISABLED_WARNINGS_LIST
-- should contain only 2 warnings now.
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE
--echo $DISABLED_WARNINGS_LIST

-- $DISABLED_WARNINGS_LIST variable can be used with enable_warnings command
-- to enable all the currently disabled warnings.
--enable_warnings $DISABLED_WARNINGS_LIST

-- All the warnings are enabled, $DISABLED_WARNINGS_LIST should be empty
--echo $DISABLED_WARNINGS_LIST

-- Disabling warnings only once, $DISABLED_WARNINGS_LIST value should get
-- updated after the execution of the next statement.
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE ONCE
--echo $DISABLED_WARNINGS_LIST
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 25, -500, "aaa");
DELETE FROM t1;

-- $DISABLED_WARNINGS_LIST should be empty now
--echo $DISABLED_WARNINGS_LIST
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 26, -500, "aaa");
DELETE FROM t1;

-- $ENABLED_WARNINGS_LIST contains list of currently enabled warnings.
-- All the warning are enabled, $ENABLED_WARNINGS_LIST should be empty.
--echo $ENABLED_WARNINGS_LIST

--disable_warnings
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 27, -500, "aaa");
DELETE FROM t1;

-- Enable ER_WARN_DATA_OUT_OF_RANGE warning
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 28, -500, "aaa");
DELETE FROM t1;

-- $ENABLED_WARNINGS_LIST should contain ER_WARN_DATA_OUT_OF_RANGE
--echo $ENABLED_WARNINGS_LIST

-- Enable ER_TRUNCATED_WRONG_VALUE,ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
--enable_warnings ER_TRUNCATED_WRONG_VALUE,ER_TRUNCATED_WRONG_VALUE_FOR_FIELD
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 29, -500, "aaa");
DELETE FROM t1;

-- $ENABLED_WARNINGS_LIST should contain 3 warnings
--echo $ENABLED_WARNINGS_LIST

-- $ENABLED_WARNINGS_LIST variable can be used with disable_warnings command
-- to disable all the currently enabled warnings.
--disable_warnings $ENABLED_WARNINGS_LIST

-- All the warnings are disabled, $ENABLED_WARNINGS_LIST should be empty
--echo $ENABLED_WARNINGS_LIST

-- Enabling warnings only once, $ENABLED_WARNINGS_LIST value should get
-- updated after the execution of the next statement.
--disable_warnings
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE,ER_TRUNCATED_WRONG_VALUE ONCE
--echo $ENABLED_WARNINGS_LIST
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 30, -500, "aaa");
DELETE FROM t1;

-- $ENABLED_WARNINGS_LIST should be empty now
--echo $ENABLED_WARNINGS_LIST
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 31, -500, "aaa");
DELETE FROM t1;

-- Varables containing warning names as arguments to disable/enable_warnings
-- command.
--let $warning_1 = ER_WARN_DATA_OUT_OF_RANGE
--let $warning_2 = ER_TRUNCATED_WRONG_VALUE
--disable_warnings $warning_1,$warning_2
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 32, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 33, -500, "aaa");
DELETE FROM t1;
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 34, -500, "aaa");

-- Cleanup
SET @@sql_mode = @old_sql_mode;
DROP TABLE t1;

-- More scenarios
--write_file $MYSQL_TMP_DIR/mtr.test
--disable_warnings ER_BAD_TABLE_ERROR
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
EOF

--write_file $MYSQL_TMP_DIR/mtr.inc
--enable_warnings ER_BAD_TABLE_ERROR ONCE
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
EOF

--exec $MYSQL_TEST -x $MYSQL_TMP_DIR/mtr.test 2>&1
--remove_file $MYSQL_TMP_DIR/mtr.inc
--remove_file $MYSQL_TMP_DIR/mtr.test

--################

--write_file $MYSQL_TMP_DIR/mtr.test
--disable_warnings
--enable_warnings ER_BAD_TABLE_ERROR
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
EOF

--write_file $MYSQL_TMP_DIR/mtr.inc
--disable_warnings ER_BAD_TABLE_ERROR ONCE
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;
EOF

--exec $MYSQL_TEST -x $MYSQL_TMP_DIR/mtr.test 2>&1
--remove_file $MYSQL_TMP_DIR/mtr.inc
--remove_file $MYSQL_TMP_DIR/mtr.test

-- Invalid scenarios

-- Error numbers are not allowed in warning list argument for both
-- disabled_warnings and enable_warnings command.
--error 1
--exec echo "disable_warnings 1264;

-- Test shouldn't end with disabled warnings
--error 1
--exec echo "disable_warnings;

-- If there exist disabled warnings, then a query should generate any of
-- the disabled warnings.
--error 1
--exec echo "disable_warnings ER_TRUNCATED_WRONG_VALUE;

-- Second argument to disable/enable_warnings command should always
-- be "ONCE" keyword.
--error 1
--exec echo "disable_warnings ER_WARN_DATA_OUT_OF_RANGE ONE;

-- Warning list argument to disable/enable_warnings command can't
-- be an empty string
--error 1
--exec echo "disable_warnings \$ENABLED_WARNINGS_LIST;

-- Query didn't generate any of the expected warning(s)
--error 1
--exec echo "disable_warnings ER_YES;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1;

-- All the warnings are enabled, $DISABLED_WARNINGS_LIST should be empty
--echo $DISABLED_WARNINGS_LIST

-- Warning list argument to command 'enable_warnings' can't be an empty string
--enable_warnings $DISABLED_WARNINGS_LIST ONCE
EOF

--error 1
--exec $MYSQL_TEST -x $MYSQL_TMP_DIR/bug28218057.test 2>&1
--remove_file $MYSQL_TMP_DIR/bug28218057.test

--echo --
--echo -- BUG#28759823: DISABLE/ENABLE_WARNINGS COMMANDS SHOULDN'T ALLOW COMMA
--echo --               AT THE END
--echo --

--error 1
--exec echo "disable_warnings ER_YES,ER_NO,;

SET @old_sql_mode = @@sql_mode;
SET @@sql_mode = 'NO_ENGINE_SUBSTITUTION';

CREATE TABLE t1 (
  c1 DOUBLE NOT NULL AUTO_INCREMENT,
  c2 INT,
  c3 DECIMAL(2) UNSIGNED,
  c4 DECIMAL,
  PRIMARY KEY (c1)
);

-- Only ER_TRUNCATED_WRONG_VALUE should be disabled ONCE.
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE ONCE
--disable_warnings ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 35, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 36, -500, "aaa");
DELETE FROM t1;

-- ER_WARN_DATA_OUT_OF_RANGE and ER_TRUNCATED_WRONG_VALUE should be
-- disabled for the first INSERT statement.
--disable_warnings ER_WARN_DATA_OUT_OF_RANGE
--disable_warnings ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 37, -500, "aaa");
DELETE FROM t1;

-- Only ER_WARN_DATA_OUT_OF_RANGE should be disabled.
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 38, -500, "aaa");
DELETE FROM t1;

-- Only ER_TRUNCATED_WRONG_VALUE should be enabled.
--disable_warnings
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE ONCE
--enable_warnings ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 39, -500, "aaa");
DELETE FROM t1;

INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 40, -500, "aaa");
DELETE FROM t1;

-- ER_WARN_DATA_OUT_OF_RANGE and ER_TRUNCATED_WRONG_VALUE should be
-- enabled for the first INSERT statement.
--enable_warnings ER_WARN_DATA_OUT_OF_RANGE
--enable_warnings ER_TRUNCATED_WRONG_VALUE ONCE
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 41, -500, "aaa");
DELETE FROM t1;

-- Only ER_WARN_DATA_OUT_OF_RANGE should be enabled.
INSERT INTO t1 VALUES (0x7FFFFFFFFFFFFFFD, 42, -500, "aaa");
DELETE FROM t1;

-- Cleanup
SET @@sql_mode = @old_sql_mode;
DROP TABLE t1;

-- Some common regex errors :-

-- Disabling result log since the actual error message displayed
-- might vary on some platforms.
--disable_result_log

-- Unclosed parenthesis, brackets or braces
--error 1
--exec echo "replace_regex /(a// ;

-- Invalid use of quantifiers
--error 1
--exec echo "replace_regex /?/--/ ;

-- Invalid ranges
--error 1
--exec echo "replace_regex /a{2,1}// ;

-- Miscellaneous use cases

-- Using '-', '$', '.'  or '*' inside a character class with a non-range
-- context matches them literally
--replace_regex /[a-]/--/
SELECT 'b-','ab';
SELECT "$,*,." as escape_chars;

-- Using parenthesis as literals should be fine
--replace_regex /\(/parenthesis/
SELECT "(";
SELECT "[";

-- Even null character and non-printable characters should
-- be matchable in replace_regex
--replace_regex /\0/nul/ /[^ -~]/--/
SELECT 0x00, 0xff;
SELECT 0x00, 0xff;
SELECT 0x00;

-- Matching square brackets literally.
--replace_regex /\[[^\]]+\]/--/
SELECT "[ MY-012345 ]" as err;

-- Removing backslash needs escaping
--replace_regex /[\\]/\//
SELECT CONCAT('winpath','\\');

-- Patterns with assertions
--replace_regex /^mt/--/
SELECT "mtr";
SELECT "mtr";
SELECT "mtr";
SELECT "mtr";
SELECT "abc", "abd";
SELECT "abc", "abd";
SELECT "many words form a sentence" as text;
SELECT "many words form a sentence" as text;

-- Pattern with an alternative
--replace_regex /(ab|ac)/--/
SELECT "absolute", "accent";

-- Patterns with POSIX classes
--replace_regex /[[:digit:]]/<digit>/ /^[[:upper:]]{3}$/<uppercase>/
SELECT 1 as num, "abc" as lc, "ABC" as uc;
SELECT 'a' as letter, 0x00 as nullchar, 0xff as nonprintable;
SELECT $val AS res;
SELECT $val AS res;

CREATE TABLE t1(col1 INT, col2 INT, col3 INT);
INSERT INTO t1 VALUES(1, RAND(), 4);
INSERT INTO t1 VALUES(2, RAND(), 5);
INSERT INTO t1 VALUES(3, RAND(), 6);

CREATE TABLE t2(col1 INT, col2 INT, col3 INT);
INSERT INTO t2 VALUES(1, RAND(), 4);
INSERT INTO t2 VALUES(2, RAND(), 5);
INSERT INTO t2 VALUES(3, RAND(), 6);

-- Check if the two tables are identical, while
-- masking col2, which could vary.
--let $mask_column_list=col2
--let $diff_tables=default:t1, default:t2
--source include/diff_tables.inc

DROP TABLE t1, t2;
abc 456.27
EOF

--replace_result abc def
--cat_file $MYSQLTEST_VARDIR/tmp/bug29769715.txt

-- Check that replacement doesn't affect next query or command
SELECT "abc 456.27" as c1;

-- Should not get replaced
--cat_file $MYSQLTEST_VARDIR/tmp/bug29769715.txt

--replace_numeric_round 1
--cat_file $MYSQLTEST_VARDIR/tmp/bug29769715.txt

-- Should not get replaced
SELECT "abc 456.27" as c1;

-- Check whether long strings get replaced when used with
-- the 'cat_file' mysqltest command
--perl
  my $vardir= $ENV{'MYSQLTEST_VARDIR'};
EOF

--let $replace_string= `SELECT REPEAT('a', 600)`
--replace_result $replace_string long_string
--cat_file $MYSQLTEST_VARDIR/tmp/600chars.txt

--replace_regex /a+/long_string/
--cat_file $MYSQLTEST_VARDIR/tmp/600chars.txt

--remove_file $MYSQLTEST_VARDIR/tmp/bug29769715.txt
--remove_file $MYSQLTEST_VARDIR/tmp/600chars.txt

--#
--# Test assert()
--#
assert(1);

let $x= 1;

let $y= 0;

CREATE TABLE t1 (i int primary key not null);
INSERT INTO t1 values(3);
DROP TABLE t1;
{
  assert(3);
{
  --assert(0)
}

if ($myvar)
{
  assert(0);
{
  assert(0);
{
  assert(0);
{
  assert(0);
{
  --assert(1)
}

while ($myvar)
{
  --assert(1)
  --dec $myvar
}

--error 1
--exec echo "--assert(abcd)" | $MYSQL_TEST 2>&1

--let $true_var=1
--assert(`SELECT $true_var`)

--error 1
--exec echo "--assert(0)" | $MYSQL_TEST 2>&1

--error 1
--exec echo "--assert(\$undef_var)" | $MYSQL_TEST 2>&1

--error 1
--exec echo "let \$false_var=0;