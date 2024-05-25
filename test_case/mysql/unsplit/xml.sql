SELECT extractValue(@xml,'/a');
SELECT extractValue(@xml,'/a/b');
SELECT extractValue(@xml,'/a/b/c');
SELECT extractValue(@xml,'/a/@aa1');
SELECT extractValue(@xml,'/a/@aa2');
SELECT extractValue(@xml,'/a/@*');
SELECT extractValue(@xml,'//@ba1');
SELECT extractValue(@xml,'//a');
SELECT extractValue(@xml,'//b');
SELECT extractValue(@xml,'//c');
SELECT extractValue(@xml,'/a//b');
SELECT extractValue(@xml,'/a//c');
SELECT extractValue(@xml,'//*');
SELECT extractValue(@xml,'/a//*');
SELECT extractValue(@xml,'/./a');
SELECT extractValue(@xml,'/a/b/.');
SELECT extractValue(@xml,'/a/b/..');
SELECT extractValue(@xml,'/a/b/../@aa1');
SELECT extractValue(@xml,'/*');
SELECT extractValue(@xml,'/*/*');
SELECT extractValue(@xml,'/*/*/*');
SELECT extractValue(@xml,'/a/child::*');
SELECT extractValue(@xml,'/a/self::*');
SELECT extractValue(@xml,'/a/descendant::*');
SELECT extractValue(@xml,'/a/descendant-or-self::*');
SELECT extractValue(@xml,'/a/attribute::*');
SELECT extractValue(@xml,'/a/b/c/parent::*');
SELECT extractValue(@xml,'/a/b/c/ancestor::*');
SELECT extractValue(@xml,'/a/b/c/ancestor-or-self::*');
SELECT extractValue(@xml,'/descendant-or-self::*');
SELECT extractValue(@xml,'/a/b/c/ancestor-or-self::*');
SELECT extractValue(@xml,'//@ba');
SELECT extractValue(@xml,'/a/b');
SELECT extractValue(@xml,'/a/c');
SELECT extractValue(@xml,'/a/child::b');
SELECT extractValue(@xml,'/a/child::c');
SELECT extractValue(@xml,'/a/b[1]');
SELECT extractValue(@xml,'/a/b[2]');
SELECT extractValue(@xml,'/a/c[1]');
SELECT extractValue(@xml,'/a/c[2]');
SELECT extractValue(@xml,'/a//@x');
SELECT extractValue(@xml,'/a//@x[1]');
SELECT extractValue(@xml,'/a//@x[2]');
SELECT extractValue(@xml,'//b[1]');
SELECT extractValue(@xml,'/descendant::b[1]');
SELECT extractValue(@xml,'/a/b[1+0]');
SELECT extractValue(@xml,'/a/b[1*1]');
SELECT extractValue(@xml,'/a/b[--1]');
SELECT extractValue(@xml,'/a/b[2*1-1]');
SELECT extractValue(@xml,'/a/b[1+1]');
SELECT extractValue(@xml,'/a/b[1*2]');
SELECT extractValue(@xml,'/a/b[--2]');
SELECT extractValue(@xml,'/a/b[1*(3-1)]');
SELECT extractValue(@xml,'//*[1=1]');
SELECT extractValue(@xml,'//*[1!=1]');
SELECT extractValue(@xml,'//*[1>1]');
SELECT extractValue(@xml,'//*[2>1]');
SELECT extractValue(@xml,'//*[1>2]');
SELECT extractValue(@xml,'//*[1>=1]');
SELECT extractValue(@xml,'//*[2>=1]');
SELECT extractValue(@xml,'//*[1>=2]');
SELECT extractValue(@xml,'//*[1<1]');
SELECT extractValue(@xml,'//*[2<1]');
SELECT extractValue(@xml,'//*[1<2]');
SELECT extractValue(@xml,'//*[1<=1]');
SELECT extractValue(@xml,'//*[2<=1]');
SELECT extractValue(@xml,'//*[1<=2]');
SELECT extractValue(@xml,'/a/b[c="c11"]');
SELECT extractValue(@xml,'/a/b[c="c21"]');
SELECT extractValue(@xml,'/a/b[@c="c11"]');
SELECT extractValue(@xml,'/a/b[@c="c21"]');
SELECT extractValue(@xml, '/a/b[@c="c11"]/d');
SELECT extractValue(@xml, '/a/b[@c="c21"]/d');
SELECT extractValue(@xml, '/a/b[d="d11"]/@c');
SELECT extractValue(@xml, '/a/b[d="d21"]/@c');
SELECT extractValue(@xml, '/a[b="b11"]');
SELECT extractValue(@xml, '/a[b/@c="c11"]');
SELECT extractValue(@xml, '/a[b/d="d11"]');
SELECT extractValue(@xml, '/a[/a/b="b11"]');
SELECT extractValue(@xml, '/a[/a/b/@c="c11"]');
SELECT extractValue(@xml, '/a[/a/b/d="d11"]');
SELECT extractValue('<a>a</a>', '/a[false()]');
SELECT extractValue('<a>a</a>', '/a[true()]');
SELECT extractValue('<a>a</a>', '/a[not(false())]');
SELECT extractValue('<a>a</a>', '/a[not(true())]');
SELECT extractValue('<a>a</a>', '/a[true() and true()]');
SELECT extractValue('<a>a</a>', '/a[true() and false()]');
SELECT extractValue('<a>a</a>', '/a[false()and false()]');
SELECT extractValue('<a>a</a>', '/a[false()and true()]');
SELECT extractValue('<a>a</a>', '/a[true() or true()]');
SELECT extractValue('<a>a</a>', '/a[true() or false()]');
SELECT extractValue('<a>a</a>', '/a[false()or false()]');
SELECT extractValue('<a>a</a>', '/a[false()or true()]');
select extractValue(@xml,'/a/b[@c="c"]');
select extractValue(@xml,'/a/b[@c="d"]');
select extractValue(@xml,'/a/b[@c="e"]');
select extractValue(@xml,'/a/b[not(@c="e")]');
select extractValue(@xml,'/a/b[@c!="e"]');
select extractValue(@xml,'/a/b[@c="c" or @c="d"]');
select extractValue(@xml,'/a/b[@c="c" and @c="e"]');
select extractValue(@xml,'/a/b[@c]');
select extractValue(@xml,'/a/b[@d]');
select extractValue(@xml,'/a/b[@e]');
select extractValue(@xml,'/a/b[not(@c)]');
select extractValue(@xml,'/a/b[not(@d)]');
select extractValue(@xml,'/a/b[not(@e)]');
select extractValue(@xml, '/a/b[boolean(@c) or boolean(@d)]');
select extractValue(@xml, '/a/b[boolean(@c) or boolean(@e)]');
select extractValue(@xml, '/a/b[boolean(@d) or boolean(@e)]');
select extractValue(@xml, '/a/b[boolean(@c) and boolean(@d)]');
select extractValue(@xml, '/a/b[boolean(@c) and boolean(@e)]');
select extractValue(@xml, '/a/b[boolean(@d) and boolean(@e)]');
select extractValue(@xml, '/a/b[@c or @d]');
select extractValue(@xml, '/a/b[@c or @e]');
select extractValue(@xml, '/a/b[@d or @e]');
select extractValue(@xml, '/a/b[@c and @d]');
select extractValue(@xml, '/a/b[@c and @e]');
select extractValue(@xml, '/a/b[@d and @e]');
SELECT extractValue(@xml,'/a/b[@*]');
SELECT extractValue(@xml,'/a/b[not(@*)]');
SELECT extractValue('<a>a</a>', '/a[ceiling(3.1)=4]');
SELECT extractValue('<a>a</a>', '/a[floor(3.1)=3]');
SELECT extractValue('<a>a</a>', '/a[round(3.1)=3]');
SELECT extractValue('<a>a</a>', '/a[round(3.8)=4]');
SELECT extractValue('<a><b>b</b><c>c</c></a>', '/a/b | /a/c');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[position()=1]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[position()=2]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[position()=3]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[1=position()]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[2=position()]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[3=position()]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[2>=position()]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[2<=position()]');
select extractValue('<a b="b1" b="b2" b="b3"/>','/a/@b[position()=3 or position()=2]');
SELECT extractValue('<a>a<b>a1<c>c1</c></b><b>a2</b></a>','/a/b[count(c)=0]');
SELECT extractValue('<a>a<b>a1<c>c1</c></b><b>a2</b></a>','/a/b[count(c)=1]');
select extractValue('<a>a1<b ba="1" ba="2">b1</b><b>b2</b>4</a>','/a/b[sum(@ba)=3]');
select extractValue('<a><b>b1</b><b>b2</b></a>','/a/b[1]');
select extractValue('<a><b>b1</b><b>b2</b></a>','/a/b[boolean(1)]');
select extractValue('<a><b>b1</b><b>b2</b></a>','/a/b[true()]');
select extractValue('<a><b>b1</b><b>b2</b></a>','/a/b[number(true())]');
select extractValue('<a>ab</a>','/a[contains("abc","b")]');
select extractValue('<a>ab</a>','/a[contains(.,"a")]');
select extractValue('<a>ab</a>','/a[contains(.,"b")]');
select extractValue('<a>ab</a>','/a[contains(.,"c")]');
select extractValue('<a b="1">ab</a>','/a[concat(@b,"2")="12"]');
select extractValue(@xml, '/a/@b[substring(.,2)="1"]');
select extractValue(@xml, '/a/@b[substring(.,2)="2"]');
select extractValue(@xml, '/a/@b[substring(.,1,1)="1"]');
select extractValue(@xml, '/a/@b[substring(.,1,1)="2"]');
select extractValue(@xml, '/a/@b[substring(.,2,1)="1"]');
select extractValue(@xml, '/a/@b[substring(.,2,1)="2"]');
SELECT extractValue(@xml, '/a/b[string-length("x")=1]');
SELECT extractValue(@xml, '/a/b[string-length("xx")=2]');
SELECT extractValue(@xml, '/a/b[string-length("xxx")=2]');
SELECT extractValue(@xml, '/a/b[string-length("x")]');
SELECT extractValue(@xml, '/a/b[string-length("xx")]');
SELECT extractValue(@xml, '/a/b[string-length()]');
SELECT extractValue(@xml, 'string-length("x")');
select extractValue(@xml,'/a/@b');
select extractValue(@xml,'/a/@b[contains(.,"1")]');
select extractValue(@xml,'/a/@b[contains(.,"1")][contains(.,"2")]');
select extractValue(@xml,'/a/@b[contains(.,"1")][contains(.,"2")][2]');
select UpdateXML('<a>a1<b>b1<c>c1</c>b2</b>a2</a>','/a/b/c','+++++++++');
select UpdateXML('<a>a1<b>b1<c>c1</c>b2</b>a2</a>','/a/b/c','<c1>+++++++++</c1>');
select UpdateXML('<a>a1<b>b1<c>c1</c>b2</b>a2</a>','/a/b/c','<c1/>');
select UpdateXML(@xml, '/a/b', '<b>ccc</b>');
select UpdateXML(@xml, '/a/b', '<b>ccc</b>');
select UpdateXML(@xml, '/a/@aa1', '');
select UpdateXML(@xml, '/a/@aa1', 'aa3="aa3"');
select UpdateXML(@xml, '/a/@aa2', '');
select UpdateXML(@xml, '/a/@aa2', 'aa3="aa3"');
select UpdateXML(@xml, '/a/b/@bb1', '');
select UpdateXML(@xml, '/a/b/@bb1', 'bb3="bb3"');
select UpdateXML(@xml, '/a/b/@bb2', '');
select UpdateXML(@xml, '/a/b/@bb2', 'bb3="bb3"');
select updatexml('<div><div><span>1</span><span>2</span></div></div>',
                 '/','<tr><td>1</td><td>2</td></tr>') as upd1;
