CREATE VIEW v1 AS SELECT * FROM B;
CREATE VIEW v2 AS SELECT * FROM MAIN;
INSERT INTO MAIN(Id,Id1) VALUES(2,3);
INSERT INTO B(Id,Id1) VALUES(2,3);
INSERT INTO B 
        SELECT * FROM B UNION ALL 
        SELECT * FROM MAIN WHERE exists (select * FROM B WHERE B.Id = MAIN.Id);
SELECT * FROM B;
EXPLAIN  INSERT INTO b SELECT * FROM main;
EXPLAIN  INSERT INTO b SELECT * FROM b;
EXPLAIN  INSERT INTO b SELECT (SELECT id FROM b), id1 FROM main;
EXPLAIN  INSERT INTO b SELECT id1, (SELECT id FROM b) FROM main;
EXPLAIN  
    INSERT INTO b 
      SELECT * FROM main WHERE id = (SELECT id1 FROM b WHERE main.id = b.id);
EXPLAIN  INSERT INTO b SELECT * FROM v1;
EXPLAIN  INSERT INTO b SELECT * FROM v2;
EXPLAIN  
    INSERT INTO b 
    SELECT * FROM main WHERE id > 10 AND max(id1, (SELECT id FROM b)) > 10;
