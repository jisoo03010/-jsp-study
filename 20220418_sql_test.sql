CREATE TABLE student_tbl_004(

	st_no varchar2(6) NOT NULL PRIMARY KEY,
	st_major varchar2(30) NOT NULL,
	st_nm varchar2(10) NOT NULL,
	st_addr varchar2(50),
	st_phone varchar2(11),
	st_email varchar2(20),
	st_in_date DATE,
	st_out_date varchar2(30)
)

DROP TABLE student_tbl_004;

INSERT INTO student_tbl_004 values('30501', '유비쿼터스', '강신일', '서울시 송파구', '01011112222', 'ksi@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30502', '유비쿼터스', '김병철', '서울시 강남구', '01022223333', 'kbc@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30503', '유비쿼터스', '김지원', '서울시 송파구', '01033334444', 'kjw@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30504', '유비쿼터스', '박훈', '서울시 성동구', '01044445555', 'bh@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30505', '유비쿼터스', '송중기', '서울시 동작구', '01055556666', 'sjk@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30506', '유비쿼터스', '송혜교', '서울시 용산구', '01066667777', 'shk@sdhs.kr', '20170302', '');
INSERT INTO student_tbl_004 values('30507', '유비쿼터스', '진구', '서울시 광진구', '01077778888', 'jg@sdhs.kr', '20170302', '');

SELECT * FROM student_tbl_004





CREATE TABLE subject_tbl_004(
	sbj_cd varchar2(8) NOT NULL PRIMARY KEY,
	sbj_nm varchar2(20) ,
	sbj_fg varchar2(2)
)

INSERT INTO subject_tbl_004 values('A001', 'HTML', 'Y');
INSERT INTO subject_tbl_004 values('A002', 'JAVA', 'Y');
INSERT INTO subject_tbl_004 values('A003', 'PHP', 'Y');
INSERT INTO subject_tbl_004 values('A004', 'JAVASCRIPT', 'Y');
INSERT INTO subject_tbl_004 values('A005', 'CSS', 'Y');
INSERT INTO subject_tbl_004 values('B001', '국어', 'N');
INSERT INTO subject_tbl_004 values('B002', '영어', 'N');
INSERT INTO subject_tbl_004 values('B003', '수학', 'N');


SELECT  * FROM  subject_tbl_004


DROP TABLE exam_tbl_004

CREATE TABLE exam_tbl_004(
	exam_ymd varchar2(8) NOT NULL,
	exam_no varchar2(5) NOT NULL,
	exam_st_no varchar2(6) NOT NULL,
	exam_sbj_cd varchar2(8) NOT NULL,
	exam_w_point NUMBER(3),
	exam_a_point number(3),
    CONSTRAINT pk_type PRIMARY KEY(exam_ymd, exam_no) ,
    CONSTRAINT fk_st_no FOREIGN key(exam_st_no)
    REFERENCES student_tbl_004(st_no)
    ON DELETE CAScade,
    CONSTRAINT fk_sbj_cd FOREIGN key(exam_sbj_cd)
    REFERENCES subject_tbl_004(sbj_cd) ON DELETE cascade
)

select goods_cd, goods_nm, to_char(goods_price, 'l999,999,999') goods_price,  to_char(cost, 'l999,999,999')cost, to_char(in_date, 'YYYY-MM-DD') in_date from goods_tbl_002

INSERT INTO exam_tbl_004 values('20190412', '0001', '30501', 'A001', 80, 60);
INSERT INTO exam_tbl_004 values('20190412', '0002', '30502', 'A001', 70, 80);
INSERT INTO exam_tbl_004 values('20190412', '0003', '30503', 'A001', 90, 85);
INSERT INTO exam_tbl_004 values('20190412', '0004', '30504', 'A001', 100, 95);
INSERT INTO exam_tbl_004 values('20190412', '0005', '30505', 'A001', 65, 75);
INSERT INTO exam_tbl_004 values('20190412', '0006', '30506', 'A001', 50, 65);
INSERT INTO exam_tbl_004 values('20190412', '0007', '30507', 'A001', 80, 85);
INSERT INTO exam_tbl_004 values('20190412', '0008', '30501', 'B002', 70, 50);

