DROP TABLE IF EXISTS table_with_enum_column_for_csv_insert;
CREATE TABLE table_with_enum_column_for_csv_insert (
    Id Int32,
    Value Enum('ef' = 1, 'es' = 2)
) ENGINE=Memory();
DROP TABLE IF EXISTS table_with_enum_column_for_csv_insert;