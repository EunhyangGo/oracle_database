-- gradeUser로 접속한 성적처리 화면입니다.

select*from tbl_student;
desc tbl_score;
DROP TABLE tbl_score;

--ID	학번	과목	점수
CREATE TABLE tbl_score(
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);

-- 전체데이터 열기
SELECT * FROM tbl_score;

-- 임포트 후에는 데이터의 개수만 확인
SELECT COUNT(*) FROM tbl_score;

-- 과목 테이블 생성
-- 과목 번호, 과목명, 담당교수
CREATE TABLE tbl_subject(
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name nVARCHAR2(20) NOT NULL,
    su_pro nVARCHAR2(30)
);

-- 모든 칼럼에 데이터가 있을 경우 사용하는 방법
-- VALUES에는 데이터 리스트를 테이블 생성할때 순서로 작성
INSERT INTO tbl_subject VALUES('001','국어','홍길동');

-- 일부 칼럼에만 데이터가 있을 경우 사용하는 방법
-- VALUES에는 테이블명 다음에 나열된 칼럼과 일치하는 데이터만 순서대로 작성
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002','영어');

-- 테이블을 생성할 당시의 칼럼 순서를 모르거나 
-- 정확히 칼럼과 일치되도록 데이터를 작성하는 방법
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('수학','003','성춘향');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004','물리');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('005','음악');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('006','음악');

SELECT * FROM tbl_subject ; 
-- 데이터를 입력한 후 확인해보니 음악 데이터가 2개가 있다.
-- 준비된 원본 데이터를 확인해봤더니 과목번호 006은 음악이 아니고 무용과목이었다.
-- 해당하는 데이터를 변경 하려고 한다.

-- 과목번호 006의 과목명을 음악에서 무용으로 바꾸기
-- Update Set Where
UPDATE tbl_subject 
SET su_name = '무용'
WHERE su_num = '006';

SELECT * FROM tbl_subject;

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900','국토지리');

SELECT * FROM tbl_subject;

-- 데이터를 확인해보니 과목번호 900이라는 항목이 있다.
-- 그래서 데이터를 삭제하려고 한다.
-- DFW
DELETE FROM tbl_subject WHERE su_num ='900';
SELECT * FROM tbl_subject;

-- 성적테이블의 데이터를 확인하는데..
-- 과목칼럼의 데이터들이 과목명이 아니고, 과목 번호로 되어있다.
-- 어떤 과목인지 알기가 매우 어렵다.
-- 성적테이블과 과목테이블을 join을 실행해서 조회를 하려고 한다.
SELECT SC.sc_st_num, SC.sc_subject, SU.su_name, SC.sc_score
FROM tbl_score SC -- 확인하고자 하는 주(main) 테이블
    LEFT JOIN tbl_subject SU -- 주(main)테이블의 조회를 도와주는 서브 테이블
    ON SC.sc_subject = SU.su_num;  -- 두 레이블을 연결하기 위한 조건문

-- 성적 조회를 하면서 학생명이 없어서 누구의 점수인지 확인하기가 어렵다.
-- 학생테이블과 join을 실행해서 조회를 하려고 한다.
SELECT SC.sc_st_num, ST.st_name, SC.sc_score
FROM tbl_score SC -- 확인하고자 하는 주(main) 테이블
    LEFT JOIN tbl_student ST -- 주(main)테이블의 조회를 도와주는 서브 테이블
    ON TRIM(SC.sc_st_num) = TRIM(ST.st_num);  -- 두 레이블을 연결하기 위한 조건문
    
-- 성적테이블과 학생테이블의 학번 칼럼이 type이 달라서 join이 실행되지 않는다.
-- 칼럼을 변경
ALTER TABLE tbl_student MODIFY st_num VARCHAR2(5);
ALTER TABLE tbl_score MODIFY sc_st_num VARCHAR2(5);

-- 학생테이블과 과목테이블을 점수 테이블에 동시에 join을 실행해서 view하기

-- SELECT를 해서 조회된 결과를 VIEW로 생성하려면 
-- AS(알리아스)를 만들어 주어야 한다.
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS 학번,
                ST.st_name AS 학생이름,
                SC.sc_subject AS 과목번호,
                SU.su_name AS 과목이름,
                SC.sc_score AS 점수
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON TRIM(SC.sc_st_num) = TRIM(ST.st_num)

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num

