-- mybatis ����ȭ��
--Dynamic menu �ý����� �ۼ��ϱ� ���� menu table�� ����

CREATE TABLE tbl_menu(
    MENU_ID CHAR(10) PRIMARY KEY,
    MENU_P_ID CHAR(10) DEFAULT NULL, --���� �߰����� ������ ������ NULL�� ����
    MENU_TITLE nVARCHAR2(255),
    MENU_HREF nVARCHAR2(255)
    );
    
COMMIT;

COMMIT;
SELECT * FROM tbl_menu;

-- menu data �߿��� menu_p_id�� null�� �����͸� Ȯ��
-- main menu�� Ȯ���ϰ� �ʹٴ� ��
SELECT * FROM tbl_menu WHERE menu_p_id is null;

-- sub menu�� Ȯ��
SELECT * FROM tbl_menu WHERE menu_p_id is not null;

-- sub menu�� Ȯ���ϸ鼭 � main�޴��� ������ �Ǿ� �ִ°� Ȯ��
SELECT S.menu_p_id, S.menu_id, M.menu_id, M.menu_title
FROM tbl_menu S 
LEFT JOIN tbl_menu M
            ON S.menu_p_id = M.menu_id
            WHERE S.menu_p_id is not null;
            
DELETE FROM tbl_menu;
COMMIT;
