-- mybts

CREATE TABLE tbl_email(
    id NUMBER PRIMARY KEY,
    from_email nVARCHAR2(30) NOT NULL,
    to_email nVARCHAR2(30) NOT NULL,
    s_date nVARCHAR2(10),
    s_time nVARCHAR2(10),
    s_subject nVARCHAR2(125),
    s_content nVARCHAR2(2000),
    s_file1 nVARCHAR2(125),
    s_file2 nVARCHAR2(125)
    );
    ALTER TABLE tbl_email MODIFY s_time nVARCHAR2(20);
    
    CREATE SEQUENCE SEQ_Email
    START WITH 1
    INCREMENT BY 1;
    
     Select * from tbl_email;  
     
    