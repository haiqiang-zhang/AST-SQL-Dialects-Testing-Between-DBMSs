drop user if exists "       ";
drop user if exists '   spaces';
drop user if exists 'spaces    ';
drop user if exists " spaces ";
drop user if exists "test 01119";
drop user if exists "ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂ¿ÃÂÃÂºÃÂÃÂ¸ÃÂÃÂ½";
drop user if exists "ÃÂ¦ÃÂÃÂ ÃÂ¥ÃÂÃÂÃÂ¦ÃÂ°ÃÂ ";
drop user if exists "ÃÂ°ÃÂÃÂÃÂ ÃÂ°ÃÂÃÂÃÂ ÃÂ°ÃÂÃÂÃÂ";
select length(name), name, '.' from system.users where position(name, ' ')!=0 order by name;
