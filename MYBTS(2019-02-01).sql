CREATE TABLE tbl_memo(
 id NUMBER PRIMARY KEY,
        m_auth nVARCHAR2(30) NOT NULL,
        m_date CHAR(10),
        m_subject nVARCHAR2(50),
        m_text nVARCHAR2(255)
        );

