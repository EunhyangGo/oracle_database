-- ����� mybts ���� ȭ�� �Դϴ�.

-- �ּҷ� table�� �ϳ� ����
-- �й�, �̸�, ��ȭ��ȣ, �ּ�

CREATE TABLE tbl_addr(
        ad_num nVARCHAR2(5) PRIMARY KEY,
        ad_name nVARCHAR2(30) NOT NULL,
        ad_tel nVARCHAR2(15),
        ad_addr1 nVARCHAR2(20),
        ad_addr2 nVARCHAR2(50)
);

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19001','ȫ�浿','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19002','������','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19003','�庸��','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19004','�̸���','001-001-004');

select * from tbl_addr;
