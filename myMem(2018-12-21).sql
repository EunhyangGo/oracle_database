-- ����� myMem���� ������ ȭ���Դϴ�.

-- tbl_iolist���� ��ǰ�������̺��� �и��ؼ� ��2����ȭ ������ ����

-- tbl_iolist�� ������ Ȯ��
SELECT COUNT(*) FROM tbl_iolist;

-- ��ü�����Ͱ� �ƴ� � ���ǿ� �´� �����͸� �����ؼ�
-- Ȯ���ϰ��� �Ҷ��� WHERE������ Į�� = ���� ������ SQL�� �̿��Ѵ�.

-- � ������ �����ϱⰡ �������� ������
-- �׳� ��� ������ �����ؼ�(��, 10��, 100��) ��ȸ�ϰ��� �Ҷ�
-- ����Ŭ�� SQL
-- Į�������� ROWNUM��� Į���� �ִ�.
--       �� Į���� ����� �������� ROW ������ �������� ǥ���϶�� ����Ŭ DUMYĮ��
SELECT ROWNUM, io_date, io_cname, io_dcode 
FROM tbl_iolist;

-- ROWNUM Į���� �̿��ϸ� �����͸���Ʈ �߿��� ��� ���������� ��ȸ�� �� �� �ִ�.
SELECT ROWNUM, io_date, io_cname
FROM tbl_iolist
WHERE ROWNUM <=10;

-- ROWNUM Į���� �̿��ؼ� 10��° ��ġ�� �����ͺ��� 20��° �����͸� ��ȸ�ϰ� �ʹ�.
SELECT ROWNUM, io_date, io_cname
FROM tbl_iolist
WHERE ROWNUM BETWEEN 10 AND 20;

-- MySQL
-- SELECT * FROM tbl_iolist LIMIT 10;

SELECT * FROM tbl_iolist WHERE ROWNUM <10;

-- ��ǰ ������ ��ǰ���̺�� �и��ϱ� ���ؼ�
-- ��ǰ�̸� ����Ʈ�� �����.
SELECT io_cname
FROM tbl_iolist
GROUP BY io_cname;

SELECT io_cname, io_inout, io_price
FROM tbl_iolist 
WHERE ROWNUM <10;

-- ���� ��ȸ�� �����Ϳ��� io_inout�� '����'�̸� io_price�� '���� �ܰ�' �� ���̰�
-- '����'�̸� '����ܰ�'�� ������ ������ �ȴ�.
-- �׷��� io_inout�� ���� �ܰ��� �ٸ��� ǥ���� ����.
SELECT io_cname, io_inout,
        DECODE(io_inout, '����', io_price) ���Դܰ�,
        DECODE(io_inout, '����', io_price) ����ܰ�
FROM tbl_iolist
WHERE ROWNUM < 10;

SELECT io_cname, io_inout,
       AVG(DECODE(io_inout, '����', io_price)) ���Դܰ�,
        AVG(DECODE(io_inout, '����', io_price)) ����ܰ�
FROM tbl_iolist
GROUP BY io_cname, io_inout, DECODE(io_inout, '����', io_price) ,DECODE(io_inout, '����', io_price) ;

SELECT io_cname,
       AVG(DECODE(io_inout, '����', io_price)) ���Դܰ�,
       AVG(DECODE(io_inout, '����', io_price)) ����ܰ�
FROM tbl_iolist
GROUP BY io_cname
ORDER BY io_cname;

CREATE TABLE tbl_product(
p_code	CHAR(9)		PRIMARY KEY,
p_name	nVARCHAR2(50)	NOT NULL,	
p_iprice	NUMBER,		
p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;

-- ���� ��ǰ���� ���̺� �����ϰ� �����͸� ���������
-- ��. ���Ը����������� ��ǰ�ڵ� Į���� �����ϰ�
-- ��. ��ǰ�ڵ� Į�� �����͸� Update�ϰ�
-- ��. ��ǰ�� Į���� ����

ALTER TABLE tbl_iolist ADD io_pcode CHAR(9);

-- ���� ������ �̿��ؼ� iolist�� product table���� ���踦 �ѹ� ��ǥ����
SELECT io_cname, 
            (SELECT p_name FROM tbl_product P 
            WHERE P.p_name = I.io_cname),
             (SELECT p_code FROM tbl_product P 
            WHERE P.p_name = I.io_cname)
FROM tbl_iolist I;

-- product table���� ��ǰ�ڵ�(p_code)�� ��ȸ�ؼ� 
-- iolist table�� io_pcode Į���� Update ����.
UPDATE tbl_iolist I
SET io_pcode = 
        (SELECT p_code FROM tbl_product P
            WHERE P.p_name = I.io_cname) ;

-- UPDATE �Ŀ� ����
-- Join�� �̿��ؼ� ����
SELECT I.io_pcode, P.p_code, I.io_cname,  P.p_name
FROM tbl_iolist I
        LEFT JOIN tbl_product P
                   ON I.io_pcode = P.p_code
ORDER BY I.io_pcode;

-- ��ǰ�� Į���� ����
ALTER TABLE tbl_iolist DROP COLUMN io_cname;

DESC tbl_iolist;

SELECT * FROM tbl_iolist
WHERE ROWNUM <10;

-- tbl_iolist�� �� 2����ȭ ������ �Ϸ�Ǿ���
-- ���Ը������ ���鼭 ��ǰ��� �ŷ�ó���� ���� Ȯ���ϰ� �ʹ�.

-- 1. ���Ը������ ��ǰ�� ���� ����
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout, 
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
        LEFT JOIN tbl_product P
                  ON I.io_pcode = P.p_code;
                  
-- 2. ���Ը��� ���� �ŷ�ó ������ ���� ����
SELECT I.io_date,
                I.io_dcode,
                I.io_inout, 
                I.io_quan,
                I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
        LEFT JOIN tbl_dept D
                  ON I.io_dcode = D.d_code;

-- 3. ���Ը������ ���鼭 ��ǰ����, �ŷ�ó������ ���� ����ʹ�.
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout,
                I.io_dcode, D.d_name, D.d_ceo,
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
        LEFT JOIN tbl_product P -- ��ǰ������ JOIN
                ON I.io_pcode = P.p_code     
                LEFT JOIN tbl_dept D -- �ŷ�ó ������ join
                        ON I.io_dcode = D.d_code;
                        
-- ���Ը������ ��ǰ����, �ŷ�ó������ JOIN�ؼ� ��ȸ�� �ߴµ�
-- ������ �ʹ� ������
-- �׷��� ���� ����� �� ����.
-- �̷��� SQL�� VIEW�� ������ �ξ��.
CREATE VIEW io_dept_product_view
AS
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout,
                I.io_dcode, D.d_name, D.d_ceo,
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
        LEFT JOIN tbl_product P -- ��ǰ������ JOIN
                ON I.io_pcode = P.p_code
                LEFT JOIN tbl_dept D -- �ŷ�ó ������ join
                        ON I.io_dcode = D.d_code;
                        
SELECT * FROM io_dept_product_view;

SELECT io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <='2018-03-31'
AND io_inout ='����'
GROUP BY io_inout;
