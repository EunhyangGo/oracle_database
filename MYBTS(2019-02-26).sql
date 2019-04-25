

CREATE table tbl_member(

 m_userid VARCHAR2(30) PRIMARY KEY,
 m_password NVARCHAR2(125) NOT NULL,
 m_name NVARCHAR2(125) NOT NULL,
 m_tel NVARCHAR2(20),
 m_city NVARCHAR2(20),
 m_addr NVARCHAR2(125),
 m_photo NVARCHAR2(125), --사진 파일 이름
 m_photo_path NVARCHAR2(255) --저장된 경로 + 이름
 );

COMMIT;
SELECT * FROM tbl_menu;

-- menu data 중에서 menu_p_id가 null인 데이터만 확인
-- main menu만 확인하고 싶다는 뜻
SELECT * FROM tbl_menu WHERE menu_p_id is null;

-- sub menu만 확인
SELECT * FROM tbl_menu WHERE menu_p_id is not null;

-- sub menu를 확인하면서 어떤 main메뉴와 연결이 되어 있는가 확인
SELECT S.menu_p_id, S.menu_id, M.menu_id, M.menu_title
FROM tbl_menu S 
LEFT JOIN tbl_menu M
            ON M.menu_p_id = S.menu_id
            WHERE menu_p_id is not null;