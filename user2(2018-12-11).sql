-- ����� user2 ����ȭ�� �Դϴ�.

CREATE TABLE tbl_users(
    str_userid CHAR(12) PRIMARY KEY,
    str_name nVARCHAR2(50) NOT NULL,
    str_tel nVARCHAR2(15),
    str_addr nVARCHAR2(50)
);
INSERT INTO tbl_users VALUES ('001','�����','01012345678','���ֱ�����');
INSERT INTO tbl_users VALUES ('002','������','01012345674','����Ư����');
INSERT INTO tbl_users VALUES ('003','ȣȣȣ','01012345675','��õ������');
INSERT INTO tbl_users VALUES ('004','������','01012345679','����������');
INSERT INTO tbl_users VALUES ('005','������','01012341234','��걤����');

SELECT * FROM tbl_users;

-- ���� �ۼ��� tbl_users ���̺� str_userid�� 12�ڸ��� 
-- ������ �ߴµ�, �Է��� �ϴٺ��� �ʹ� ���� �ڸ��� �����Ѵ�.
-- �׷��� ���� �Է����� id ������ 3���� ũ�⸦ �ٲ㺸���� �Ѵ�.
-- �̹� ������ ���̺��� Į�� ������ �����ϴ°�.
-- DDL ��� �� ALTER����� ����Ѵ�.
ALTER TABLE tbl_users MODIFY str_userid CHAR(6);
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);

-- CHAR�� �����ʹ� ���̴� �����Ϳ� �޸� ���� ũ�⸸ŭ ��������� �̹� ä���� �־ ũ�⸦ ���̱Ⱑ �ȵȴ�.
-- (n)VARCHAR2�� �����ʹ� ���̴� ������ �� ���� ���̰� �� �����͸�ŭ�� ũ�⸦ ���� �� �ִ�.

-- INSERT�� �����Ҷ� ��ü Į���� �ƴ� Ư�� Į���� ���� �ִ� ���
INSERT INTO tbl_users(str_userid, str_name) VALUES('006','Ʈ����');

-- INSERT�� �����Ҷ� �������� ��ġ(����)�� �ٲ��� �Ҷ��� TABLE(Į������Ʈ)�� Į������Ʈ�� ������ �ٲٸ� �ȴ�.
INSERT INTO tbl_users(str_name, str_userid) VALUES('Ʈ����','007');

SELECT * FROM tbl_users;

-- SELECT�� �����Ҷ� Ư���� Į���鸸 �����ؼ� ������ �Ҷ�
-- Į������Ʈ: Projection
SELECT str_name, str_tel
FROM tbl_users;

SELECT * FROM tbl_users
WHERE str_name = '������';

SELECT * FROM tbl_users
WHERE str_addr = '���ֱ�����' AND str_name = '�����';

-- tbl_users ���̺��� id�� 003���� 006���� �����͸� ���̱�
SELECT * FROM tbl_users
WHERE str_userid >= '003' AND str_userid <= '006';

-- ǥ�� SQL
SELECT * FROM tbl_users
WHERE str_userid BETWEEN '003' AND '006';

SELECT * FROM tbl_users;

-- SQL�� ����Լ� 
-- ���� tbl_users�� ����� ������ ������ ���? �˾ƺ���.
-- SUM, COUNT, AVG, MIN, MAX
-- Į���� ���δ� �Լ� 
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT(*) AS ����,
   MIN(str_userid) AS ������,
   MAX(str_userid) AS ū��
   FROM tbl_users;
