
let BASEDIR=    `select @@basedir`;
let DDIR=       $MYSQL_TMP_DIR/dd_bootstrap_test;
let MYSQLD_LOG= $MYSQL_TMP_DIR/server.log;
let extra_args= --no-defaults --innodb_dedicated_server=OFF --log-error=$MYSQLD_LOG --secure-file-priv="" --loose-skip-auto_generate_certs --loose-skip-sha256_password_auto_generate_rsa_keys --skip-ssl --basedir=$BASEDIR --lc-messages-dir=$MYSQL_SHAREDIR;
let BOOTSTRAP_SQL= $MYSQL_TMP_DIR/tiny_bootstrap.sql;
  CREATE SCHEMA test;
EOF

--echo -- 1 First start the server with --initialize and --lower-case-table-names=1.
--echo --   We need to make sure l-c-t-n is set during database initialization.
--echo --   Otherwise the mysql.tables.name do not pick right collation.
--echo --   This test also requires to be run with --character-set-server=utf8mb3
--exec $MYSQLD $extra_args --initialize-insecure --datadir=$DDIR --init-file=$BOOTSTRAP_SQL --lower-case-table-names=1 --character-set-server=utf8mb3

--echo -- 2 Restart the server against DDIR
--exec echo "restart: --datadir=$DDIR --character-set-server=utf8mb3 --no-console --log-error=$MYSQLD_LOG" > $MYSQLTEST_VARDIR/tmp/mysqld.1.expect
--enable_reconnect
--source include/wait_until_connected_again.inc

--
-- Bug#25830 SHOW TABLE STATUS behaves differently depending on table name
--
set names utf8mb3;
create table `Ö` (id int);
drop table `Ö`;