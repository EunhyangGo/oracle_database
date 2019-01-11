-- 여기는 myMem으로 접속한 화면입니다.

-- tbl_iolist에서 상품정보테이블을 분리해서 제2정규화 과정을 수행

-- tbl_iolist의 개수를 확인
SELECT COUNT(*) FROM tbl_iolist;

-- 전체데이터가 아닌 어떤 조건에 맞는 데이터만 제한해서
-- 확인하고자 할때는 WHERE절에서 칼럼 = 조건 형식의 SQL을 이용한다.

-- 어떤 조건을 설정하기가 마땅하지 않을때
-- 그냥 몇개의 개수만 제한해서(예, 10개, 100개) 조회하고자 할때
-- 오라클용 SQL
-- 칼럼명으로 ROWNUM라는 칼럼이 있다.
--       이 칼럼은 저장된 데이터의 ROW 순번을 가상으로 표시하라는 오라클 DUMY칼럼
SELECT ROWNUM, io_date, io_cname, io_dcode 
FROM tbl_iolist;

-- ROWNUM 칼럼을 이용하면 데이터리스트 중에서 몇개만 제한적으로 조회를 할 수 있다.
SELECT ROWNUM, io_date, io_cname
FROM tbl_iolist
WHERE ROWNUM <=10;

-- ROWNUM 칼럼을 이용해서 10번째 위치의 데이터부터 20번째 데이터를 조회하고 싶다.
SELECT ROWNUM, io_date, io_cname
FROM tbl_iolist
WHERE ROWNUM BETWEEN 10 AND 20;

-- MySQL
-- SELECT * FROM tbl_iolist LIMIT 10;

SELECT * FROM tbl_iolist WHERE ROWNUM <10;

-- 상품 정보를 상품테이블로 분리하기 위해서
-- 상품이름 리스트를 만든다.
SELECT io_cname
FROM tbl_iolist
GROUP BY io_cname;

SELECT io_cname, io_inout, io_price
FROM tbl_iolist 
WHERE ROWNUM <10;

-- 현재 조회된 데이터에서 io_inout이 '매입'이면 io_price는 '매입 단가' 일 것이고
-- '매출'이면 '매출단가'일 것으로 생각이 된다.
-- 그래서 io_inout에 따라 단가를 다르게 표시해 보자.
SELECT io_cname, io_inout,
        DECODE(io_inout, '매입', io_price) 매입단가,
        DECODE(io_inout, '매출', io_price) 매출단가
FROM tbl_iolist
WHERE ROWNUM < 10;

SELECT io_cname, io_inout,
       AVG(DECODE(io_inout, '매입', io_price)) 매입단가,
        AVG(DECODE(io_inout, '매출', io_price)) 매출단가
FROM tbl_iolist
GROUP BY io_cname, io_inout, DECODE(io_inout, '매입', io_price) ,DECODE(io_inout, '매출', io_price) ;

SELECT io_cname,
       AVG(DECODE(io_inout, '매입', io_price)) 매입단가,
       AVG(DECODE(io_inout, '매출', io_price)) 매출단가
FROM tbl_iolist
GROUP BY io_cname
ORDER BY io_cname;

CREATE TABLE tbl_product(
p_code	CHAR(9)		PRIMARY KEY,
p_name	nVARCHAR2(50)	NOT NULL,	
p_iprice	NUMBER,		
p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;

-- 이제 상품정보 테이블 생성하고 데이터를 만들었으니
-- 가. 매입매출정보에서 상품코드 칼럼을 생성하고
-- 나. 상품코드 칼럼 데이터를 Update하고
-- 다. 상품명 칼럼을 삭제

ALTER TABLE tbl_iolist ADD io_pcode CHAR(9);

-- 서브 쿼리를 이용해서 iolist와 product table간의 관계를 한번 살표보자
SELECT io_cname, 
            (SELECT p_name FROM tbl_product P 
            WHERE P.p_name = I.io_cname),
             (SELECT p_code FROM tbl_product P 
            WHERE P.p_name = I.io_cname)
FROM tbl_iolist I;

-- product table에서 상품코드(p_code)를 조회해서 
-- iolist table의 io_pcode 칼럼에 Update 하자.
UPDATE tbl_iolist I
SET io_pcode = 
        (SELECT p_code FROM tbl_product P
            WHERE P.p_name = I.io_cname) ;

-- UPDATE 후에 검증
-- Join을 이용해서 검증
SELECT I.io_pcode, P.p_code, I.io_cname,  P.p_name
FROM tbl_iolist I
        LEFT JOIN tbl_product P
                   ON I.io_pcode = P.p_code
ORDER BY I.io_pcode;

-- 상품명 칼럼을 삭제
ALTER TABLE tbl_iolist DROP COLUMN io_cname;

DESC tbl_iolist;

SELECT * FROM tbl_iolist
WHERE ROWNUM <10;

-- tbl_iolist는 제 2정규화 과정이 완료되었다
-- 매입매출명세를 보면서 상품명과 거래처명을 같이 확인하고 싶다.

-- 1. 매입매출명세와 상품명 같이 보기
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout, 
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
        LEFT JOIN tbl_product P
                  ON I.io_pcode = P.p_code;
                  
-- 2. 매입매출 명세와 거래처 정보를 같이 보기
SELECT I.io_date,
                I.io_dcode,
                I.io_inout, 
                I.io_quan,
                I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
        LEFT JOIN tbl_dept D
                  ON I.io_dcode = D.d_code;

-- 3. 매입매출명세를 보면서 상품정보, 거래처정보를 같이 보고싶다.
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout,
                I.io_dcode, D.d_name, D.d_ceo,
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
        LEFT JOIN tbl_product P -- 상품정보와 JOIN
                ON I.io_pcode = P.p_code     
                LEFT JOIN tbl_dept D -- 거래처 정보와 join
                        ON I.io_dcode = D.d_code;
                        
-- 매입매출명세와 상품정보, 거래처정보를 JOIN해서 조회를 했는데
-- 쿼리가 너무 복잡해
-- 그런데 자주 사용할 것 같아.
-- 이럴땐 SQL을 VIEW로 생성해 두어라.
CREATE VIEW io_dept_product_view
AS
SELECT I.io_date, I.io_pcode, P.p_name, 
                I.io_inout,
                I.io_dcode, D.d_name, D.d_ceo,
                I.io_price,P.p_iprice, P.p_oprice,
                I.io_quan,
                I.io_price * I.io_quan AS 합계
FROM tbl_iolist I
        LEFT JOIN tbl_product P -- 상품정보와 JOIN
                ON I.io_pcode = P.p_code
                LEFT JOIN tbl_dept D -- 거래처 정보와 join
                        ON I.io_dcode = D.d_code;
                        
SELECT * FROM io_dept_product_view;

SELECT io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date <='2018-03-31'
AND io_inout ='매입'
GROUP BY io_inout;
