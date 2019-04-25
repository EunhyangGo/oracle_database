-- mybatis 접속화면
--Dynamic menu 시스템을 작성하기 위해 menu table을 생성

CREATE TABLE tbl_menu(
    MENU_ID CHAR(10) PRIMARY KEY,
    MENU_P_ID CHAR(10) DEFAULT NULL, --값을 추가하지 않으면 강제로 NULL로 설정
    MENU_TITLE nVARCHAR2(255),
    MENU_HREF nVARCHAR2(255)
    );
    
COMMIT;

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
            ON S.menu_p_id = M.menu_id
            WHERE S.menu_p_id is not null;
            
DELETE FROM tbl_menu;
COMMIT;
