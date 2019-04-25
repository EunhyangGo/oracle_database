-- mybts화면
-- 게시판용 테이블

DROP table tbl_board;
CREATE TABLE tbl_board (
    id NUMBER PRIMARY KEY,
    b_userid nVARCHAR2(50),
    b_date VARCHAR2(10),
    b_time VARCHAR2(10),
    b_subject nVARCHAR2(50),
    b_content nVARCHAR2(1000),
    b_hit NUMBER -- 조회수
    );
    
    SELECT ROUND(DBMS_RANDOM.VALUE(0,9999999999),0) FROM DUAL;
    
    select * from tbl_member;
    
    Delete FROM tbl_board;