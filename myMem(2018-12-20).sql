-- ����� myMem���� ������ ȭ���Դϴ�.

-- ���̺� ����
DROP TABLE tbl_iolist;

-- ������ ���Ը��������� ����Ŭ�� import�� �ϰ� 
-- ���Ը���DB�κ��� ��2����ȭ�� �����ؼ� �ŷ�ó  ������ �и��ϴ� �۾�

DROP TABLE io_list;

CREATE TABLE tbl_iolist(

    io_id	            NUMBER		PRIMARY KEY,
    io_date	        CHAR(10)	NOT NULL	,
    io_cname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL	,
    io_deco	    nVARCHAR2(50),
    io_inout	    nVARCHAR2(5)	NOT NULL,	
    io_quan	    NUMBER,
    io_price	    NUMBER,
    io_total	        NUMBER		

);
-- ������ import Ȯ���ϱ�
SELECT * FROM tbl_iolist;

--
SELECT io_inout, COUNT (*) FROM tbl_iolist
GROUP BY io_inout;

-- ���� ���� �������� �ŷ�ó ������ �ٸ� ���̺�� �и��ؼ� ��2����ȭ ������ ����
-- 1. ���Ը����������� �ŷ�ó ������ �����ϴ� �۾� ����
-- ��. �ŷ�ó��� ��ǥ���� �׷����� ���� ����Ʈ�� �����Ѵ�.
SELECT io_dname, io_deco
FROM tbl_iolist
GROUP BY io_dname, io_deco
ORDER BY io_dname;

-- ��. �������� ������ �ŷ�ó������ import�ϱ� ���ؼ� table�� ����
CREATE TABLE tbl_dept(
d_code	CHAR(6)		PRIMARY KEY,
d_name	nVARCHAR2(50)	NOT NULL,	
d_ceo	    nVARCHAR2(50)		
);

-- ��. �����κ��� �ŷ�ó ������ import
SELECT COUNT(*) FROM tbl_dept;

-- 2. tbl_iolist�� tbl_dept�� ������ Į���� �߰��ϰ� tbl_dept�κ��� �����۾��� ����
-- ��. Į�� �߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(6);
-- ��. �߰��� Į�� Ȯ��
DESC tbl_iolist;

-- SUB QUERY
-- DML(SELECT, INTSERT, UPTDATE) ���ο� �ٸ� SELECT���� �ִ� SQL�� ���Ѵ�.
SELECT io_dname, io_deco, io_dcode
FROM tbl_iolist;

-- ���� SQL�� SUB Query�� �߰��ؼ� dept ���̺�κ��� io_dcode�� ��ȸ �غ���
SELECT io_dname, io_deco,
                (SELECT d_code FROM tbl_dept D
                  WHERE D.d_name = tbl_iolist.io_dname AND
                                D.d_ceo = tbl_iolist.io_deco) AS dcode
FROM tbl_iolist;

-- SUB QUERY�� ����ؼ� tbl_dept�κ��� tbl_iolist�� �ŷ�ó�ڵ带 update�ϴ� �ڵ�
UPDATE tbl_iolist I
SET io_dcode
        =       (SELECT d_code FROM tbl_dept D
                  WHERE D.d_name = I.io_dname AND
                                D.d_ceo = I.io_deco); 
 
SELECT io_dcode, io_dname, io_deco FROM tbl_iolist;

-- tbl_iolist�� io_dname�� io_deco Į���� ����
ALTER TABLE tbl_iolist DROP COLUMN io_dname;
ALTER TABLE tbl_iolist DROP COLUMN io_deco;
DESC tbl_iolist;

-- iolist�� dept ���̺��� join�ؼ� ��ȸ�ϴ� SQL
SELECT I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code;
-- �� join�� EQ JOIN �̶�� �ϸ�, tbl_iolist ���̺���
-- tbl_dept ���̺� ���� io_dcode�� ���� �������� �ʴ´ٴ� ������ ������
-- ������ ����� �����ش�.
-- ���� ��Ȳ������ tbl_dept�� ���� �ڵ尡 tbl_iolist�� ������ �� �ִ�.

-- �׽�Ʈ �����͸� �����  ���ؼ� ���� �������� io_dcode�� ������ ����
SELECT * FROM tbl_iolist
WHERE io_dcode = 'D00100';

UPDATE tbl_iolist
SET io_dcode = 'D00500'
WHERE io_id = 306;

SELECT I.io_id, I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code
            AND io_id BETWEEN 300 AND 310 
ORDER BY I.io_id;

-- JOIN���� ���� ���·� ���Ը��ⱸ�о��� �հ�ݾ��� ���
SELECT COUNT (*), SUM(io_total)
FROM tbl_iolist
WHERE io_id BETWEEN 300 AND 310;

-- EQ JOIN���� ���Ը��ⱸ�о��� �հ�ݾ��� ���
--                     ���� �հ� �ݾװ� ������ ���̰� ����.
SELECT COUNT (*), SUM(io_total)
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code
            AND io_id BETWEEN 300 AND 310 ;
            
-- LEFT JOIN���� ���Ը��ⱸ�о��� �հ� �ݾ��� ���
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I
            LEFT JOIN tbl_dept D
                      ON I.io_dcode = D.d_code
WHERE io_id BETWEEN 300 AND 310;

-- LEFT JOIN�� ���� table�� �����ʹ� ��� �����ְ� 
--       ���� table�� Ű(io_dcode)�� ��ġ�ϴ� �����Ͱ�
--       ������ table�� ������ �����ְ�, ������ null�� ǥ���϶�.
-- ������ table�� ��ġ�ϴ� �����Ͱ� ��� ���� �������� �Ϻΰ� �����Ǿ�
--      ��谡 �߸��Ǵ� ������ Ȯ���ϴ� ����̸�,
--      ���� ��Ȳ���� ����� ������ JOIN�̴�.
SELECT I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I
        LEFT JOIN tbl_dept D
                  ON I.io_dcode = D.d_code
WHERE I.io_id BETWEEN 300 AND 310;

-- iolist�κ��� �ŷ�ó������ �и�
-- 1. �ŷ�ó������ GROUPING�Ͽ� ���� ����Ʈ ��ȸ
-- 2. ������ ����
-- 3. code�� �ο�
-- 4. table����
-- 5. import
-- 6. iolist�� dcode Į�� ����
-- 7. �ŷ�ó���� ���̺��� iolist�� dcode Į���� update
-- ��ǰ�ڵ�� pcode, ���̺��� tbl_product
-- ��ǰ�ڵ� �и��س���.

SELECT io_id, io_cname
FROM tbl_iolist
GROUP BY io_id, io_cname
ORDER BY io_cname;

CREATE TABLE tbl_product(
io_id	            CHAR(6)		PRIMARY KEY
io_cname	nVARCHAR2(50)	NOT NULL	