INSERT INTO exam_tbl_004 values('20190412', '0009', '30502', 'B002', 70, 70);
INSERT INTO exam_tbl_004 values('20190412', '0010', '30503', 'B002', 80, 65);
INSERT INTO exam_tbl_004 values('20190412', '0011', '30504', 'B002', 80, 95);
INSERT INTO exam_tbl_004 values('20190412', '0012', '30505', 'B002', 65, 70);
INSERT INTO exam_tbl_004 values('20190412', '0013', '30506', 'B002', 55, 75);
INSERT INTO exam_tbl_004 values('20190412', '0014', '30507', 'B002', 80, 85);

SELECT * FROM exam_tbl_004

CREATE TABLE person_tbl_004(
	p_no varchar2(10),
	p_nm varchar2(10),
	p_age varchar2(10)
)




--2 
SELECT * FROM student_number

CREATE SEQUENCE student_number
START WITH 8
INCREMENT BY 1 ;

DROP TABLE student_number;


CREATE SEQUENCE exam_sample
START WITH 100
INCREMENT BY 1 ;

--2-1 
SELECT exam_sample.nextval FROM dual 

--2-2
SELECT exam_sample.currval FROM dual

--3번 
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')  AS "오늘의 날짜" FROM dual

--4번 
SELECT SUBSTR(st_no, 1,1) AS "학년", SUBSTR(st_no, 3,1) AS "반", SUBSTR(st_no, 5,1) AS "번호", st_major, st_nm, NULL AS  "출석"
FROM STUDENT_TBL_004

--5번 
SELECT * FROM  exam_tbl_004


SELECT exam_st_no AS "학번", st_nm, st_major AS "전공", exam_w_point AS "필기평가", exam_a_point AS "실기평가", (exam_w_point+exam_a_point)/2 AS "평균",
CASE WHEN (exam_w_point+exam_a_point)/2 >= 90 THEN 'A'
	 WHEN (exam_w_point+exam_a_point)/2 >= 80 AND (exam_w_point+exam_a_point)/2 < 90 THEN 'B'
	 WHEN (exam_w_point+exam_a_point)/2 >=70 AND (exam_w_point+exam_a_point)/2 < 80 THEN 'C'
	 WHEN (exam_w_point+exam_a_point)/2 >=60  AND (exam_w_point+exam_a_point)/2 < 70 THEN 'D'
	 ELSE 'F'
END AS 등급
FROM STUDENT_TBL_004 st , exam_tbl_004 et
WHERE exam_st_no = st_no AND exam_sbj_cd LIKE 'A%'


--5-1

SELECT exam_st_no AS "학번", st_nm, st_major AS "전공", exam_w_point AS "필기평가", exam_a_point AS "실기평가", ROUND((exam_w_point+exam_a_point)/2) AS "평균",
CASE WHEN (exam_w_point+exam_a_point)/2 >= 90 THEN 'A'
	 WHEN (exam_w_point+exam_a_point)/2 >= 80 AND (exam_w_point+exam_a_point)/2 < 90 THEN 'B'
	 WHEN (exam_w_point+exam_a_point)/2 >=70 AND (exam_w_point+exam_a_point)/2 < 80 THEN 'C'
	 WHEN (exam_w_point+exam_a_point)/2 >=60  AND (exam_w_point+exam_a_point)/2 < 70 THEN 'D'
	 ELSE 'F'
END AS 등급
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_st_no = st_no AND exam_sbj_cd LIKE 'A%'


