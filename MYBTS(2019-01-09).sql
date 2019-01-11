-- ����� myBTs�� ������ ȭ���Դϴ�.
-- ���ο� ���̺��� ����
CREATE TABLE tbl_student (
         st_num CHAR(5) PRIMARY KEY,
         st_name nVARCHAR2(20) NOT NULL,
         st_grade CHAR(2),
         st_tel nVARCHAR2(20)
);

INSERT INTO tbl_student(st_num, st_name, st_grade, st_tel)
VALUES( '00001', 'ȫ�浿', '1', '001-001-0001') ;


INSERT INTO tbl_student VALUES ( '00002' , '001-001-0001','1','�̸���');


INSERT INTO tbl_student(st_name, st_num, st_grade,st_tel)
VALUES('������', '00003', '3','001-002-0002');

--  �����͸� Ȯ���ߴ��� �̸��� �����Ͱ� �� �� �Ȱ��� Ȯ���ߴ�.
-- �̸��� �����Ϳ� st_name Į���� �̸������� �ٲٰ�
-- st_tel Į���� 001-001-0001�� �ٲٷ��� �Ѵ�.
-- ���� st_name Į���� ���� 001-001-0001�ε� �̸������� �ٲٰ��� �Ѵ�.

SELECT * FROM tbl_student;

UPDATE tbl_student
SET st_name = '�̸���', st_tel = '001-001-0001'
WHERE st_num = '00002';

INSERT INTO tbl_student(st_num, st_name, st_grade, st_tel)
VALUES( '0004', 'ȫ�浿', '1', '001-001-0001');

SELECT * FROM tbl_student;

-- �Էµ� �����Ϳ� ȫ�浿�� 2���� �ߺ��Ǿ� �ԷµǾ� �ִ�.
-- �̶� �ι�° �Էµ� ȫ�浿�� �����Ϸ��� �Ѵ�.

-- join�� ���̺� �����
CREATE TABLE tbl_score (
        id NUMBER PRIMARY KEY,
        st_num CHAR(3) NOT NULL,
        sc_sb_code CHAR(3) NOT NULL,
        sc_score NUMBER(3)
);

-- ���� ���̺� ���� ����
ALTER TABLE tbl_score MODIFY st_num CHAR(5);
ALTER TABLE tbl_score MODIFY st_num nVARCHAR2(5);
ALTER TABLE tbl_student MODIFY st_num nVARCHAR2(5);
ALTER TABLE tbl_score MODIFY sc_sb_code nVARCHAR2(5);

-- SEQ ��ü �����ϱ�
CREATE SEQUENCE SEQ_SCORE
START WITH 1 -- ���� ��1;
INCREMENT BY 1;  -- ������1;

SELECT SEQ_SCORE FROM DUAL; -- ������ �׽�Ʈ 

INSERT 
INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES ( SEQ_SCORE.NEXTVAL, '00001','001',90);

commit;

SELECT * FROM tbl_score;

