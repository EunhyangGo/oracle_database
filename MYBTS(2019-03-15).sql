-- ÀÌ°÷Àº mybts

CREATE TABLE tbl_books(
    b_id NUMBER NOT NULL PRIMARY KEY,
    b_userid VARCHAR2(20) NOT NULL,
    b_isbn VARCHAR2(20) NOT NULL,
    b_title nVARCHAR2(30) NOT NULL,
    b_date VARCHAR2(10) NOT NULL,
    b_star NUMBER(21),
    b_text nVARCHAR2(100)
    );
    
    ALTER TABLE tbl_books drop column b_star;
    
    select* from tbl_books;
    
    ALTER TABLE tbl_books ADD b_star NUMBER(2,1);
  
  CREATE SEQUENCE  SEQ_BOOK
  START WITH 1
  INCREMENT BY 1;
  
DESC tbl_member;

SELECT * FROM tbl_member;