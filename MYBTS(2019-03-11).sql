--mybts접속 화면
DESC tbl_memo;

CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

-- 파일업로드를 하기위한 파일정보를 저장할 테이블
CREATE TABLE tbl_files(
    id NUMBER PRIMARY KEY,
    parent_id NUMBER NOT NULL,
    file_name nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);

CREATE SEQUENCE SEQ_FILE
START WITH 1
INCREMENT BY 1;

-- tbl_files 테이블과 tbl_memo 테이블을 서로  Relation
-- memo_files라는 이름으로 FOREIGN KEY를 설정하라
ALTER TABLE tbl_files
ADD CONSTRAINT memo_files --key 이름
FOREIGN KEY (parent_id)  -- 칼럼 이름
REFERENCES tbl_memo(id) --참조 대상
ON DELETE CASCADE; --삭제 조건

SELECT SEQ_MEMO.NEXTVAL
INSERT INTO tbl_memo(id, m_auth)
VALUES ( SEQ_MEMO.NEXTVAL, 'aaa');

ALTER TABLE tbl_files 