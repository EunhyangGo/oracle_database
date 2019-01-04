-- 여기는 관리자 화면입니다.

-- 새로운 테이블 스페이스 생성
-- TS명 : myIOTs
-- datafile : myIOTs.dbf
CREATE TABLESPACE myIOTs
DATAFILE 'd:/bizwork/ordata/myIOTs.dbf' 
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- 새로운 사용자 생성
CREATE USER myIoUser IDENTIFIED BY 1234;

GRANT DBA to myIouser;

