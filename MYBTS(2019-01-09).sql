-- 여기는 myBTs로 접속한 화면입니다.
-- 새로운 테이블을 생성
CREATE TABLE tbl_student (
         st_num CHAR(5) PRIMARY KEY,
         st_name nVARCHAR2(20) NOT NULL,
         st_grade CHAR(2),
         st_tel nVARCHAR2(20)
);

INSERT INTO tbl_student(st_num, st_name, st_grade, st_tel)
VALUES( '00001', '홍길동', '1', '001-001-0001') ;


INSERT INTO tbl_student VALUES ( '00002' , '001-001-0001','1','이몽룡');


INSERT INTO tbl_student(st_name, st_num, st_grade,st_tel)
VALUES('성춘향', '00003', '3','001-002-0002');

--  데이터를 확인했더니 이몽룡 데이터가 잘 못 된것을 확인했다.
-- 이몽룡 데이터에 st_name 칼럼을 이몽룡으로 바꾸고
-- st_tel 칼럼을 001-001-0001로 바꾸려고 한다.
-- 현재 st_name 칼럼의 값이 001-001-0001인데 이몽룡으로 바꾸고자 한다.

SELECT * FROM tbl_student;

UPDATE tbl_student
SET st_name = '이몽룡', st_tel = '001-001-0001'
WHERE st_num = '00002';

INSERT INTO tbl_student(st_num, st_name, st_grade, st_tel)
VALUES( '0004', '홍길동', '1', '001-001-0001');

SELECT * FROM tbl_student;

-- 입력된 데이터에 홍길동이 2개가 중복되어 입력되어 있다.
-- 이때 두번째 입력된 홍길동을 삭제하려고 한다.

-- join할 테이블 만들기
CREATE TABLE tbl_score (
        id NUMBER PRIMARY KEY,
        st_num CHAR(3) NOT NULL,
        sc_sb_code CHAR(3) NOT NULL,
        sc_score NUMBER(3)
);

-- 기존 테이블 구조 변경
ALTER TABLE tbl_score MODIFY st_num CHAR(5);
ALTER TABLE tbl_score MODIFY st_num nVARCHAR2(5);
ALTER TABLE tbl_student MODIFY st_num nVARCHAR2(5);
ALTER TABLE tbl_score MODIFY sc_sb_code nVARCHAR2(5);

-- SEQ 객체 생성하기
CREATE SEQUENCE SEQ_SCORE
START WITH 1 -- 시작 값1;
INCREMENT BY 1;  -- 증가값1;

SELECT SEQ_SCORE FROM DUAL; -- 시퀀스 테스트 

INSERT 
INTO tbl_score(id, st_num, sc_sb_code, sc_score)
VALUES ( SEQ_SCORE.NEXTVAL, '00001','001',90);

commit;

SELECT * FROM tbl_score;

