-- 여기는 관리자 화면 입니다.

CREATE TABLESPACE mybtsts
DATAFILE 'd:/bizwork/ordata/mybts.dbf'
SIZE 100M 
AUTOEXTEND ON NEXT 100k;

DROP USER mybts;
CREATE USER mybts IDENTIFIED BY 1234
default tablespace mybtsts;

GRANT DBA TO mybts;