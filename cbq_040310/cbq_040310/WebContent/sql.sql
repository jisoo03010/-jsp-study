select * from TBL_HOSP_202108

drop table TBL_VACCRESV_202108


create table tbl_jumin_201808 (
	jumin char(14) not null primary key,
	pname varchar2(16),
	tel varchar2(13),
	address varchar2(10)
)

insert into tbl_jumin_201808 values('700101-1000001', '±èÁÖ¹Î', '010-1234-0001', '¼­¿ï');
insert into tbl_jumin_201808 values('700101-1000002', 'ÀÌÁÖ¹Î', '010-1234-0002', '¼­¿ï');
insert into tbl_jumin_201808 values('700101-1000003', '¹ÚÁÖ¹Î', '010-1234-0003', '¼­¿ï');
insert into tbl_jumin_201808 values('700101-1000004', 'Á¶ÁÖ¹Î', '010-1234-0004', '´ëÀü');
insert into tbl_jumin_201808 values('700101-1000005', 'È«ÁÖ¹Î', '010-1234-0005', '´ëÀü');
insert into tbl_jumin_201808 values('700101-1000006', '³ªÁÖ¹Î', '010-1234-0006', '´ë±¸');
insert into tbl_jumin_201808 values('700101-1000007', 'È²ÁÖ¹Î', '010-1234-0007', '´ë±¸');
insert into tbl_jumin_201808 values('700101-1000008', '¿ëÁÖ¹Î', '010-1234-0008', '±¤ÁÖ');
insert into tbl_jumin_201808 values('700101-1000009', '¹éÁÖ¹Î', '010-1234-0009', '±¤ÁÖ');
insert into tbl_jumin_201808 values('700101-1000010', '¼ÛÁÖ¹Î', '010-1234-0010', '±¤ÁÖ');



create table TBL_HOSP_202108(
	hospcode char(4) not null primary key,
	hospname varchar2(10),
	hosptel varchar2(10),
	hospaddr varchar2(10)
)

insert into TBL_HOSP_202108 values('H001', '°¡-º´¿ø', '1588-0001', '¼­¿ï' );
insert into TBL_HOSP_202108 values('H002', '³ª-º´¿ø', '1588-0002', '´ëÀü' );
insert into TBL_HOSP_202108 values('H003', '´Ù-º´¿ø', '1588-0003', '´ë±¸' );
insert into TBL_HOSP_202108 values('H004', '¶ó-º´¿ø', '1588-0004', '±¤ÁÖ' );



create table TBL_VACCRESV_202108(
	resvno char(8) not null primary key,
	jumin char(14),
	vcode char(4),
	hospcode char(4),
	resvdate char(8),
	resvtime char(4)
	
)

insert into TBL_VACCRESV_202108 values('20210001','700101-1000001', 'V001', 'H001', '20210901', '0920');
insert into TBL_VACCRESV_202108 values('20210002','700101-1000002', 'V001', 'H002', '20210901', '1030');
insert into TBL_VACCRESV_202108 values('20210003','700101-1000003', 'V002', 'H003', '20210902', '1130');
insert into TBL_VACCRESV_202108 values('20210004','700101-1000004', 'V002', 'H001', '20210902', '1230');
insert into TBL_VACCRESV_202108 values('20210005','700101-1000005', 'V002', 'H002', '20210902', '1330');
insert into TBL_VACCRESV_202108 values('20210006','700101-1000006', 'V003', 'H003', '20210903', '1430');
insert into TBL_VACCRESV_202108 values('20210007','700101-1000007', 'V003', 'H001', '20210903', '1530');
insert into TBL_VACCRESV_202108 values('20210008','700101-1000008', 'V003', 'H002', '20210903', '1630');
insert into TBL_VACCRESV_202108 values('20210009','700101-1000009', 'V003', 'H003', '20210904', '1730');
insert into TBL_VACCRESV_202108 values('20210010','700101-1000010', 'V003', 'H001', '20210904', '1830');


select tj.pname, tv.jumin, substr(tv.jumin, 8, 1)
from TBL_VACCRESV_202108 tv, TBL_HOSP_202108 th, tbl_jumin_201808 tj
where resvno= '20210003'



select * from TBL_VACCRESV_202108 where resvno = '20210003'



select count(th.hospname)
from TBL_HOSP_202108 th, TBL_VACCRESV_202108 tv
where th.hospcode = tv.hospcode

select null hospcode ,  'ÃÑ°è' hospname, count(*)
from TBL_HOSP_202108 natural join TBL_VACCRESV_202108 
group by hospcode



select ''  hospcode ,  'ÃÑ°è' hospname,count(th.hospname)
from TBL_HOSP_202108 th, TBL_VACCRESV_202108 tv
where th.hospcode = tv.hospcode
union
select hospcode ,  hospname, count(hospname)
from TBL_HOSP_202108 natural join TBL_VACCRESV_202108 
group by hospname, hospcode
order by  hospname 















