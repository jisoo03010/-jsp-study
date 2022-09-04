select * from TBL_TMP_202108
select * from TBL_seat_202108
select * from TBL_resv_202108

drop table TBL_TMP_202108



create table TBL_TMP_202108(
	empno char(4) not null primary key,
	empname varchar2(20),
	tel1 char(4),
	tel2 char(4),
	tel3 char(4),
	deptcode char(2),
	position char(1)

)


insert into TBL_TMP_202108 values('1001','±è»ç¿ø','010','1234','1111','10','1');
insert into TBL_TMP_202108 values('1002','ÀÌ»ç¿ø','010','1234','2222','20','2');
insert into TBL_TMP_202108 values('1003','¹Ú»ç¿ø','010','1234','3333','30','3');
insert into TBL_TMP_202108 values('1004','È«»ç¿ø','010','1234','4444','10','4');
insert into TBL_TMP_202108 values('1005','Á¶»ç¿ø','010','1234','5555','20','1');
insert into TBL_TMP_202108 values('1006','Á¤»ç¿ø','010','1234','6666','30','2');
insert into TBL_TMP_202108 values('1007','È²»ç¿ø','010','1234','7777','10','3');

create table TBL_seat_202108(
	seatno char(4) not null primary key,
	office varchar2(20),
	calno varchar2(10),
	conv char(1)

)


insert into TBL_seat_202108 values('S001', '1Ãþ101È£', '7777-0001', 'N');
insert into TBL_seat_202108 values('S002', '1Ãþ101È£', '7777-0002', 'Y');
insert into TBL_seat_202108 values('S003', '1Ãþ101È£', '7777-0003', 'Y');
insert into TBL_seat_202108 values('S004', '1Ãþ102È£', '7777-0004', 'Y');
insert into TBL_seat_202108 values('S005', '1Ãþ102È£', '7777-0005', 'Y');
insert into TBL_seat_202108 values('S006', '1Ãþ102È£', '7777-0006', 'N');
insert into TBL_seat_202108 values('S007', '1Ãþ103È£', '7777-0007', 'Y');
insert into TBL_seat_202108 values('S008', '1Ãþ103È£', '7777-0008', 'Y');
insert into TBL_seat_202108 values('S009', '1Ãþ103È£', '7777-0009', 'Y');

create table TBL_resv_202108 (
	resvno varchar2(8) not null primary key,
	empno char(4) ,
	resvdate char(8),
	seatno char(4)
)

insert into TBL_resv_202108 values('20210001', '1001','20211004', 'S002');
insert into TBL_resv_202108 values('20210002', '1002','20211004', 'S003');
insert into TBL_resv_202108 values('20210003', '1003','20211004', 'S004');
insert into TBL_resv_202108 values('20210004', '1004','20211004', 'S005');
insert into TBL_resv_202108 values('20210005', '1005','20211005', 'S004');
insert into TBL_resv_202108 values('20210006', '1006','20211005', 'S005');
insert into TBL_resv_202108 values('20210007', '1007','20211005', 'S007');
insert into TBL_resv_202108 values('20210008', '1001','20211005', 'S008');
insert into TBL_resv_202108 values('20210009', '1002','20211006', 'S002');
insert into TBL_resv_202108 values('20210010', '1003','20211006', 'S003');



select   tt.empno, tt.empname, tr.resvdate, tr.seatno, ts.office, ts.calno
from TBL_resv_202108 tr ,TBL_TMP_202108 tt, TBL_seat_202108 ts
where tr.seatno = ts.seatno 
and tt.empno = tr.empno
order by  tr.empno


select empno, empname, resvdate, seatno,office, calno
from TBL_resv_202108 natural join TBL_TMP_202108 natural join TBL_seat_202108 

select * from TBL_TMP_202108 where empno = '1001'





