create table tbl_tmp_202108(
	empno char(4) not null primary key,
	empname varchar2(20),
	tel1 char(4),
	tel2 char(4),
	tel3 char(4),
	deptcode char(2),
	position char(1)

)

drop table tbl_tmp_202108;

insert into tbl_tmp_202108 values('1001', '±è»ç¿ø', '010', '1234', '1111', '10', '1');
insert into tbl_tmp_202108 values('1002', 'ÀÌ»ç¿ø', '010', '1234', '2222', '20', '2');
insert into tbl_tmp_202108 values('1003', '¹Ú»ç¿ø', '010', '1234', '3333', '30', '3');
insert into tbl_tmp_202108 values('1004', 'È«»ç¿ø', '010', '1234', '4444', '10', '4');
insert into tbl_tmp_202108 values('1005', 'Á¶»ç¿ø', '010', '1234', '5555', '20', '1');
insert into tbl_tmp_202108 values('1006', 'Á¤»ç¿ø', '010', '1234', '6666', '30', '2');
insert into tbl_tmp_202108 values('1007', 'È²»ç¿ø', '010', '1234', '7777', '10', '3');


create table tbl_seat_202108(
	seatno char(4) not null primary key,
	office varchar2(20) ,
	callno varchar2(10),
	conv char(1)
)

insert into tbl_seat_202108 values('S001', '1Ãþ101È£', '7777-0001', 'N');
insert into tbl_seat_202108 values('S001', '1Ãþ101È£', '7777-0002', 'Y');
insert into tbl_seat_202108 values('S001', '1Ãþ101È£', '7777-0003', 'Y');

insert into tbl_seat_202108 values('S001', '1Ãþ102È£', '7777-0004', 'Y');
insert into tbl_seat_202108 values('S001', '1Ãþ102È£', '7777-0005', 'Y');
insert into tbl_seat_202108 values('S001', '1Ãþ102È£', '7777-0006', 'N');

insert into tbl_seat_202108 values('S001', '1Ãþ103È£', '7777-0007', 'Y');
insert into tbl_seat_202108 values('S001', '1Ãþ103È£', '7777-0008', 'Y');
insert into tbl_seat_202108 values('S001', '1Ãþ103È£', '7777-0009', 'Y');



create table tbl_resv_202108( 
	resvno varchar2(8) not null primary key,
	empno char(4),
	resvdate char(8),
	seatno char(4)
)
x

insert into tbl_resv_202108 values('20210001', '1001', '20211004', 'S002');
insert into tbl_resv_202108 values('20210002', '1002', '20211004', 'S003');
insert into tbl_resv_202108 values('20210003', '1003', '20211004', 'S004');
insert into tbl_resv_202108 values('20210004', '1004', '20211004', 'S005');
insert into tbl_resv_202108 values('20210005', '1005', '20211005', 'S004');
insert into tbl_resv_202108 values('20210006', '1006', '20211005', 'S005');
insert into tbl_resv_202108 values('20210007', '1007', '20211005', 'S007');
insert into tbl_resv_202108 values('20210008', '1001', '20211005', 'S008');
insert into tbl_resv_202108 values('20210009', '1002', '20211006', 'S002');
insert into tbl_resv_202108 values('20210010', '1003', '20211006', 'S003');

insert into tbl_resv_202108 values('20210010', '1003', '20211006', 'S003');






select  COUNT(*)
from tbl_tmp_202108 tt,tbl_seat_202108 ts, tbl_resv_202108 tr
where tt.empno = tr.empno 
group by tr.empno




-- 10 :  20 : 30 : 

select tr.empno, tt.empname, decode(tt.deptcode, '10', '¿µ¾÷ÆÀ', '20', 'ÃÑ¹«ÆÀ', '30', '±¸¸ÅÆÀ'),  COUNT(*)
from tbl_tmp_202108 tt, tbl_resv_202108 tr
where tt.empno = tr.empno 
group by tr.empno, tt.empname,decode(tt.deptcode, '10', '¿µ¾÷ÆÀ', '20', 'ÃÑ¹«ÆÀ', '30', '±¸¸ÅÆÀ')


