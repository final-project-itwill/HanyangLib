-- hanyang.sql

-- 1. Member 테이블
CREATE TABLE member (
	 m_id				VARCHAR(25)					PRIMARY KEY
	,m_pw				VARCHAR(25)					NOT NULL
	,m_name			VARCHAR(10)					NOT NULL
	,m_nick			VARCHAR(15)					NOT NULL	UNIQUE
	,m_birth			DATETIME						NOT NULL
	,m_gender		CHAR(1)						NOT NULL
	,m_zip			INT(10)						NOT NULL
	,m_add1			VARCHAR(255)				NOT NULL
	,m_add2			VARCHAR(255)				NOT NULL
	,m_tel			VARCHAR(20)					NOT NULL
	,m_email			VARCHAR(50)					NOT NULL
	,m_mailcheck	CHAR(1)						NOT NULL		CHECK(m_mailcheck IN('Y', 'N'))
	,m_smscheck		CHAR(1)						NOT NULL		CHECK(m_smscheck IN('Y', 'N'))
	,m_grade			CHAR(1)						NOT NULL		DEFAULT 'C'		CHECK(m_grade IN('A', 'B', 'C', 'F'))
	,m_gudok			CHAR(1)						NOT NULL
	,m_point			INT(10) UNSIGNED			NOT NULL		DEFAULT 0
	,m_heat			DECIMAL(4,1) UNSIGNED	NOT NULL		DEFAULT 36.5
	,m_rdate			DATETIME						NOT NULL		DEFAULT current_timestamp
);

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'webmaster', '12341234', '김경환', '깅깅깅', '1992-12-03', 'M', '12345','강원도', '춘천시', '010-1234-5678', 'webmaster@itwill.com', 'Y', 'Y', 'A', 'Y', 0, 100 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'ksh134625', '12341234', '김성훈', '충청도사나이', '1994-12-24', 'M', '12345','충청남도', '대전광역시', '010-1234-5679', 'ksh135246@itwill.com', 'Y', 'Y', 'B', 'N', 12500, 84.3 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'hanju1004', '12341234', '김한주', '서울사나이', '1996-11-25', 'M', '12345', '서울특별시', '강남구', '010-1234-5680', 'hanju1004@itwill.com', 'Y', 'Y', 'B', 'Y', 9800, 64.2 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'mimimi05', '12341234', '방미연', '지나가는1인', '2001.01.01', 'F', '12345', '부산광역시', '부산부산', '010-1234-5681', 'mimimi05@itwill.com', 'Y', 'Y', 'C', 'Y', 1200, 37.8 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'hanyihanyi', '12341234', '강한이', '행복한돼지', '2003.05.23', 'F', '12345', '경상남도', '영천시', '010-1234-5682', 'hanyihanyi@itwill.com', 'Y', 'Y', 'B', 'N', 5200, 72.2 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'cloudd81', '12341234', '김경환', '햄최6', '1992.12.12', 'M', '12345', '경기도 화성시 매송로 360번길 13', '107-401', '010-1234-5683', 'cloudd81@itwill.com', 'Y', 'Y', 'C', 'Y', 100, 36.5 );

INSERT member( m_id, m_pw, m_name, m_nick, m_birth, m_gender, m_zip, m_add1, m_add2, m_tel, m_email, m_mailcheck, m_smscheck, m_grade, m_gudok, m_point, m_heat )
VALUES ( 'cheonwoobabo', '12341234', '구천우', '너냐', '2013.01.01', 'F', '12345', '제주도', '서귀포시', '010-1234-5684', 'cheonwoobabo@itwill.com', 'N', 'N', 'F', 'N', 0, 0 );


-- 2. 도서 테이블
CREATE TABLE book (
	 b_code			VARCHAR(20)		PRIMARY KEY
	,b_name			VARCHAR(100)	NOT NULL
	,b_type			VARCHAR(10)		NOT NULL    CHECK(b_type IN ('novel', 'essay', 'humanity', 'science', 'yearly', 'monthly'))
	,b_gudok			CHAR(1)			NOT NULL		CHECK(b_gudok IN ('Y', 'N'))
	,b_author		VARCHAR(50)		NOT NULL
	,b_publish		VARCHAR(50)		NOT NULL
	,b_page			INT(5)			NOT NULL
	,b_price			INT(10)			NOT NULL
	,b_cdate			DATETIME			NOT NULL		DEFAULT current_timestamp
	,b_rdate			DATETIME			NOT NULL		DEFAULT current_timestamp
	,b_bookcover	VARCHAR(200)	NOT NULL		DEFAULT 'none.jpg'
	,b_coversize	BIGINT			NOT NULL
	,b_des			TEXT
);


INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788936438838', '아버지의 해방일지', 'novel', 'N', '정지아', '창비', 268, 12000, '2022-09-02', 'far.jpg', 477888900, '미스터리 같은 한 남자가 헤쳐온 역사의 격랑' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788956608556', '구의 증명', 'novel', 'Y', '최진영', '은행나무', 180, 6480, '2015-05-30', 'goo.jpg', 360221000, '만약 네가 먼저 죽는다면 나는 너를 먹을 거야.' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788937880384', '헝거게임', 'novel', 'N', '수잔 콜린스', '북폴리오', 376, 8190, '2009-10-31', 'hunger01.jpg', 429447800, '수잔 콜린스의 ''헝거 게임 3부작''의 첫 번째 작품<헝거게임>' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788993357509', '등산이 내 몸을 망친다', 'essay', 'N', '정덕환,안재용,윤현구', '비타북스', 272, 9100, '2011-04-01', 'mybody.jpg', 417784400, '건강을 위해 찾은 산에서 오히려 건강을 잃는다면?' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9791189159634', '식객 허영만의 백반기행', 'essay', 'Y', '허영만', '가디언', 352, 12500, '2020-05-14', 'back.jpg', 258846211, '식객 허영만이라면 믿고 먹는다' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788936476694', '나의 문화유산 답사기:산사 순례', 'humanity', 'Y', '유홍준', '창비', 392, 12600, '2018-08-24', 'sansa.jpg', 34477441114, '산과 절을 뗄 수 없듯, ''답사기''와 산사도 한몸' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9791197918117', '수학의 위로', 'humanity', 'Y', '마이클 프레임', '디플롯', 264, 13000, '2022-11-07', 'math.jpg', 212111411, '"매일 이별하며" 살아가는 우리에게 어느 노년의 수학자가 전하려는 메세지는 ''위로''다' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9791166817878', '군주론', 'humanity', 'Y', '니콜로 마키벨리아', '현대지성', 256, 4900, '2021-07-26', 'maki.jpg', 398441647, '냉엄한 현실에서 리더가 갖춰야 할 처세술과 리더십' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( '9788964942161', '매듭 교과서', 'science', 'Y', '박재영', '보누스', 224, 7200, '2021-03-10', 'knot.jpg', 321654987987, '베테랑을 위한 캠핑, 낚시, 등산 간단 매듭법' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( 'yearly', '1년 구독', 'yearly', 'Y', '한양서재', '한양서재', 0, 99000, '2022-11-23', 'ygudok.jpg', 124444, '한양서재의 1년 구독 서비스입니다.' );

INSERT book( b_code, b_name, b_type, b_gudok, b_author, b_publish, b_page, b_price, b_cdate, b_bookcover, b_coversize, b_des )
VALUES ( 'monthly', '1개월 구독', 'monthly', 'Y', '한양서재', '한양서재', 0, 9000, '2022-11-23', 'mgudok.jpg', 124444, '한양서재의 1개월 구독 서비스입니다.' );

-- 3. 공지사항 테이블
CREATE TABLE notice (
	 n_no			INT				PRIMARY KEY AUTO_INCREMENT
	,n_type		VARCHAR(10)		NOT NULL		DEFAULT 'info'	CHECK(n_type IN ('book', 'comm', 'payment', 'event', 'info'))
	,n_title		VARCHAR(255)	NOT NULL
	,n_content	TEXT				NOT NULL
	,n_rdate		DATETIME			NOT NULL		DEFAULT current_timestamp
	,n_writer	VARCHAR(25)		NOT NULL
	,FOREIGN KEY(n_writer) REFERENCES member(m_id) 
);

INSERT notice( n_type, n_title, n_content, n_writer )
VALUES ( 'info', '한양서재 이용법', '한양 서재를 이용하시는 방법!', 'webmaster' );

INSERT notice( n_type, n_title, n_content, n_writer )
VALUES ( 'book', 'E-Book 구매 시 주의해주세요', 'E-Book은 종이책이 아닌 전자책입니다.', 'webmaster' );

INSERT notice( n_type, n_title, n_content, n_writer )
VALUES ( 'comm', '깨끗한 커뮤니티를 조성해주세요', '신고를 많이 받으신 회원분들은 커뮤니티 이용에 제한이 있을 수 있습니다', 'webmaster' );

INSERT notice( n_type, n_title, n_content, n_writer )
VALUES ( 'event', '한양서재 오픈 기념 이벤트',	'한양서재에서 스타벅스 기프티콘을 쏩니다!', 'webmaster' );

INSERT notice( n_type, n_title, n_content, n_writer )
VALUES ( 'payment', '환불 요청 안내', '환불을 원하시는 분들은 연락주세요', 'webmaster' );


-- 4. 커뮤니티 테이블
CREATE TABLE community(
    c_code   VARCHAR(20)    PRIMARY KEY
   ,c_name   VARCHAR(30)    NOT NULL
   ,c_des    TEXT           NOT NULL
   ,c_bcode  VARCHAR(20)    NOT NULL
   ,c_local  VARCHAR(50)    NOT NULL
   ,c_id     VARCHAR(25)    NOT NULL
   ,c_chat   VARCHAR(50)    NOT NULL
   ,c_banner VARCHAR(50)    NOT NULL        DEFAULT 'none.jpg'
   ,c_count  INT            NOT NULL        DEFAULT 3
   ,c_state  CHAR(1)        NOT NULL        DEFAULT 'i' check(c_state in ('i', 'd', 'e'))
   ,c_rdate  DATETIME       NOT NULL        DEFAULT CURRENT_TIMESTAMP
   ,FOREIGN KEY(c_id) REFERENCES member(m_id)
   ,FOREIGN KEY(c_bcode) REFERENCES book(b_code)
);


INSERT INTO community (c_code, c_name, c_des, c_bcode, c_local
, c_id, c_chat, c_banner ,c_count, c_state)
VALUES ('com001', '산악회', '건강 등산법 토론 및 등산', '9788993357509'
, '관악구, 강남구, 서초구', 'ksh134625', 'https://open.kakao.com/o/giKjcbPe','대표사진.png', 20, 'i');


INSERT INTO community (c_code, c_name, c_des, c_bcode, c_local
, c_id, c_chat, c_banner ,c_count, c_state)
VALUES ('com002', '책췍check', '책을 가지고 독서모임', '9788937880384'
, '은평구,서대문구', 'webmaster', 'https://open.kakao.com/o/giKjcbPe','대표사진2.png', 8 , 'd');


INSERT INTO community (c_code, c_name, c_des, c_bcode, c_local
, c_id, c_chat, c_banner ,c_count, c_state)
VALUES ('com003', '읽어서 소설속으로', '소설을 즐기고 읽는자들의 토론모임', '9788936438838'
, '송파구, 강동구', 'hanyihanyi', 'https://open.kakao.com/o/giKjcbPe','대표사진3.png', 6 , 'e');


INSERT INTO community (c_code, c_name, c_des, c_bcode, c_local
, c_id, c_chat, c_banner ,c_count, c_state)
VALUES ('com004', '놀면좋지않니', '놀고놀듯이일하다', '9791197918117'
, '광진구', 'hanju1004', 'https://open.kakao.com/o/giKjcbPe','대표사진4.png', 15 , 'i');


INSERT INTO community (c_code, c_name, c_des, c_bcode, c_local
, c_id, c_chat, c_banner ,c_count, c_state)
VALUES ('com005', '굶주린돼지', '블루리본서베이 선정 맛집', '9791189159634'
, '광진구', 'hanyihanyi', 'https://open.kakao.com/o/giKjcbPe','대표사진6.png', 18 , 'i');


-- 5. 커뮤니티 신청 테이블
CREATE TABLE community_signup (
     s_no        	INT          AUTO_INCREMENT	PRIMARY KEY
    ,s_code      	VARCHAR(20)  NOT NULL
    ,s_id        	VARCHAR(25)  NOT NULL
    ,s_nick      	VARCHAR(15)  NOT NULL
    ,s_state     	CHAR(1)      NOT NULL  DEFAULT 'i' check(s_state in ('i', 'r', 's'))
    ,s_surveycode	VARCHAR(20)  NOT NULL 
    ,s_rdate		DATETIME	NOT NULL  DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY(s_code) REFERENCES community(c_code)
    ,FOREIGN KEY(s_id) REFERENCES member(m_id)
    ,FOREIGN KEY(s_nick) REFERENCES member(m_nick)
);

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com001', 'hanju1004', '서울사나이', 'i', 's221120001');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com001', 'mimimi05', '지나가는1인', 'r', 's221120001');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com001', 'hanyihanyi', '행복한돼지', 's', 's221120001');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com002', 'cheonwoobabo', '너냐', 's', 's221121001');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com002', 'ksh134625', '충청도사나이', 's', 's221121001');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'webmaster', '깅깅깅', 'i', 's221121002');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'ksh134625', '충청도사나이', 'r', 's221121002');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'hanju1004', '서울사나이', 'r', 's221121002');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'mimimi05', '지나가는1인', 'r', 's221121002');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'cloudd81', '햄최6', 's', 's221121002');

