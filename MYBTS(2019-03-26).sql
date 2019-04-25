-- mybts ����ȭ��

SELECT * FROM tbl_board;

-- �Խ��� ����Ʈ����
SELECT b_date, b_time, b_subject FROM tbl_board
ORDER BY b_date DESC, b_time DESC;

-- ����Ŭ������ ������ ������ŭ�� �����͸� �����Ҷ�
-- ���ٸ� Ű���峪 ��ɵ��� ��� 'ROWNUM'��� Ű����� Į���� �����
-- ROWNUM ������ �����͸� �߶� SELECT�� �����Ѵ�.

-- �׷���,
-- ���� �����͸� ORDER BY�� ������ ���� ��쿡�� 
-- ROWNUM�� �����ϰ� �ο��Ǿ� 
-- ���ϴ� �����͸� ������ �� ����.
SELECT ROWNUM, b_userid, b_date, b_time, b_subject
FROM tbl_board
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY b_date DESC, b_time DESC;

-- ���� ���� ISSUE�� �־ 
-- ����Ŭ������ �ణ�� �ļ��� SUBQUERY�� ����Ѵ�.
-- 1. �ϴ� ��ü �����͸� ���ϴ� Į������ ������ �����ϰ�,
-- 2. ���ĵ� �����͸� ������ ���̺�� ���
-- 3. �� ���̺�κ��� SELECT�� �����ϸ鼭 
-- 4. ROWNUM Į���� �����Ͽ� 
-- 5. ������ �����Ѵ�.

-- ���� ������ ����ؼ� ����
SELECT ROWNUM, M.b_userid, M.b_date, M.b_time, M.b_subject
FROM
    (SELECT id, b_userid, b_date, b_time, b_subject FROM tbl_board
    ORDER BY b_date DESC, b_time DESC)  M
WHERE ROWNUM BETWEEN 1 AND 10;

-- ���������� �ۼ��Ͽ� ������ �����Ҷ� ���� ū ������
-- �ϴ� ��ü�����͸� �����ϴ� �������� �ӵ����ϰ� �߻��Ѵ�.
-- �����̳��� ���� ������ ���ؼ� INDEX��� ���� Ȱ���� ����.

CREATE INDEX idx_board ON tbl_board(b_date, b_time) ; -- ����Į�� �ε���
CREATE INDEX idx_board_subject ON tbl_board(b_subject); -- ����Į�� �ε���
-- INDEX
-- ���̺��� Į���߿� ����ϰ� SELECT ����, ORDER BY ���ǿ� ���Ǵ�
-- Į���� INDEX��� ������ ������ �� �д�.
-- �⺻ table�� ������ �˻�Į���� ���� ������ ���ڵ�(REC) �ּҸ��� ����
-- ������ �ý��� ���̺��̴�.
-- INDEX�� �׻� �˻�Į���� �������� ������ �Ǿ� �ִ�.
-- �׷��� INDEX�� �Ǿ��ִ� Į���� �������� �˻��� �ϸ�
-- �׷��� ���� Į���� �˻��Ҷ� ���� ��û�� �ӵ� ����� �����ش�.

-- ��, INSERT, UPDATE, DELETE�� �̷�� ������
-- ���� table�� INDEX�� ���ÿ� �����ؾ� �ϰ�
-- INDEX�� ���� �۾����� �����ؾ� �ϱ� ������ 
-- ����� �ӵ� ���ϰ� �߻��� �� �ִ�.

-- PK�� �ڵ����� �⺻ INDEX�� ������ �ȴ�.
-- PK�� Ư¡ : NOT NULL, UNIQUE, INDEX�� �⺻ �����̴�.

CREATE TABLE tbl_bbs_files(
    ID          NUMBER PRIMARY KEY,
    PARENT_ID NUMBER NOT NULL,
    FILE_NAME NVARCHAR2(125),
    SAVE_FILE_NAME NVARCHAR2(125)
);

-- tbl_board�� tbl_bbs_files�� ����Ű ����
ALTER TABLE tbl_bbs_files
ADD CONSTRAINT fk_bbs_files FOREIGN KEY (PARENT_ID)
REFERENCES tbl_board(id)
ON; 

-- tbl_bbs_files�� �����ߴµ�..
-- ������ ����ϱ� ���� tbl_board�� 1���� ���̸� ������ Į���� �߰�����

ALTER TABLE tbl_board ADD b_image nVARCHAR2(125);
