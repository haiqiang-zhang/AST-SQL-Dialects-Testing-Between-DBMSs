SELECT 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ' AS x, lengthUTF8(x) AS y;
SELECT x, lengthUTF8(x) AS y FROM (SELECT arrayJoin(['', 'h', 'hello', 'hello hello hello', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½', 'ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½']) AS x);
