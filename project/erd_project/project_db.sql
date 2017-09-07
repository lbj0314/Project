
/* Drop Tables */

DROP TABLE PROJECT.NOTICE CASCADE CONSTRAINTS;
DROP TABLE PROJECT.ADMINATOR CASCADE CONSTRAINTS;
DROP TABLE PROJECT.ADMMEMBER CASCADE CONSTRAINTS;
DROP TABLE PROJECT.GOODPACKAGE CASCADE CONSTRAINTS;
DROP TABLE PROJECT.ORDERPACKAGE CASCADE CONSTRAINTS;
DROP TABLE PROJECT.COMMEMBER CASCADE CONSTRAINTS;
DROP TABLE PROJECT.RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE PROJECT.STAY CASCADE CONSTRAINTS;
DROP TABLE PROJECT.TOUR CASCADE CONSTRAINTS;
DROP TABLE PROJECT.ENTMEMBER CASCADE CONSTRAINTS;
DROP TABLE PROJECT.REVIEW CASCADE CONSTRAINTS;
DROP TABLE PROJECT.QNA CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE PROJECT.ADMINATOR_SEQ;
DROP SEQUENCE PROJECT.COMMEMBER_SEQ;
DROP SEQUENCE PROJECT.ENTMEMBER_SEQ;
DROP SEQUENCE PROJECT.GOODPACKAGE_SEQ;
DROP SEQUENCE PROJECT.NOTICE_SEQ;
DROP SEQUENCE PROJECT.ORDERPACKAGE_SEQ;
DROP SEQUENCE PROJECT.RESTAURANT_SEQ;
DROP SEQUENCE PROJECT.STAY_SEQ;
DROP SEQUENCE PROJECT.TOUR_SEQ;




/* Create Sequences */

CREATE SEQUENCE PROJECT.ADMINATOR_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 3 NOCACHE;
CREATE SEQUENCE PROJECT.COMMEMBER_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.ENTMEMBER_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.GOODPACKAGE_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.NOTICE_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 4 NOCACHE;
CREATE SEQUENCE PROJECT.ORDERPACKAGE_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.RESTAURANT_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.STAY_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 0 NOCACHE;
CREATE SEQUENCE PROJECT.TOUR_SEQ INCREMENT BY 1 MINVALUE 0 MAXVALUE 999 START WITH 24 NOCACHE;



/* Create Tables */

CREATE TABLE PROJECT.ADMINATOR
(
	-- 관리자 번호
	ADMNUM number(4,0) NOT NULL,
	-- 관리자 아이디
	ADMID varchar2(20 char) NOT NULL,
	-- 관리자 비밀번호
	ADMPASSWD varchar2(20 char) NOT NULL,
	CONSTRAINT ADMINNUM_PK PRIMARY KEY (ADMNUM)
);


CREATE TABLE PROJECT.ADMMEMBER
(
	ADMNUM number NOT NULL,
	ADMID varchar2(20 char) NOT NULL,
	ADMPASSWD varchar2(20 char) NOT NULL,
	ADMGRADE varchar2(20 char) NOT NULL,
	CONSTRAINT ADMMEMBER_PK PRIMARY KEY (ADMNUM)
);


CREATE TABLE PROJECT.COMMEMBER
(
	-- 사용자 번호
	COMNUM number(4,0) NOT NULL,
	-- 사용자 아이디
	COMID varchar2(20 char) NOT NULL,
	-- 사용자 비밀번호
	COMPASSWD varchar2(20 char) NOT NULL,
	-- 사용자 이름
	COMNAME varchar2(20 char) NOT NULL,
	-- 사용자 주민등록번호
	COMSSN number(13) NOT NULL,
	-- 사용자 전화번호
	COMPHONE number(13) NOT NULL,
	-- 사용자 등급
	COMGRADE varchar2(10 char) NOT NULL,
	-- 사용자 이메일
	COMMEMAIL varchar2(100 char) NOT NULL,
	-- 사용자 주소1
	COMADDR1 varchar2(400 char) NOT NULL,
	-- 사용자 주소2
	COMADDR2 varchar2(400 char) NOT NULL,
	-- 사용자 우편번호1
	COMPOST1 number(5,0) NOT NULL,
	-- 사용자 우편번호2
	COMPOST2 number(5,0) NOT NULL,
	CONSTRAINT MBERNUM_PK PRIMARY KEY (COMNUM)
);


