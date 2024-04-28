PRAGMA enable_verification;
CREATE TABLE empsalary (depname varchar, empno bigint, salary int, enroll_date date);
INSERT INTO empsalary VALUES ('develop', 10, 5200, '2007-08-01'), ('sales', 1, 5000, '2006-10-01'), ('personnel', 5, 3500, '2007-12-10'), ('sales', 4, 4800, '2007-08-08'), ('personnel', 2, 3900, '2006-12-23'), ('develop', 7, 4200, '2008-01-01'), ('develop', 9, 4500, '2008-01-01'), ('sales', 3, 4800, '2007-08-01'), ('develop', 8, 6000, '2006-10-01'), ('develop', 11, 5200, '2007-08-15');
SELECT depname, min(salary) OVER (PARTITION BY depname ORDER BY salary, empno) m1 FROM empsalary GROUP BY m1 ORDER BY depname, empno;
select row_number() over (range between unbounded following and unbounded preceding);;
select row_number() over (range between unbounded preceding and unbounded preceding);;
select LIST(salary ORDER BY enroll_date) OVER (PARTITION BY depname) FROM empsalary;
SELECT sum(i) OVER (ORDER BY i GROUPS 1 PRECEDING) FROM generate_series(1,10) AS _(i);;
SELECT array_agg(i) OVER (${invalid} ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM generate_series(1,5) AS _(i)
WINDOW ${invalid} AS (ORDER BY i);;