INSERT INTO community_signup(s_code , s_id, s_nick,s_state ,s_surveycode)
VALUES ('com003', 'cheonwoobabo', '너냐', 's', 's221121002');


-- 6. 커뮤니티 활동 테이블
CREATE TABLE community_ac (
     ac_no       INT   			AUTO_INCREMENT       PRIMARY KEY
    ,ac_id       VARCHAR(25)  NOT NULL
    ,ac_ccode    VARCHAR(20)  NOT NULL
    ,ac_cname    VARCHAR(30)  NOT NULL
    ,ac_manjok   INT          NOT NULL		CHECK(ac_manjok>=1 && ac_manjok<=5)
    ,ac_review   TEXT         NOT NULL
    ,ac_rdate    DATETIME  	NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY(ac_id) REFERENCES member(m_id)
    ,FOREIGN KEY(ac_ccode) REFERENCES community(c_code)
);

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review )
VALUES ( 'hanju1004', 'com001', '산악회', 4, '산은 힘들었지만 사람은 좋았다' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'hanju1004', 'com003', '읽어서 소설속으로', 5, '소설 좋아요' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'mimimi05', 'com003', '읽어서 소설속으로', 5
, '소설이 가진 힘은 위대합니다. 당신은 소설을 읽어야만 합니다. 당신이 소설을 읽을 때 한 세상이 만들어지는 것을 기억하십시오.' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'hanyihanyi', 'com001', '산악회', 3, '내려와서 먹는 음식이 맛있어야 하는데..' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'ksh134625', 'com002', '책췍check', 2, '내 생각이랑 달라서 좀 힘들었음' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'cheonwoobabo', 'com002', '책췍check', 1, '다음에도 할지 안할지 모르겠다' );

