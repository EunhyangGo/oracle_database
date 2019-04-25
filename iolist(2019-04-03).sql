-- iolist 접속화면

DROP TABLE tbl_product;
CREATE TABLE tbl_product(
p_code	CHAR(13)		PRIMARY KEY,
p_name	nVARCHAR2(125)	NOT NULL,	
p_tax	CHAR(1)	 DEFAULT  '1',
p_iprice	NUMBER,		
p_oprice	NUMBER		
);

CREATE TABLE tbl_iolist(
io_id	NUMBER		PRIMARY KEY,
io_date	CHAR(10)	NOT NULL	,
io_pcode	CHAR(13)	NOT NULL,	
io_dcode	CHAR(5)	NOT NULL	,
io_inout	CHAR(5)	NOT NULL	,
io_tax CHAR(1) DEFAULT '1',
io_quan	NUMBER,		
io_price	NUMBER,		
io_total	 NUMBER,		
io_tax_total	NUMBER		
);

ALTER table tbl_iolist add io_time char(20);

CREATE TABLE tbl_dept(
d_code	CHAR(5)		PRIMARY KEY,
d_name	nVARCHAR2(50)	NOT NULL	,
d_ceo	nVARCHAR2(50),		
d_tel	nVARCHAR2(20),		
d_addr	nVARCHAR2(125)
);
ALTER table tbl_dept modify d_name nVARCHAR2(125);

select * from tbl_dept;