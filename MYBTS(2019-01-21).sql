-- 여기는 mybts 접속 화면 입니다.

-- 주소록 table을 하나 생성
-- 학번, 이름, 전화번호, 주소

CREATE TABLE tbl_addr(
        ad_num nVARCHAR2(5) PRIMARY KEY,
        ad_name nVARCHAR2(30) NOT NULL,
        ad_tel nVARCHAR2(15),
        ad_addr1 nVARCHAR2(20),
        ad_addr2 nVARCHAR2(50)
);

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19001','홍길동','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19002','성춘향','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19003','장보고','001-001-004');

INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19004','이몽룡','001-001-004');

select * from tbl_addr;
