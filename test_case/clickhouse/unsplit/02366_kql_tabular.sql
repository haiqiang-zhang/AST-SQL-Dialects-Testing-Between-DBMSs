DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
(    
    FirstName Nullable(String),
    LastName String, 
    Occupation String,
    Education String,
    Age Nullable(UInt8)
) ENGINE = Memory;
INSERT INTO Customers VALUES ('Theodore','Diaz','Skilled Manual','Bachelors',28), ('Stephanie','Cox','Management','Bachelors',33), ('Peter','Nara','Skilled Manual','Graduate Degree',26), ('Latoya','Shen','Professional','Graduate Degree',25), ('Joshua','Lee','Professional','Partial College',26), ('Edward','Hernandez','Skilled Manual','High School',36), ('Dalton','Wood','Professional','Partial College',42), ('Christine','Nara','Skilled Manual','Partial College',33), ('Cameron','Rodriguez','Professional','Partial College',28), ('Angel','Stewart','Professional','Partial College',46);
set dialect='kusto';
print '-- test Query only has table name: --';
Customers;
print '-- Query has Column Selection --';
Customers | project FirstName,LastName,Occupation;
print '-- Query has limit --';
Customers | project FirstName,LastName,Occupation | take 5;
Customers | project FirstName,LastName,Occupation | limit 5;
print '-- Query has second limit with bigger value --';
Customers | project FirstName,LastName,Occupation | take 5 | take 7;
print '-- Query has second limit with smaller value --';
Customers | project FirstName,LastName,Occupation | take 5 | take 3;
print '-- Query has second Column selection --';
Customers | project FirstName,LastName,Occupation | take 3 | project FirstName,LastName;
print '-- Query has second Column selection with extra column --';
set dialect='kusto';
Customers | project FirstName,LastName,Occupation,Education | where Education !in  ('Bachelors','High School');
print '-- Test Filter using common string operations (contains_cs) --';
Customers | project FirstName,LastName,Occupation,Education | where Education contains_cs 'Coll';
print '-- Test Filter using common string operations (startswith_cs) --';
Customers | project FirstName,LastName,Occupation,Education | where Occupation startswith_cs 'Prof';
print '-- Test Filter using common string operations (endswith_cs) --';
Customers | project FirstName,LastName,Occupation,Education | where FirstName endswith_cs 'a';
print '-- Test Filter using numerical equal (==) --';
Customers | project FirstName,LastName,Occupation,Education,Age | where Age == 26;
print '-- Test Filter using numerical great and less (> , <) --';
Customers | project FirstName,LastName,Occupation,Education,Age | where Age > 30 and Age < 40;
print '-- Test Filter using multi where --';
Customers | project FirstName,LastName,Occupation,Education,Age | where Age > 30 | where Occupation == 'Professional';
print '-- Complex query with unknown function --';
SET max_query_size = 55;
SET dialect='kusto';
SET max_query_size=262144;