INSERT INTO community_ac( ac_id ,ac_ccode ,ac_cname ,ac_manjok ,ac_review)
VALUES ( 'cheonwoobabo', 'com003', '읽어서 소설속으로', 1, '소설 선정을 왜 이런 식으로 하는 건지' );


-- 7. 장바구니 테이블
CREATE TABLE cart(
   cart_no     INT(10)			AUTO_INCREMENT   PRIMARY KEY
  ,cart_code   VARCHAR(20)		NOT NULL
  ,cart_id      VARCHAR(25)  	NOT NULL
  ,FOREIGN KEY(cart_code) REFERENCES book(b_code)
  ,FOREIGN KEY(cart_id) REFERENCES member(m_id)
);
  
 
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788993357509','ksh134625');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9791197918117','ksh134625');
 INSERT INTO cart(cart_code,cart_id) VALUES ('yearly','hanju1004');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788937880384','hanju1004');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788993357509','hanyihanyi');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9791189159634','hanyihanyi');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788936476694','hanyihanyi');
 INSERT INTO cart(cart_code,cart_id) VALUES ('monthly','mimimi05');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788993357509','mimimi05');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788936438838','mimimi05');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9788937880384','mimimi05');
 INSERT INTO cart(cart_code,cart_id) VALUES ('9791189159634','cloudd81');


 -- 8. 결제 테이블
CREATE TABLE payment(
	 pay_no       varchar(50)    PRIMARY KEY   
	,pay_id       varchar(25)      NOT NULL 
	,pay_total    int(10)         NOT NULL 
	,pay_point    int(10)            
	,pay_result    int(10)         NOT NULL 
	,pay_status    char(1)         DEFAULT 'i'    CHECK(pay_status IN('c', 'i', 'd'))
	,FOREIGN KEY(pay_id) REFERENCES member(m_id)
);
 
INSERT INTO payment(pay_no, pay_id, pay_total, pay_point, pay_result, pay_status) VALUES ('20221121-001', 'ksh134625',22100, 0, 22100, 'd');
INSERT INTO payment(pay_no, pay_id, pay_total, pay_point, pay_result, pay_status) VALUES ('20221121-002', 'hanju1004',108190, 1000, 107190, 'd');
INSERT INTO payment(pay_no, pay_id, pay_total, pay_point, pay_result, pay_status) VALUES ('20221122-001', 'hanyihanyi',34200, 0, 34200, 'd');
INSERT INTO payment(pay_no, pay_id, pay_total, pay_point, pay_result, pay_status) VALUES ('20221122-002', 'mimimi05',39190, 3000, 36190, 'i');
INSERT INTO payment(pay_no, pay_id, pay_total, pay_point, pay_result, pay_status) VALUES ('20221122-003', 'cloudd81',12500, 0, 12500, 'i');


-- 9. 결제 상세 테이블
 CREATE TABLE d_payment(
  dpay_no      int            AUTO_INCREMENT   PRIMARY KEY  
 ,dpay_pno      varchar(50)      NOT NULL
 ,dpay_code      varchar(20)      NOT NULL
 ,dpay_price   int(10)         NOT NULL    DEFAULT 0
 ,FOREIGN KEY(dpay_pno) REFERENCES payment(pay_no)
 ,FOREIGN KEY(dpay_code) REFERENCES book(b_code)
  );
 
 
INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price)
VALUES ('20221121-001','9788993357509',9100);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221121-001','9791197918117',13000);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221121-002','yearly',100000);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221121-002','9788937880384',8190);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-001','9788993357509',9100);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-001','9791189159634',12500);
 
INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-002','9788936476694',12600);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-002','monthly',9900);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-002','9788993357509',9100);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-002','9788936438838',12000);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-002','9788937880384',8190);

INSERT INTO d_payment (dpay_pno, dpay_code, dpay_price) 
VALUES ('20221122-003','9791189159634',12500);

 
  
 -- 10. 나만의 서재
 
