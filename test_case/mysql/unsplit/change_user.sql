select user(), current_user(), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
select concat('<', user(), '>'), concat('<', current_user(), '>'), database();
SELECT @@session.sql_big_selects;
SELECT @@global.max_join_size;
SELECT @@session.sql_big_selects;
SELECT @@global.max_join_size;
SELECT @@session.sql_big_selects;
SELECT @@session.sql_big_selects;
SELECT @@INSERT_ID;
SELECT @@TIMESTAMP;
SELECT @@INSERT_ID;
SELECT @@TIMESTAMP=200;
SELECT IS_FREE_LOCK('bug31418');
SELECT IS_USED_LOCK('bug31418');
SELECT GET_LOCK('bug31418', 1);
SELECT IS_USED_LOCK('bug31418') = CONNECTION_ID();
SELECT IS_FREE_LOCK('bug31418');
SELECT IS_USED_LOCK('bug31418');
SELECT 1;
