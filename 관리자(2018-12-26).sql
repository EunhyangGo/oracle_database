-- ����� ������ ȭ���Դϴ�.

-- ���ο� ���̺� �����̽� ����
-- TS�� : myIOTs
-- datafile : myIOTs.dbf
CREATE TABLESPACE myIOTs
DATAFILE 'd:/bizwork/ordata/myIOTs.dbf' 
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- ���ο� ����� ����
CREATE USER myIoUser IDENTIFIED BY 1234;

GRANT DBA to myIouser;

