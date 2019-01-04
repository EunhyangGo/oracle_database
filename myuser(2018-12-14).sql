-- ����� myuser�� ������ ȭ���Դϴ�.
-- ���Ը������(����)���Ͽ��� database�� �����͸� �ű��
-- DB��Ģ�� �µ��� �����ϴ� ���

CREATE TABLE tbl_iolist(
    id	                        NUMBER		PRIMARY KEY,
    io_date	                CHAR(10)	NOT NULL	,
    io_cname	        nVARCHAR2(50)	NOT NULL,	
    io_dname	        nVARCHAR2(30)	NOT NULL	,
    io_deco	            nVARCHAR2(10),		
    io_inout	            nVARCHAR2(5)	,	
    io_quan	            NUMBER,		
    io_price	            NUMBER,		
    io_price1	            NUMBER
    );
    
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;
    
DELETE FROM tbl_iolist;
    
DELETE FROM tbl_iolist;
   
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <= '2018-02-28'
AND io_inout = '����';

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <= '2018-02-28'
AND io_inout = '����';

-- ��¥ ������ �����ϱ�
SELECT io_date, io_cname, io_dname, io_inout, io_total
FROM tbl_iolist
WHERE io_date >='2018-02-01' AND io_date <='2018-02-28'
ORDER BY io_date ;

-- ����Լ��� �̿��ؼ� ������ �հ� ���ϱ�
SELECT  COUNT (*) AS ���� , SUM (io_price1) AS �հ�
FROM tbl_iolist;

-- ����Լ��� �̿��ؼ� ������ �հ踦 ���ϴµ�...
-- �����հ�, �����հ踦 ���� ����ϰ� �ʹ�.
-- 1. ���԰� ������ �����ϴ� Į�� : io_inout
SELECT io_inout, COUNT(io_price1), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_inout ;

-- ������ �հ� ���
-- ���� : ��¥���� ������ �ο��ؼ� ������ �հ� ���
-- 1. ��¥�� �����ϴ� Į�� : io_date
SELECT io_date, COUNT (*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date -- �׷����� ��� ���� �ʹ�.
ORDER BY io_date; --��¥������ �����ؼ� ���� �ʹ�.

-- ���� : ��¥���� ����, �ٽ� ���� ����� �����Ͽ� ������ �հ踦 ����϶�.
-- 1. ��¥�� �����ϴ� Į�� : io_date
-- 2. ���԰� ������ �����ϴ� Į�� : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���а� ��¥ ������ �ٲپ
SELECT io_inout, io_date, COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- ����, ������ �����ϰ� ��¥���� ������ �հ踦 ����Ͽ� ���̱�
-- ��, ��¥������ 2018-03-01~2018-03-31�� ����
SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <= '2018-03-31'
GROUP BY io_date, io_inout
ORDER by io_date;

-- �հ�ݾ��� 50���� �̻��� �׸� ������
SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <= '2018-03-31'
GROUP BY io_date, io_inout
HAVING SUM(io_price1) >=500000
ORDER by io_date;
-- ����Լ��� ����ϴ� ��� 
-- ����Լ� ����� ���� �����ϴ�  list�� �����ϰ� ������
-- (�ʿ��� ������ ���� ���� ������) WHERE�� ������ �ο��ϸ� �ȵȴ�.
-- �̶��� HAVING �̶�� ���� ����Ѵ�.

SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date, io_inout
HAVING SUM(io_price1) >=500000 AND io_date BETWEEN '2018-03-01' AND '2018-03-31'
ORDER by io_date;
-- �̷��� ����Ҽ��� ������ ���� ���� ������ �ƴϴ�. �����Ͱ� ���� ��� ����. ���� ���� ����.
-- HAVING���� ��� ��踦 ����� ��, �������� ������ �ϱ� ������ 
-- ��� �����Ϳ� COUNT�� SUM�� ����ϰ� ��μ� ��¥ ������ �����Ѵ�.
-- ���� DB SELECT���� �־��� �ð� �ҿ䰡 �ɸ���.
