-- ����� myBTS ���� ȭ���Դϴ�.
DROP TABLE tbl_score;

-- FOREIGN KEY ����
-- ���� tbl_score ���̺� �����͸� �Է��ϴµ�
-- tbl_student �� st_num�� ��ġ���� �ʴ� ���� �Է��ϸ� ������ �߻��ؼ�
-- �߸� �ԷµǴ� �����Ͱ� ������ �����ϴ� ��.

-- �̰��� ���� ���Ἲ �����̶�� �Ѵ�.
CREATE TABLE tbl_score (
        id NUMBER PRIMARY KEY,
        st_num nVARCHAR2(5) NOT NULL,
        sc_sb_code nVARCHAR2(5) NOT NULL, 
        sc_score NUMBER(3),
        CONSTRAINT FK_st_num FOREIGN KEY(st_num)
        REFERENCES tbl_student(st_num)
);

-- �ʱ⿡ �뷮�� �����͸� �Է��Ϸ��� �ϴµ�
-- FK�� �����Ǿ� ������, tbl_student �����Ͱ� ��� �ϼ��Ǳ� ������
-- tbl_score �����͸� �߰��� �� ���Եȴ�.
-- ���� �ʱ⿡�� �ϴ� FK�� ���� �Ǵ� ������ �ʰ�, �����͸� �Է��ϰ� 
-- �����Ͱ� ���� �ϼ��Ǹ� FK�� �����ϴ� ���� ����.
ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num;

ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num);

-- ���� �����͸� ��� �Է��� �� FK�� ����(�߰�)�ϴµ�,
-- ������ �߻��ϸ� tbl_score�� �߸��� st_num�� �����Ѵٴ� ���̴�.
-- �̷����� join�� ���ؼ� �����͸� Ȯ���ؾ��Ѵ�.

SELECT SC.st_num, ST.st_num, St.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
            ON SC.st_num = ST.st_num
            WHERE St.st_num =' ' ;
            
SELECT * FROM tbl_student;

INSERT INTO tbl_score
VALUES(SEQ_SCORE.NEXTVAL, '00001','001',100);


-- ���� ���Ἲ, ����Ű
-- ���� �����͸� �߰��Ϸ��� �ϴµ� tbl_student�� ���� 001�� �߰��Ϸ��� �ϴ� ������ �߻��Ѵ�.
INSERT INTO tbl_score
VALUES(SEQ_SCORE.NEXTVAL, '001','001',100);

INSERT INTO tbl_score VALUES (SEQ_SCORE.NEXTVAL,'00002','001',00);

SELECT SC.st_num, ST.st_num, SC.sc_sb_code, sc_score, sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
            ON SC.st_num = ST.st_num;
            
SELECT * FROM tbl_student;
DELETE FORM tbl_student WHERE st_num = '00003';
-- �й� 00003�� ���� tbl_score�� �Էµ� �����Ͱ� ��� tbl_student���� ������ ����������
-- �й� 00002�� �̹� tbl_score�� �Էµ� �����Ͱ� �ֱ� ������ 
-- tbl_studnet���� ������ �Ұ����ϴ�.
DELETE FORM tbl_student WHERE st_num = '00002';

-- �ᱹ �� �� ���̺��� st_num�� ��������
-- join���� ���������� ���� ���谡 ��Ȯ������ ���� join�� �����ص� ������ ���� �Ǿ���.

ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num;

-- ���� TBL_STUDENT   ���̺��� �����͸� �����ϴµ�
-- tbl_score�� st_num�� ��ġ�ϴ� �����͵��� ������ ����(���)�����ع���.
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num)
ON DELETE CASCADE;

-- tbl_student�� �����͸� �����ϴµ�
-- tbl_score�� st_num�� ��ġ�ϴ� �����Ͱ� ������
-- st_num�� null�� �ٲ��.
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num)
ON DELETE SET NULL;


SELECT *FROM tbl_score;

DELETE FROM tbl_sutdent WHERE st_num = '00002';
