-- mybts�� ������ ȭ��

-- tbl_member table�� �����͸� ����
DELETE FROM tbl_member;
COMMIT;

-- aaa��� ����� ������ tbl_member�� ������ ������� null�̴�.
SELECT * FROM tbl_member WHERE m_userid ='aaa';

select * from tbl_member;