PRAGMA enable_verification;
CREATE TABLE Product(DaysToManufacture int, StandardCost int);;
INSERT INTO Product VALUES (0, 5.0885), (1, 223.88), (2, 359.1082), (4, 949.4105);;
CREATE OR REPLACE TABLE monthly_sales(empid INT, amount INT, month TEXT);;
INSERT INTO monthly_sales VALUES
    (1, 10000, 'JAN'),
    (1, 400, 'JAN'),
    (2, 4500, 'JAN'),
    (2, 35000, 'JAN'),
    (1, 5000, 'FEB'),
    (1, 3000, 'FEB'),
    (2, 200, 'FEB'),
    (2, 90500, 'FEB'),
    (1, 6000, 'MAR'),
    (1, 5000, 'MAR'),
    (2, 2500, 'MAR'),
    (2, 9500, 'MAR'),
    (1, 8000, 'APR'),
    (1, 10000, 'APR'),
    (2, 800, 'APR'),
    (2, 4500, 'APR');;
INSERT INTO monthly_sales VALUES (1, 250, NULL);;
SELECT *
FROM monthly_sales
PIVOT(SUM(amount) FOR MONTH IN ('JAN', 'JAN'))
  AS p
ORDER BY EMPID;;
SELECT *
FROM monthly_sales
PIVOT(COS(amount) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'APR'))
  AS p (EMP_ID_renamed, JAN, FEB, MAR, APR)
ORDER BY EMP_ID_renamed;;
SELECT *
FROM monthly_sales
PIVOT(SUM(amount + (SELECT 42)) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'APR'))
  AS p (EMP_ID_renamed, JAN, FEB, MAR, APR)
ORDER BY EMP_ID_renamed;;
SELECT *
FROM monthly_sales
PIVOT(SUM(amount + row_number() over ()) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'APR'))
  AS p (EMP_ID_renamed, JAN, FEB, MAR, APR)
ORDER BY EMP_ID_renamed;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTHx IN ('JAN', 'FEB', 'MAR', 'DEC'))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN ())
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN (*))
      AS p
  ORDER BY EMPID;;
SELECT DaysToManufacture, AVG(StandardCost) AS AverageCost
FROM Product
GROUP BY DaysToManufacture;;
SELECT 'AverageCost' AS Cost_Sorted_By_Production_Days,
  "0", "1", "2", "3", "4"
FROM
(
  SELECT DaysToManufacture, StandardCost
  FROM Product
) AS SourceTable
PIVOT
(
  AVG(StandardCost)
  FOR DaysToManufacture IN (0, 1, 2, 3, 4)
) AS PivotTable;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'APR'))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount+1) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'DEC'))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(COUNT(*) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'DEC') GROUP BY empid)
      AS p
  ORDER BY EMPID;;
SELECT empid, January, February, March, April
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN ('JAN' AS January, 'FEB' AS February, 'MAR' AS March, 'APR' AS April))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN ('JAN', 'FEB', 'MAR'))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'DEC'))
      AS p
  ORDER BY EMPID;;
SELECT *
FROM monthly_sales
PIVOT(SUM(amount) FOR MONTH IN ('JAN', 'FEB', 'MAR', 'APR'))
  AS p (EMP_ID_renamed, JAN, FEB, MAR, APR)
ORDER BY EMP_ID_renamed;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN (NULL, 'JAN', 'FEB', 'MAR', 'APR'))
      AS p
  ORDER BY EMPID;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN (NULL, 'JAN', 'FEB', 'MAR', 'APR'))
      AS p
    UNPIVOT INCLUDE NULLS(amount FOR MONTH IN ("NULL", JAN, FEB, MAR, APR))
  ORDER BY ALL;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN (NULL, 'JAN', 'FEB', 'MAR', 'APR'))
      AS p
    UNPIVOT EXCLUDE NULLS(amount FOR MONTH IN ("NULL", JAN, FEB, MAR, APR))
  ORDER BY ALL;;
SELECT *
  FROM monthly_sales
    PIVOT(SUM(amount) FOR MONTH IN (NULL, 'JAN', 'FEB', 'MAR', 'APR'))
      AS p
    UNPIVOT EXCLUDE NULLS(amount FOR MONTH IN ("NULL", JAN, FEB, MAR, APR))
  ORDER BY EMPID;;
FROM
(
  SELECT DaysToManufacture, StandardCost
  FROM Product
) AS SourceTable
PIVOT
(
  AVG(StandardCost)
  FOR DaysToManufacture IN ('zz')
) AS PivotTable;;