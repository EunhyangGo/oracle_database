-- iolist ���� �뿩 ����

delete from tbl_book ; 

select * from tbl_book;

-- ���Ƿ� �����͸� ����Ʈ�� �� ���ο� �����͸� ���ÿ��� �Է��Ϸ��� �ϸ�
-- SEQ�� ������ ���� �� �ִ�.
-- �׷��� ������ SEQ�� �����ϰ� �ٸ� ��Ģ���� ����
DROP SEQUENCE SEQ_BOOK;

CREATE SEQUENCE SEQ_BOOK
START WITH 300
INCREMENT BY 1;
commit;