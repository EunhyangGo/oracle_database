-- 여기는 myuser 화면입니다.

CREATE TABLE tbl_employee (
        strEmpno CHAR(3) PRIMARY KEY,
        strName nVARCHAR2(20) NOT NULL,
        strJob nVARCHAR2(20),
        intSal nVARCHAR2(10),
        strDeptNo nVARCHAR2(20)
);

INSERT INTO tbl_employee VALUES('001','홍길동','인사업무',2500000,'총무부');
INSERT INTO tbl_employee VALUES('002','임꺽정','기술영업',2500000,'영업부');
INSERT INTO tbl_employee VALUES('003','장영실','급여관리',2500000,'총무부');
INSERT INTO tbl_employee VALUES('004','성춘향','품질관리',2500000,'생산부');
INSERT INTO tbl_employee VALUES('005','이몽룡','생산관리',2500000,'생산부');

-- 조건 검색
-- 어떤 칼럼에 저장된 값을 기준으로 리스트를 제한하는 것
SELECT * FROM tbl_employee
WHERE strDeptNo =  '총무부';

-- tbl_emp 테이블의 strDeptNo는 부서를 나타내는 칼럼
-- 이 회사의 부서명이 일부 변경되는데, 총무부를 인사관리부로 변경하고자 한다.
UPDATE tbl_employee
SET strDeptNo = '인사관리부'
WHERE strDeptNo = '총무부';

SELECT * FROM tbl_employee;

-- 신입사원이 입사를 한다
-- 신입사원 정보를 추가
-- 이름 : 장록수, 업무 : 인사보조, 부서: 인사 관리부
INSERT INTO tbl_employee VALUES ('006','장록수','인사보조',1500000,'인사관리부');

SELECT * FROM tbl_employee;

-- 회사 전체의 부서 변경을 다시 시도한다.
-- 다른 부서는 이름이 3글자인데, 유독 인사관리부만 5글자여서 마음에 들지 않는다.
-- 인사관리부를 인사부로 변경하고자 한다.
UPDATE tbl_employee
SET strDeptNo = '인사부'
WHERE strDeptNo = '인사관리부';

SELECT * FROM tbl_employee;

-- tbl_emp 테이블을 제2정규화(2NF)를 하기 위해
-- 1. 부서 테이블을 생성하고
-- 2. 부서 정보를 추가해 놓는다.
CREATE TABLE table_dept(
   strDeptNo CHAR(3) PRIMARY KEY,
   strDeptName nVARCHAR2(20) NOT NULL,
   strDEptChief nVARCHAR2(20)
   );
   
INSERT INTO table_dept VALUES('01','총무부','홍길동');
INSERT INTO table_dept VALUES('02','영업부','이몽룡');
INSERT INTO table_dept VALUES('03','생산부','장길산');
INSERT INTO table_dept VALUES('04','자재부','임꺽정');

SELECT * FROM table_dept;

-- 3. tbl_emp 테이블의 strDeptNo칼럼을 strDetpName으로 변경
ALTER TABLE tbl_employee RENAME COLUMN strDeptNO to strDeptName ;

SELECT * FROM tbl_employee;

-- 4. tbl_emp 테이블에 strDEptNo(3)칼럼을 추가
-- 새로만든 부서 테이블의 부서 번호(코드) 칼럼과 같은 형식으로
-- 새로운 칼럼을 등록
ALTER TABLE tbl_employee
ADD strDeptNo CHAR(3);

-- 테이블에서 칼럼을 변경, 추가, 삭제한 후에 변경 정보를 보는 방법
DESCRIBE tbl_employee;
DESC tbl_employee;

--  5. 기존 tbl_emp 테이블의 strDeptNo칼럼에 tbl_dept 테이블 정보를 참조하여
-- 해당하는 no를 update한다.
SELECT * FROM tbl_employee;

UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = '인사부' ;

UPDATE tbl_employee
SET strDeptNo = '02'
WHERE strDeptName = '영업부' ;

UPDATE tbl_employee
SET strDeptNo = '03'
WHERE strDeptName = '생산부' ;

UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = ' 인사관리부' ;

SELECT * FROM tbl_employee;

-- 6. strDeptName 칼럼을 삭제한다.
-- 주의사항 모든 데이터의 strDeptNo가 정상적인지 확인하는 과정을 반드시 거쳐야 한다.
ALTER TABLE tbl_employee DROP COLUMN strDeptName;

SELECT * FROM tbl_employee;

SELECT E.strEmpNo, E.strName, E.strJob, E.strDeptNo, 
                D.strDeptName
FROM tbl_employee E, table_dept D -- 별명을 꼭 붙여야한다.
WHERE E.strDeptNo = D.strDeptNo;

SELECT * FROM table_dept;

-- 기존의 총무부를 인사관리부로 변경 
UPDATE table_dept
SET strDeptName =  '인사관리부'
WHERE strDeptNo = '01' ;

-- 그리고 변경 후 데이터 확인
SELECT E.strEmpNo, E.strName, E.strJob, E.strDeptNo, 
                D.strDeptName
FROM tbl_employee E, table_dept D -- 별명을 꼭 붙여야한다.
WHERE E.strDeptNo = D.strDeptNo;

