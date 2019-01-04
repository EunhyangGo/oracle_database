-- ����� myMem���� ������ ȭ���Դϴ�.

-- GROUP BY�� �̿��ؼ� � table �����ͷκ��� �ߺ����� �ʴ� list�� �����ϱ�.
--      SELECT�� ���������� ���� ���� ���� ����Ʈ�� �ټ� ��Ÿ���µ�
--      �׵��� ��ǥ�� 1������ �����ϰ� ������ 
--    GROUP BY ���� ����ؼ� SQL�� �ۼ��Ѵ�.
SELECT Io_inout
FROM tbl_iolist;

SELECT io_inout
FROM tbl_iolist
GROUP BY io_inout;

-- �ߺ��������� ��ǰ ����Ʈ�� �����ϴ� SQL
SELECT io_cname 
FROM tbl_iolist
GROUP BY io_cname;

SELECT d_name
FROM tbl_dept;

-- �ŷ�ó���� �ߺ��Ȱ��� ��� ����Ʈ�� �����޶�
SELECT d_name
FROM tbl_dept
GROUP BY d_name;

SELECT d_name, d_ceo
FROM tbl_dept
GROUP BY d_name, d_ceo;

-- iolist�� �ִ� �����͸� cname�� �������� �����, �׸��� count�ϴ°� �ߺ��� �����͸�.
SELECT io_cname, COUNT(io_cname)
FROM tbl_iolist
GROUP BY io_cname;

SELECT d_name, d_ceo,COUNT(d_name)
FROM tbl_dept
GROUP BY d_name, d_ceo;