-- 여기는 관리자 화면입니다.

-- TABLESPACE를 하나 생성하기
-- tableSpace명 :myTBL1
-- dataFile : d:/bizwork/ordata/mytbl_1.dbf
-- 초기 크기 : 100M
-- 자동 확장 1M씩

CREATE TABLESPACE myTBL1 DATAFILE 'D:/bizwork/ordata/mytbl_1.dbf' size 100M
AUTOEXTEND ON NEXT 1M;

CREATE USER myMem IDENTIFIED BY 1234;
DEFAULT TABLESPACE myTBL1;

GRANT DBA to myMem;
