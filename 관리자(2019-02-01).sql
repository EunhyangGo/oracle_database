-- ����� ������ ȭ�� �Դϴ�.

CREATE TABLESPACE mybtsts
DATAFILE 'd:/bizwork/ordata/mybts.dbf'
SIZE 100M 
AUTOEXTEND ON NEXT 100k;

DROP USER mybts;
CREATE USER mybts IDENTIFIED BY 1234
default tablespace mybtsts;

GRANT DBA TO mybts;