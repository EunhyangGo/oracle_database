-- 여기는 myuser로 접속한 화면입니다.
-- 매입매출샘플(엑셀)파일에서 database로 데이터를 옮기고
-- DB규칙에 맞도록 적용하는 모습

CREATE TABLE tbl_iolist(
    id	                        NUMBER		PRIMARY KEY,
    io_date	                CHAR(10)	NOT NULL	,
    io_cname	        nVARCHAR2(50)	NOT NULL,	
    io_dname	        nVARCHAR2(30)	NOT NULL	,
    io_deco	            nVARCHAR2(10),		
    io_inout	            nVARCHAR2(5)	,	
    io_quan	            NUMBER,		
    io_price	            NUMBER,		
    io_price1	            NUMBER
    );
    
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;
    
DELETE FROM tbl_iolist;
    
DELETE FROM tbl_iolist;
   
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <= '2018-02-28'
AND io_inout = '매입';

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <= '2018-02-28'
AND io_inout = '매출';

-- 날짜 순으로 정렬하기
SELECT io_date, io_cname, io_dname, io_inout, io_total
FROM tbl_iolist
WHERE io_date >='2018-02-01' AND io_date <='2018-02-28'
ORDER BY io_date ;

-- 통계함수를 이용해서 개수와 합게 구하기
SELECT  COUNT (*) AS 개수 , SUM (io_price1) AS 합계
FROM tbl_iolist;

-- 통계함수를 이용해서 개수와 합계를 구하는데...
-- 매입합계, 매출합계를 따로 계산하고 싶다.
-- 1. 매입과 매출을 구분하는 칼럼 : io_inout
SELECT io_inout, COUNT(io_price1), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_inout ;

-- 개수와 합계 계산
-- 조건 : 날짜별로 조건을 부여해서 개수와 합계 계산
-- 1. 날짜를 구분하는 칼럼 : io_date
SELECT io_date, COUNT (*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date -- 그룹으로 묶어서 보고 싶다.
ORDER BY io_date; --날짜순으로 정렬해서 보고 싶다.

-- 조건 : 날짜별로 묶고, 다시 매입 매출로 구분하여 개수와 합계를 계산하라.
-- 1. 날짜를 구분하는 칼럼 : io_date
-- 2. 매입과 매출을 구분하는 칼럼 : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- 구분과 날짜 순서를 바꾸어서
SELECT io_inout, io_date, COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_inout;

-- 매입, 매출을 구분하고 날짜별로 개수와 합계를 계산하여 보이기
-- 단, 날짜범위를 2018-03-01~2018-03-31로 제한
SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <= '2018-03-31'
GROUP BY io_date, io_inout
ORDER by io_date;

-- 합계금액이 50만원 이상인 항목만 보여라
SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <= '2018-03-31'
GROUP BY io_date, io_inout
HAVING SUM(io_price1) >=500000
ORDER by io_date;
-- 통계함수를 사용하는 경우 
-- 통계함수 결과에 따라 추출하는  list를 제한하고 싶을때
-- (필요한 범위의 값만 보고 싶을때) WHERE에 조건을 부여하면 안된다.
-- 이때는 HAVING 이라는 절을 사용한다.

SELECT io_date, io_inout , COUNT(*), SUM(io_price1)
FROM tbl_iolist
GROUP BY io_date, io_inout
HAVING SUM(io_price1) >=500000 AND io_date BETWEEN '2018-03-01' AND '2018-03-31'
ORDER by io_date;
-- 이렇게 사용할수도 있지만 별로 좋은 형식은 아니다. 데이터가 많을 경우 난감. 절대 쓰지 말것.
-- HAVING절은 모든 통계를 계산한 후, 조건으로 제한을 하기 때문에 
-- 모든 데이터에 COUNT와 SUM을 계산하고 비로소 날짜 범위를 제한한다.
-- 따라서 DB SELECT에서 최악의 시간 소요가 걸린다.
