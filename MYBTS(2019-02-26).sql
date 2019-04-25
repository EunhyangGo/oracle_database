

CREATE table tbl_member(

 m_userid VARCHAR2(30) PRIMARY KEY,
 m_password NVARCHAR2(125) NOT NULL,
 m_name NVARCHAR2(125) NOT NULL,
 m_tel NVARCHAR2(20),
 m_city NVARCHAR2(20),
 m_addr NVARCHAR2(125),
 m_photo NVARCHAR2(125), --���� ���� �̸�
 m_photo_path NVARCHAR2(255) --����� ��� + �̸�
 );

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
            ON M.menu_p_id = S.menu_id
            WHERE menu_p_id is not null;