CREATE TABLE mylib(
	 lib_no	int				AUTO_INCREMENT 	PRIMARY KEY 
	,lib_id	varchar(25)		NOT NULL	
	,lib_bcode	varchar(20)		NOT NULL 
	,lib_proc	int(4)			NOT NULL	DEFAULT 0
	,FOREIGN KEY(lib_id) REFERENCES member(m_id)
	,FOREIGN KEY(lib_bcode) REFERENCES book(b_code)
);
  
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('ksh134625','9788993357509',100);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('ksh134625','9791197918117',18);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('hanju1004','9788937880384',100);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('hanyihanyi','9788993357509',98);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('hanyihanyi','9791189159634',100);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('hanyihanyi','9788936476694',31);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('mimimi05','9788964942161',27);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('mimimi05','9788993357509',98);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('mimimi05','9788936438838',65);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('mimimi05','9788937880384',34);
 INSERT INTO mylib(lib_id, lib_bcode, lib_proc)
 VALUES ('cloudd81','9791189159634',89);

-- 11. 방명록
CREATE TABLE visitor(
   vis_no         int            AUTO_INCREMENT    PRIMARY KEY 
  ,vis_pid         varchar(25)      NOT NULL
  ,vis_myid         varchar(25)      NOT NULL
  ,vis_content      text         NOT NULL
  ,vis_rdate      datetime      NOT NULL    DEFAULT CURRENT_TIMESTAMP
  ,FOREIGN KEY(vis_pid) REFERENCES member(m_id)
  ,FOREIGN KEY(vis_myid) REFERENCES member(m_id)
);
 
  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ('hanyihanyi','ksh134625','조만간 밥한끼 먹어요~', '2022-11-19');
  
  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ('hanyihanyi','mimimi05','보고싶어용 우리 한번 만나요', '2022-11-21');
  
  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ('hanyihanyi','cloudd81','"이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다.
영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..."','2022-11-18');

  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ('hanyihanyi', 'hanju1004', '엉니 너무 이뻐여', '2022-11-20' );

  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ( 'cloudd81','hanyihanyi','"이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다.
영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..."', '2022-11-19');

  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ( 'cloudd81','mimimi05','이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서...','2022-11-22');

  INSERT INTO visitor( vis_pid, vis_myid, vis_content, vis_rdate)
  VALUES ('cloudd81','ksh134625','한끼 밥 먹어요 조만간~', '2022-11-22' );
  

-- 12. 서평
CREATE TABLE bookreview(
	 br_no		int				AUTO_INCREMENT	PRIMARY KEY 
	,br_bcode	varchar(20)		NOT NULL
	,br_id		varchar(25)		NOT NULL
	,br_title	varchar(255)	NOT NULL
	,br_content	text			NOT NULL
	,br_star	int(1)			NOT NULL	CHECK (br_star >= 1 AND br_star <= 5)
	,br_count	int				NOT NULL	DEFAULT 0
	,br_rdate	datetime		NOT NULL	DEFAULT CURRENT_TIMESTAMP 
	,FOREIGN KEY(br_bcode) REFERENCES book(b_code)
	,FOREIGN KEY(br_id)	   REFERENCES member(m_id)
);


-- bookreview 행 추가 테스트
INSERT INTO bookreview(br_bcode, br_id, br_title, br_content, br_star, br_count)
VALUES('9791189159634', 'hanyihanyi', '내가 식객이 될거야', '허영만씨가 다닌 곳 꼭 다 가볼것이다', 4, 23);

INSERT INTO bookreview(br_bcode, br_id, br_title, br_content, br_star, br_count)
VALUES('9791189159634', 'cloudd81', '백반을 먹지 않고서야, 하루를 어찌 마감하리', '백반, 그것은 완벽한 음식이렸다', 4, 12);

INSERT INTO bookreview(br_bcode, br_id, br_title, br_content, br_star, br_count)
VALUES('9788936438838', 'mimimi05', '나의 아버지는?', '아버지의 인생은 무엇일까 관심도 없었지만 알 수도 없었던 그의 인생을 들여다 보았다', 5, 40);

INSERT INTO bookreview(br_bcode, br_id, br_title, br_content, br_star, br_count)
VALUES('9788936476694', 'hanju1004', '나의 문화유산 답사기:산사 순례', '문화유산이 이렇게 많았는지 몰랐다 가보고 싶다', 4, 30);

INSERT INTO bookreview(br_bcode, br_id, br_title, br_content, br_star, br_count)
VALUES('9791197918117', 'ksh134625', '수학이란 무엇인가.', '일상속에서도 수학을 적용시켜야 한다니.. ', 2, 120);


-- 13. 서평 댓글
CREATE TABLE brcomment(
	 brc_no			int	            AUTO_INCREMENT	PRIMARY KEY 
	,brc_pno			int	            NOT NULL
	,brc_id			varchar(25)     NOT NULL
	,brc_content	varchar(255) 	NOT NULL
	,brc_rdate		datetime	 	NOT NULL	DEFAULT CURRENT_TIMESTAMP 
	,FOREIGN KEY(brc_pno) 	REFERENCES bookreview(br_no)
	,FOREIGN KEY(brc_id)	REFERENCES member(m_id)
);


-- brcomment 행 추가 테스트
INSERT INTO brcomment(brc_pno, brc_id, brc_content)
VALUES(1, 'cloudd81', '동의합니다');

INSERT INTO brcomment(brc_pno, brc_id, brc_content)
VALUES(1, 'mimimi05', '혹시 비건에 대한 내용이 있나요?');

INSERT INTO brcomment(brc_pno, brc_id, brc_content)
VALUES(3, 'cloudd81', '아버지는, 택시드라이버~');

INSERT INTO brcomment(brc_pno, brc_id, brc_content)
VALUES(4, 'mimimi05', '진짜 그곳을 방문할 생각이 있으신가요???');

INSERT INTO brcomment(brc_pno, brc_id, brc_content)
VALUES(5, 'mimimi05', '수학에 대해 왜 그렇게 판단하시죠?');


-- 14. 1:1 문의
CREATE TABLE inquiry (
    ask_no      INT        			AUTO_INCREMENT PRIMARY KEY 
   ,ask_type    VARCHAR(20)           NOT NULL 
   ,ask_id      VARCHAR(100)          NOT NULL 
   ,ask_title   VARCHAR(100)          NOT NULL 
   ,ask_content TEXT                  NOT NULL 
   ,ask_rdate   DATETIME             NOT NULL  DEFAULT CURRENT_TIMESTAMP
   ,FOREIGN KEY(ask_id) REFERENCES member(m_id)
);

-- 행 삽입
INSERT INTO inquiry (ask_type ,ask_id ,ask_title ,ask_content)
VALUES ('community', 'hanju1004', '커뮤니티가 안들어가집니다', '커뮤니티신청을 했습니다 그런데 자꾸 거부당합니다 ㅜㅜ' );

INSERT INTO inquiry (ask_type ,ask_id ,ask_title ,ask_content)
VALUES ('payment', 'hanju1004', '책을 환불하고 싶은데 어떻게 하면 좋을까여?', 'ebook을 잘못 구매했습니다');

INSERT INTO inquiry (ask_type ,ask_id ,ask_title ,ask_content)
VALUES ('mylibrary', 'cloudd81', '구독 기간을 더 늘려주세요~', '구독기간이 조금 짧은거 같아요~늘려주세요');

INSERT INTO inquiry (ask_type ,ask_id ,ask_title ,ask_content)
VALUES ('etc', 'ksh134625', 'ebook에 오타가 있습니다', 'ebook에 오타가 있습니다 고쳐주세요');


-- 15. 1:1 답변
CREATE TABLE response (
     ans_no      INT        PRIMARY KEY
    ,ans_content TEXT       NOT NULL
    ,FOREIGN KEY(ans_no) REFERENCES inquiry(ask_no)
);

-- 행 삽입
    INSERT INTO response (ans_no, ans_content)
    VALUES (1, '죄송합니다. 혹시 들어가실 커뮤니티에 정한 책을 구매나 관심목록에 들어있나요?');
    
    INSERT INTO response (ans_no, ans_content)
    VALUES (2, '책을 환불해드리겠습니다. 영수증이미지를 보내주시면 환불해드리겠습니다');
    
    INSERT INTO response (ans_no, ans_content)
    VALUES (3, '말씀해주신 사항을 참고해보겠습니다');
    
    INSERT INTO response (ans_no, ans_content)
    VALUES (4, '오타가 있는 ebook내용을 캡쳐해서 보내주세요 처리해드리겠습니다');


# 16. 설문지
CREATE TABLE survey (
	 sv_code	varchar(20)     PRIMARY KEY
	,sv_comcode	varchar(20)		NOT NULL
	,sv_id		varchar(25)     NOT NULL
	,sv_title	varchar(100)    NOT NULL
	,sv_des		text	        
	,sv_rdate	datetime	    NOT NULL	DEFAULT CURRENT_TIMESTAMP 
	,sv_edate	datetime	    NOT NULL
	,sv_max		int(5)          NOT NULL
	,sv_status	char(1)         NOT NULL	DEFAULT 'N'	CHECK(sv_status IN('Y', 'N'))
	,FOREIGN KEY(sv_comcode) 	REFERENCES community(c_code)
	,FOREIGN KEY(sv_id)		REFERENCES member(m_id)
);


-- survey 행 추가 테스트
INSERT INTO survey(sv_code, sv_comcode, sv_id, sv_title, sv_des, sv_edate, sv_max)
VALUES('s221120-001', 'com001', 'ksh134625', '등산', '등산을 좋아하는 사람', '2022-11-30', 3);

INSERT INTO survey(sv_code, sv_comcode, sv_id, sv_title, sv_des, sv_edate, sv_max)
VALUES('s221121-001', 'com004', 'hanju1004', '게임', '게임을 좋아하는 사람', '2022-12-03', 10);

INSERT INTO survey(sv_code, sv_comcode, sv_id, sv_title, sv_des, sv_edate, sv_max)
VALUES('s221121-002', 'com005', 'hanyihanyi', '먹보의 하루', '햄최5만 가능', '2022-11-25', 4);


# 17. 설문지 상세
CREATE TABLE dsurvey(
	 dsv_no			int				AUTO_INCREMENT	PRIMARY KEY
	,dsv_code		varchar(20)     NOT NULL
	,dsv_type		varchar(10)     NOT NULL	
						CHECK (dsv_type IN('gaek', 'check', 'drop', 'ju', 'rating', 'time', 'schedule', 'etc'))
	,dsv_order		varchar(20)     NOT NULL
	,dsv_subject	varchar(100)	NOT NULL
	,dsv_check		char(1)         NOT NULL	DEFAULT 'Y'	 CHECK (dsv_check IN('Y', 'N'))
	,FOREIGN KEY(dsv_code) 	REFERENCES survey(sv_code)
);


-- dsurvey 행 추가 테스트
INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'gaek', 'od01', '등산을 얼마나 좋아하십니까?', 'Y');

INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'gaek', 'od02', '한달에 몇회 하십니까?', 'Y');

INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'check', 'od03', '등산해본 산을 체크해주세요.', 'Y');

INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'ju', 'od04', '산을 타면서 힘들었던 것', 'N');

INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'time', 'od05', '선호 시간대 말해주세요', 'Y');

INSERT INTO dsurvey(dsv_code, dsv_type, dsv_order, dsv_subject, dsv_check)
VALUES('s221120-001', 'schedule', 'od06', '12월에 가능한 등산 일정', 'Y');



-- 18. 설문지 생성
CREATE TABLE choice(
	 ch_no		int         	AUTO_INCREMENT		PRIMARY KEY
	,ch_code	varchar(20) 	NOT NULL
	,ch_dsvno	int				NOT NULL
	,ch_order	varchar(20)		NOT NULL
	,ch_type	varchar(10)		NOT NULL
	,ch_anscode	varchar(20) 	NOT NULL
	,ch_content	varchar(100)	NOT NULL	DEFAULT ''
	,FOREIGN KEY(ch_code) 	REFERENCES survey(sv_code)
	,FOREIGN KEY(ch_dsvno) 	REFERENCES dsurvey(dsv_no)
);


-- choice 행 추가 
INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 1, 'od01', 'gaek', 'g01', '매우 좋음');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 1, 'od01', 'gaek', 'g02', '좋음');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 1, 'od01', 'gaek', 'g03', '싫음');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 1, 'od01', 'gaek', 'g04', '매우 싫음');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 2, 'od02', 'gaek', 'g01', '1~2회');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 2, 'od02', 'gaek', 'g02', '3~4회');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 2, 'od02', 'gaek', 'g03', '5회 이상');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 3, 'od03', 'check', 'c01', '관악산');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 3, 'od03', 'check', 'c02', '한라산');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 3, 'od03', 'check', 'c03', '백두산');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 3, 'od03', 'check', 'c04', '남한산성');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 3, 'od03', 'etc', 'e01', '기타');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 4, 'od04', 'ju', 'j01', '');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 5, 'od05', 'time', 'j01', '');

