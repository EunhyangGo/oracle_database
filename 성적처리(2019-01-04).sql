-- 여기는 성적처리를 위한 gradeUser로 접속한 화면입니다.

SELECT * FROM tbl_student;

-- 학번으로 조건 검색
SELECT * 
FROM tbl_student
WHERE st_num = '003';

-- 학생 이름으로 조회
SELECT * FROM tbl_student
WHERE st_name = '배칠수';

-- 학생의 이름이 같은 데이터 있는지 확인(= 중복된 이름이 있는지)확인
-- 이름 칼럼으로 GROUP BY를 실행해서 결과를 확인하는 방법
SELECT st_name, COUNT(st_name)
FROM tbl_student
GROUP BY st_name;

SELECT * FROM tbl_student
WHERE st_name = '윤정희';

-- SELECT를 수행할때
-- (특별히 문자열일 경우) 값의 전체를 알지 못하고
-- 일부만을 알고 있을때, 부분 문자열 검색 
-- 부분문자열 검색은 데이터베이스의 SQL 명령문 중에
-- 가장 성능이 떨어지는 실행.
-- 따라서 특별한 경우가 아니면, 가급적 사용하지 않는것이 좋다.
SELECT * FROM tbl_student
WHERE st_name LIKE '김%';
-- st_name에 있는 칼럼의 김떙땡에 관한걸 모두 찾아주는 것.

SELECT * FROM tbl_student
WHERE st_addr LIKE '서울%';
-- st_addr 칼럼에 있는 주소가 서울이라고 시작되는 문자열의 모든 데이터