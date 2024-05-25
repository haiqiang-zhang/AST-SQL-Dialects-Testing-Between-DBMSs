PRAGMA enable_verification;
CREATE TABLE Cities(Country VARCHAR, Name VARCHAR, Year INT, Population INT);
INSERT INTO Cities VALUES ('NL', 'Amsterdam', 2000, 1005);
INSERT INTO Cities VALUES ('NL', 'Amsterdam', 2010, 1065);
INSERT INTO Cities VALUES ('NL', 'Amsterdam', 2020, 1158);
INSERT INTO Cities VALUES ('US', 'Seattle', 2000, 564);
INSERT INTO Cities VALUES ('US', 'Seattle', 2010, 608);
INSERT INTO Cities VALUES ('US', 'Seattle', 2020, 738);
INSERT INTO Cities VALUES ('US', 'New York City', 2000, 8015);
INSERT INTO Cities VALUES ('US', 'New York City', 2010, 8175);
INSERT INTO Cities VALUES ('US', 'New York City', 2020, 8772);
PIVOT Cities USING SUM(Population);
PIVOT Cities USING SUM(Population) GROUP BY Country;
PIVOT Cities GROUP BY Country;
PIVOT Cities ON Year GROUP BY Country;
PIVOT (SELECT Country, Year FROM Cities) ON Year;