INSERT INTO choice(ch_code, ch_dsvno, ch_order, ch_type, ch_anscode, ch_content)
VALUES('s221120-001', 6, 'od06', 'schedule', 'j01', '');




-- 19. 설문지 답변
CREATE TABLE answer(
	 ans_no			int	            AUTO_INCREMENT		PRIMARY KEY
	,ans_code		varchar(20)    	NOT NULL
	,ans_dsvno		int				NOT NULL	
	,ans_order		varchar(20)     NOT NULL
	,ans_anscode	varchar(20) 	NOT NULL
	,ans_id			varchar(100)    NOT NULL
	,ans_content	varchar(255)	NOT NULL	DEFAULT ''
	,FOREIGN KEY(ans_code) 	REFERENCES survey(sv_code)
	,FOREIGN KEY(ans_dsvno) REFERENCES dsurvey(dsv_no)
	,FOREIGN KEY(ans_id) 	REFERENCES member(m_id)
);


-- answer 행 추가 
INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 1, 'od01', 'g03', 'mimimi05', '싫음');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 2, 'od02', 'g02', 'mimimi05', '3~4회');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 3, 'od03', 'c03', 'mimimi05', '백두산');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 3, 'od03', 'c04', 'mimimi05', '남한산성');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 4, 'od04', 'j01', 'mimimi05', '오이 좀 주지 마요');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 5, 'od05', 't01', 'mimimi05', '오전 10:00');

INSERT INTO answer(ans_code, ans_dsvno, ans_order, ans_anscode, ans_id, ans_content)
VALUES('s221120-001', 6, 'od06', 's01', 'mimimi05', '12/25');


-- 20. 설문지 템플릿 정보
CREATE TABLE temp (
      tem_no     INT          AUTO_INCREMENT NOT NULL PRIMARY KEY
     ,tem_title  VARCHAR(100)    NOT NULL
     ,tem_code   VARCHAR(20)     NOT NULL  UNIQUE
);
    