CREATE TABLE PROJECT.ENTMEMBER
(
	-- 기업 번호
	ENTNUM number(4,0) NOT NULL,
	-- 기업 아이디
	ENTID varchar2(20 char) NOT NULL,
	-- 기업 비밀번호
	ENTPASSWD varchar2(20 char) NOT NULL,
	-- 기업 이름
	ENTNAME varchar2(100 char) NOT NULL,
	-- 기업 지역위치
	-- 
	ENTLOCATION varchar2(500 char) NOT NULL,
	-- 기업 전화번호
	ENTPHONE number(13) NOT NULL,
	-- 업주 핸드폰 번호
	ENTCELLPHONE number(13),
	-- 기업 팩스번호
	ENTFAX number(13) NOT NULL,
	-- 기업 사업자등록번호
	ENTIN number(13) NOT NULL,
	-- 기업 종류(명소,맛집,숙박)
	ENTTYPE varchar2(40 char) NOT NULL,
	CONSTRAINT SYS_C0011035 PRIMARY KEY (ENTNUM)
);


CREATE TABLE PROJECT.GOODPACKAGE
(
	-- GOOD_PACKAGE 번호
	GOODPANUM number(4,0) NOT NULL,
	-- 사용자 번호
	COMNUM number(4,0) NOT NULL,
	-- 관광지 번호
	ATTNUM number(7,0) NOT NULL,
	-- 음식점 번호
	RESTNUM number(7,0) NOT NULL,
	-- 숙박업소 번호
	STAYNUM number(7,0) NOT NULL,
	-- GOOD_PACKAGE 시작날짜
	GOSTARTDATE date DEFAULT SYSDATE,
	-- GOOD_PACKAGE 종료 날짜
	GOENDDATE date DEFAULT SYSDATE,
	-- GOOD_PACKAGE 어른수
	GOADULT number(3,0) NOT NULL,
	-- GOOD_PACKAGE 어린이수
	GOKID number(3,0) NOT NULL,
	-- GOOD_PACKAGE 보증금
	GODEPOSIT number(10,0) NOT NULL,
	-- GOOD_PACKAGE 날짜
	GOWRITEDAY date DEFAULT SYSDATE,
	-- GOOD_PACKAGE 결제 종류
	GOPAYMENT varchar2(10 char) NOT NULL,
	CONSTRAINT SYS_C0011335 PRIMARY KEY (GOODPANUM)
);


CREATE TABLE PROJECT.NOTICE
(
	-- 게시판 번호
	NONUM number(4,0) NOT NULL,
	-- 게시판 글 제목
	NOTITLE varchar2(20 char) NOT NULL,
	-- 공지사항 글 작성날짜
	NOWRITEDAY date DEFAULT SYSDATE,
	-- 공지사항 글 내용
	NOCONTENT varchar2(1000 char) NOT NULL,
	-- 공지사항 글 조회수
	NOREADCNT number(9,0) DEFAULT 0,
	-- 관리자 번호
	ADMNUM number(4,0) NOT NULL,
	CONSTRAINT SYS_C0011061 PRIMARY KEY (NONUM)
);


