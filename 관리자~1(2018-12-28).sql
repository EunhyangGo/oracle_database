-- 여기는 관리자 화면입니다.

CREATE USER BBS IDENTIFIED BY 1234;
DROP USER BBS;

CREATE TABLESPACE bbsTS
DATAFILE 'D:/bizwork/ordata/bbsTS.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;


CREATE USER bbsUSER IDENTIFIED BY 1234
DEFAULT TABLESPACE bbsTS;

GRANT DBA TO bbsUSER ;