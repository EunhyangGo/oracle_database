-- ����� ����ó���� ���� gradeUser�� ������ ȭ���Դϴ�.

SELECT * FROM tbl_student;

-- �й����� ���� �˻�
SELECT * 
FROM tbl_student
WHERE st_num = '003';

-- �л� �̸����� ��ȸ
SELECT * FROM tbl_student
WHERE st_name = '��ĥ��';

-- �л��� �̸��� ���� ������ �ִ��� Ȯ��(= �ߺ��� �̸��� �ִ���)Ȯ��
-- �̸� Į������ GROUP BY�� �����ؼ� ����� Ȯ���ϴ� ���
SELECT st_name, COUNT(st_name)
FROM tbl_student
GROUP BY st_name;

SELECT * FROM tbl_student
WHERE st_name = '������';

-- SELECT�� �����Ҷ�
-- (Ư���� ���ڿ��� ���) ���� ��ü�� ���� ���ϰ�
-- �Ϻθ��� �˰� ������, �κ� ���ڿ� �˻� 
-- �κй��ڿ� �˻��� �����ͺ��̽��� SQL ��ɹ� �߿�
-- ���� ������ �������� ����.
-- ���� Ư���� ��찡 �ƴϸ�, ������ ������� �ʴ°��� ����.
SELECT * FROM tbl_student
WHERE st_name LIKE '��%';
-- st_name�� �ִ� Į���� �苯���� ���Ѱ� ��� ã���ִ� ��.

SELECT * FROM tbl_student
WHERE st_addr LIKE '����%';
-- st_addr Į���� �ִ� �ּҰ� �����̶�� ���۵Ǵ� ���ڿ��� ��� ������