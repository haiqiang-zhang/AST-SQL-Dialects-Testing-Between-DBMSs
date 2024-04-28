PRAGMA enable_verification;
CREATE TABLE final(channel VARCHAR, i_brand_id INTEGER, i_class_id INTEGER, i_category_id INTEGER, sum_sales DECIMAL(38,2), number_sales HUGEINT);;
COPY final FROM 'data/csv/tpcds_14.csv' (FORMAT CSV, DELIMITER '|', HEADER);;
SELECT * FROM final
ORDER BY channel NULLS FIRST,
         i_brand_id NULLS FIRST,
         i_class_id NULLS FIRST,
         i_category_id NULLS FIRST
LIMIT 100;;
SELECT * FROM final
ORDER BY channel DESC NULLS FIRST,
         i_brand_id DESC NULLS FIRST,
         i_class_id DESC NULLS FIRST,
         i_category_id DESC NULLS FIRST
LIMIT 100;;
SELECT * FROM final
ORDER BY channel NULLS LAST,
         i_brand_id NULLS LAST,
         i_class_id NULLS LAST,
         i_category_id NULLS LAST
LIMIT 100;;
SELECT * FROM final
ORDER BY channel DESC NULLS LAST,
         i_brand_id DESC NULLS LAST,
         i_class_id DESC NULLS LAST,
         i_category_id DESC NULLS LAST
LIMIT 100;;