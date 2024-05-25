PRAGMA enable_verification;
CREATE TABLE cpb_tbl AS
WITH CPB(CPDH,NF,JG) AS (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
) FROM CPB;
pivot cpb_tbl on nf using sum(jg)group by cpdh;
WITH CPB(CPDH,NF,JG) AS (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
pivot CPB on nf IN (2010, 2017, 2018, 2022) using sum(jg)group by cpdh;
WITH CPB(CPDH,NF,JG) AS (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
pivot CPB on nf using sum(jg)group by cpdh;
WITH CPB(CPDH,NF,JG) AS (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
SELECT *
FROM  (pivot CPB on nf using sum(jg)group by cpdh);
WITH CPB(CPDH,NF,JG) AS (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
from CPB pivot (sum(jg) for nf in (2010, 2017, 2018, 2022) group by cpdh);
WITH CPB AS (SELECT 42)
SELECT *
FROM  (
	WITH CPB(CPDH,NF,JG) AS (
		SELECT 'C1',2022,10
		UNION ALL
		SELECT 'C1',2018,20
		UNION ALL
		SELECT 'C1',2017,0
		UNION ALL
		SELECT 'C2',2022,10
		UNION ALL
		SELECT 'C2',2010,30
		UNION ALL
		SELECT 'C3',2010,80
	)
	pivot CPB on nf using sum(jg) group by cpdh);
WITH CPB(CPDH,NF,JG) AS MATERIALIZED (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
pivot CPB on nf IN (2010, 2017, 2018, 2022) using sum(jg)group by cpdh;
WITH CPB(CPDH,NF,JG) AS MATERIALIZED (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
pivot CPB on nf using sum(jg)group by cpdh;
WITH CPB(CPDH,NF,JG) AS MATERIALIZED (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
SELECT *
FROM  (pivot CPB on nf using sum(jg)group by cpdh);
WITH CPB(CPDH,NF,JG) AS MATERIALIZED (
SELECT 'C1',2022,10
UNION ALL
SELECT 'C1',2018,20
UNION ALL
SELECT 'C1',2017,0
UNION ALL
SELECT 'C2',2022,10
UNION ALL
SELECT 'C2',2010,30
UNION ALL
SELECT 'C3',2010,80
)
from CPB pivot (sum(jg) for nf in (2010, 2017, 2018, 2022) group by cpdh);
WITH CPB AS (SELECT 42)
SELECT *
FROM  (
	WITH CPB(CPDH,NF,JG) AS MATERIALIZED (
		SELECT 'C1',2022,10
		UNION ALL
		SELECT 'C1',2018,20
		UNION ALL
		SELECT 'C1',2017,0
		UNION ALL
		SELECT 'C2',2022,10
		UNION ALL
		SELECT 'C2',2010,30
		UNION ALL
		SELECT 'C3',2010,80
	)
	pivot CPB on nf using sum(jg) group by cpdh);