CREATE TABLE PROJECT.ORDERPACKAGE
(
	-- ORDER_PACKAGE 번호
	ORDERPANUM number(4,0) NOT NULL,
	-- 사용자 번호
	COMNUM number(4,0) NOT NULL,
	-- 관광지 번호
	ATTNUM number(7,0) NOT NULL,
	-- 음식점 번호
	RESTNUM number(4,0) NOT NULL,
	-- 숙박업소 번호
	STAYNUM number(7,0) NOT NULL,
	-- ORDER_PACKAGE 할인
	PADISCOUNT number(10,0) NOT NULL,
	-- ORDER_PACKAGE 시작 날짜
	PASTARTDATE date,
	-- ORDER_PACKAGE 종료 날짜
	PAENDDATE date,
	-- ORDER_PACKAGE 어른수
	PAADULT number(3,0) NOT NULL,
	-- ORDER_PACKAGE 어린이수
	PAKID number(3,0),
	-- ORDER_PACKAGE 보증금
	PADEPOSIT varchar2(20 char),
	-- ORDER_PACKAGE 결제 날짜
	PAWRITEDAY date DEFAULT SYSDATE,
	-- PACKAGE 결제 종류
	PAPAYMENT varchar2(20 char),
	CONSTRAINT SYS_C0011343 PRIMARY KEY (ORDERPANUM)
);


CREATE TABLE PROJECT.QNA
(
	-- 질답 번호
	QNANUM number NOT NULL,
	-- 질답 글 제목
	QNATITLE varchar2(400 char) NOT NULL,
	-- 질답 글 내용
	QNACONTENT varchar2(500 char) NOT NULL,
	-- 질답 글 작성 날짜
	QNAWRITEDAY date DEFAULT SYSDATE,
	-- 질답 글 조회수
	QNAREADCNT number(10,0) DEFAULT 0,
	CONSTRAINT SYS_C0011436 PRIMARY KEY (QNANUM)
);


CREATE TABLE PROJECT.RESTAURANT
(
	-- 음식점 번호
	RESTNUM number(4,0) NOT NULL,
	-- 음식점 종류
	RESTTYPE varchar2(40 char) NOT NULL,
	-- 음식점 이름
	RESTNAME varchar2(50 char) NOT NULL,
	-- 음식점 지역위치
	RESTLOCATION varchar2(400 char) NOT NULL,
	-- 음식점 가격
	RESTPRICE number DEFAULT 0,
	-- 음식점 전화번호
	RESTPHONE number(12) NOT NULL,
	-- 음식점 글 제목
	RESTTITLE varchar2(50 char) NOT NULL,
	-- 음식점 글 내용
	RESTCONTENT varchar2(1000 char) NOT NULL,
	-- 음식점 글 작성 날짜
	RESTWRITEDAY date DEFAULT SYSDATE,
	-- 음식점 글 조회수
	RESTREADCNT number(10,0) DEFAULT 0,
	-- 댓글수
	RESTREPLECNT number(10,0) DEFAULT 0,
	-- 음식점 이미지
	RESTIMAGE varchar2(500 char) NOT NULL,
	-- 음식점 사이트
	RESTSITE varchar2(500 char) NOT NULL,
	-- 기업 번호
	ENTNUM number(4,0) NOT NULL,
	CONSTRAINT SYS_C0011039 PRIMARY KEY (RESTNUM)
);


CREATE TABLE PROJECT.REVIEW
(
	-- 리뷰 번호
	REVIEWNUM number(4,0) NOT NULL,
	-- 리뷰 글 제목
	REVIEWTITLE varchar2(50 char) NOT NULL,
	-- 리뷰 글 내용
	REVIEWCONTENT varchar2(500) NOT NULL,
	-- 리뷰 글 작성 날짜
	REVIEWWRITEDAY date DEFAULT SYSDATE,
	-- 리뷰 글 조회수
	REVIEWREADCNT number(10,0) DEFAULT 0,
	-- 질답 번호
	QNANUM number NOT NULL,
	CONSTRAINT SYS_C0011452 PRIMARY KEY (REVIEWNUM)
);


