PRAGMA enable_verification;
set secret_directory='__TEST_DIR__/create_secret_scope_matching';
CREATE TEMPORARY SECRET t1 ( TYPE S3 );
CREATE TEMPORARY SECRET t2 ( TYPE S3 );
CREATE SECRET p1 IN LOCAL_FILE ( TYPE S3 );
DROP SECRET t1;
DROP SECRET t2;
DROP SECRET p1;
