select * from member_tbl_03

drop table score_tbl_03


create table member_tbl_03(
	id varchar2(5) not null primary key,
	name varchar2(20) ,
	gender char(1)
)

insert into member_tbl_03 values('10301', '권이준', '1');
insert into member_tbl_03 values('10302', '구지우', '2');
insert into member_tbl_03 values('10303', '권태준', '1');
insert into member_tbl_03 values('10304', '금기연', '2');
insert into member_tbl_03 values('10305', '김영진', '1');

insert into member_tbl_03 values('10401', '김주현', '1');
insert into member_tbl_03 values('10402', '김태민', '2');
insert into member_tbl_03 values('10403', '임수민', '2');
insert into member_tbl_03 values('10404', '남상도', '1');
insert into member_tbl_03 values('10405', '조은호', '1');


drop table score_tbl_03


create table score_tbl_03(
	id varchar2(5) not null primary key,
	korean number(3) ,
	english number(3) ,
	math number(3) ,
	history number(3) 
)
mathhistory

insert into score_tbl_03 values('10301', 70, 80, 75, 95);
insert into score_tbl_03 values('10302', 80, 73, 80, 85);
insert into score_tbl_03 values('10303', 45, 75, 45,75);
insert into score_tbl_03 values('10304', 65, 73, 65, 65);
insert into score_tbl_03 values('10305', 90, 100, 68, 95);

insert into score_tbl_03 values('10401', 95, 75 , 84, 60);
insert into score_tbl_03 values('10402', 65, 70, 50, 94);
insert into score_tbl_03 values('10403', 80, 60, 100, 80);
insert into score_tbl_03 values('10404', 64, 50, 40, 65);
insert into score_tbl_03 values('10405', 55, 70, 80, 75);


select name, substr(id, 1, 1),  substr(id, 2, 2), substr(id, 4, 2),  decode(substr(gender, 1, 1), '1', '남', '2', '여')
from member_tbl_03




select * from score_tbl_03

update member_tbl_03 set id= '10305', name= '김지수', gender= '2' where id = '10305'



select substr(id, 3, 1)||'반',korean, english, math ,history 
from score_tbl_03



select * 
from (select mt.id,mt.name, st.korean, st.english,st.math ,  st.history,sum(st.korean+ st.english+ st.math+  st.history), rank() over (order by sum(st.korean+ st.english+ st.math+  st.history)  desc)
from score_tbl_03 st, member_tbl_03 mt
where st.id = mt.id
group by mt.id, mt.name,  st.korean, st.english,st.math ,  st.history
order by sum(st.korean+ st.english+ st.math+  st.history) desc)
where rownum <= 3







