-- iolist

-- �ŷ�ó �������� ���� ������ �ڵ尪(ū��) 1���� �����ϴ� SQL
SELECT M.d_code FROM 
(select row_numBER() over( order BY D_CODE DESC)R,d_code
from tbl_dept) M
WHERE m.r =1;

SELECT * FROM tbl_iolist I
    LEFT JOIN tbl_product P
        ON I.io_pcode = P.p_code
        LEFT JOIN tbl_dept D
            ON I.io_dcode = D.d_code;
            
SELECT * FROM tbl_product WHERE p_name like '%����%';