CREATE TABLE PROJECT.STAY
(
	-- 숙박업소 번호
	STAYNUM number(7,0) NOT NULL,
	-- 숙박업소 종류
	STAYTYPE varchar2(40) NOT NULL,
	-- 숙박업소 이름
	STAYNAME varchar2(40) NOT NULL,
	-- 숙박업소 지역위치
	STAYLOCATION varchar2(400 char) NOT NULL,
	-- 숙박업소 등급
	STAYGRADE varchar2(20) NOT NULL,
	-- 숙박업소 어른 가격
	STAYADULTPRICE number DEFAULT 0,
	-- 숙박업소 어린이 가격
	STAYKIDPRICE number DEFAULT 0,
	-- 숙박업소 전화번호
	STAYPHONE number(13) NOT NULL,
	-- 숙박업소 글 제목
	STAYTITLE varchar2(80 char) NOT NULL,
	-- 숙박업소 글 내용
	STAYCONTENT varchar2(1000 char) NOT NULL,
	-- 숙박업소 글 작성 날짜
	STAYWRITEDAY date DEFAULT SYSDATE,
	-- 숙박업소 글 조회수
	STAYREADCNT number(10,0) DEFAULT 0,
	-- 숙박업소 댓글수
	STAYREPLECNT number(10,0) DEFAULT 0,
	-- 숙박업소 이미지
	STAYIMAGE varchar2(500 char) NOT NULL,
	-- 숙박업소 사이트
	STAYSITE varchar2(500 char) NOT NULL,
	-- 기업 번호
	ENTNUM number(4,0) NOT NULL,
	CONSTRAINT SYS_C0011042 PRIMARY KEY (STAYNUM)
);


CREATE TABLE PROJECT.TOUR
(
	-- 관광지 종류
	ATTTYPE varchar2(30 char) NOT NULL,
	-- 관광지 이름
	ATTNAME varchar2(40 char) NOT NULL,
	-- 관광지 지역위치
	ATTLOCATION varchar2(200 char) NOT NULL,
	-- 관광지 어른 가격
	ATTADULTPRICE number(10,0) DEFAULT 0,
	-- 관광지 어린이 가격
	ATTKIDPRICE number(10,0) DEFAULT 0,
	-- 관광지 전화번호
	ATTPHONE number(12,0) NOT NULL,
	-- 관광지 글 제목
	ATTTITLE varchar2(50 char) NOT NULL,
	-- 관광지 번호
	ATTNUM number(7,0) NOT NULL,
	-- 관광지 글 내용
	ATTCONTENT varchar2(1000 char) NOT NULL,
	-- 관광지 글쓴 날짜
	ATTWRITEDAY date DEFAULT SYSDATE,
	-- 관광지 조회수
	ATTREADCNT number(10,0) DEFAULT 0,
	-- 관광지 댓글수
	ATTREPLECNT number(10,0) DEFAULT 0,
	-- 관광지 이미지
	ATTIMAGE varchar2(500 char) NOT NULL,
	-- 관광지 사이트
	ATTSITE varchar2(500 char) NOT NULL,
	-- 기업 번호
	ENTNUM number(4,0) NOT NULL,
	-- 좋아요 카운트
	ATTGOODS number(10,0) DEFAULT 0 ,
	-- 이미지 중복시에
	ATTIMAGECLONE varchar2(500 char),
	CONSTRAINT SYS_C0011329 PRIMARY KEY (ATTNUM)
);



/* Create Foreign Keys */

ALTER TABLE PROJECT.NOTICE
	ADD CONSTRAINT SYS_C0011477 FOREIGN KEY (ADMNUM)
	REFERENCES PROJECT.ADMINATOR (ADMNUM)
;


ALTER TABLE PROJECT.GOODPACKAGE
	ADD CONSTRAINT SYS_C0011345 FOREIGN KEY (COMNUM)
	REFERENCES PROJECT.COMMEMBER (COMNUM)
;


ALTER TABLE PROJECT.ORDERPACKAGE
	ADD CONSTRAINT SYS_C0011349 FOREIGN KEY (COMNUM)
	REFERENCES PROJECT.COMMEMBER (COMNUM)
;


ALTER TABLE PROJECT.RESTAURANT
	ADD CONSTRAINT SYS_C0011480 FOREIGN KEY (ENTNUM)
	REFERENCES PROJECT.ENTMEMBER (ENTNUM)
;


ALTER TABLE PROJECT.STAY
	ADD CONSTRAINT SYS_C0011481 FOREIGN KEY (ENTNUM)
	REFERENCES PROJECT.ENTMEMBER (ENTNUM)
;


ALTER TABLE PROJECT.TOUR
	ADD CONSTRAINT SYS_C0011482 FOREIGN KEY (ENTNUM)
	REFERENCES PROJECT.ENTMEMBER (ENTNUM)
;


ALTER TABLE PROJECT.REVIEW
	ADD CONSTRAINT SYS_C0011483 FOREIGN KEY (QNANUM)
	REFERENCES PROJECT.QNA (QNANUM)
;


ALTER TABLE PROJECT.GOODPACKAGE
	ADD CONSTRAINT SYS_C0011346 FOREIGN KEY (RESTNUM)
	REFERENCES PROJECT.RESTAURANT (RESTNUM)
;


ALTER TABLE PROJECT.ORDERPACKAGE
	ADD CONSTRAINT SYS_C0011350 FOREIGN KEY (RESTNUM)
	REFERENCES PROJECT.RESTAURANT (RESTNUM)
;


ALTER TABLE PROJECT.GOODPACKAGE
	ADD CONSTRAINT SYS_C0011347 FOREIGN KEY (STAYNUM)
	REFERENCES PROJECT.STAY (STAYNUM)
;


ALTER TABLE PROJECT.ORDERPACKAGE
	ADD CONSTRAINT SYS_C0011351 FOREIGN KEY (STAYNUM)
	REFERENCES PROJECT.STAY (STAYNUM)
;


ALTER TABLE PROJECT.GOODPACKAGE
	ADD CONSTRAINT SYS_C0011344 FOREIGN KEY (ATTNUM)
	REFERENCES PROJECT.TOUR (ATTNUM)
;


ALTER TABLE PROJECT.ORDERPACKAGE
	ADD CONSTRAINT SYS_C0011348 FOREIGN KEY (ATTNUM)
	REFERENCES PROJECT.TOUR (ATTNUM)
;



/* Comments */

