--

SET @old_general_log_state = @@global.general_log;
SET @old_log_output=       @@global.log_output;
SET @old_slow_query_log=   @@global.slow_query_log;
SET @old_general_log=      @@global.general_log;
SET @old_long_query_time=  @@session.long_query_time;
SET GLOBAL log_output="FILE,TABLE";
use mysql;

-- Capture initial settings of system variables
-- so that we can revert to old state after manipulation for testing
-- NOTE:  PLEASE USE THESE VALUES TO 'RESET' SYSTEM VARIABLES
-- Capturing old values within the tests results in loss of values
-- due to people not paying attention to previous tests' changes, captures
-- or improper cleanup
SET @saved_long_query_time = @@long_query_time;
SET @saved_log_output = @@log_output;
SET @saved_general_log = @@GLOBAL.general_log;
SET @saved_slow_query_log = @@GLOBAL.slow_query_log;

SELECT @saved_long_query_time, @saved_log_output, @saved_general_log, @saved_slow_query_log;



--
-- Check that log tables work and we can do basic selects. This also
-- tests truncate, which works in a special mode with the log tables
--

truncate table general_log;
select * from general_log;
select * from slow_log;

--
-- We want to check that a record newly written to a log table shows up for
-- the query: since log tables use concurrent insert machinery and log tables
-- are always locked by artificial THD, this feature requires additional
-- check in ha_tina::write_row. This simple test should prove that the
-- log table flag in the table handler is triggered and working.
--

truncate table general_log;
select * from general_log where argument like '%general_log%';


--
-- Check some basic queries interfering with the log tables.
-- In our test we'll use a tbale with verbose comments to the short
-- command type names, used in the tables
--

create table join_test (verbose_comment varchar (80), command_type varchar(64));

insert into join_test values ("User performed a usual SQL query", "Query");
insert into join_test values ("New DB connection was registered", "Connect");
insert into join_test values ("Get the table info", "Field List");
select verbose_comment, user_host, argument
  from  mysql.general_log join join_test
    on (mysql.general_log.command_type = join_test.command_type);

drop table join_test;

--
-- check that flush of the log table work fine
--

flush logs;

--
-- check locking of the log tables
--

--error ER_CANT_LOCK_LOG_TABLE
lock tables mysql.general_log WRITE;

--
-- This attemts to get TL_READ_NO_INSERT lock, which is incompatible with
-- TL_WRITE_CONCURRENT_INSERT. This should fail. We issue this error as log
-- tables are always opened and locked by the logger.
--

--error ER_CANT_LOCK_LOG_TABLE
lock tables mysql.general_log READ;

--
-- This call should result in TL_READ lock on the log table.
-- This is not ok and should fail.
--

--error ER_CANT_LOCK_LOG_TABLE
lock tables mysql.slow_log READ LOCAL, mysql.general_log READ LOCAL;

-- Misc locking tests

show create table mysql.general_log;

--
-- check that FLUSH LOGS does not flush the log tables
--

flush logs;

SET GLOBAL GENERAL_LOG=ON;
SET GLOBAL SLOW_QUERY_LOG=ON;

--
-- check that FLUSH TABLES does flush the log tables
--

flush tables;

SET GLOBAL GENERAL_LOG=OFF;
SET GLOBAL SLOW_QUERY_LOG=OFF;

SET GLOBAL GENERAL_LOG=ON;
SET GLOBAL SLOW_QUERY_LOG=ON;

--
-- Bug#23924 general_log truncates queries with character set introducers.
--
truncate table mysql.general_log;
set names binary;
select _koi8r'����' as test;
select * from mysql.general_log;
set names utf8mb3;

--
-- Bug #16905    Log tables: unicode statements are logged incorrectly
--

truncate table mysql.general_log;
set names utf8mb3;
create table bug16905 (s char(15) character set utf8mb3 default 'пусто');
insert into bug16905 values ('новое');
select * from mysql.general_log;
drop table bug16905;

--
-- Bug #17600: Invalid data logged into mysql.slow_log
--

truncate table mysql.slow_log;
set session long_query_time=1;
select sleep(2);
select * from mysql.slow_log;
set @@session.long_query_time = @saved_long_query_time;

--
-- Bug #20139 Infinite loop after "FLUSH" and "LOCK tabX, general_log"
--

flush tables with read lock;
use mysql;

--
-- Bug #17544 Cannot do atomic log rotate and
-- Bug #21785 Server crashes after rename of the log table
--

