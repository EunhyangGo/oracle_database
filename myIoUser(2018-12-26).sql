-- ����� myIoUser ����ȭ���Դϴ�.

CREATE TABLE tbl_iolist(
id	NUMBER		PRIMARY KEY,
io_date	CHAR(10)	NOT NULL	,
io_pname	nVARCHAR2(30)	NOT NULL	,
io_dname	nVARCHAR2(50)	NOT NULL	,
io_ceo	nVARCHAR2(30)		,
io_inout	nVARCHAR2(5)		,
io_quan	NUMBER		,
io_pirce	NUMBER		,
io_total	NUMBER		
);

SELECT COUNT(*) FROM tbl_iolist;

-- �ŷ�ó��, ��ǥ�ڸ��� GROUP���� �Ͽ� ����Ʈ ��ȸ
SELECT io_dname,io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo;

CREATE TABLE tbl_dlist(
d_code	CHAR(5)		PRIMARY KEY,
d_name	nVARCHAR2(30)	NOT NULL,	
d_ceo	nVARCHAR2(10)		
);

-- EQ JOIN
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I , tbl_dlist D 
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;

-- �����Ͱ� ��Ȯ�� ��������°� �����ϱ� ���ؼ�
-- LEFT JOIN�� ����ؼ� ����
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
        LEFT JOIN tbl_dlist D
                        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;
                        
-- �� SQL������ Ȯ����  LIST�� ��� ��ǰ���Ը��� ����� ��Ÿ���� 
-- �߸��� �����Ͱ� �ִ��� Ȯ���ϱ� ��ƴ�.

-- ���� ���� SQL���� ���������� iolist���� �����Ͱ� �ִµ�
--       dlist���� �����Ͱ� ���� ��쿡
--       D.d_name �� D.d_ceo�� NULL������ ��Ÿ�� ���̴�.
-- �� ������ �̿��ؼ� D.d_name�̳� D.d_ceo�� NULL�ΰ͸� ã�� ���� �� ���� Ȯ���� �����ϴ�.
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
        LEFT JOIN tbl_dlist D
                        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo
                        WHERE D.d_name IS NULL OR D.d_ceo IS NULL;
-- ���� SQL�� ���������� LIST�� �ϳ��� ����� ���������� �ŷ�ó���� TABLE�� �ϼ��� ���̴�.

-- �ŷ�ó���� ������ �׸��� �ִ���
SELECT io_dname
FROM tbl_iolist
WHERE io_dname IS NULL;

-- �ŷ�ó���� �ִ� �׸��� �ִ���
SELECT io_dname
FROM tbl_iolist
WHERE io_dname IS NOT NULL;

-- ���� Į���� 0�� ���� 0�̶�� ���� INSERT, UPDATE ������ ��
SELECT io_pirce
FROM tbl_iolist
WHERE io_pirce =0;

-- ���� Į���� NULL�ΰ��� ó������ �ƿ� ���� INSERT���� ������
SELECT io_pirce
FROM tbl_iolist
WHERE io_pirce is NULL;

-- SUB QUERY�� ��ȸ�Ͽ� �ŷ�ó��, ��ǥ�ڸ��� ������ ��ȸ SQL�ۼ�
SELECT I.io_dname, I.io_ceo,
                (SELECT D.d_code FROM tbl_dlist D
                WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) dcode
FROM tbl_iolist I;

-- �ŷ�ó�ڵ带 ������ Į�� �߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5);
SELECT * FROM tbl_iolist;

-- �ŷ�ó���� ���̺��� ��ǰ���Ը��� ���̺� �ִ� �ŷ�ó��� ��ǥ�ڸ��� ��ġ�ϴ�
-- �����͸� ã�Ƽ� �� �������� �ŷ�ó�ڵ带 ��ǰ���Ը��� ���̺��� �ŷ�ó�ڵ忡 UPDATE ����
-- io_dcode�� ���������� �̿��Ͽ� ������Ʈ �ϴ°�.
UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dlist D
             WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo
FROM tbl_iolist;

-- ��ǰ���� ����ȭ �غ���

