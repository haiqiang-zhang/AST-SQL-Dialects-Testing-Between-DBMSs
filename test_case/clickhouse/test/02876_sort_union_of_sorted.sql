SELECT '1..20:';
SELECT * FROM ((SELECT * FROM table1 ORDER BY number) UNION ALL (SELECT * FROM table2 ORDER BY number)) ORDER BY number;
SELECT '20..1:';
SELECT * FROM ((SELECT * FROM table1 ORDER BY number) UNION ALL (SELECT * FROM table2 ORDER BY number)) ORDER BY number DESC;
SELECT '20..1:';
SELECT * FROM ((SELECT * FROM table1 ORDER BY number DESC) UNION ALL (SELECT * FROM table2 ORDER BY number DESC)) ORDER BY number DESC;
DROP TABLE table1;
DROP TABLE table2;
