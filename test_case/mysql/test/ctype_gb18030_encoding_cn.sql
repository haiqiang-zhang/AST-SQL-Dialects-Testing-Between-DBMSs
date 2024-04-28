
-- Use the following chars to get single bytes
-- ���������������������������� ����
-- And construct these gb18030 chars maped from SIP
-- �2�6�2�8�0�5�5�2�5�0�5�1�5�2�5�3�5�4

SET NAMES gb18030;
SET CHARACTER_SET_DATABASE = gb18030;

CREATE DATABASE `����`;
CREATE DATABASE `���ݿ�`;

SELECT schema_name, HEX(schema_name)
  FROM information_schema.schemata
  WHERE schema_name NOT IN ('mtr', 'sys')
  ORDER BY schema_name;

USE `���ݿ�`;
USE `����`;

DROP DATABASE `���ݿ�`;
DROP DATABASE `����`;

USE test;

CREATE TABLE `����` (`�ֶ�һ` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE `ģʽ` (`������` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE `�Jແ9�0` (`�Ё9�3�9�4` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE IF NOT EXISTS `����`(`�ֶ�һ` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE IF NOT EXISTS `ģʽ` (`������` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE IF NOT EXISTS `�Jແ9�0` (`�Ё9�3�9�4` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE IF NOT EXISTS `�9�4�9�4�9�4` (`�9�3�9�3�9�3` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TEMPORARY TABLE `�9�6�9�7�9�8` (`�9�5�9�5�9�5` CHAR(1)) DEFAULT CHARSET = gb18030;

DROP TABLE `����`, `ģʽ`, `�Jແ9�0`, `�9�4�9�4�9�4`, `�9�6�9�7�9�8`;
CREATE TABLE `����` (`�ֶ�һ` CHAR(5)) DEFAULT CHARSET = gb18030;
CREATE TABLE `�Jແ9�0` (`�9�1�9�2�9�3` CHAR(5)) DEFAULT CHARSET = gb18030;

INSERT INTO `����` VALUES ('һ�����ĕ2�8'), ('���߰˾�ʮ'), ('�9�4�9�5�9�6�9�7�9�8'), ('�2�6�2�8�0�5�5�2�5�0');
INSERT INTO `�Jແ9�0` VALUES ('���3�6���F'), ('�h���h���h'), ('�9�2�9�3�9�6�9�7�9�9');

ALTER TABLE `����` ADD `���ֶ�һ` CHAR(1) FIRST;
ALTER TABLE `����` ADD `���ֶζ�` CHAR(1) AFTER `�ֶ�һ`;
ALTER TABLE `����` ADD `���ֶ���` CHAR(1);
ALTER TABLE `����` ADD INDEX (`���ֶζ�`);
ALTER TABLE `����` ADD PRIMARY KEY (`�ֶ�һ`);
ALTER TABLE `����` ADD UNIQUE (`���ֶ���`);
ALTER TABLE `����` CHANGE `���ֶζ�` `�3�2�3�2һ` CHAR(1);
ALTER TABLE `����` MODIFY `���ֶ���` CHAR(6);
SELECT * FROM `����`;

ALTER TABLE `����` DROP INDEX `���ֶζ�`;
ALTER TABLE `����` DROP PRIMARY KEY;
ALTER TABLE `����` DROP INDEX `���ֶ���`;
ALTER TABLE `����` DROP `�3�2�3�2һ`;
ALTER TABLE `����` DROP `���ֶ�һ`;
ALTER TABLE `����` DROP `���ֶ���`;
SELECT * FROM `����`;

DROP TABLE `����`, `�Jແ9�0`;
CREATE TABLE `��һ` (`�ֶ�һ` char(5)) DEFAULT CHARSET = gb18030;
INSERT INTO `��һ` VALUES ('���5�3���5�2��');
SELECT INSERT(`�ֶ�һ`, 1, 1, '�9�9') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 2, '�9�9') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 3, '�9�9') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 4, '�9�9') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 5, '�9�9') FROM `��һ`;

SELECT INSERT(`�ֶ�һ`, 4, 1, '�5�4') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 4, 2, '�5�4') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 5, 1, '�5�4') FROM `��һ`;

SELECT INSERT(`�ֶ�һ`, 1, 1, ' ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 2, '  ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 3, '   ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 4, '    ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 5, '     ') FROM `��һ`;

SELECT INSERT(`�ֶ�һ`, 4, 1, ' ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 4, 2, '  ') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 5, 1, ' ') FROM `��һ`;

SELECT INSERT(`�ֶ�һ`, 1, 1, '��') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 2, '����') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 3, '������') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 4, '��������') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 1, 5, '����������') FROM `��һ`;

