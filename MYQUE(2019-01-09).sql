-- 여기는 myQue화면입니다.

CREATE TABLE tbl_cbt(
    cbt_question nVARCHAR2(100) PRIMARY KEY ,
    cbt_num1 nVARCHAR2(50) NOT NULL,
    cbt_num2 nVARCHAR2(50) NOT NULL,
    cbt_num3 nVARCHAR2(50) NOT NULL,
    cbt_num4 nVARCHAR2(50) NOT NULL
    );
    
SELECT * FROM tbl_cbt;

CREATE TABLE tbl_answer(
cbt_question	nVARCHAR2(100)		PRIMARY KEY,
cbt_answer	nVARCHAR2(5)	NOT NULL	
);

SELECT*FROM tbl_answer;