--5-2
SELECT exam_st_no AS "학번", st_nm, st_major AS "전공", exam_w_point AS "필기평가", exam_a_point AS "실기평가", ROUND((exam_w_point+exam_a_point)/2) AS "평균",
CASE WHEN (exam_w_point+exam_a_point)/2 >= 90 THEN 'A'
	 WHEN (exam_w_point+exam_a_point)/2 >= 80 AND (exam_w_point+exam_a_point)/2 < 90 THEN 'B'
	 WHEN (exam_w_point+exam_a_point)/2 >=70 AND (exam_w_point+exam_a_point)/2 < 80 THEN 'C'
	 WHEN (exam_w_point+exam_a_point)/2 >=60  AND (exam_w_point+exam_a_point)/2 < 70 THEN 'D'
	 ELSE 'F'
END AS 등급
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_st_no = st_no AND exam_sbj_cd LIKE 'A%'
ORDER BY (exam_w_point+exam_a_point)/2 DESC 

--5-3
SELECT exam_st_no AS "학번", st_nm,
CASE WHEN (exam_w_point+exam_a_point)/2 >= 90 THEN 'A'
	 WHEN (exam_w_point+exam_a_point)/2 >= 80 AND (exam_w_point+exam_a_point)/2 < 90 THEN 'B'
	 WHEN (exam_w_point+exam_a_point)/2 >=70 AND (exam_w_point+exam_a_point)/2 < 80 THEN 'C'
	 WHEN (exam_w_point+exam_a_point)/2 >=60  AND (exam_w_point+exam_a_point)/2 < 70 THEN 'D'
	 ELSE 'F'
END AS grade
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_st_no = st_no AND exam_sbj_cd LIKE 'A%' AND CASE WHEN (exam_w_point+exam_a_point)/2 >= 90 THEN 'A'
	 WHEN (exam_w_point+exam_a_point)/2 >= 80 AND (exam_w_point+exam_a_point)/2 < 90 THEN 'B'
	 WHEN (exam_w_point+exam_a_point)/2 >=70 AND (exam_w_point+exam_a_point)/2 < 80 THEN 'C'
	 WHEN (exam_w_point+exam_a_point)/2 >=60  AND (exam_w_point+exam_a_point)/2 < 70 THEN 'D'
	 ELSE 'F'
END = 'B'
ORDER BY (exam_w_point+exam_a_point)/2 DESC 

-- 5-4
SELECT *
FROM (
SELECT exam_st_no AS "학번", st_nm, st_major AS "전공", ROUND((exam_w_point+exam_a_point)/2,1) AS "평균",
RANK() over(ORDER BY  ROUND((exam_w_point+exam_a_point)/2,1) desc)
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_st_no = st_no AND exam_sbj_cd LIKE 'A%'
)
WHERE rownum <= 3

-- 5-5
SELECT *
from
(
SELECT RANK() over(ORDER BY  avg(exam_w_point+exam_a_point)/2 desc) ranking, exam_st_no AS "학번", st_nm, st_major AS "전공", avg(exam_w_point+exam_a_point)/2 AS "평균", sum(exam_w_point+exam_a_point)
FROM STUDENT_TBL_004 JOIN exam_tbl_004
on exam_st_no = st_no 
GROUP BY exam_st_no, st_nm, st_major
ORDER BY exam_st_no
)


--5-6
SELECT '비전공' AS "과목",(
SELECT * 
FROM (
SELECT  st_nm || '('  || min(exam_w_point)  || ')' AS "필기평가 최하득점" 
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_sbj_cd LIKE 'B%' AND  exam_st_no = st_no 
GROUP BY st_nm
ORDER BY min(exam_w_point) ASC
)
WHERE rownum <= 1) AS "필기평가 최하득점" 
,
(SELECT * 
FROM (
SELECT  st_nm ||  '('  || min(exam_a_point) || ')'AS "실기평가 최하득점"
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE exam_sbj_cd LIKE 'B%' AND  exam_st_no = st_no
GROUP BY st_nm
ORDER BY min(exam_a_point) asc
)WHERE rownum <= 1)AS "실기평가 최하득점"
FROM STUDENT_TBL_004 NATURAL JOIN exam_tbl_004
WHERE rownum <= 1



