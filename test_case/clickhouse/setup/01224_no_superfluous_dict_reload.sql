SET send_logs_level = 'fatal';
DROP DATABASE IF EXISTS dict_db_01224;
DROP DATABASE IF EXISTS dict_db_01224_dictionary;
set allow_deprecated_database_ordinary=1;
CREATE DATABASE dict_db_01224 ENGINE=Ordinary;
CREATE DATABASE dict_db_01224_dictionary Engine=Dictionary;
CREATE TABLE dict_db_01224.dict_data (key UInt64, val UInt64) Engine=Memory();
CREATE DICTIONARY dict_db_01224.dict
(
  key UInt64 DEFAULT 0,
  val UInt64 DEFAULT 10
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'dict_data' PASSWORD '' DB 'dict_db_01224'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(FLAT());