select updatexml('', '/', '') as upd2;
select extractvalue(@xml,'order/clerk');
select extractvalue(@xml,'/order/clerk');
select extractvalue('<a><b>B</b></a>','/a|/b');
select extractvalue('<a><b>B</b></a>','/a|b');
select extractvalue('<a>a<b>B</b></a>','/a|/b');
select extractvalue('<a>a<b>B</b></a>','/a|b');
select extractvalue('<a>a<b>B</b></a>','a|/b');
select extractvalue('<a>A<b>B<c>C</c></b></a>','/a/descendant::*');
select extractvalue('<a>A<b>B<c>C</c></b></a>','/a/self::*');
select extractvalue('<a>A<b>B<c>C</c></b></a>','/a/descendant-or-self::*');
select extractvalue('<A_B>A</A_B>','/A_B');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[position()]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)=last()]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[last()]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[last()-1]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[last()=1]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[last()=2]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[last()=position()]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)-1]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)=1]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)=2]');
select extractvalue('<a>A<b>B1</b><b>B2</b></a>','/a/b[count(.)=position()]');
select extractvalue('<a>Jack</a>','/a[contains(../a,"J")]');
select extractvalue('<a>Jack</a>','/a[contains(../a,"j")]');
select ExtractValue('<tag1><![CDATA[test]]></tag1>','/tag1');
select extractValue('<a>a','/a');
select extractValue('<a>a<','/a');
select extractValue('<a>a</','/a');
select extractValue('<a>a</a','/a');
select extractValue('<a>a</a></b>','/a');
select extractValue('<a b=>a</a>','/a');
DROP PROCEDURE IF EXISTS p2;
select extractValue('<ns:element xmlns:ns="myns"/>','count(ns:element)');
select extractValue('<ns:element xmlns:ns="myns">a</ns:element>','/ns:element');
select extractValue('<ns:element xmlns:ns="myns">a</ns:element>','/ns:element/@xmlns:ns');
select extractValue('<foo><foo.bar>Data</foo.bar><something>Otherdata</something></foo>','/foo/foo.bar');
select extractValue('<foo><foo.bar>Data</foo.bar><something>Otherdata</something></foo>','/foo/something');
select extractValue('<zot><tim0><01>10:39:15</01><02>140</02></tim0></zot>','//*');
select extractValue('<.>test</.>','//*');
select extractValue('<->test</->','//*');
select extractValue('<:>test</:>','//*');
select extractValue('<_>test</_>','//*');
select extractValue('<x.-_:>test</x.-_:>','//*');
select ExtractValue(@xml, "/entry[(pt=10)]/id");
select ExtractValue(@xml, "/entry[(pt!=10)]/id");
select ExtractValue(@xml, "/entry[(pt<10)]/id");
select ExtractValue(@xml, "/entry[(pt<=10)]/id");
select ExtractValue(@xml, "/entry[(pt>10)]/id");
select ExtractValue(@xml, "/entry[(pt>=10)]/id");
select ExtractValue(@xml, "/entry[(pt=50)]/id");
select ExtractValue(@xml, "/entry[(pt!=50)]/id");
select ExtractValue(@xml, "/entry[(pt<50)]/id");
select ExtractValue(@xml, "/entry[(pt<=50)]/id");
select ExtractValue(@xml, "/entry[(pt>50)]/id");
select ExtractValue(@xml, "/entry[(pt>=50)]/id");
select ExtractValue(@xml, "/entry[(10=pt)]/id");
select ExtractValue(@xml, "/entry[(10!=pt)]/id");
select ExtractValue(@xml, "/entry[(10>pt)]/id");
select ExtractValue(@xml, "/entry[(10>=pt)]/id");
select ExtractValue(@xml, "/entry[(10<pt)]/id");
select ExtractValue(@xml, "/entry[(10<=pt)]/id");
select ExtractValue(@xml, "/entry[(50=pt)]/id");
select ExtractValue(@xml, "/entry[(50!=pt)]/id");
select ExtractValue(@xml, "/entry[(50>pt)]/id");
select ExtractValue(@xml, "/entry[(50>=pt)]/id");
select ExtractValue(@xml, "/entry[(50<pt)]/id");
select ExtractValue(@xml, "/entry[(50<=pt)]/id");
select ExtractValue('<a><b><Text>test</Text></b></a>','/a/b/Text');
select ExtractValue('<a><b><comment>test</comment></b></a>','/a/b/comment');
select ExtractValue('<a><b><node>test</node></b></a>','/a/b/node');
select ExtractValue('<a><b><processing-instruction>test</processing-instruction></b></a>','/a/b/processing-instruction');
select ExtractValue('<a><and>test</and></a>', '/a/and');
select ExtractValue('<a><or>test</or></a>', '/a/or');
select ExtractValue('<a><mod>test</mod></a>', '/a/mod');
select ExtractValue('<a><div>test</div></a>', '/a/div');
select ExtractValue('<a><and:and>test</and:and></a>', '/a/and:and');
select ExtractValue('<a><or:or>test</or:or></a>', '/a/or:or');
select ExtractValue('<a><mod:mod>test</mod:mod></a>', '/a/mod:mod');
select ExtractValue('<a><div:div>test</div:div></a>', '/a/div:div');
select ExtractValue('<a><ancestor>test</ancestor></a>', '/a/ancestor');
select ExtractValue('<a><ancestor-or-self>test</ancestor-or-self></a>', '/a/ancestor-or-self');
select ExtractValue('<a><attribute>test</attribute></a>', '/a/attribute');
select ExtractValue('<a><child>test</child></a>', '/a/child');
select ExtractValue('<a><descendant>test</descendant></a>', '/a/descendant');
select ExtractValue('<a><descendant-or-self>test</descendant-or-self></a>', '/a/descendant-or-self');
select ExtractValue('<a><following>test</following></a>', '/a/following');
select ExtractValue('<a><following-sibling>test</following-sibling></a>', '/a/following-sibling');
select ExtractValue('<a><namespace>test</namespace></a>', '/a/namespace');
select ExtractValue('<a><parent>test</parent></a>', '/a/parent');
select ExtractValue('<a><preceding>test</preceding></a>', '/a/preceding');
select ExtractValue('<a><preceding-sibling>test</preceding-sibling></a>', '/a/preceding-sibling');
select ExtractValue('<a><self>test</self></a>', '/a/self');
select ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
select ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
select ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/c');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[-1]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[10]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b["1"]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b["1 and string"]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b["string and 1"]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b["string"]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
SELECT ExtractValue('<a><b>b1</b><b>b2</b></a>','/a/b[$@i]');
select updatexml(NULL, 1, 1), updatexml(1, NULL, 1), updatexml(1, 1, NULL);
select updatexml(NULL, NULL, 1), updatexml(1, NULL, NULL), 
       updatexml(NULL, 1, NULL);
