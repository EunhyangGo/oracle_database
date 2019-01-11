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

-- st_name Į���� "��"�̶�� ���ڿ��� ���Ե� �����͸� �˻��ϴ� Ű����
-- ����� "��"�� �ִ°� �ƴ�.
SELECT * FROM tbl_student
WHERE st_name LIKE '%��%';

SELECT * FROM tbl_student
WHERE st_name LIKE '%��%';

-- ������ �����߿� �ϳ��� ������ �ϰ� �ִ� �����͸� ã�� Ű����
SELECT * FROM tbl_student
WHERE st_name LIKE '%��'
        OR st_name LIKE '%��%'
        OR st_name LIKE '%ö%';
        
-- private String sc_num;
--	private int sc_kor;
--	private int sc_eng;
--	private int sc_math;

CREATE TABLE tbl_score(
   sc_num CHAR(5) PRIMARY KEY ,
   sc_kor NUMBER(3),
   sc_eng NUMBER(3),
   sc_math NUMBER(3)
   );