COMMENT ON COLUMN PROJECT.ADMINATOR.ADMNUM IS '관리자 번호';
COMMENT ON COLUMN PROJECT.ADMINATOR.ADMID IS '관리자 아이디';
COMMENT ON COLUMN PROJECT.ADMINATOR.ADMPASSWD IS '관리자 비밀번호';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMNUM IS '사용자 번호';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMID IS '사용자 아이디';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMPASSWD IS '사용자 비밀번호';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMNAME IS '사용자 이름';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMSSN IS '사용자 주민등록번호';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMPHONE IS '사용자 전화번호';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMGRADE IS '사용자 등급';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMMEMAIL IS '사용자 이메일';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMADDR1 IS '사용자 주소1';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMADDR2 IS '사용자 주소2';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMPOST1 IS '사용자 우편번호1';
COMMENT ON COLUMN PROJECT.COMMEMBER.COMPOST2 IS '사용자 우편번호2';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTNUM IS '기업 번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTID IS '기업 아이디';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTPASSWD IS '기업 비밀번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTNAME IS '기업 이름';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTLOCATION IS '기업 지역위치
';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTPHONE IS '기업 전화번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTCELLPHONE IS '업주 핸드폰 번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTFAX IS '기업 팩스번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTIN IS '기업 사업자등록번호';
COMMENT ON COLUMN PROJECT.ENTMEMBER.ENTTYPE IS '기업 종류(명소,맛집,숙박)';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOODPANUM IS 'GOOD_PACKAGE 번호';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.COMNUM IS '사용자 번호';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.ATTNUM IS '관광지 번호';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.RESTNUM IS '음식점 번호';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.STAYNUM IS '숙박업소 번호';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOSTARTDATE IS 'GOOD_PACKAGE 시작날짜';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOENDDATE IS 'GOOD_PACKAGE 종료 날짜';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOADULT IS 'GOOD_PACKAGE 어른수';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOKID IS 'GOOD_PACKAGE 어린이수';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GODEPOSIT IS 'GOOD_PACKAGE 보증금';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOWRITEDAY IS 'GOOD_PACKAGE 날짜';
COMMENT ON COLUMN PROJECT.GOODPACKAGE.GOPAYMENT IS 'GOOD_PACKAGE 결제 종류';
COMMENT ON COLUMN PROJECT.NOTICE.NONUM IS '게시판 번호';
COMMENT ON COLUMN PROJECT.NOTICE.NOTITLE IS '게시판 글 제목';
COMMENT ON COLUMN PROJECT.NOTICE.NOWRITEDAY IS '공지사항 글 작성날짜';
COMMENT ON COLUMN PROJECT.NOTICE.NOCONTENT IS '공지사항 글 내용';
COMMENT ON COLUMN PROJECT.NOTICE.NOREADCNT IS '공지사항 글 조회수';
COMMENT ON COLUMN PROJECT.NOTICE.ADMNUM IS '관리자 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.ORDERPANUM IS 'ORDER_PACKAGE 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.COMNUM IS '사용자 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.ATTNUM IS '관광지 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.RESTNUM IS '음식점 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.STAYNUM IS '숙박업소 번호';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PADISCOUNT IS 'ORDER_PACKAGE 할인';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PASTARTDATE IS 'ORDER_PACKAGE 시작 날짜';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PAENDDATE IS 'ORDER_PACKAGE 종료 날짜';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PAADULT IS 'ORDER_PACKAGE 어른수';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PAKID IS 'ORDER_PACKAGE 어린이수';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PADEPOSIT IS 'ORDER_PACKAGE 보증금';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PAWRITEDAY IS 'ORDER_PACKAGE 결제 날짜';
COMMENT ON COLUMN PROJECT.ORDERPACKAGE.PAPAYMENT IS 'PACKAGE 결제 종류';
COMMENT ON COLUMN PROJECT.QNA.QNANUM IS '질답 번호';
COMMENT ON COLUMN PROJECT.QNA.QNATITLE IS '질답 글 제목';
COMMENT ON COLUMN PROJECT.QNA.QNACONTENT IS '질답 글 내용';
COMMENT ON COLUMN PROJECT.QNA.QNAWRITEDAY IS '질답 글 작성 날짜';
COMMENT ON COLUMN PROJECT.QNA.QNAREADCNT IS '질답 글 조회수';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTNUM IS '음식점 번호';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTTYPE IS '음식점 종류';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTNAME IS '음식점 이름';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTLOCATION IS '음식점 지역위치';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTPRICE IS '음식점 가격';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTPHONE IS '음식점 전화번호';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTTITLE IS '음식점 글 제목';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTCONTENT IS '음식점 글 내용';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTWRITEDAY IS '음식점 글 작성 날짜';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTREADCNT IS '음식점 글 조회수';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTREPLECNT IS '댓글수';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTIMAGE IS '음식점 이미지';
COMMENT ON COLUMN PROJECT.RESTAURANT.RESTSITE IS '음식점 사이트';
COMMENT ON COLUMN PROJECT.RESTAURANT.ENTNUM IS '기업 번호';
COMMENT ON COLUMN PROJECT.REVIEW.REVIEWNUM IS '리뷰 번호';
COMMENT ON COLUMN PROJECT.REVIEW.REVIEWTITLE IS '리뷰 글 제목';
COMMENT ON COLUMN PROJECT.REVIEW.REVIEWCONTENT IS '리뷰 글 내용';
COMMENT ON COLUMN PROJECT.REVIEW.REVIEWWRITEDAY IS '리뷰 글 작성 날짜';
COMMENT ON COLUMN PROJECT.REVIEW.REVIEWREADCNT IS '리뷰 글 조회수';
COMMENT ON COLUMN PROJECT.REVIEW.QNANUM IS '질답 번호';
COMMENT ON COLUMN PROJECT.STAY.STAYNUM IS '숙박업소 번호';
COMMENT ON COLUMN PROJECT.STAY.STAYTYPE IS '숙박업소 종류';
COMMENT ON COLUMN PROJECT.STAY.STAYNAME IS '숙박업소 이름';
COMMENT ON COLUMN PROJECT.STAY.STAYLOCATION IS '숙박업소 지역위치';
COMMENT ON COLUMN PROJECT.STAY.STAYGRADE IS '숙박업소 등급';
COMMENT ON COLUMN PROJECT.STAY.STAYADULTPRICE IS '숙박업소 어른 가격';
COMMENT ON COLUMN PROJECT.STAY.STAYKIDPRICE IS '숙박업소 어린이 가격';
COMMENT ON COLUMN PROJECT.STAY.STAYPHONE IS '숙박업소 전화번호';
COMMENT ON COLUMN PROJECT.STAY.STAYTITLE IS '숙박업소 글 제목';
COMMENT ON COLUMN PROJECT.STAY.STAYCONTENT IS '숙박업소 글 내용';
COMMENT ON COLUMN PROJECT.STAY.STAYWRITEDAY IS '숙박업소 글 작성 날짜';
COMMENT ON COLUMN PROJECT.STAY.STAYREADCNT IS '숙박업소 글 조회수';
COMMENT ON COLUMN PROJECT.STAY.STAYREPLECNT IS '숙박업소 댓글수';
COMMENT ON COLUMN PROJECT.STAY.STAYIMAGE IS '숙박업소 이미지';
COMMENT ON COLUMN PROJECT.STAY.STAYSITE IS '숙박업소 사이트';
COMMENT ON COLUMN PROJECT.STAY.ENTNUM IS '기업 번호';
COMMENT ON COLUMN PROJECT.TOUR.ATTTYPE IS '관광지 종류';
COMMENT ON COLUMN PROJECT.TOUR.ATTNAME IS '관광지 이름';
COMMENT ON COLUMN PROJECT.TOUR.ATTLOCATION IS '관광지 지역위치';
COMMENT ON COLUMN PROJECT.TOUR.ATTADULTPRICE IS '관광지 어른 가격';
COMMENT ON COLUMN PROJECT.TOUR.ATTKIDPRICE IS '관광지 어린이 가격';
COMMENT ON COLUMN PROJECT.TOUR.ATTPHONE IS '관광지 전화번호';
COMMENT ON COLUMN PROJECT.TOUR.ATTTITLE IS '관광지 글 제목';
COMMENT ON COLUMN PROJECT.TOUR.ATTNUM IS '관광지 번호';
COMMENT ON COLUMN PROJECT.TOUR.ATTCONTENT IS '관광지 글 내용';
COMMENT ON COLUMN PROJECT.TOUR.ATTWRITEDAY IS '관광지 글쓴 날짜';
COMMENT ON COLUMN PROJECT.TOUR.ATTREADCNT IS '관광지 조회수';
COMMENT ON COLUMN PROJECT.TOUR.ATTREPLECNT IS '관광지 댓글수';
COMMENT ON COLUMN PROJECT.TOUR.ATTIMAGE IS '관광지 이미지';
COMMENT ON COLUMN PROJECT.TOUR.ATTSITE IS '관광지 사이트';
COMMENT ON COLUMN PROJECT.TOUR.ENTNUM IS '기업 번호';
COMMENT ON COLUMN PROJECT.TOUR.ATTGOODS IS '좋아요 카운트';
COMMENT ON COLUMN PROJECT.TOUR.ATTIMAGECLONE IS '이미지 중복시에';



