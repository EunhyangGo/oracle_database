-- mybts로 접속한 화면

-- tbl_member table의 데이터를 삭제
DELETE FROM tbl_member;
COMMIT;

-- aaa라는 사용자 정보가 tbl_member에 없으면 결과값은 null이다.
SELECT * FROM tbl_member WHERE m_userid ='aaa';

select * from tbl_member;