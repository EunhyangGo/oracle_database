-- 여기는 sysDBA로 접속한 화면이니다.
-- 여기서는 사용자를 생성하고 권한을 부여하는 일만 수행합니다.

-- DB의 SQL에서 등록, 생성 이라는 용어가 나오면 키워드는 대체로 CREATE로 시작한다.
-- CREATE 키워드는 DDL, DCL 명령어의 핵심 키워드

-- 1. 새로운 사용자 등록을 수행
-- 사용자 아이디를 user1으로 설정하고 비밀번호를 1234로 하겠다.
CREATE USER user1 IDENTIFIED BY 1234;

-- 여기까지 수행을 하면 새로운 사용자가 등록
-- 이 user1은 아무런 명령 수행권한이 없다.

-- 2. 권한 부여: DCL명령어 이용
--     GRANT, REVOKE
GRANT CONNECT TO user1; -- user1에게 로그인 권한만 부여하는 것
REVOKE CONNECT FROM user1; -- user1에게 로그인 권한 제거