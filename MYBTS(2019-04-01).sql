-- mybts 접속

-- INDEX를 b_date, b_time으로 설정한 상태에서 사용할 수 있는 SQL
SELECT * FROM  
( SELECT ROWNUM R, B.* FROM tbl_board B  
WHERE b_date > '0000-00-00' )  M  
WHERE R BETWEEN 10 AND  20 ;


-- INDEX없이 레코드 번호 10번부터 20번까지 리스트만 select
SELECT M.* FROM(

SELECT ROW_NUMBER() OVER (ORDER BY B_DATE DESC, B_TIME DESC) R,
B_DATE, B_TIME, B_SUBJECT, B_CONTENT, B_FILE1, B_FILE2
FROM tbl_board) M 
WHERE M.R BETWEEN 10 AND 20;

-- 날짜를 역순으로 하고 시간을 역순으로 정렬한 순선대로 row num을 붙여라
-- 그리고 r이라고 하는 걸로 설정
SELECT ROW_NUMBER() OVER (ORDER BY  B_DATE DESC, B_TIME DESC) R, 
                    B_DATE, B_TIME, B_SUBJECT, B_CONTENT
FROM tbl_board;

