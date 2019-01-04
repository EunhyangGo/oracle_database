-- 여기는 USER1으로 접속한 화면입니다.
-- 이름(o_name), 전화번호(o_tel), 주소(o_addr), 회사(o_comp), 부서(o_dept) 칼럼을 갖는 
-- tbl_office 테이블을 생성하시오.
-- 단, id는 pk로 선언하고 이름은 NOT NULL로 선언하시오.

CREATE TABLE tbl_office(
     id NUMBER PRIMARY KEY,
     o_name nVARCHAR2(5) NOT NULL,
     o_tel nVARCHAR2(10),
     o_addr nVARCHAR2(30),
     o_comp nVARCHAR2(30),
     o_dept nVARCHAR2(15)    
);
SELECT
    *
FROM tbl_office;