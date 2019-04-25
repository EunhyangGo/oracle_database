-- gradeUser�� ������ ����ó�� ȭ���Դϴ�.

select*from tbl_student;
desc tbl_score;
DROP TABLE tbl_score;

--ID	�й�	����	����
CREATE TABLE tbl_score(
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);

-- ��ü������ ����
SELECT * FROM tbl_score;

-- ����Ʈ �Ŀ��� �������� ������ Ȯ��
SELECT COUNT(*) FROM tbl_score;

-- ���� ���̺� ����
-- ���� ��ȣ, �����, ��米��
CREATE TABLE tbl_subject(
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name nVARCHAR2(20) NOT NULL,
    su_pro nVARCHAR2(30)
);

-- ��� Į���� �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ������ ����Ʈ�� ���̺� �����Ҷ� ������ �ۼ�
INSERT INTO tbl_subject VALUES('001','����','ȫ�浿');

-- �Ϻ� Į������ �����Ͱ� ���� ��� ����ϴ� ���
-- VALUES���� ���̺�� ������ ������ Į���� ��ġ�ϴ� �����͸� ������� �ۼ�
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002','����');

-- ���̺��� ������ ����� Į�� ������ �𸣰ų� 
-- ��Ȯ�� Į���� ��ġ�ǵ��� �����͸� �ۼ��ϴ� ���
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('����','003','������');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004','����');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('005','����');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('006','����');

SELECT * FROM tbl_subject ; 
-- �����͸� �Է��� �� Ȯ���غ��� ���� �����Ͱ� 2���� �ִ�.
-- �غ�� ���� �����͸� Ȯ���غô��� �����ȣ 006�� ������ �ƴϰ� ��������̾���.
-- �ش��ϴ� �����͸� ���� �Ϸ��� �Ѵ�.

-- �����ȣ 006�� ������� ���ǿ��� �������� �ٲٱ�
-- Update Set Where
UPDATE tbl_subject 
SET su_name = '����'
WHERE su_num = '006';

SELECT * FROM tbl_subject;

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900','��������');

SELECT * FROM tbl_subject;

-- �����͸� Ȯ���غ��� �����ȣ 900�̶�� �׸��� �ִ�.
-- �׷��� �����͸� �����Ϸ��� �Ѵ�.
-- DFW
DELETE FROM tbl_subject WHERE su_num ='900';
SELECT * FROM tbl_subject;

-- �������̺��� �����͸� Ȯ���ϴµ�..
-- ����Į���� �����͵��� ������� �ƴϰ�, ���� ��ȣ�� �Ǿ��ִ�.
-- � �������� �˱Ⱑ �ſ� ��ƴ�.
-- �������̺�� �������̺��� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, SC.sc_subject, SU.su_name, SC.sc_score
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� ��(main) ���̺�
    LEFT JOIN tbl_subject SU -- ��(main)���̺��� ��ȸ�� �����ִ� ���� ���̺�
    ON SC.sc_subject = SU.su_num;  -- �� ���̺��� �����ϱ� ���� ���ǹ�

-- ���� ��ȸ�� �ϸ鼭 �л����� ��� ������ �������� Ȯ���ϱⰡ ��ƴ�.
-- �л����̺�� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, ST.st_name, SC.sc_score
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� ��(main) ���̺�
    LEFT JOIN tbl_student ST -- ��(main)���̺��� ��ȸ�� �����ִ� ���� ���̺�
    ON TRIM(SC.sc_st_num) = TRIM(ST.st_num);  -- �� ���̺��� �����ϱ� ���� ���ǹ�
    
-- �������̺�� �л����̺��� �й� Į���� type�� �޶� join�� ������� �ʴ´�.
-- Į���� ����
ALTER TABLE tbl_student MODIFY st_num VARCHAR2(5);
ALTER TABLE tbl_score MODIFY sc_st_num VARCHAR2(5);

-- �л����̺�� �������̺��� ���� ���̺� ���ÿ� join�� �����ؼ� view�ϱ�

-- SELECT�� �ؼ� ��ȸ�� ����� VIEW�� �����Ϸ��� 
-- AS(�˸��ƽ�)�� ����� �־�� �Ѵ�.
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS �й�,
                ST.st_name AS �л��̸�,
                SC.sc_subject AS �����ȣ,
                SU.su_name AS �����̸�,
                SC.sc_score AS ����
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON TRIM(SC.sc_st_num) = TRIM(ST.st_num)

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num

