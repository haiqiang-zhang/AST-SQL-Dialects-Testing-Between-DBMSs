CREATE TABLE t1 (
  col_varchar_1024_utf8_key varchar(1024),
  pk int,
  col_int_key int,
  col_int int,
  PRIMARY KEY (pk),
  KEY col_varchar_1024_utf8_key (col_varchar_1024_utf8_key(333)),
  KEY col_int_key (col_int_key)
) charset latin1;
INSERT INTO t1 VALUES
('pvg',1,5,773586944),('akl',2,NULL,NULL),('from',3,NULL,8),
('qmx',4,4,-693436416),('p',5,3,5),('want',6,-34930688,-1647247360),
('q',19,6,-805896192),('kov',20,7,NULL),('d',21,NULL,1752498176);
CREATE TABLE t2 (
  col_varchar_1024_utf8_key varchar(1024),
  col_int int,
  col_int_key int,
  pk int,
  PRIMARY KEY (pk),
  KEY col_varchar_1024_utf8_key (col_varchar_1024_utf8_key(255)),
  KEY col_int_key (col_int_key)
) charset latin1;
INSERT INTO t2 VALUES
('he',1,NULL,1),('y',551288832,NULL,2),('uac',NULL,166789120,3),
('jhu',-1002176512,NULL,4),('t',NULL,5,5),('z',1017970688,NULL,6),
('jnp',8,NULL,7),('up',-1243742208,-857014272,8),('q',8,NULL,9),
('hqn',NULL,0,10),('afk',5,NULL,11),('e',9,0,12),('noq',NULL,-239075328,13),
('they',7,NULL,14),('slb',NULL,NULL,15),('cxh',2,-599130112,16),
('it\'s',0,1571749888,17),('acx',8,-1055457280,18),('out',NULL,NULL,19),
('a',-1747648512,1182400512,20),('we',NULL,NULL,21),('I',NULL,1886846976,22),
('y',9,8,23),('something',8,NULL,24),('s',-738590720,NULL,25);
CREATE TABLE t3 (
  col_varchar_1024_utf8 varchar(1024),
  pk int,
  col_varchar_1024_latin1_key varchar(1024),
  col_varchar_1024_utf8_key varchar(1024),
  col_int int,
  PRIMARY KEY (pk),
  KEY col_varchar_1024_latin1_key (col_varchar_1024_latin1_key(1000)),
  KEY col_varchar_1024_utf8_key (col_varchar_1024_utf8_key(333))
) charset latin1;
INSERT INTO t3 VALUES
('nxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcjzztsuacxcbmcjtkwdljofrqckbcqwgjrxqmmofrexhnjytqcakutgjwrfxaubfwnewarkbvecqyepiqbsbdapsjdsdvjgvbozrvbwdudngkxhaawixfsvgbevpmivovfajydafkbaahbozvylysfqpgtnaojrnrhfifbrlohyzqsigsnoqayhhwlstorvogfjznkssvkpsjtycgstwenmcsyuoavfraswnqjmdamsvghmzsvzxsjbaamjlmsaihmuckfniwlqadutvnqaskdgfviojrymdxncdfuka',1,'knxgvcphmpqaonbf','dknx',1108148224),
('ftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjiv',2,'lftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqg','was',1),
('u',3,'r','l',-1089929216),
('so',4,'qliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefel','see',8),
('could',5,'oh','had',5),
('i',6,'v','zpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbr',8),
('lnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcjzztsuacxcbmcjtkwdljofrqckbcqwgjrxqmmofrexhnjytqcakutgjwrfxaubfwnewarkbvecqyepiqbsbda',7,'olnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszx','l',-813367296),
('jkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoow',8,'ok','tcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurw',3),
('m',9,'b','they',NULL),
('a',10,'up','z',NULL),
('ok',11,'yjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcjzztsuacxcbmcjtkwdljofrqckbcqwgjrxqmmofrexhnjytqcakutgjwrfxaubfwnewarkbvecqyepiqbsbdapsjdsdvjgvbozrvbwdudngkxhaawixfsvgbevpmivovfajydafkbaahb','if',66322432),
('y',12,'okay','q',9),
('but',13,'hshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcjzztsuacxcbmcjtkwdljofrqckbcqwgjrxqmmofrexhnjytqcakutgjwrfxaubfwnewarkbvecqyepi','ichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixat',NULL),
('had',14,'v','z',0),
('bvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvn',15,'time','why',-2018770944),
('a',16,'her','w',7),
('want',17,'v','some',-1528823808),
('about',18,'why','who',NULL),
('a',19,'psuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcjzztsuacxcbmcjtkwdljofrqckbcqwgjrxqmmofrexhnjytqcakutgjwrfxaubfwnewarkbvecqyepiqbsbdapsjdsdvjgvbozrvbwdudngkxhaawixfsvgbevpmivovfajydafkbaahbozvylysfqpgtnaojrnrhfifbrlohyzqsigsnoqayhhwlstorvogfjznkssvkpsjtycgstwenmcsyuoavfraswnqjmdamsvghmzsvzxsjbaamjlmsaihmuckfniwlqadutvnqaskdgfviojrymdxncdfu','v',3),
('mpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtva',20,'and','l',3),
('l',21,'fijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwa','cfijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbv',NULL),
('t',22,'v','vepbcfijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmr',5),
('now',23,'g','pvepbcfijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijakdamsoypzzxqbrfmfnhqbgdorlshvmcbgmwjtvabjjujnpejevaahvattzdoyrcdhuopipfrnremgvkixcqhhyqbvwgfkedhkhjrjxdfzwywvlihysszxioksqoxhrnhleorevadbmkdkrcuaecfgwhjbltrmamphyfcrwgwrwcopcj',9),
('but',24,'she','raipvepbcfijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuefelliurrvammkoccwmvylaklfxgtixathpmbsskijak',183435264),
('f',25,'tell','jklraipvepbcfijtmpsuoqenwelutabvjichshabyjiwigxtcjkwolnpzpqqliiallftdknxgvcphmpqaonbfzieqxojejpeczjlegpbjslbjgddasliaxqggoqfrayeltrtcrqmzhtdajxoghfkaednrrxurwywioedopoaustgjlgyzxseruuacohiozwaftycyjssvankmscsfutyetviwdwtlklkdplnlqopuhhtlmrmgisrjcjhuxxgtrqwrxgvjxusjijbjxjrsikxkkbbaygadwuaxkrouxnaqtfgggajlrchukvngoowwcsjmnrrlnkqkafkbejqgkjvsgqhqnbxuelqjbiwbpcxghjfdlhisvvhwxjivbuzbwrvqcwakbkyccxhyonqacaqzsycfjgpnactzkdcxyocultkiongrlquublljcidfrtpxkwapsldhpmbpnlweejkvixatntevuggxutjtuylrlkrutpyxmggkrmhsiwgkvdwyqouuef',NULL);
CREATE TABLE t4 (
  pk int,
  PRIMARY KEY (pk)
);