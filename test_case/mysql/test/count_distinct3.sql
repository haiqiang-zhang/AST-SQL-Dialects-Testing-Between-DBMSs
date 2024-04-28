DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (id INTEGER, grp TINYINT, id_rev INTEGER);
SET @rnd_max= 2147483647;
let $1 = 1000;
{
  SET @rnd= RAND();
  SET @id = CAST(@rnd * @rnd_max AS UNSIGNED);
  SET @id_rev= @rnd_max - @id;
  SET @grp= CAST(127.0 * @rnd AS UNSIGNED);
  INSERT INTO t1 (id, grp, id_rev) VALUES (@id, @grp, @id_rev);
  dec $1;

-- We increase the size of t1 here.
SET @orig_myisam_sort_buffer_size = @@session.myisam_sort_buffer_size;
SET session myisam_sort_buffer_size=20000000;
INSERT INTO t1
SELECT A.id, A.grp, A.id_rev
FROM 
  t1 A,
  (SELECT * FROM t1 B LIMIT 100) B,
  (SELECT * FROM t1 Z LIMIT 42) Z;

SELECT COUNT(*) FROM t1;

-- As t1 contains random numbers, results are different from test to test. 
-- That's okay, because we test only that select doesn't yield an
-- error. Note, that --disable_result_log doesn't suppress error output.
--disable_result_log
SELECT COUNT(DISTINCT id) FROM t1 GROUP BY grp;
SET session myisam_sort_buffer_size = @orig_myisam_sort_buffer_size;
DROP TABLE t1;