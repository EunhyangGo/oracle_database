-- ����� myuser ȭ���Դϴ�.

CREATE TABLE tbl_employee (
        strEmpno CHAR(3) PRIMARY KEY,
        strName nVARCHAR2(20) NOT NULL,
        strJob nVARCHAR2(20),
        intSal nVARCHAR2(10),
        strDeptNo nVARCHAR2(20)
);

INSERT INTO tbl_employee VALUES('001','ȫ�浿','�λ����',2500000,'�ѹ���');
INSERT INTO tbl_employee VALUES('002','�Ӳ���','�������',2500000,'������');
INSERT INTO tbl_employee VALUES('003','�念��','�޿�����',2500000,'�ѹ���');
INSERT INTO tbl_employee VALUES('004','������','ǰ������',2500000,'�����');
INSERT INTO tbl_employee VALUES('005','�̸���','�������',2500000,'�����');

-- ���� �˻�
-- � Į���� ����� ���� �������� ����Ʈ�� �����ϴ� ��
SELECT * FROM tbl_employee
WHERE strDeptNo =  '�ѹ���';

-- tbl_emp ���̺��� strDeptNo�� �μ��� ��Ÿ���� Į��
-- �� ȸ���� �μ����� �Ϻ� ����Ǵµ�, �ѹ��θ� �λ�����η� �����ϰ��� �Ѵ�.
UPDATE tbl_employee
SET strDeptNo = '�λ������'
WHERE strDeptNo = '�ѹ���';

SELECT * FROM tbl_employee;

-- ���Ի���� �Ի縦 �Ѵ�
-- ���Ի�� ������ �߰�
-- �̸� : ��ϼ�, ���� : �λ纸��, �μ�: �λ� ������
INSERT INTO tbl_employee VALUES ('006','��ϼ�','�λ纸��',1500000,'�λ������');

SELECT * FROM tbl_employee;

-- ȸ�� ��ü�� �μ� ������ �ٽ� �õ��Ѵ�.
-- �ٸ� �μ��� �̸��� 3�����ε�, ���� �λ�����θ� 5���ڿ��� ������ ���� �ʴ´�.
-- �λ�����θ� �λ�η� �����ϰ��� �Ѵ�.
UPDATE tbl_employee
SET strDeptNo = '�λ��'
WHERE strDeptNo = '�λ������';

SELECT * FROM tbl_employee;

-- tbl_emp ���̺��� ��2����ȭ(2NF)�� �ϱ� ����
-- 1. �μ� ���̺��� �����ϰ�
-- 2. �μ� ������ �߰��� ���´�.
CREATE TABLE table_dept(
   strDeptNo CHAR(3) PRIMARY KEY,
   strDeptName nVARCHAR2(20) NOT NULL,
   strDEptChief nVARCHAR2(20)
   );
   
INSERT INTO table_dept VALUES('01','�ѹ���','ȫ�浿');
INSERT INTO table_dept VALUES('02','������','�̸���');
INSERT INTO table_dept VALUES('03','�����','����');
INSERT INTO table_dept VALUES('04','�����','�Ӳ���');

SELECT * FROM table_dept;

-- 3. tbl_emp ���̺��� strDeptNoĮ���� strDetpName���� ����
ALTER TABLE tbl_employee RENAME COLUMN strDeptNO to strDeptName ;

SELECT * FROM tbl_employee;

-- 4. tbl_emp ���̺� strDEptNo(3)Į���� �߰�
-- ���θ��� �μ� ���̺��� �μ� ��ȣ(�ڵ�) Į���� ���� ��������
-- ���ο� Į���� ���
ALTER TABLE tbl_employee
ADD strDeptNo CHAR(3);

-- ���̺��� Į���� ����, �߰�, ������ �Ŀ� ���� ������ ���� ���
DESCRIBE tbl_employee;
DESC tbl_employee;

--  5. ���� tbl_emp ���̺��� strDeptNoĮ���� tbl_dept ���̺� ������ �����Ͽ�
-- �ش��ϴ� no�� update�Ѵ�.
SELECT * FROM tbl_employee;

UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = '�λ��' ;

UPDATE tbl_employee
SET strDeptNo = '02'
WHERE strDeptName = '������' ;

UPDATE tbl_employee
SET strDeptNo = '03'
WHERE strDeptName = '�����' ;

UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = ' �λ������' ;

SELECT * FROM tbl_employee;

-- 6. strDeptName Į���� �����Ѵ�.
-- ���ǻ��� ��� �������� strDeptNo�� ���������� Ȯ���ϴ� ������ �ݵ�� ���ľ� �Ѵ�.
ALTER TABLE tbl_employee DROP COLUMN strDeptName;

SELECT * FROM tbl_employee;

SELECT E.strEmpNo, E.strName, E.strJob, E.strDeptNo, 
                D.strDeptName
FROM tbl_employee E, table_dept D -- ������ �� �ٿ����Ѵ�.
WHERE E.strDeptNo = D.strDeptNo;

SELECT * FROM table_dept;

-- ������ �ѹ��θ� �λ�����η� ���� 
UPDATE table_dept
SET strDeptName =  '�λ������'
WHERE strDeptNo = '01' ;

-- �׸��� ���� �� ������ Ȯ��
SELECT E.strEmpNo, E.strName, E.strJob, E.strDeptNo, 
                D.strDeptName
FROM tbl_employee E, table_dept D -- ������ �� �ٿ����Ѵ�.
WHERE E.strDeptNo = D.strDeptNo;

