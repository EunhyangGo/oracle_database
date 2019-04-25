-- ����� myBTS�� ������ ȭ���Դϴ�.

CREATE TABLE tbl_student (
         st_num CHAR(5) PRIMARY KEY, -- char >> nvarchar2
         st_name nVARCHAR2(20) NOT NULL,
         st_grade CHAR(2),
         st_tel nVARCHAR2(20)
);

DROP TABLE tbl_score;
CREATE TABLE tbl_score (
        id NUMBER PRIMARY KEY,
        st_num CHAR(3) NOT NULL, -- char >> nvarchar2
        sc_sb_code CHAR(3) NOT NULL, -- char >> nvarchar2
        sc_score NUMBER(3)
);

-- �������̺�(tbl_score)�� �����͸� �߰��Ҷ�
-- �й�(st_num)�� �����ȣ(sc_sb_code)�� �ߺ��Ǵ� ������ �߻��� �� �ִ�.
-- ���� ��� 00001 �й��� 001 ������ 2�� �̻� �ߺ��Ǿ� �Էµ� �� �ִ�.

-- �� �ߺ� �Է��� �ȵǵ��� ���̺� ���踦 �ٽ� �����Ѵ�.
-- �̰��� �������(CONSTRAINT) �߰���� �Ѵ�.

CREATE TABLE tbl_score (
        id NUMBER PRIMARY KEY,
        st_num nVARCHAR2(5) NOT NULL,
        sc_sb_code nVARCHAR2(5) NOT NULL, 
        sc_score NUMBER(3),
        CONSTRAINT un_num_sb_code UNIQUE(st_num, sc_sb_code) -- �ΰ��� Į���� ���� �ߺ����� �ʵ��� �ϰڴ�
);

INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'00001','001',80);
INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'00001','002',80);
INSERT INTO tbl_score VALUES(SEQ_SCORE.NEXTVAL,'00001','003',80);

-- �ټ��� Į���� ��� PK�� ����, ������ ���� �������� �ʴ� ���
-- ���� ���� insert������ �����ϸ� id���� ��� ����Ǿ 
-- ������ ������, �Ʒ� primary key ���� ������ ���ǹ�������.
CREATE TABLE tbl_score (
        id NUMBER ,
        st_num nVARCHAR2(5) NOT NULL,
        sc_sb_code nVARCHAR2(5) NOT NULL, 
        sc_score NUMBER(3),
        CONSTRAINT PK_num_sb_code PRIMARY KEY(id, st_num, sc_sb_code)  
);

-- ������ �����Ǿ��ִ� key�� �����ϴ� ���
ALTER TABLE tbl_score 
DROP CONSTRAINT un_num_sb_code;
-- �̹� �����Ǿ��ִ� key�� �����ϴ� ����� ����.
ALTER TABLE tbl_score
DROP CONSTRAINT PK_num_sb_code;

-- �̹� ������ �� ���̺��� ���� ������ �߰��ϴ� ���
ALTER TABLE tbl_score
ADD CONSTRAINT un_num_sb_code UNIQUE(st_num, sc_sb_code);

-- �ε��� ����
CREATE INDEX idx_score_num ON tbl_score(st_num);
-- �ε�����
-- ���� �˻�(SELECT) �Ҷ� �ַ� ����ϴ� Į���� ���
-- �˻��� �ӵ��� ���̱� ���ؼ� ������ �� Į�� ������ �ϳ��� Ŭ������ ����� �δ� ��
-- ���� 
SELECT * FROM tbl_score WHERE st_num = '00001';
-- �̷��� ������ �����ϸ� 
-- DB�� ���� idx_score_num���� �ش� Į���� ��ȸ�ϰ�,
-- �ű⿡�� ����� ������ �������� tbl_score���� �����͸� �����´�.

-- �ε����� ����ϸ�
-- �˻��Ҷ��� �ſ� ���� �����͸� ã�� �� �ִ�.
-- �����Ͱ� �������� ���������� ȿ���� �� Ŀ����.

-- ������ 
-- st_num���� ������ ���� �Ͼ�ų�,
-- �ʱ⿡ ���� ���� �����͸� �߰��Ҷ��� ������ �ӵ��� ��������.

-- �ǹ�������
-- �ʱ⿡ �������� �����͸� �߰��Ҷ��� 
-- �ε����� ������ �ʰ� ����ϴٰ� ������ �߰��� ����(���)������ �ε����� ����� ����Ѵ�.

-- �����Ϳ� ����, �߰� ���� ����� �߻��ϸ�
-- �ε���(����)�� �ջ�Ǵ� ��쵵 �߻��Ѵ�.
-- �׷����� �ε����� �����ϰ�, �ٽ� ������־�� �Ѵ�.
DROP INDEX idx_score_num ; -- �ε��� ����


