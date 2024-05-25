PRAGMA enable_verification;
CREATE OR REPLACE TABLE monthly_sales(empid INT, dept TEXT, Jan INT, Feb INT, Mar INT, April INT);
INSERT INTO monthly_sales VALUES
    (1, 'electronics', 100, 200, 300, 100),
    (2, 'clothes', 100, 300, 150, 200),
    (3, 'cars', 200, 400, 100, 50);
SELECT * FROM monthly_sales
    UNPIVOT(sales FOR month IN (jan, feb, mar, april))
    ORDER BY empid;
SELECT empid, dept, april, month, sales FROM monthly_sales
    UNPIVOT(sales FOR month IN (jan, feb, mar))
    ORDER BY empid;
SELECT * FROM monthly_sales
    UNPIVOT(sales FOR month IN (jan AS January, feb AS February, mar AS March, april))
    ORDER BY empid;
SELECT p.id, p.type, p.m, p.vals FROM monthly_sales
    UNPIVOT(sales FOR month IN (jan, feb, mar, april)) AS p(id, type, m, vals);
SELECT empid, dept, month, sales_jan_feb, sales_mar_apr FROM monthly_sales
    UNPIVOT((sales_jan_feb, sales_mar_apr) FOR month IN ((jan, feb), (mar, april)));
UNPIVOT (SELECT * FROM monthly_sales)
    ON jan, feb, mar april
    INTO
        NAME month
        VALUE sales;