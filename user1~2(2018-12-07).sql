-- ����� USER1���� ������ ȭ���Դϴ�.
-- �̸�(o_name), ��ȭ��ȣ(o_tel), �ּ�(o_addr), ȸ��(o_comp), �μ�(o_dept) Į���� ���� 
-- tbl_office ���̺��� �����Ͻÿ�.
-- ��, id�� pk�� �����ϰ� �̸��� NOT NULL�� �����Ͻÿ�.

CREATE TABLE tbl_office(
     id NUMBER PRIMARY KEY,
     o_name nVARCHAR2(5) NOT NULL,
     o_tel nVARCHAR2(10),
     o_addr nVARCHAR2(30),
     o_comp nVARCHAR2(30),
     o_dept nVARCHAR2(15)    
);
SELECT
    *
FROM tbl_office;