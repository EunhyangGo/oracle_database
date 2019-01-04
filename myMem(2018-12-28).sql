-- ����� myMEM���� ������ ȭ���Դϴ�.

CREATE TABLE tbl_primary(
        p_id NUMBER PRIMARY KEY,
        p_name nVARCHAR2(50) NOT NULL,
        p_tel nVARCHAR2(20)
);
-- ���� ���̺� �� pk�� �� ������(���ڵ�)�� �ĺ��ϴ� � ��ҷμ� ����� �ȴ�.
-- �׷��� ����(�л�����, ��ǰ����, �ŷ�ó����, �μ�����)�� �����ϴ� ���̺�����
-- ���Ƿ� �ڵ�(ex: D001, S001)�� �����ؼ� �����͸� �߰�(Insert)�Ҷ� ����Ѵ�.

-- ������
-- ������ �����Ͱ� �ٷ����� �߰��Ǵ� work table(��ǰ���Ը���, ����ó��)�� ��� �ڵ� ������ �߰��ϱⰡ �ſ� ��ƴ�.
-- �׷��� �̷� ���̺��� ���Ƿ� idĮ���� �ϳ� �߰��ϰ�
-- ������ ������ ��(���ڰ� �����Ǵ� ����)�� ����� ������ �Ѵ�.
-- mySQL���� DB������ AUTO INCREMENT��� �ɼ��� �־
-- PK Į���� �ش� �ɼ��� �������ָ� INSERT�� �����Ҷ� �ڵ����� 1�� ������ ���� �����ϰ� Į���� �Ҵ����ֵ��� �� �� �ִ�.

-- �׷���, ����Ŭ(11����)������ AUTO INCREMENT �ɼ��� ����.

-- ������� ����Ŭ�� �ִ� SEQ(SEQUENCE)��� ��ü�� Ȱ���ؼ�
-- AUTO INCREMENT ȿ���� ���� �� �ִ�.

-- ���ο� SEQ ��ü�� �����ϰڴ�. �����
CREATE SEQUENCE PK_SEQ
START WITH 1 -- ���۰�
INCREMENT BY 1 -- STEP(����) ��
NOMAXVALUE -- �Ǵ� MAXVALUE 1000
NOMINVALUE; -- �Ǵ� MINVALUE 0

-- FROM DUAL : ����Ŭ�� �ִ� �׽�Ʈ��(DUMY) ���̺��� �̿��ؼ�
-- ������ �����̳�, ���� �Լ����� ������ �ϰ��� �� �� ����Ѵ�.
-- �ٸ� DB������ SELECT 30 * 40 �̶�� �ۼ��� �ص� DB���� ���� ����������,
-- ����Ŭ�� ������ �߻��Ѵ�.
-- �׷��� �ݵ�� FROM DUAL; �̶�� ������Ѵ�.
SELECT 30 * 40 FROM DUAL;

-- ������ ������ PK_SEQ ������ �׽��� �غ���.
SELECT PK_SEQ.NEXTVAL FROM DUAL;
-- SEQ ��ü�� NEXTVAL������ ȣ���ϸ�
-- �������� ���������� ���� INCREMENT BY�� �����Ѹ�ŭ ���� ��Ų��
-- �� ���� return �Ѵ�.

-- SEQ�� NEXTVAL ���� INSERT�Ҷ� PK�� ����� ID�� �����ϵ��� �Ͽ�
-- ��ġ AUTO INCREMENT�� ������ Į���� ������ ���� ��밡���ϴ�.
INSERT INTO tbl_primary 
VALUES(0,'ȫ�浿','0001');
INSERT INTO tbl_primary VALUES (PK_SEQ.NEXTVAL, '�̸���', '0005');

SELECT * FROM tbl_primary;

-- INSERT�� ������ �� ���� ID���� SEQ�� ���ؼ� Ȯ���ϴ� ���
-- INSERT�� ������� ���� ���¿��� ��ȸ�� �ϸ� ������ ����..
SELECT PK_SEQ.CURRVAL FROM DUAL;

-- INSERT�� ������� �ʾ� ������ �߻��ϰ� ���� ID���� ���� �� ������
-- ����Ŭ�� SYSTEM DB(�ý��� ������ ����)�� ���� ���� ��ȸ�� �� �ִ�.

SELECT * FROM  USER_SEQUENCES 
WHERE SEQUENCE_NAME = 'PK_SEQ';

-- RANDOM �Լ��� ����ؼ� PK�� ����� ���
SELECT DBMS_RANDOM.VALUE FROM DUAL;
SELECT DBMS_RANDOM.VALUE(100, 9999) FROM DUAL;

INSERT INTO tbl_primary VALUES(ROUND( DBMS_RANDOM.VALUE(100, 9999)), '������','0007'); 
-- ������ �̿��ؼ� PK�� �����, �ߺ��� ���� ��Ÿ�� ����� �ְ�
-- ID ������ ������ ������ �ǹ̾��� ������ �ȴ�.
SELECT * FROM tbl_primary
ORDER BY p_id;

-- GUID(Global Unique Identifier), UUID(Universally Unique Identifer)
SELECT SYS_GUID() FROM DUAL;

-- SYS_GUID�� ����ؼ� PK�� �����Ҷ��� CHAR(32)�̻��� ������ �����Ѵ�.
-- SYS_GUID�� ����ؼ� PK�� �����Ҷ� CHAR(32)���� ������ �߻��ϴ� ��찡 �ִ�.
-- �׷����� CLOB, BLOB
INSERT INTO tbl_primary VALUES ( SYS_GUID(), '�Ӳ���', '0000');

DROP SEQUENCE SEQ_TEST;

CREATE SEQUENCE SEQ_TEST
START WITH 1
INCREMENT BY 1
MAXVALUE 10
NOCACHE
CYCLE;

SELECT SEQ_TEST.NEXTVAL FROM DUAL;

-- ������ ����
-- �������� �ٸ� ��üó�� ALTER�� ����ؼ� ������ �� �� �ִµ�
-- START WITH�� ������ �� �� ����.
-- START WITH�� �����Ϸ��� DROP�� �Ŀ� �ٽ� �����ؾ� �Ѵ�.
ALTER SEQUENCE SEQ_TEST
INCREMENT BY 2
MAXVALUE 20
NOCYCLE;

-- �������� ���� �������� �����ϰ� �������� �ִ�.
-- �������� �����Ҷ��� MAXVALUE���� �ݵ�� START ������ ū ������ �����Ѵ�.
CREATE SEQUENCE ASC_SEQ
START WITH 99999
INCREMENT BY -1
MINVALUE 0 -- NOMINVALUE :-1���� ����.
MAXVALUE 100000 ;-- NOMAXVALUE

CREATE TABLE tbl_mytable(
        p_id NUMBER PRIMARY KEY,
        p_name nVARCHAR2(50) NOT NULL,
        p_tel nVARCHAR2(20),
        p_kor NUMBER, -- ������ �����Ϸ��� ���� Į������ ������ �ȴ�.
        p_eng NUMBER -- ��ó�� ������ �ִ밪�� ������ �� ���� ���� ũ�⸦ �������ִ°��� ����.
        );

CREATE SEQUENCE MY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE;

INSERT INTO tbl_mytable VALUES (MY_SEQ.NEXTVAL,'0002',
                                                             ROUND(DBMS_RANDOM.VALUE(50,100)), 
                                                             ROUND(DBMS_RANDOM.VALUE(50,100)) );
                                                             
SELECT p_id, p_name, p_tel, p_kor,p_eng, (p_kor + p_eng) AS �հ�
FROM tbl_mytable;
