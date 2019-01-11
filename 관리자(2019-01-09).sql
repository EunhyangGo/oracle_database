-- 여기는 관리자 화면입니다.

-- Table Space 생성
-- 이름 : myBTs
-- DataFile : d:/bizwork/ordata/myBTs.dbf
-- 시작크기 : 100MB
-- 자동 증가 : 100K

CREATE TABLESPACE myBTs
DATAFILE 'd:/bizwork/ordata/myBTs.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- 새로운 사용자 등록
-- 이름 : mybts
-- 비밀번호 : 1234
-- Default TableSpace : myBTs
-- DBA 권한 부여

CREATE USER mybts IDENTIFIED BY 1234
default TABLESPACE myBTs;

GRANT DBA to mybts; 