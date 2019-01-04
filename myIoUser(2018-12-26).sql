-- 여기는 myIoUser 접속화면입니다.

CREATE TABLE tbl_iolist(
id	NUMBER		PRIMARY KEY,
io_date	CHAR(10)	NOT NULL	,
io_pname	nVARCHAR2(30)	NOT NULL	,
io_dname	nVARCHAR2(50)	NOT NULL	,
io_ceo	nVARCHAR2(30)		,
io_inout	nVARCHAR2(5)		,
io_quan	NUMBER		,
io_pirce	NUMBER		,
io_total	NUMBER		
);

SELECT COUNT(*) FROM tbl_iolist;

-- 거래처명, 대표자명을 GROUP으로 하여 리스트 조회
SELECT io_dname,io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo;

CREATE TABLE tbl_dlist(
d_code	CHAR(5)		PRIMARY KEY,
d_name	nVARCHAR2(30)	NOT NULL,	
d_ceo	nVARCHAR2(10)		
);

-- EQ JOIN
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I , tbl_dlist D 
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;

-- 데이터가 정확히 만들어졌는가 검증하기 위해서
-- LEFT JOIN을 사용해서 실행
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
        LEFT JOIN tbl_dlist D
                        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;
                        
-- 위 SQL문으로 확인한  LIST는 모든 상품매입매출 목록이 나타나서 
-- 잘못된 데이터가 있는지 확인하기 어렵다.

-- 만약 위의 SQL문을 실행했을때 iolist에는 데이터가 있는데
--       dlist에는 데이터가 없을 경우에
--       D.d_name 과 D.d_ceo는 NULL값으로 나타날 것이다.
-- 이 성질을 이용해서 D.d_name이나 D.d_ceo가 NULL인것만 찾아 보면 더 쉽게 확인이 가능하다.
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
        LEFT JOIN tbl_dlist D
                        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo
                        WHERE D.d_name IS NULL OR D.d_ceo IS NULL;
-- 위의 SQL을 실행했을때 LIST가 하나도 없어야 정상적으로 거래처정보 TABLE이 완성된 것이다.

-- 거래처명이 누락된 항목이 있느냐
SELECT io_dname
FROM tbl_iolist
WHERE io_dname IS NULL;

-- 거래처명이 있는 항목이 있느냐
SELECT io_dname
FROM tbl_iolist
WHERE io_dname IS NOT NULL;

-- 숫자 칼럼이 0인 것은 0이라는 값을 INSERT, UPDATE 실행한 것
SELECT io_pirce
FROM tbl_iolist
WHERE io_pirce =0;

-- 숫자 칼럼이 NULL인것은 처음부터 아예 값을 INSERT하지 않은것
SELECT io_pirce
FROM tbl_iolist
WHERE io_pirce is NULL;

-- SUB QUERY로 조회하여 거래처명, 대표자명을 포함한 조회 SQL작성
SELECT I.io_dname, I.io_ceo,
                (SELECT D.d_code FROM tbl_dlist D
                WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) dcode
FROM tbl_iolist I;

-- 거래처코드를 저장할 칼럼 추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5);
SELECT * FROM tbl_iolist;

-- 거래처정보 테이블에서 상품매입매출 테이블에 있는 거래처명과 대표자명이 일치하는
-- 데이터를 찾아서 그 데이터의 거래처코드를 상품매입매출 테이블의 거래처코드에 UPDATE 실행
-- io_dcode를 서브쿼리를 이용하여 업데이트 하는것.
UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dlist D
             WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo
FROM tbl_iolist;

-- 상품정보 정규화 해보기

