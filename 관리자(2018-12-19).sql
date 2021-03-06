-- 여기는 관리자 화면입니다.           

CREATE USER myuser1 IDENTIFIED BY 1111;
-- TABLESPACE를 SYSTEM 테이블 스페이스로 자동 지정
-- 실제 환경에서는 매우 위험한 방법

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, UPDATE, INSERT ON [table] to myuser1;

CREATE TABLESPACE mystA
DATAFILE 'd:/bizwork/ordata/mytsA.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100k;

-- 사용자 등록을 실행한 후 테이블 스페이스를 만들지 않고
-- table등을 생성하면 생성된 table들은 system ts에 생성되어
-- 나중에 테이블스페이스를 만든 후 옮기려면 많은 문제가 발생한다.
-- 따라서, 사용자를 생성하고 테이블을 만들기 전에 테이블 스페이스를 반드시 생성하고
-- 그리고 사용자의 DEFAULT TABLESPACE를 지정해주어야 한다.
ALTER USER myuser1 DEFAULT TABLESPACE mystA;

CREATE TABLE EMP_TABLE(
        EMPNO              CHAR(6) NOT NULL PRIMARY KEY,
        EMPNAME          nVARCHAR2(20) NOT NULL,
        EMPBIRTH         nVARCHAR2(8),
        EMPDEPTNO    nVARCHAR2(3) NOT NULL,
        HREDATE          nVARCHAR2(10) NOT NULL
        );
        
        INSERT INTO emp_table VALUES('170001','홍길동','880212','001','20170612');
        INSERT INTO emp_table VALUES('170002','이몽룡','770215','003','20080422');
        INSERT INTO emp_table VALUES('170003','성춘향','820513','003','20100711');
        INSERT INTO emp_table VALUES('170004','장보고','941101','004','20160303');
        INSERT INTO emp_table VALUES('170005','임꺽정','901019','001','20130705');
       SELECT * FROM emp_table;
       
       UPDATE emp_table
       SET hredate ='20180301'
       WHERE empname = '장보고';
       -- >> 이 SQL은 현재 데이터 상으로는 문제가 없어 보이나
       -- 데이터가 많아질 경우 이름이 장보고인 사원이 중복되지 않는다는 보장이 없다.
       -- 따라서 사원으로 이름을 조건으로 변경을 시도하는 것은 데이터 무결성을 해치는 매우 위험한 방법이다.
       
       -- 1. UPDATE를 하기 전에 변경하고자 하는 정보를 먼저 조회 해야 한다.
       SELECT * FROM emp_table WHERE empname = '장보고'; -- 기타 여러 조건을 조합해서 검색해야한다.
       -- 2. 조회된 데이터 중에서 변경하고자 하는 데이터의 pk를 입수한다.
       --     여기서 조회된 PK: 170004가 되는데
       -- 3. 조회된 PK를 이용해서 데이터 변경을 시도한다.
       
       UPDATE emp_table
       SET hredate ='20180301'
       WHERE empno = '170004';
       
       SELECT * FROM emp_table;
       