SET SESSION long_query_time = 1000;
drop table if exists mysql.renamed_general_log;
drop table if exists mysql.renamed_slow_log;
drop table if exists mysql.general_log_new;
drop table if exists mysql.slow_log_new;

use mysql;
select * from general_log;
select * from slow_log;

create table general_log_new like general_log;

create table slow_log_new like slow_log;

-- check that rename checks more then first table in the list
--error ER_CANT_RENAME_LOG_TABLE
rename table general_log TO general_log_new, renamed_general_log TO general_log, slow_log to renamed_slow_log;

-- now check the content of tables
--replace_column 1 TIMESTAMP 2 USER_HOST 3 THREAD_ID
select * from general_log;
select * from renamed_general_log;

-- the content of the slow log is empty, but we will try a select anyway
--replace_column 1 TIMESTAMP 2 USER_HOST
select * from slow_log;
select * from renamed_slow_log;

-- check that we can do whatever we want with disabled log
set global general_log='OFF';

set global slow_query_log='OFF';

-- this should fail
--error ER_NO_SUCH_TABLE
set global general_log='ON';
set global slow_query_log='ON';
SET SESSION long_query_time = @saved_long_query_time;

-- this should work
set global general_log='ON';
set global slow_query_log='ON';
drop table renamed_general_log, renamed_slow_log;
use test;

--
-- Bug#27858 (Failing to log to a log table doesn't log anything to error log)
--
-- This test works as expected, it's a negative test.
-- The message "[ERROR] Failed to write to mysql.general_log"
-- is printed to master.err when writing to the table mysql.general_log
-- failed.
-- However, this message is picked up by mysql-test-run.pl,
-- and reported as a test failure, which is a false negative.
-- There is no current way to *selectively* filter out these expected error conditions
-- (see mysql-test/lib/mtr_report.pl, mtr_report_stats()).
-- Instead of filtering all occurences of "Failed to write to
-- mysql.general_log", which could hide bugs when the error is not expected,
-- this test case is commented instead.
-- TODO: improve filtering of expected errors in master.err in
-- mysql-test-run.pl (based on the test name ?), and uncomment this test.

-- --disable_warnings
-- drop table if exists mysql.bad_general_log;
-- 
-- create table mysql.bad_general_log (a int) engine= CSV;
-- 
-- # Rename does not perform checks on the table structure,
-- # exploiting this to force a failure to log
-- rename table mysql.general_log to mysql.general_log_hide, mysql.bad_general_log TO mysql.general_log;
-- 
-- # The following message should be printed in master.log:
-- # [ERROR] Failed to write to mysql.general_log
-- # TODO: See how verifying this could be automated
-- 
-- flush tables;
-- 
-- # Restore the log tables
-- 
-- rename table mysql.general_log to mysql.bad_general_log, mysql.general_log_hide TO mysql.general_log;
-- 
-- flush tables;
-- 
-- drop table mysql.bad_general_log;

--
-- Bug #21966 Strange warnings on repair of the log tables
--

use mysql;
create table general_log_new like general_log;
create table slow_log_new like slow_log;
drop table slow_log_new, general_log_new;
use test;

--
-- Bug#25422 (Hang with log tables)
--

--disable_warnings
drop procedure if exists proc25422_truncate_slow;
drop procedure if exists proc25422_truncate_general;
drop procedure if exists proc25422_alter_slow;
drop procedure if exists proc25422_alter_general;

use test//
create procedure proc25422_truncate_slow (loops int)
begin
  declare v1 int default 0;
    begin end;
    truncate mysql.slow_log;
    set v1 = v1 + 1;
    end while;

create procedure proc25422_truncate_general (loops int)
begin
  declare v1 int default 0;
    begin end;
    truncate mysql.general_log;
    set v1 = v1 + 1;
    end while;

create procedure proc25422_alter_slow (loops int)
begin
  declare v1 int default 0;
    set @old_log_state = @@global.slow_query_log;
    set global slow_query_log = 'OFF';
    alter table mysql.slow_log engine = CSV;
    set global slow_query_log = @old_log_state;
    set v1 = v1 + 1;
    end while;

create procedure proc25422_alter_general (loops int)
begin
  declare v1 int default 0;
    set @old_log_state = @@global.general_log;
    set global general_log = 'OFF';
    alter table mysql.general_log engine = CSV;
    set global general_log = @old_log_state;
    set v1 = v1 + 1;
    end while;

set @iterations=100;

-- ER_BAD_LOG_STATEMENT errors will occur,
-- since concurrent threads do SET GLOBAL general_log= ...
-- This is silenced by handlers and will not affect the test

