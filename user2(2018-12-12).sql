-- 여기는 user2 접속 화면입니다.

CREATE TABLE tbl_test1 (
    str_num char(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)

);
-- 표준 형식의 pk설정
CREATE TABLE tbl_test2(
  str_num CHAR(3),
  intKor NUMBER(3),
  intEng NUMBER(3),
  intMath NUMBER(3),
  PRIMARY KEY(str_num)
  );
  
DROP TABLE tbl_users ;

CREATE TABLE tbl_users(
  str_num CHAR(3) PRIMARY KEY,
  str_name nVARCHAR2(20),
  str_tel nVARCHAR2(15)
);

INSERT INTO tbl_users VALUES('001','홍길동','111');
INSERT INTO tbl_users VALUES('002','이몽룡','222');
INSERT INTO tbl_users VALUES('003','성춘향','333');
INSERT INTO tbl_users VALUES('004','장영실','444');
INSERT INTO tbl_users VALUES('005','임꺽정','555');

INSERT INTO tbl_test1 VALUES('001',65,78,88);
INSERT INTO tbl_test1 VALUES('002',47,99,56);
INSERT INTO tbl_test1 VALUES('003',87,75,84);
INSERT INTO tbl_test1 VALUES('004',67,98,81);
INSERT INTO tbl_test1 VALUES('005',84,73,68);

SELECT * FROM tbl_test1;
SELECT * FROM tbl_users;

SELECT * FROM tbl_users
ORDER BY str_num;

-- 학생의 점수를 관리하는 table을 설계하는데 가장 일반적인 방법으로 테이블을 만들면
-- 필요한 칼럼을 모두 포함하는 테이블을 생성할 수 있다.

-- 학번, 이름, 국어, 영어, 수학, 총점, 평균
-- 학번, 이름, 전화번호, 주소, 국어, 영어, 수학, 총점, 평균

-- 하지만 DataBase적인 관점에서는 한개의 테이블에
-- 필요한 칼럼을 모두 나열하는 것은 매우 바람직하지 않다.
-- DB 관점에서는 필요한 정보들끼리 table을 별도로 생성을 해서 Data를 관리한다.

-- 학생 정보는 : tbl_users 테이블에 있고
-- 점수 정보는 : tbl_test1 테이블에 있게 하는 것이 좋다.

-- 하지만, 이렇게 테이블을 분리하면 점수정보를 보면서 학생정보를 같이 조회하고 싶을때
-- 어려움이 발생을 한다.

-- 그래서 표준 SQL에는 두개의 table을 연결(Join)해서
-- 마치 1개의 테이블처럼 데이터를 볼 수 있는 기능을 제공한다.

-- 두개의 테이블 정보를 모두 보고 싶다. <<그냥>>
SELECT * FROM tbl_test1, tbl_users; 

-- 두개의 테이블을 조회(read, select)할때 
-- 나누어진 다수의 table을 묶어서(Join)하여 보여주는 기법
-- >> Join 이라고 한다.
-- Join 중에서 가장 단순한 보편적인, Join으로 Equal Join 이라고 한다.
SELECT * FROM tbl_test1, tbl_users
WHERE tbl_test1.str_num = tbl_users.str_num ;

-- 원하는 칼럼만 나열하기
SELECT tbl_test1.str_num,
               tbl_test1.intKor,
               tbl_test1.intEng,
               tbl_test1.intMath,
               tbl_users.str_name
FROM tbl_test1, tbl_users
WHERE tbl_test1.str_num = tbl_users.str_num;

--  테이블에 별명 붙이기
SELECT T.str_num,
               U.str_name,
               T.intKor,
               T.intEng,
               T.intMath
FROM tbl_test1 T, tbl_users U
WHERE T.str_num = U.str_num;

-- 오라클 9 이상에서 사용하는 전용 EQ JOIN
SELECT T.str_num,
               U.str_name,
               T.intKor,
               T.intEng,
               T.intMath
FROM tbl_test1  T
NATURAL JOIN tbl_users U;

-- test1 테이블에 점수만 하나 추가를 한다.
INSERT INTO tbl_test1
VALUES('006',90,90,100);

SELECT * FROM tbl_test1;
SELECT T.str_num,
               U.str_name,
               T.intKor,
               T.intEng,
               T.intMath
FROM tbl_test1 T LEFT JOIN tbl_users U
 ON T.str_num = U.str_num;
 
 -- 복잡한 SQL문(select)의 설정사항을 table처럼 등록하고, 
 -- table을 select하는 방법으로 사용할 수 있다.
 -->> VIEW라고 한다.
CREATE VIEW myJoin
AS
SELECT T.str_num AS TNum,
               U.str_num AS UNum,
               U.str_name,
               T.intKor,
               T.intEng,
               T.intMath
FROM tbl_test1 T, tbl_users U
WHERE T.str_num = U.str_num(+)
ORDER BY T.str_num;

SELECT * FROM myJoin;
DROP VIEW myJoin;

SELECT * FROM myJoin
WHERE TNum = '002';

SELECT * FROM myJoin
ORDER BY TNum;

-- DCL 명령
-- 지금 현재 tbl_users, tbl_test1 테이블에 데이터를 추가 했다.
-- 하지만, 아직 물리적 저장 공간에는 적용이 안된 상태이다.
-- 현재 데이터는 오라클의 임시 저장영역에 저장이 되어 있다.
-- 임시 저장영역에 저장된 데이터를 물리적 저장 공간에 저장하는 키워드를 학습

COMMIT; -- 모든 저장 내용을 물리적 저장 공간에 반영하라는 말.
SELECT * FROM tbl_test1;

DELETE FROM tbl_test1;
SELECT * FROM tbl_test1;

ROLLBACK;
SELECT * FROM tbl_test1;