--5-7 
SELECT * FROM exam_tbl_004 WHERE exam_st_no = '30506'

UPDATE exam_tbl_004 set exam_w_point = 55 WHERE exam_st_no = '30506' AND exam_sbj_cd LIKE 'A%'

--5-8
SELECT * FROM student_tbl_004 WHERE st_no = '30503' ;

UPDATE student_tbl_004 SET st_addr = '서울시 서초구'  WHERE st_no = '30503';

--5-9
SELECT * FROM student_tbl_004 WHERE st_no = '30502' ;

DELETE FROM STUDENT_TBL_004 WHERE  st_no = '30502' ;

-- 5- 10
SELECT st_out_date FROM STUDENT_TBL_004;

UPDATE STUDENT_TBL_004 SET st_out_date  =  to_char(SYSDATE, 'YYYYMMDD');
--5-11 

DELETE FROM STUDENT_TBL_004 WHERE  st_no = '30501' ;
--6번 
DROP TABLE person_tbl_004


SELECT * 
FROM student_tbl_004;

SELECT * 
FROM exam_tbl_004


INSERT INTO student_tbl_004 values('30508', '유비쿼터스', '김지수', '서울시 송파구', '01011112222', 'ksi@sdhs.kr',  to_char(SYSDATE, 'YYYYMMDD'), '');



SELECT * FROM STUDENT_TBL_004 WHERE SUBSTR(st_no, 5,1)=5;


SELECT * FROM STUDENT_TBL_004 WHERE st_no = '30505'


SELECT SUBSTR(st_no, 1,1) st_no, SUBSTR(st_no, 3,1) st_class, SUBSTR(st_no, 5,1)  st_classNum, st_major, st_nm, ' ' AS  출석 
FROM STUDENT_TBL_004 
WHERE st_nod = 3








SELECT * FROM STUDENT_TBL_004


SELECT  SUBSTR(st_no, 1,1) st_nod, SUBSTR(st_no, 3,1) st_class, SUBSTR(st_no, 5) as st_classNum,st_no, st_major, st_nm, st_addr, st_phone, st_email FROM STUDENT_TBL_004 

WHERE st_no='30505'


UPDATE student_tbl_004 SET  st_major='유비쿼터스', st_nm='김지자', st_addr='경기도 안양시', st_phone='01088889999', st_email='kjg@sdhs.kr' WHERE st_no='30503';

drop table goods_tbl_003

select * from goods_tbl_003

TRANSACTION 

SELECT * FROM goods_tbl_002

DROP TABLE goods_tbl_002

drop table sale_tbl_002





alter table goods_tbl_002 add CONSTRAINT  goods_cd PRIMARY KEY 



SELECT ,  FROM goods_tbl_002



SELECT SALE_FG, sale_no, IN_DATE goods_nm, SALE_CNT ,GOODS_PRICE,paytype
FROM 
(
SELECT DECODE(SALE_FG, '1', '판매', '2', '판매취소') SALE_FG, sale_no, TO_CHAR(IN_DATE, 'YYYY-MM-DD') IN_DATE,
 goods_nm, SALE_CNT ,GOODS_PRICE, DECODE(PAY_TYPE, '01', '현금', '02', '카드') paytype
FROM sale_tbl_002 NATURAL JOIN goods_tbl_002 natural join store_tbl_002
WHERE store_nm = '이태원점'
)
GROUP BY SALE_FG, sale_no, IN_DATE, goods_nm, SALE_CNT ,GOODS_PRICE,paytype





SELECT * FROM sale_tbl_002

SELECT * FROM goods_tbl_002




SELECT DECODE(sa.SALE_FG, '1', '판매', '2', '판매취소') SALE_FG, sa.sale_no, TO_CHAR(gt.IN_DATE, 'YYYY-MM-DD') IN_DATE,  gt.goods_nm, sa.SALE_CNT ,gt.GOODS_PRICE, DECODE(sa.PAY_TYPE, '01', '현금', '02', '카드') paytype FROM sale_tbl_002 sa , goods_tbl_002 gt ,store_tbl_002 st  WHERE sa.good_cd = gt.goods_cd  AND  sa.STORE_CD = st.STORE_CD AND st.store_nm = '이태원점'