ORDER BY SC.sc_st_num; -- 학번 순으로 정렬

-- 학생데이터 학번: 0001
-- 성적데이터 학번: 001 문자열 길이를 맞추는 방법
-- ON TRIM( '00'|| SC.sc_st_num) = TRIM(ST.st_num)
-- ON RPAD(SC.sc_st_num,5,'0')

-- 자릿수 맞추어서 값 생성하기
SELECT RPAD('3',5,'0') FROM DUAL; 
SELECT LPAD('3',5,'0') FROM DUAL;

-- 문자열 합성
SELECT 'KOREA' || '는 우리나라' FROM DUAL;

-- view_score는 성적테이블, 학생테이블, 과목테이블이 조인된 view이다
SELECT * FROM view_score;

-- view_score를 사용해서 select 연습
SELECT * FROM view_score;

-- 학번 이름 총점 형식의 view 생성
SELECT 학번, 학생이름, SUM(점수),AVG(점수)
FROM view_score
GROUP BY 학번, 학생이름
ORDER BY 학번;

-- 학번, 이름, 국어, 영어, 수학, 과학, 음악, 총점 형식으로 보여주기.
SELECT 학번, 학생이름,
   (DECODE(과목번호,'001',점수) AS 국어
FROM view_score
GROUP BY 학번, 학생이름 , DECODE(과목번호,'001',점수)
ORDER BY 학번;

SELECT 학번, 학생이름,
   SUM(DECODE(과목번호,'001',점수))  AS 국어
FROM view_score
GROUP BY 학번, 학생이름
ORDER BY 학번;

-- 한 학생의 점수를 여러개의 레코드에 저장해두고 view를 할 때
-- 일람표처럼 보이는 SQL
CREATE VIEW 성적일람표
AS
SELECT 학번, 학생이름,
   SUM(DECODE(과목번호,'001',점수))  AS 국어,
   SUM(DECODE(과목번호,'002',점수))  AS 영어,
   SUM(DECODE(과목번호,'003',점수))  AS 수학,
   SUM(DECODE(과목번호,'004',점수))  AS 과학,
   SUM(DECODE(과목번호,'005',점수))  AS 음악,
   SUM(점수) AS 총점,
   RANK() OVER( ORDER BY SUM(점수) DESC) AS 총점순위,
   AVG(점수) AS 평균,
   RANK() OVER( ORDER BY AVG(점수) DESC) AS 평균순위 -- 평균점수 기준으로 순위를 매겨랏
FROM view_score
GROUP BY 학번, 학생이름
ORDER BY 평균순위;
-- GROUP BY를 사용해서 SQL을 작성하는 경우
-- SUM, AVG, COUNT, MAX, MIN, RANK등 통계함수로 묶이지 않는 칼럼이나 계산식들은
-- 모두 GROUP BY에 작성해 주어야 한다.

SELECT * FROM 성적일람표
ORDER BY 학번;

-- 특정한 칼럼만 확인하고 싶을때
SELECT 학번, 학생이름, 수학 FROM 성적일람표;

-- 모든 칼럼을 확인하고 싶을때
SELECT * FROM 성적일람표;

-- 데이터를 추가할때 INSERT문에서 할때 각 칼럼을 나열할 것을 권장함
INSERT INTO tbl_subject(su_num, su_name, su_pro)
VALUES('009','지구과학','이몽룡');

-- UPDATE할때는 기존에 칼럼이 무엇이 저장되었는지 상관하지 말것
-- 반드시 where절을 사용할 것.
-- 특별한 경우가 아니면 한개의 레코드별로 UPDATE를 실행할것.
UPDATE tbl_subject SET su_pro = '임꺽정' 
WHERE  su_num = '009';

-- DELETE와 FORM 키워드 사이에는 아무것도 작성하지 말것
-- 반드시 WHERE 절을 사용할 것
-- 특별한 경우가 아니면 한개의 레코드씩 삭제를 실행할 것.
DELETE FROM tbl_subject WHERE su_num = '009';

-- 프라이머리 키는 변경하지 말자 가급적이면.
UPDATE tbl_subject SET su_num = '010'
WHERE su_num = '009';
