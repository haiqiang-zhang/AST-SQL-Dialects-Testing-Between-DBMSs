CREATE TABLE customer (id INT PRIMARY KEY);
CREATE TABLE apr (id INT PRIMARY KEY, apr REAL);
CREATE VIEW v1 AS
  SELECT c.id, i.apr
  FROM customer c
  LEFT JOIN apr i ON i.id=c.id;
CREATE VIEW v1rj AS
  SELECT c.id, i.apr
  FROM apr i
  RIGHT JOIN customer c ON i.id=c.id;
CREATE VIEW v2 AS
  SELECT c.id, v1.apr
  FROM customer c
  LEFT JOIN v1 ON v1.id=c.id;
CREATE VIEW v2rj AS
  SELECT c.id, v1.apr
  FROM v1 RIGHT JOIN customer c ON v1.id=c.id;
CREATE VIEW v2rjrj AS
  SELECT c.id, v1rj.apr
  FROM v1rj RIGHT JOIN customer c ON v1rj.id=c.id;
INSERT INTO customer (id) VALUES (1);
INSERT INTO apr (id, apr) VALUES (1, 12);
INSERT INTO customer (id) VALUES (2);
INSERT INTO apr (id, apr) VALUES (2, 12.01);
PRAGMA automatic_index=ON;