-- 행 삽입
INSERT INTO temp (tem_title ,tem_code)
VALUES ('기본 1', 'tmp001');

INSERT INTO temp (tem_title ,tem_code)
VALUES ('기본 2', 'tmp002');


-- 21. 설문지 템플릿 상세
CREATE TABLE temp_info (
      tefo_no       INT          AUTO_INCREMENT NOT NULL PRIMARY KEY
     ,tefo_code     VARCHAR(20)    NOT NULL
     ,tefo_type     VARCHAR(20)    NOT NULL
     						CHECK(tefo_type IN('gaek', 'check', 'drop', 'ju', 'rating', 'time', 'schedule', 'etc'))
     ,tefo_order    VARCHAR(20)    NOT NULL
     ,tefo_subject  VARCHAR(255)   NOT NULL 
     ,tefo_check    CHAR(1)        NOT NULL DEFAULT 'Y' CHECK(tefo_check IN ('N', 'Y'))
     ,FOREIGN KEY(tefo_code) REFERENCES temp(tem_code)
);

-- 행 삽입
INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp001', 'ju', 'od01', '당신의 이름은 무엇입니까?', 'Y');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp001', 'ju', 'od02', '당신은 이 커뮤니티에서 무엇을 하고 싶으십니까?', 'Y');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp001', 'check', 'od03', '이 커뮤니티를 어떻게 알게 되셨나요?', 'Y');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp001', 'ju', 'od04', '커뮤니티를 참여하시면서 바라는 점이 있다면 적어주세요', 'N');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp002', 'gaek', 'od01', '해당 책을 어느정도로 읽으셨나요?', 'Y');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp002', 'rating', 'od02', '책에 별점을 주신다면 몇점을 주실건가요?', 'Y');

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp002', 'drop', 'od03', '모임에 참석한다면 어느 지역을 선호하시나요?', 'Y');   

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp002', 'check', 'od04', '어떤 형식의 모임을 선호하시나요?', 'Y');   

INSERT INTO temp_info (tefo_code ,tefo_type, tefo_order, tefo_subject, tefo_check)
VALUES ('tmp002', 'gaek', 'od05', '참여시 참여비용이 발생해도 괜찮으신가요?', 'Y');  



-- 22. 설문지 생성 테이블
CREATE TABLE c_temp_info (
     ch_no         INT          AUTO_INCREMENT NOT NULL PRIMARY KEY
    ,ch_code       VARCHAR(20)    NOT NULL
    ,ch_tefono     INT	          NOT NULL  
    ,ch_order      VARCHAR(20)    NOT NULL
    ,ch_type       VARCHAR(10)    NOT NULL
    ,ch_anscode    VARCHAR(20)    NOT NULL
    ,ch_content    VARCHAR(100)   NOT NULL
    ,FOREIGN KEY(ch_code) REFERENCES temp(tem_code)
    ,FOREIGN KEY(ch_tefono) REFERENCES temp_info(tefo_no)
);
    
     -- 행 삽입
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '1', 'od01', 'ju', 'j01', '');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '2', 'od02', 'ju', 'j02', '');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '3', 'od03', 'check', 'c01', '커뮤니티 검색');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '3', 'od03', 'check', 'c02', '추천');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '3', 'od03', 'etc', 'e01', '');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp001', '4', 'od04', 'ju', 'j03', '관악산');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '5', 'od01', 'gaek', 'g01', '0~20%');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '5', 'od01', 'gaek', 'g02', '21~40%');    
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '5', 'od01', 'gaek', 'g03', '41~60%');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '5', 'od01', 'gaek', 'g04', '61~80%');
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '5', 'od01', 'gaek', 'g05', '81~100%');        
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '6', 'od02', 'rating', 'r01', '1');    
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '6', 'od02', 'rating', 'r02', '2');   
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '6', 'od02', 'rating', 'r03', '3');   
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '6', 'od02', 'rating', 'r04', '4');   
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '6', 'od02', 'rating', 'r05', '5');       
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '7', 'od03', 'drop', 'd01', '강동');           

    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '7', 'od03', 'drop', 'd02', '강서');         
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '7', 'od03', 'drop', 'd03', '강남');           
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '7', 'od03', 'drop', 'd04', '강북');           
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '8', 'od04', 'check', 'c01', '토론');           
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '8', 'od04', 'check', 'c02', '낭독');           
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '8', 'od04', 'check', 'c03', '서평 발표');      
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '8', 'od04', 'check', 'c04', '필사');         
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '8', 'od04', 'etc', 'e01', '');     
   
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '9', 'od05', 'gaek', 'g01', '네');     
    
    INSERT INTO c_temp_info (ch_code ,ch_tefono, ch_order, ch_type, ch_anscode, ch_content)
    VALUES ('tmp002', '9', 'od05', 'gaekhello', 'g02', '아니요');         
    
  