SELECT DECODE(store_cd, 'A001', '이태원점', 'A002', '한남점', 'A003' , '도원점', 'B001', '혜화점', 'C001', '방배점', 'D001', '사당점', 'D002', '흑석점', 'E001', '금호점' ) STORE_CD ,  goods_price * sale_cnt cash, 0 card
FROM sale_tbl_002 NATURAL join goods_tbl_002 
WHERE  good_cd =goods_cd and pay_type = '01' 
UNION 
SELECT DECODE(store_cd, 'A001', '이태원점', 'A002', '한남점', 'A003' , '도원점', 'B001', '혜화점', 'C001', '방배점', 'D001', '사당점', 'D002', '흑석점', 'E001', '금호점' ) STORE_CD ,  0 cash ,
sum(goods_price * sale_cnt) card
FROM sale_tbl_002 NATURAL join goods_tbl_002 
WHERE  good_cd =goods_cd and pay_type = '02' 
GROUP BY store_cd
ORDER BY card desc



select store_cd, SUM(cash), SUM(card) , sum(cash + card)
from 
(
SELECT DECODE(store_cd, 'A001', '이태원점', 'A002', '한남점', 'A003' , '도원점', 'B001', '혜화점', 'C001', '방배점', 'D001', '사당점', 'D002', '흑석점', 'E001', '금호점' ) STORE_CD ,  goods_price * sale_cnt cash, 0 card
FROM sale_tbl_002 NATURAL join goods_tbl_002 
WHERE  good_cd =goods_cd and pay_type = '01' 
UNION 
SELECT DECODE(store_cd, 'A001', '이태원점', 'A002', '한남점', 'A003' , '도원점', 'B001', '혜화점', 'C001', '방배점', 'D001', '사당점', 'D002', '흑석점', 'E001', '금호점' ) STORE_CD ,  0 cash ,
sum(goods_price * sale_cnt) card
FROM sale_tbl_002 NATURAL join goods_tbl_002 
WHERE  good_cd =goods_cd and pay_type = '02' 
GROUP BY store_cd
ORDER BY card desc
)GROUP BY store_cd
ORDER BY sum(cash + card) DESC

--공부 해야할거

시퀀스

















insert into tbl_salelist_02 values(100001, 'S001', '2018-12-02', 'AA01', 50);
insert into tbl_salelist_02 values(100002, 'S001', '2018-12-02', 'AA02', 30);
insert into tbl_salelist_02 values(100003, 'S001', '2018-12-02', 'AA03', 20);
insert into tbl_salelist_02 values(100004, 'S001', '2018-12-02', 'AA04', 50);
insert into tbl_salelist_02 values(100005, 'S003', '2018-12-03', 'AA01', 40);
insert into tbl_salelist_02 values(100006, 'S003', '2018-12-03', 'AA02', 60);

insert into tbl_salelist_02 values(100007, 'S003', '2018-12-03', 'AA04', 60);
insert into tbl_salelist_02 values(100008, 'S003', '2018-12-04', 'AA05', 70);
insert into tbl_salelist_02 values(100009, 'S005', '2018-12-02', 'AA01', 80);
insert into tbl_salelist_02 values(100010, 'S005', '2018-12-02', 'AA03', 30);
insert into tbl_salelist_02 values(100011, 'S005', '2018-12-02', 'AA04', 40);
insert into tbl_salelist_02 values(100012, 'S005', '2018-12-02', 'AA05', 50);
insert into tbl_salelist_02 values(100013, 'S004', '2018-12-04', 'AA01', 30);
insert into tbl_salelist_02 values(100014, 'S004', '2018-12-04', 'AA02', 20);
insert into tbl_salelist_02 values(100015, 'S004', '2018-12-04', 'AA06', 50);





