-- ����� ������ ȭ���Դϴ�.

CREATE USER myuser IDENTIFIED BY 1234;
GRANT DBA to myuser;

create tablespace mytbl datafile 'D:/bizwork/ordata/mytbl.dbf' size 100m
autoextend on next 1m;

ALTER user myuser default tablespace mytbl;