SELECT INSERT(`�ֶ�һ`, 4, 1, '�2�8') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 4, 2, '�2�8�2�8') FROM `��һ`;
SELECT INSERT(`�ֶ�һ`, 5, 1, '�2�8') FROM `��һ`;

UPDATE `��һ` SET `�ֶ�һ` = ('���������2�8');
SELECT * FROM `��һ`;
DELETE FROM `��һ` WHERE `�ֶ�һ` = '���5�3���5�2��';
SELECT * FROM `��һ`;
DELETE FROM `��һ`;
SELECT * FROM `��һ`;
CREATE TABLE `����` (c CHAR(5), v VARCHAR(10), t TEXT) DEFAULT CHARSET = gb18030;
INSERT INTO `����` VALUES ('�����5�2�5�0��', '�䳤�2�8�0�5�5�2�ַ����ֶ�', '�ı������5�2�5�3�5�4�ֶ�');
SELECT * FROM `����`;

DROP TABLE `��һ`, `����`;
CREATE TABLE `����` (e ENUM('��', '��', 'Ŀ', '��', '��'), INDEX(e)) DEFAULT CHARSET = gb18030;
INSERT INTO `����` VALUES('��'), ('��'), ('Ŀ'), ('��'), ('��');
SELECT * FROM `����`;
ALTER TABLE `����` ADD c CHAR(1) NOT NULL FIRST;
DROP TABLE `����`;
CREATE TABLE `��һ` (c1 CHAR(20), INDEX(c1)) DEFAULT CHARSET = gb18030;
INSERT INTO `��һ` VALUES ('�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�0�2�0�9�0�8�0�3�6�4');
INSERT INTO `��һ` VALUES ('���9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�9�9�9�9�9�9�9�9�0�0�0�2�0�3�0�4�0�2�9�9�0�6�9�9�0�8�0�3�9�9�0�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�0�4�0�5�0�6�0�7�0�0�0�0�0�2�0�9�0�3�0�1�0�8�0�4�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�0�5�0�6�0�7�0�8�0�9�0�0');
INSERT INTO `��һ` VALUES ('�0�1�0�2�0�3�0�4�0�5�0�7�0�8�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES (' !"--$%&\'()*+,-./');
INSERT INTO `��һ` VALUES ('0123456789:;
INSERT INTO `��һ` VALUES ('@ABCDEFGHIJKLMNO');
INSERT INTO `��һ` VALUES ('PQRSTUVWXYZ[\\]^_');
INSERT INTO `��һ` VALUES ('abcdefghijklmno');
INSERT INTO `��һ` VALUES ('pqrstuvwxyz{|}~');
INSERT INTO `��һ` VALUES ('�9�9�0�9�0�8�0�2�0�0�0�9�0�5�0�8�0�1�0�3�0�1�0�3�0�5�0�9�0�5�0�7�0�1�0�7�0�6�0�9');
INSERT INTO `��һ` VALUES ('�0�8�0�2�0�8�0�5�0�0�9�9�0�3�0�5�0�9�0�7�0�1�0�1�0�0�0�3�0�2�0�6�0�2�0�7�0�0�0�5');
INSERT INTO `��һ` VALUES ('�0�6�0�8�0�1�0�5�0�3�0�1�0�4�0�2�0�5�0�7�0�6�0�0�0�8�0�7�0�1�0�8�0�9�0�5�0�9�0�7');
INSERT INTO `��һ` VALUES ('�0�1�0�3�0�7�0�5�0�1�0�9�0�3�0�2�0�5�0�4�0�8�0�8�0�2�0�7�0�4�0�0�0�5�0�0�0�2�0�1');
INSERT INTO `��һ` VALUES ('�0�9�0�6�0�6�0�0�0�8�0�1�0�5�0�3�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�����0�1�0�9�0�0�����0�2�0�2�0�0�0�4�0�6�0�0�0�4�0�8�0�2�����0�5');
INSERT INTO `��һ` VALUES ('�����0�9���0�1�0�7�0�4�0�6�9�9�0�8�0�2�����0�7�0�6���9�9���0�1�0�6');
INSERT INTO `��һ` VALUES ('�0�7�0�9�0�2�0�6�0�4�����0�3�0�9�����0�2�0�0���0�2���0�1�0�6�0�0�0�8');
INSERT INTO `��һ` VALUES ('�0�2�0�4�0�8�0�6�0�2�0�0�������0�4�0�9���0�3���0�5�0�1�0�6������');
INSERT INTO `��һ` VALUES ('���0�7�0�5�0�7�0�9�0�2�0�6�0�4�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�@�A�Bآ�E�G�J��حѾ�M�N��Q�T�U�Wر�Z');
INSERT INTO `��һ` VALUES ('�]ؿ�`�d���l�m�q�vء�����������ꁗ������');
INSERT INTO `��һ` VALUES ('��큣�������݁���������������������');
INSERT INTO `��һ` VALUES ('�����āŁƁǁȁɁˁ́сҁԁՁցׁ���');
INSERT INTO `��һ` VALUES ('١Ӷ���Ё��������٫���ֶ�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�9�9�u�x�{�|����ؾ��������ػܱ������������');
INSERT INTO `��һ` VALUES ('�������@�B�����F�G���H�J�L���M�N�O�Y�[�\');
INSERT INTO `��һ` VALUES ('�]�^�`�c�d�n�o�s�t�u�v�w�y�{������������');
INSERT INTO `��һ` VALUES ('�����������������9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9�9');
INSERT INTO `��һ` VALUES ('�����������������2�6�2�8�0�5�5�2�5�0�5�1�5�2�5�3�5�4�5�3�5�4');
SELECT * FROM `��һ`;
SELECT * FROM `��һ` WHERE c1 LIKE ' %';
SELECT * FROM `��һ` WHERE c1 LIKE '% %';
SELECT * FROM `��һ` WHERE c1 LIKE '% ';
SELECT * FROM `��һ` WHERE c1 LIKE '��%';
SELECT * FROM `��һ` WHERE c1 LIKE '%�q�v%';
SELECT * FROM `��һ` WHERE c1 LIKE '%��';
SELECT * FROM `��һ` WHERE c1 LIKE '�������@�B�����F�G���H�J�L���M�N�O�Y�[�\%';
SELECT * FROM `��һ` WHERE c1 LIKE '%�������@�B�����F�G���H�J�L���M�N�O�Y�[�\%';
SELECT * FROM `��һ` WHERE c1 LIKE '%�������@�B�����F�G���H�J�L���M�N�O�Y�[�\';
SELECT * FROM `��һ` WHERE c1 = '�0�6�0�8�0�1�0�5�0�3�0�1�0�4�0�2�0�5�0�7�0�6�0�0�0�8�0�7�0�1�0�8�0�9�0�5�0�9�0�7';
SELECT * FROM `��һ` WHERE c1 = '�]ؿ�`�d���l�m�q�vء�����������ꁗ������';
SELECT * FROM `��һ` WHERE c1 = '�]�^�`�c�d�n�o�s�t�u�v�w�y�{������������';
SELECT * FROM `��һ` WHERE c1 = '�����������������2�6�2�8�0�5�5�2�5�0�5�1�5�2�5�3�5�4�5�3�5�4';
SELECT c1, CONVERT(c1 USING gb18030) FROM `��һ`;
SELECT c1, CONVERT(c1 USING utf8mb4), CONVERT(CONVERT(c1 USING utf8mb4) USING gb18030) FROM `��һ`;

DROP TABLE `��һ`;
CREATE TABLE t1a (c CHAR(1) PRIMARY KEY) DEFAULT CHARSET = gb18030;
CREATE TABLE t1b (c CHAR(1) PRIMARY KEY) DEFAULT CHARSET = gb18030;

CREATE TABLE t2a (c CHAR(1) PRIMARY KEY) DEFAULT CHARSET = gb18030;
CREATE TABLE t2b (c CHAR(1) PRIMARY KEY) DEFAULT CHARSET = gb18030;

INSERT INTO t1a VALUES ('˫'), ('��'), ('�5�2'), ('�5�3');
INSERT INTO t1b VALUES ('˫');

INSERT INTO t2a VALUES ('�5�4'), ('�y'), ('�5�3');
INSERT INTO t2b VALUES ('�5�4');

SELECT c FROM t1a WHERE c IN (SELECT c FROM t1b);
SELECT c FROM t1a WHERE EXISTS (SELECT c FROM t1b WHERE t1a.c = t1b.c);
SELECT c FROM t1a WHERE NOT EXISTS (SELECT c FROM t1b WHERE t1a.c = t1b.c);

SELECT c FROM t2a WHERE c IN (SELECT c FROM t2b);
SELECT c FROM t2a WHERE EXISTS (SELECT c FROM t2b WHERE t2a.c = t2b.c);
SELECT c FROM t2a WHERE NOT EXISTS (SELECT c FROM t2b WHERE t2a.c = t2b.c);
SELECT * FROM t1a JOIN t1b;
SELECT * FROM t1a INNER JOIN t1b;
SELECT * FROM t1a JOIN t1b USING (c);
SELECT * FROM t1a INNER JOIN t1b USING (c);
SELECT * FROM t1a CROSS JOIN t1b;
SELECT * FROM t1a LEFT JOIN t1b USING (c);
SELECT * FROM t1a LEFT JOIN t1b ON (t1a.c = t1b.c);
SELECT * FROM t1b RIGHT JOIN t1a USING (c);
SELECT * FROM t1b RIGHT JOIN t1a ON (t1a.c = t1b.c);
SELECT * FROM t2a JOIN t2b;
SELECT * FROM t2a INNER JOIN t2b;
SELECT * FROM t2a JOIN t2b USING (c);
SELECT * FROM t2a INNER JOIN t2b USING (c);
SELECT * FROM t2a CROSS JOIN t2b;
SELECT * FROM t2a LEFT JOIN t2b USING (c);
SELECT * FROM t2a LEFT JOIN t2b ON (t2a.c = t2b.c);
SELECT * FROM t2b RIGHT JOIN t2a USING (c);
SELECT * FROM t2b RIGHT JOIN t2a ON (t2a.c = t2b.c);

DROP TABLE t1a, t1b, t2a, t2b;
CREATE TABLE `��һ` (c1 CHAR(20), INDEX(c1)) DEFAULT CHARSET = gb18030;

INSERT INTO `��һ` VALUES ('12345678900987654321'), ('һ����������������Ҽ'), ('���߰�'), ('��ʮ'), ('��'), ('�5�0�5�1�5�2�5�3');
INSERT INTO `��һ` VALUES ('�3�1'), ('һ�3�1������'), ('�2�8�0�5');
SELECT c1, LENGTH(c1) FROM `��һ`;
SELECT c1, LPAD(c1, 20, '��') FROM `��һ`;
SELECT c1, RPAD(c1, 20, '�5�2') FROM `��һ`;

INSERT INTO `��һ` VALUES ('һ�3�1���5�2���5�4��');
SELECT INSTR(c1, 'һ') FROM `��һ`;
SELECT INSTR(c1, '��') FROM `��һ`;
SELECT INSTR(c1, '��') FROM `��һ`;
SELECT INSTR(c1, '��') FROM `��һ`;
SELECT INSTR(c1, '�5�2') FROM `��һ`;
SELECT INSTR(c1, '�5�4') FROM `��һ`;
SELECT INSTR(c1, '�3�1') FROM `��һ`;
SELECT c1, LEFT(c1, 0) FROM `��һ`;
SELECT c1, LEFT(c1, 1) FROM `��һ`;
SELECT c1, LEFT(c1, 2) FROM `��һ`;
SELECT c1, LEFT(c1, 3) FROM `��һ`;
SELECT c1, LEFT(c1, 4) FROM `��һ`;
SELECT c1, LEFT(c1, 5) FROM `��һ`;
SELECT c1, LEFT(c1, 6) FROM `��һ`;
SELECT c1, LEFT(c1, 7) FROM `��һ`;
SELECT c1, RIGHT(c1, 0) FROM `��һ`;
SELECT c1, RIGHT(c1, 1) FROM `��һ`;
SELECT c1, RIGHT(c1, 2) FROM `��һ`;
SELECT c1, RIGHT(c1, 3) FROM `��һ`;
SELECT c1, RIGHT(c1, 4) FROM `��һ`;
SELECT c1, RIGHT(c1, 5) FROM `��һ`;
SELECT c1, RIGHT(c1, 6) FROM `��һ`;
SELECT c1, RIGHT(c1, 7) FROM `��һ`;
SELECT REPLACE(c1, 'һ', 'һһ') FROM `��һ`;
SELECT REPLACE(c1, '��', '����') FROM `��һ`;
SELECT REPLACE(c1, '�5�4', '�5�4�5�4') FROM `��һ`;
SELECT REPLACE(c1, '�5�2', '�5�2�5�2') FROM `��һ`;

INSERT INTO `��һ` VALUES ('һ�3�1���5�2���5�3');
INSERT INTO `��һ` VALUES ('һ�3�1���5�2���5�3�5�2');
INSERT INTO `��һ` VALUES ('һ�3�1���5�2���5�3�5�2�5�2');
INSERT INTO `��һ` VALUES ('һ�3�1���5�2���5�3�5�2�5�2�5�2');
INSERT INTO `��һ` VALUES ('�5�2һ�3�1���5�2���5�3');
INSERT INTO `��һ` VALUES ('�5�2�5�2һ�3�1���5�2���5�3');
INSERT INTO `��һ` VALUES ('�5�2�5�2�5�2һ�3�1���5�2���5�3');
INSERT INTO `��һ` VALUES ('   һ�3�1���5�2���5�3   ');
SELECT c1, TRIM(TRAILING '�5�2' FROM c1) FROM `��һ`;
SELECT c1, TRIM(LEADING '�5�2' FROM c1) FROM `��һ`;
SELECT c1, TRIM(BOTH '�5�2' FROM c1) FROM `��һ`;
SELECT c1, TRIM(c1) FROM `��һ`;
SELECT REVERSE(c1) FROM `��һ`;

DROP TABLE `��һ`;
CREATE TABLE t1 (c VARCHAR(10)) DEFAULT CHARSET = gb18030;
INSERT INTO t1 VALUES ('������'), ('��'), ('�E�X'), ('����P��'), ('��'), ('�5�4'), ('�E�X');
SELECT c, COUNT(c) FROM t1 GROUP BY c;
DROP TABLE t1;

CREATE TABLE t1 (c1 CHAR(3)) DEFAULT CHARSET = gb18030;
CREATE TABLE t2 (c1 CHAR(3)) DEFAULT CHARSET = gb18030;
CREATE TABLE t3 (`�3�2` CHAR(1), `�9�5` CHAR(1), `��` CHAR(1)) DEFAULT CHARSET = gb18030;
CREATE TABLE t4 (c1 CHAR(3)) DEFAULT CHARSET = gb18030;

INSERT INTO t1 VALUES ('xxx');
INSERT INTO t2 VALUES ('�5�0�9�8��');
INSERT INTO t3 VALUES ('x', 'x', 'x'), ('x', 'x', 'x'), ('y', 'y', 'y'), ('y', 'y', 'y'), ('z', 'z', 'z'), ('z', 'z', 'z');
INSERT INTO t4 VALUES ('�5�0'), ('�9�8'), ('��');

-- Chinese parameter for column name
-- the parameter for stmt is not interpreted as column name
PREPARE stmt1 FROM 'SELECT ? FROM t3';

SET @arg = '�5�0';
SELECT * FROM t4;
SELECT * FROM t4;


SET @arg = '�9�8';
SELECT * FROM t4;
SELECT * FROM t4;


SET @arg = '��';
SELECT * FROM t4;
SELECT * FROM t4;

DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLE t4;
CREATE TABLE `����һ` (id INT PRIMARY KEY, c CHAR(5), b BINARY(50), v VARBINARY(100)) DEFAULT CHARSET = gb18030;
INSERT INTO `����һ` VALUES(1, 'ab�5�6�\��', '12�\3�\345', '�ַ��5�6�\��'), (2, '�\�2�6�2�8�\', '�\�\�\�\5C', '�9�2�9�3�9�6�9�7�9�9'), (3, '�0�5�5�2�5�0', '�2�6�2�8�0�5�5�2�5�0', '�5�1�5�2�5�3�5�4');
SELECT * FROM `����һ`;
DROP TABLE `�����`;
DROP TABLE `�����`;
DROP TABLE `�����`;
DROP TABLE `�����`, `����һ`;