select updatexml(NULL, NULL, NULL);
CREATE TABLE t1(a INT NOT NULL);
INSERT INTO t1 VALUES (0), (0);
SELECT 1 FROM t1 ORDER BY(UPDATEXML(a, '1', '1'));
DROP TABLE t1;
SELECT ExtractValue(@xml, 'html/head/title');
SELECT ExtractValue(@xml, 'html/body');
SELECT ExtractValue('<xml "xxx" "yyy">CharData</xml>', '/xml');
SELECT ExtractValue('<xml  xxx  "yyy">CharData</xml>', '/xml');
CREATE TABLE IF NOT EXISTS t1 (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  xml text,
  PRIMARY KEY (id)
);
INSERT INTO t1 (id, xml) VALUES
(15, '<?xml version="1.0"?><bla name="blubb"></bla>'),
(14, '<xml version="kaputt">');
SELECT
extractvalue( xml, '/bla/@name' ),
extractvalue( xml, '/bla/@name' )
FROM t1 ORDER BY t1.id;
SELECT
UpdateXML(xml, '/bla/@name', 'test'),
UpdateXML(xml, '/bla/@name', 'test')
FROM t1 ORDER BY t1.id;
DROP TABLE t1;
SELECT REPLACE(EXTRACTVALUE('1', '/a'),'ds','');
SELECT AVG(DISTINCT EXTRACTVALUE((''),('$@k')));
SELECT UPDATEXML(CONVERT(_latin1'<' USING utf8mb3),'1','1');
SELECT UPDATEXML(CONVERT(_latin1'<!--' USING utf8mb3),'1','1');
SELECT ExtractValue(CONVERT('<\"', BINARY(10)), 1);
SELECT UPDATEXML(CONVERT('' USING swe7), TRUNCATE('',1), 0);
SELECT UPDATEXML('','(a)/a','');
SELECT UPDATEXML('<a><a>x</a></a>','(a)/a','<b />');
SELECT UPDATEXML('<a><c><a>x</a></c></a>','(a)/a','<b />');
SELECT UPDATEXML('<a><c><a>x</a></c></a>','(a)//a','<b />');
SELECT ExtractValue('<a><a>aa</a><b>bb</b></a>','(a)/a|(a)/b');
select ExtractValue( @x, '/MESSAGE/DATA2' ) into @y;
select @y;
