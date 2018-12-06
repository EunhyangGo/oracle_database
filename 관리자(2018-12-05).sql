-- 주석달기
-- 무조건 ctrl + s 눌러주기

select 30+30 from dual;
select '대한민국' from dual;
select 30 * 30 from dual;

-- SELECT
-- 데이터를 조회(읽기)를 수형하는 keyword.
-- 간단한 연산(4칙 연산)등을 수행할때도 사용할 수 있다.
-- 간단한 연산을 수행할때 표준(보편적인) DBMS에서는 select 30 * 40;이라고 입력하면 수행이 되나
-- 오라클에서는 select 30 * 40 form dual; 이라고 입력해야 수행이 완료된다.
select 30+ 40 from dual;