PIVOT Cities ON Country USING SUM(Population);
PIVOT Cities ON Country, Name USING SUM(Population);
PIVOT Cities ON Country IN ('xx') USING SUM(Population);
PIVOT Cities ON (Country, Name) IN ('xx') USING SUM(Population);
PIVOT Cities ON Country IN ('xx', 'yy') USING SUM(Population);