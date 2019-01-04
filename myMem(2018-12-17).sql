-- ����� myMem ����� ȭ�� �Դϴ�.

CREATE TABLE tbl_iolist(

id	NUMBER		PRIMARY KEY,
io_date 	    CHAR(10)	NOT NULL,	
io_cname	nVARCHAR2(30)	NOT NULL,	
io_dname	nVARCHAR2(50)	NOT NULL	,
io_ceo	        nVARCHAR2(30),		
io_inout	    nVARCHAR2(5)	,	
io_quan	    NUMBER,		
io_pirce	    NUMBER,		
io_total	        NUMBER		
        );
        
SELECT * FROM tbl_iolist;

SELECT COUNT(*),SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout;

-- ���԰� ������ �����ؼ� ������ �հ踦 Ȯ���ؾ� ������ ��� ��ġ�� �ְ� �ȴ�.
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_inout = '����';

SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_inout = '����';

-- ���԰� ������ �����ϰ� �Ѳ����� Ȯ��
SELECT io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout;

-- ���ں��� �����Ͽ� ���԰� ������ ������ ���հ�ݾ�
SELECT io_date, io_inout , COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���ڿ� �Լ� ���
SELECT 'KOREA' FROM DUAL;
SELECT 'Republic Of Korea' FROM DUAL;

-- ���ڿ��� ��, �ҹ��ڷ� ��ȯ 
SELECT  UPPER ( 'KOREA') FROM DUAL; 
SELECT LOWER ( 'KOREA') FROM DUAL;

-- �ܾ��� ù����(�̴ϼ�)�� �빮�ڷ� ����
SELECT INITCAP ('republic of korea') FROM DUAL;

SELECT LENGTH('republic of korea') FROM DUAL;
-- LENGTH �Լ��� ����Ҷ� ��Ȥ �ѱ۰����� *2�� ������ ǥ���ϴ� ��찡 �ִ�.
-- �̶� �ѱ��� ��Ȯ�� ������ �˰��� �Ҷ��� ' '���ڿ� �տ� n�� �ٿ��ش�.
SELECT LENGTH(N'���ѹα�') FROM DUAL;

-- �������� ����뷮�� byte������ �����ֱ�
SELECT LENGTHB('���ѹα�') FROM DUAL;

-- of�� republic of korea�߿� ���° ��ġ�� �ֳ�
SELECT INSTR ( 'Republic of Korea','of') FROM DUAL;

-- ���� ���ڿ��� 4°�ڸ����� 3����
-- ����Ŭ�� ù���� ��ġ�� 0�� �ƴ� 1���� �����Ѵ�.
SELECT SUBSTR('Republic of Korea',4,3) FROM DUAL;

-- ǥ�� SQL���� ���ʺ��� 3��° ��ġ�� ����
SELECT LEFT('Republic',3) FROM DUAL;
-- 3��°���� 2����, ǥ��SQL���� ���
SELECT MID('Republic',3,2) FROM DUAL;

-- KOREA ���ڿ��� �����Ͽ� �� 20���� ���ڿ��� �����ϵ�
-- ����� *�� ä����.
SELECT LPAD('KOREA',20,'*') FROM DUAL;
-- ���� 1�� ���ڿ��� �ٲٰ� �� 5���� ���ڿ��� �����ϵ�
-- ����� 0���� ä����
-- �ڸ����� �����ϰ� ����� �ϴ� ��쿡 ���
SELECT LPAD(1,5,'0') FROM DUAL;
SELECT RPAD(1,5,'0') FROM DUAL;
SELECT LPAD(1,5,'0'), RPAD(1,5,'0') FROM DUAL;

INSERT test(t_num) VALUES(LPAD(1,3,'0');

-- ������ ����
SELECT LTRIM (' KOREA ���ѹα� ') FROM DUAL;
SELECT RTRIM(' KOREA ���ѹα�' ) FROM DUAL;
SELECT TRIM(  '  KOREA ') FROM DUAL;

-- TRIM �Լ��� Ư���� ���
--  'aaaaaaaakoreanaaaa' ���ڿ��� �յڿ� ���� a ���ڵ��� ��� �����϶�(����Ŭ����)
SELECT TRIM( 'a', FROM  'aabbbkoreanaaaa') FROM DUAL;

-- ���ں��� �ŷ� ���п� ���� ������ �հ踦 Ȯ�� �ϰ����Ҷ�
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���ں��� �ŷ� ���п� ���� ������ �հ踦 Ȯ��
-- ��, 2018-03-01 ~2018 -03-31������ data�� ����

SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ������ �Ǵ� �⵵���� �հ踦 ����ؼ� ���� �������� �ִ�.

CREATE VIEW �������
AS
SELECT SUBSTR(io_date,1,7) AS ����,
    io_inout, COUNT(io_total) AS ���� , SUM(io_total) AS �հ�
    FROM tbl_iolist
    GROUP BY SUBSTR(io_date,1,7), io_inout
    ORDER BY  SUBSTR(io_date,1,7);
    
    SELECT * FROM �������;
    
    SELECT * FROM �������
    WHERE ���� BETWEEN '2018-03' AND '2018-06';
    
-- �ŷ�ó���� ����, ���� ������ �հ�
SELECT , io_dname,io_inout COUNT(*),SUM(io_total)
FROM tbl_iolist
GROUP BY io_dname , io_inout;
 
-- ��ǰ���� �����ϰ� ������ �����Ͽ� ����, ���� ������ �հ�  
-- ERP�󿡼� ���� �̶�� �ϸ� ��-�� �� ����� ���� ���Ѵ�.
-- SUBSTR(io_date,6,2)�� �ƴϰ� SUBSTR(io_date,1,7)�� ����ؾ� �Ѵ�.
SELECT  io_cname , SUBSTR(io_date,1,7) AS ����,  io_inout,
COUNT(*) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY  io_cname, SUBSTR(io_date,1,7), io_inout 
ORDER BY io_cname;

-- ��ǰ�߿� ' �� Ű ��'�� ���� ���⸮��Ʈ�� Ȯ���ϰ� �ʹ�.
SELECT * FROM tbl_iolist
WHERE io_cname = ' �� Ű ��';

SELECT io_cname, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_cname = ' �� Ű ��'
GROUP BY io_cname, io_date
ORDER BY io_cname;

SELECT io_cname, SUBSTR(io_date,1,7), COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_cname =' �� Ű ��'
GROUP BY io_cname, io_date
ORDER BY io_cname;