ORDER BY SC.sc_st_num; -- �й� ������ ����

-- �л������� �й�: 0001
-- ���������� �й�: 001 ���ڿ� ���̸� ���ߴ� ���
-- ON TRIM( '00'|| SC.sc_st_num) = TRIM(ST.st_num)
-- ON RPAD(SC.sc_st_num,5,'0')

-- �ڸ��� ���߾ �� �����ϱ�
SELECT RPAD('3',5,'0') FROM DUAL; 
SELECT LPAD('3',5,'0') FROM DUAL;

-- ���ڿ� �ռ�
SELECT 'KOREA' || '�� �츮����' FROM DUAL;

-- view_score�� �������̺�, �л����̺�, �������̺��� ���ε� view�̴�
SELECT * FROM view_score;

-- view_score�� ����ؼ� select ����
SELECT * FROM view_score;

-- �й� �̸� ���� ������ view ����
SELECT �й�, �л��̸�, SUM(����),AVG(����)
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й�;

-- �й�, �̸�, ����, ����, ����, ����, ����, ���� �������� �����ֱ�.
SELECT �й�, �л��̸�,
   (DECODE(�����ȣ,'001',����) AS ����
FROM view_score
GROUP BY �й�, �л��̸� , DECODE(�����ȣ,'001',����)
ORDER BY �й�;

SELECT �й�, �л��̸�,
   SUM(DECODE(�����ȣ,'001',����))  AS ����
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й�;

-- �� �л��� ������ �������� ���ڵ忡 �����صΰ� view�� �� ��
-- �϶�ǥó�� ���̴� SQL
CREATE VIEW �����϶�ǥ
AS
SELECT �й�, �л��̸�,
   SUM(DECODE(�����ȣ,'001',����))  AS ����,
   SUM(DECODE(�����ȣ,'002',����))  AS ����,
   SUM(DECODE(�����ȣ,'003',����))  AS ����,
   SUM(DECODE(�����ȣ,'004',����))  AS ����,
   SUM(DECODE(�����ȣ,'005',����))  AS ����,
   SUM(����) AS ����,
   RANK() OVER( ORDER BY SUM(����) DESC) AS ��������,
   AVG(����) AS ���,
   RANK() OVER( ORDER BY AVG(����) DESC) AS ��ռ��� -- ������� �������� ������ �Űܶ�
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY ��ռ���;
-- GROUP BY�� ����ؼ� SQL�� �ۼ��ϴ� ���
-- SUM, AVG, COUNT, MAX, MIN, RANK�� ����Լ��� ������ �ʴ� Į���̳� ���ĵ���
-- ��� GROUP BY�� �ۼ��� �־�� �Ѵ�.

SELECT * FROM �����϶�ǥ
ORDER BY �й�;

-- Ư���� Į���� Ȯ���ϰ� ������
SELECT �й�, �л��̸�, ���� FROM �����϶�ǥ;

-- ��� Į���� Ȯ���ϰ� ������
SELECT * FROM �����϶�ǥ;

-- �����͸� �߰��Ҷ� INSERT������ �Ҷ� �� Į���� ������ ���� ������
INSERT INTO tbl_subject(su_num, su_name, su_pro)
VALUES('009','��������','�̸���');

-- UPDATE�Ҷ��� ������ Į���� ������ ����Ǿ����� ������� ����
-- �ݵ�� where���� ����� ��.
-- Ư���� ��찡 �ƴϸ� �Ѱ��� ���ڵ庰�� UPDATE�� �����Ұ�.
UPDATE tbl_subject SET su_pro = '�Ӳ���' 
WHERE  su_num = '009';

-- DELETE�� FORM Ű���� ���̿��� �ƹ��͵� �ۼ����� ����
-- �ݵ�� WHERE ���� ����� ��
-- Ư���� ��찡 �ƴϸ� �Ѱ��� ���ڵ徿 ������ ������ ��.
DELETE FROM tbl_subject WHERE su_num = '009';

-- �����̸Ӹ� Ű�� �������� ���� �������̸�.
UPDATE tbl_subject SET su_num = '010'
WHERE su_num = '009';
