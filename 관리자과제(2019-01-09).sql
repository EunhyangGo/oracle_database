
-- ����� ������ ȭ���Դϴ�.

-- Table Space ����
-- �̸� : myBTs
-- DataFile : d:/bizwork/ordata/myBTs.dbf
-- ����ũ�� : 100MB
-- �ڵ� ���� : 100K

CREATE TABLESPACE myQue
DATAFILE 'd:/bizwork/ordata/myQue.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- ���ο� ����� ���
-- �̸� : mybts
-- ��й�ȣ : 1234
-- Default TableSpace : myBTs
-- DBA ���� �ο�

CREATE USER myque IDENTIFIED BY 1234
default TABLESPACE myQue;

GRANT DBA to myQue; 