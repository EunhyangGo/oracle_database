-- 여기는 myMem으로 접속한 화면입니다.

-- GROUP BY를 이용해서 어떤 table 데이터로부터 중복되지 않는 list를 추출하기.
--      SELECT를 실행했을때 같은 값을 가진 리스트가 다수 나타나는데
--      그들의 대표값 1개씩만 추출하고 싶을때 
--    GROUP BY 절을 사용해서 SQL을 작성한다.
SELECT Io_inout
FROM tbl_iolist;

SELECT io_inout
FROM tbl_iolist
GROUP BY io_inout;

-- 중복되지않은 상품 리스트를 추출하는 SQL
SELECT io_cname 
FROM tbl_iolist
GROUP BY io_cname;

SELECT d_name
FROM tbl_dept;

-- 거래처명이 중복된것을 묶어서 리스트로 보여달라
SELECT d_name
FROM tbl_dept
GROUP BY d_name;

SELECT d_name, d_ceo
FROM tbl_dept
GROUP BY d_name, d_ceo;

-- iolist에 있는 데이터를 cname을 기준으로 묶어라, 그리고 count하는것 중복된 데이터를.
SELECT io_cname, COUNT(io_cname)
FROM tbl_iolist
GROUP BY io_cname;

SELECT d_name, d_ceo,COUNT(d_name)
FROM tbl_dept
GROUP BY d_name, d_ceo;