connect (addconroot1, localhost, root,,);

drop procedure proc25422_truncate_slow;
drop procedure proc25422_truncate_general;
drop procedure proc25422_alter_slow;
drop procedure proc25422_alter_general;


--
-- Bug#23044 (Warnings on flush of a log table)
--

FLUSH TABLE mysql.general_log;

--
-- Bug#17876 (Truncating mysql.slow_log in a SP after using cursor locks the
--            thread)
--
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
DROP TABLE IF EXISTS `db_17876.slow_log_data`;
DROP TABLE IF EXISTS `db_17876.general_log_data`;
DROP PROCEDURE IF EXISTS `db_17876.archiveSlowLog`;
DROP PROCEDURE IF EXISTS `db_17876.archiveGeneralLog`;
DROP DATABASE IF EXISTS `db_17876`;

CREATE DATABASE db_17876;

CREATE TABLE `db_17876.slow_log_data` (
  `start_time` timestamp  default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_host` mediumtext ,
  `query_time` time ,
  `lock_time` time ,
  `rows_sent` int(11) ,
  `rows_examined` int(11) ,
  `db` varchar(512) default NULL,
  `last_insert_id` int(11) default NULL,
  `insert_id` int(11) default NULL,
  `server_id` int(11) default NULL,
  `sql_text` mediumblob,
  `thread_id` bigint(21) unsigned not NULL
);

CREATE TABLE `db_17876.general_log_data` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext,
  `thread_id` bigint(21) unsigned not NULL,
  `server_id` int(11) DEFAULT NULL,
  `command_type` varchar(64) DEFAULT NULL,
  `argument` mediumblob
);

CREATE procedure `db_17876.archiveSlowLog`()
BEGIN
  DECLARE start_time, query_time, lock_time CHAR(20);
  
  REPEAT
    BEGIN
      BEGIN
        DECLARE CONTINUE HANDLER FOR ER_SP_FETCH_NO_DATA SET done = 1;

        FETCH cur1 INTO
           start_time, user_host, query_time, lock_time,
           rows_set, rows_examined, dbname, last_insert_id,
           insert_id, server_id, sql_text, thread_id;
      END;

      IF NOT done THEN
        BEGIN
          INSERT INTO
            `db_17876.slow_log_data`
            VALUES(start_time, user_host, query_time, lock_time, rows_set, rows_examined,
                   dbname, last_insert_id,  insert_id, server_id, sql_text, thread_id);
        END;
      END IF;
    END;
END //

CREATE procedure `db_17876.archiveGeneralLog`()
BEGIN
  DECLARE event_time CHAR(20);
  
  REPEAT
    BEGIN
      BEGIN
        DECLARE CONTINUE HANDLER FOR ER_SP_FETCH_NO_DATA SET done = 1;

        FETCH cur1 INTO
          event_time, user_host, thread_id, server_id,
          command_type, argument;
      END;

      IF NOT done THEN
        BEGIN
          INSERT INTO
            `db_17876.general_log_data`
            VALUES(event_time, user_host, thread_id, server_id,
            command_type, argument);
        END;
      END IF;
    END;
END //

DELIMITER ;

SET GLOBAL general_log = ON;
SET GLOBAL slow_query_log = ON;

select "put something into general_log";
select "... and something more ...";

SET GLOBAL general_log = OFF;
SET GLOBAL slow_query_log = OFF;

DROP TABLE `db_17876.slow_log_data`;
DROP TABLE `db_17876.general_log_data`;
DROP PROCEDURE IF EXISTS `db_17876.archiveSlowLog`;
DROP PROCEDURE IF EXISTS `db_17876.archiveGeneralLog`;
DROP DATABASE IF EXISTS `db_17876`;

SET GLOBAL general_log = @old_general_log;
SET GLOBAL slow_query_log = @old_slow_query_log;
SET sql_mode = default;
--

select CONNECTION_ID() into @thread_id;
set global general_log = on;
set @lparam = "000 001 002 003 004 005 006 007 008 009"
              "010 011 012 013 014 015 016 017 018 019"
              "020 021 022 023 024 025 026 027 028 029"
              "030 031 032 033 034 035 036 037 038 039"
              "040 041 042 043 044 045 046 047 048 049"
              "050 051 052 053 054 055 056 057 058 059"
              "060 061 062 063 064 065 066 067 068 069"
              "070 071 072 073 074 075 076 077 078 079"
              "080 081 082 083 084 085 086 087 088 089"
              "090 091 092 093 094 095 096 097 098 099"
              "100 101 102 103 104 105 106 107 108 109"
              "110 111 112 113 114 115 116 117 118 119"
              "120 121 122 123 124 125 126 127 128 129"
              "130 131 132 133 134 135 136 137 138 139"
              "140 141 142 143 144 145 146 147 148 149"
              "150 151 152 153 154 155 156 157 158 159"
              "160 161 162 163 164 165 166 167 168 169"
              "170 171 172 173 174 175 176 177 178 179"
              "180 181 182 183 184 185 186 187 188 189"
              "190 191 192 193 194 195 196 197 198 199"
              "200 201 202 203 204 205 206 207 208 209"
              "210 211 212 213 214 215 216 217 218 219"
              "220 221 222 223 224 225 226 227 228 229"
              "230 231 232 233 234 235 236 237 238 239"
              "240 241 242 243 244 245 246 247 248 249"
              "250 251 252 253 254 255 256 257 258 259"
              "260 261 262 263 264 265 266 267 268 269"
              "270 271 272 273 274 275 276 277 278 279"
              "280 281 282 283 284 285 286 287 288 289"
              "290 291 292 293 294 295 296 297 298 299"
              "300 301 302 303 304 305 306 307 308 309"
              "310 311 312 313 314 315 316 317 318 319"
              "320 321 322 323 324 325 326 327 328 329"
              "330 331 332 333 334 335 336 337 338 339"
              "340 341 342 343 344 345 346 347 348 349"
              "350 351 352 353 354 355 356 357 358 359"
              "360 361 362 363 364 365 366 367 368 369"
              "370 371 372 373 374 375 376 377 378 379"
              "380 381 382 383 384 385 386 387 388 389"
              "390 391 392 393 394 395 396 397 398 399"
              "400 401 402 403 404 405 406 407 408 409"
              "410 411 412 413 414 415 416 417 418 419"
              "420 421 422 423 424 425 426 427 428 429"
              "430 431 432 433 434 435 436 437 438 439"
              "440 441 442 443 444 445 446 447 448 449"
              "450 451 452 453 454 455 456 457 458 459"
              "460 461 462 463 464 465 466 467 468 469"
              "470 471 472 473 474 475 476 477 478 479"
              "480 481 482 483 484 485 486 487 488 489"
              "490 491 492 493 494 495 496 497 498 499"
              "500 501 502 503 504 505 506 507 508 509"
              "510 511 512 513 514 515 516 517 518 519"
              "520 521 522 523 524 525 526 527 528 529"
              "530 531 532 533 534 535 536 537 538 539"
              "540 541 542 543 544 545 546 547 548 549"
              "550 551 552 553 554 555 556 557 558 559"
              "560 561 562 563 564 565 566 567 568 569"
              "570 571 572 573 574 575 576 577 578 579"
              "580 581 582 583 584 585 586 587 588 589"
              "590 591 592 593 594 595 596 597 598 599"
              "600 601 602 603 604 605 606 607 608 609"
              "610 611 612 613 614 615 616 617 618 619"
              "620 621 622 623 624 625 626 627 628 629"
              "630 631 632 633 634 635 636 637 638 639"
              "640 641 642 643 644 645 646 647 648 649"
              "650 651 652 653 654 655 656 657 658 659"
              "660 661 662 663 664 665 666 667 668 669"
              "670 671 672 673 674 675 676 677 678 679"
              "680 681 682 683 684 685 686 687 688 689"
              "690 691 692 693 694 695 696 697 698 699"
              "700 701 702 703 704 705 706 707 708 709"
              "710 711 712 713 714 715 716 717 718 719"
              "720 721 722 723 724 725 726 727 728 729"
              "730 731 732 733 734 735 736 737 738 739"
              "740 741 742 743 744 745 746 747 748 749"
              "750 751 752 753 754 755 756 757 758 759"
              "760 761 762 763 764 765 766 767 768 769"
              "770 771 772 773 774 775 776 777 778 779"
              "780 781 782 783 784 785 786 787 788 789"
              "790 791 792 793 794 795 796 797 798 799"
              "800 801 802 803 804 805 806 807 808 809"
              "810 811 812 813 814 815 816 817 818 819"
              "820 821 822 823 824 825 826 827 828 829"
              "830 831 832 833 834 835 836 837 838 839"
              "840 841 842 843 844 845 846 847 848 849"
              "850 851 852 853 854 855 856 857 858 859"
              "860 861 862 863 864 865 866 867 868 869"
              "870 871 872 873 874 875 876 877 878 879"
              "880 881 882 883 884 885 886 887 888 889"
              "890 891 892 893 894 895 896 897 898 899"
              "900 901 902 903 904 905 906 907 908 909"
              "910 911 912 913 914 915 916 917 918 919"
              "920 921 922 923 924 925 926 927 928 929"
              "930 931 932 933 934 935 936 937 938 939"
              "940 941 942 943 944 945 946 947 948 949"
              "950 951 952 953 954 955 956 957 958 959"
              "960 961 962 963 964 965 966 967 968 969"
              "970 971 972 973 974 975 976 977 978 979"
              "980 981 982 983 984 985 986 987 988 989"
              "990 991 992 993 994 995 996 997 998 999";
set global general_log = off;
select command_type, argument from mysql.general_log where thread_id = @thread_id;
set global general_log = @old_general_log;

--
-- Bug#34306: Can't make copy of log tables when server binary log is enabled
--

--disable_warnings
DROP TABLE IF EXISTS log_count;
DROP TABLE IF EXISTS slow_log_copy;
DROP TABLE IF EXISTS general_log_copy;

CREATE TABLE log_count (count BIGINT(21));

SET GLOBAL general_log = ON;
SET GLOBAL slow_query_log = ON;

CREATE TABLE slow_log_copy SELECT * FROM mysql.slow_log;
INSERT INTO slow_log_copy SELECT * FROM mysql.slow_log;
INSERT INTO log_count (count) VALUES ((SELECT count(*) FROM mysql.slow_log));
DROP TABLE slow_log_copy;

CREATE TABLE general_log_copy SELECT * FROM mysql.general_log;
INSERT INTO general_log_copy SELECT * FROM mysql.general_log;
INSERT INTO log_count (count) VALUES ((SELECT count(*) FROM mysql.general_log));
DROP TABLE general_log_copy;

SET GLOBAL general_log = OFF;
SET GLOBAL slow_query_log = OFF;

CREATE TABLE slow_log_copy SELECT * FROM mysql.slow_log;
INSERT INTO slow_log_copy SELECT * FROM mysql.slow_log;
INSERT INTO log_count (count) VALUES ((SELECT count(*) FROM mysql.slow_log));
DROP TABLE slow_log_copy;

CREATE TABLE general_log_copy SELECT * FROM mysql.general_log;
INSERT INTO general_log_copy SELECT * FROM mysql.general_log;
INSERT INTO log_count (count) VALUES ((SELECT count(*) FROM mysql.general_log));
DROP TABLE general_log_copy;

SET GLOBAL general_log = @saved_general_log;
SET GLOBAL slow_query_log = @saved_slow_query_log;

DROP TABLE log_count;

--
-- Bug #31700: thd->examined_row_count not incremented for 'const' type queries
--

SET SESSION long_query_time = 0;
SET GLOBAL slow_query_log = ON;

-- Let there be three columns, unique, non-unique, and non-indexed:
CREATE TABLE t1 (f1 SERIAL,f2 INT, f3 INT, PRIMARY KEY(f1), KEY(f2));
INSERT INTO t1 VALUES (1,1,1);
INSERT INTO t1 VALUES (2,2,2);
INSERT INTO t1 VALUES (3,3,3);
INSERT INTO t1 VALUES (4,4,4);

SELECT SQL_NO_CACHE 'Bug--31700 - SCAN',f1,f2,f3,SLEEP(1.1) FROM t1 WHERE f3=4;
SELECT SQL_NO_CACHE 'Bug--31700 - KEY', f1,f2,f3,SLEEP(1.1) FROM t1 WHERE f2=3;
SELECT SQL_NO_CACHE 'Bug--31700 - PK',  f1,f2,f3,SLEEP(1.1) FROM t1 WHERE f1=2;
SELECT start_time, rows_examined, rows_sent, sql_text FROM mysql.slow_log WHERE sql_text LIKE '%Bug--31700%' ORDER BY start_time;

DROP TABLE t1;

--
-- Bug #47924 main.log_tables times out sporadically
--

use mysql;
drop table if exists renamed_general_log;
drop table if exists renamed_slow_log;

use test;

-- Additional test coverage
SET GLOBAL log_output= 'TABLE';
SELECT @@general_log;
ALTER TABLE mysql.general_log DISCARD TABLESPACE;


SET @@session.long_query_time= @old_long_query_time;

SET @@global.log_output=       @old_log_output;
SET @@global.slow_query_log=   @old_slow_query_log;
SET @@global.general_log=      @old_general_log;