--mybts���� ȭ��
DESC tbl_memo;

CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

-- ���Ͼ��ε带 �ϱ����� ���������� ������ ���̺�
CREATE TABLE tbl_files(
    id NUMBER PRIMARY KEY,
    parent_id NUMBER NOT NULL,
    file_name nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);

CREATE SEQUENCE SEQ_FILE
START WITH 1
INCREMENT BY 1;

-- tbl_files ���̺�� tbl_memo ���̺��� ����  Relation
-- memo_files��� �̸����� FOREIGN KEY�� �����϶�
ALTER TABLE tbl_files
ADD CONSTRAINT memo_files --key �̸�
FOREIGN KEY (parent_id)  -- Į�� �̸�
REFERENCES tbl_memo(id) --���� ���
ON DELETE CASCADE; --���� ����

SELECT SEQ_MEMO.NEXTVAL
INSERT INTO tbl_memo(id, m_auth)
VALUES ( SEQ_MEMO.NEXTVAL, 'aaa');

ALTER TABLE tbl_files 