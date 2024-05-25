PRAGMA enable_verification;
CREATE OR REPLACE TABLE sales(empid INT, amount INT, d DATE);
INSERT INTO sales VALUES
    (1, 10000, DATE '2000-01-01'),
    (1, 400, DATE '2000-01-07'),
    (2, 4500, DATE '2001-01-21'),
    (2, 35000, DATE '2001-01-21'),
    (1, 5000, DATE '2000-02-03'),
    (1, 3000, DATE '2000-02-07'),
    (2, 200, DATE '2001-02-05'),
    (2, 90500, DATE '2001-02-19'),
    (1, 6000, DATE '2000-03-01'),
    (1, 5000, DATE '2000-03-09'),
    (2, 2500, DATE '2001-03-03'),
    (2, 9500, DATE '2001-03-08');
PIVOT (SELECT YEAR(d) AS year, MONTH(d) AS month, empid, amount FROM sales) ON YEAR, MONTH USING SUM(AMOUNT) ORDER BY ALL;
PIVOT (PIVOT (SELECT YEAR(d) AS year, MONTH(d) AS month, empid, amount FROM sales) ON YEAR, MONTH USING SUM(AMOUNT))
ON empid USING SUM(COALESCE("2000_1",0) + COALESCE("2000_2",0) + COALESCE("2000_3",0) + COALESCE("2001_1",0) + COALESCE("2001_2",0) + COALESCE("2001_3",0));
