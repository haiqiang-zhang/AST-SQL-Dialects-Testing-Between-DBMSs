drop table if exists t1;
SELECT hex(@u0:=convert(@pl0 using utf8mb3));
SELECT hex(@u1:=convert(@pl1 using utf8mb3));
SELECT hex(@u2:=convert(@pl2 using utf8mb3));
SELECT hex(@u3:=convert(@pl3 using utf8mb3));
SELECT hex(@u4:=convert(@pl4 using utf8mb3));
SELECT hex(@u5:=convert(@pl5 using utf8mb3));
SELECT hex(@u6:=convert(@pl6 using utf8mb3));
SELECT hex(@u7:=convert(@pl7 using utf8mb3));
SELECT hex(@u8:=convert(@pl8 using utf8mb3));
SELECT hex(@u9:=convert(@pl9 using utf8mb3));
SELECT hex(@uA:=convert(@plA using utf8mb3));
SELECT hex(@uB:=convert(@plB using utf8mb3));
SELECT hex(@uC:=convert(@plC using utf8mb3));
SELECT hex(@uD:=convert(@plD using utf8mb3));
SELECT hex(@uE:=convert(@plE using utf8mb3));
SELECT hex(@uF:=convert(@plF using utf8mb3));
SELECT hex(convert(@u0 USING tis620));
SELECT hex(convert(@u1 USING tis620));
SELECT hex(convert(@u2 USING tis620));
SELECT hex(convert(@u3 USING tis620));
SELECT hex(convert(@u4 USING tis620));
SELECT hex(convert(@u5 USING tis620));
SELECT hex(convert(@u6 USING tis620));
SELECT hex(convert(@u7 USING tis620));
SELECT hex(convert(@u8 USING tis620));
SELECT hex(convert(@u9 USING tis620));
SELECT hex(convert(@uA USING tis620));
SELECT hex(convert(@uB USING tis620));
SELECT hex(convert(@uC USING tis620));
SELECT hex(convert(@uD USING tis620));
SELECT hex(convert(@uE USING tis620));
SELECT hex(convert(@uF USING tis620));
SELECT 'a' = 'a ';
SELECT 'a\0' < 'a';
SELECT 'a\0' < 'a ';
SELECT 'a\t' < 'a';
SELECT 'a\t' < 'a ';
CREATE TABLE t1 (a char(10) not null) CHARACTER SET tis620;
INSERT INTO t1 VALUES ('a'),('a\0'),('a\t'),('a ');
SELECT hex(a),STRCMP(a,'a'), STRCMP(a,'a ') FROM t1;
DROP TABLE t1;
select hex(weight_string(cast(0xE0A1 as char)));
select hex(weight_string(cast(0xE0A1 as char) as char(1)));
select hex(weight_string(cast(0xE0A1 as char)));
select hex(weight_string(cast(0xE0A1 as char) as char(1)));
