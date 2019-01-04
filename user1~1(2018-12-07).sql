-- ����� user1���� ������ ȭ��

-- DDL CREATE TABLE�� 
-- DML INTSERT SELECT DELETE�� ���������� �ѹ� �ô�.
-- �ɼǵ��� �߰��ؼ� ��ɵ��� �н�

CREATE TABLE tbl_student(
     st_num CHAR(7) PRIMARY KEY,
     st_name nVARCHAR2(20) NOT NULL,
     st_tel nVARCHAR2(15),
     st_age NUMBER(3)
);

SELECT*
FROM tbl_student;
INSERT INTO tbl_student
VALUES('001','�̸���','010-111-1234',19);
-- �̹� �����ϰ� �����Ͱ� �߰��� tbl_student�� �ּ� Į���� �����Ȱ��� �߰��ߴ�.
-- �׷��� tbl_student TABLE�� �ּ� Į���� �߰��Ϸ��� �Ѵ�.
-- DDL ��� ü�� 
-- ���� : CREATE USER, TABLE, INDEX
-- ���� : DROP USER, TABLE, INDEX
-- ���� : ALTER USER, TABLE

ALTER TABLE tbl_student ADD st_addr nVARCHAR2(125);
SELECT * 
FROM tbl_student;

INSERT INTO tbl_student
VALUES('002','������','010-222-2222',16,'�ͻ��');
-- ���� ���̺� ������ �Է��Ҷ�
-- �й�, �̸�, ��ȭ��ȣ, ����, �ּ� ������ �߰��ؾ� �Ѵ�.
-- �׷��� ������ �й�, �̸�, ����, �ּ�, ��ȭ��ȣ ������ �ۼ��Ǿ� �ִ�,
-- �׷��ٺ��� �ڲ� �Է� �Ǽ��� �ϰ� �ȴ�. 
-- �׷���, INSERT���� �ɼ��� ����ؼ� ������ �ٲٰ��� �Ѵ�.
INSERT INTO tbl_student(st_num, st_nane_st_age,st_adder, st_tel)
VALUES('003','ȫ�浿',17,'�����','010-313333');

-- INSERT �����Ҷ� TABLE(Į�� ����Ʈ) �������� �ۼ��� �ϸ� ���� table�� Į�� ������ �����ϰ� ������ �߰��� �� �� �ִ�.



CREATE TABLE tbl_score(

    st_num CHAR(7) PRIMARY KEY,
    st_kor NUMBER(3),
    st_eng NUMBER(3),
    st_math NUMBER(3)

);

INSERT INTO tbl_score(st_num) VALUES('001');
INSERT INTO tbl_score(st_num) VALUES('002');
INSERT INTO tbl_score(st_num) VALUES('003');
INSERT INTO tbl_score(st_num) VALUES('004');
INSERT INTO tbl_score(st_num) VALUES('005');
INSERT INTO tbl_score(st_num) VALUES('006');
INSERT INTO tbl_score(st_num) VALUES('007');

SELECT *
FROM tbl_score;

UPDATE tbl_score SET st_kor = 90, st_eng = 80, st_math = 70 
WHERE st_num = '001';
UPDATE tbl_score SET st_kor = 91, st_eng = 83, st_math = 76 
WHERE st_num = '002';
UPDATE tbl_score SET st_kor = 91, st_eng = 90, st_math = 78 
WHERE st_num = '003';
UPDATE tbl_score SET st_kor = 88, st_eng = 76, st_math = 70 
WHERE st_num = '004';
UPDATE tbl_score SET st_kor = 65, st_eng = 98, st_math = 74 
WHERE st_num = '005';
UPDATE tbl_score SET st_kor = 45, st_eng = 91, st_math = 98 
WHERE st_num = '006';
UPDATE tbl_score SET st_kor = 64, st_eng = 78, st_math = 81 
WHERE st_num = '007';

SELECT *
FROM tbl_score;

SELECT st_kor, st_eng, st_math ,
st_kor + st_eng+ st_math AS ����
FROM tbl_score;

-- �� Į���� �հ�, ����� ����ؼ� ���� Į������ �����ִ� ���
SELECT st_kor AS ��������,
       st_eng AS ��������,
       st_math AS ��������,
       (st_kor + st_eng+ st_math) AS ����,
       (st_kor + st_eng+ st_math)/3 AS ���
FROM tbl_score;
-- �� Į���� ���� ������ ����Ҷ���
-- SUM(Į��) ������ �Լ��� ����Ѵ�.
SELECT SUM(st_kor) AS ��������,
       SUM(st_eng) AS ��������,
       SUM(st_math) AS ��������
FROM tbl_score;

SELECT *
FROM tbl_score;

-- SQL������ ����(��)�� ���������Ͽ� �˻����� ����� �� �ִ�.
-- �̶� �˻������� ������ Į���� ����� ���ڿ��� 
-- ���ڿ� ���̰� ��� ���� �ؾ� �Ѵ�.
-- ����, �׷��� Į���� CHAR ������ �����ϴ� ���� ����.
SELECT *
FROM tbl_score
WHERE st_num >= '003' AND st_num <= '005';

SELECT st_kor AS ��������,
       st_eng AS ��������,
       st_math AS ��������,
       (st_kor + st_eng+ st_math) AS ����,
       ROUND(st_kor + st_eng+ st_math)/3,2 AS ���
FROM tbl_score;
-- ROUND �Լ��� ROUND(��, �Ҽ��ڸ���)�����̸�
-- �Ҽ��ڸ��� + 1���� �ݿø��Ͽ� �Ҽ��ڸ������� ǥ��
-- ��) ROUND( 3.234324,2) => 3.23
--     ROUND( 3.23654323,2) => 3.24

-- ORCLE ���� �Լ�
-- 1���� 45������ ���� �߻�
SELECT ROUND( DBMS_RANDOM.VALUE(50.100),0) 
FROM DUAL;

-- DUAL TABLE
--    ���� ������ ����� ���ų�
--    ���� �Լ����� �׽�Ʈ�غ����� �Ҷ�
--    ����ϴ� DUMMY TABLE
-- ORACLE ���� ������ SELECT ������ FROM�� ������
--    ������ �߻��ϹǷ� �ӽ÷� ����� �� �ִ� DUMMY TABLE�� ����� �ξ���.
SELECT * FROM DUAL;

SELECT 30 * 40 FROM tbl_score;
SELECT 30 * 40 FROM DUAL;

SELECT DBMS_RANDOM.VALUE(50,100) FROM DUAL; --50���� 100���� ����
SELECT ROUND( DBMS_RANDOM.VALUE(50,100),0) AS ���� FROM DUAL;
 
UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '001';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '002';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '003';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '004';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '005';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '006';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_Math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '007';

SELECT *
FROM tbl_score ;
