--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "MOREMORE"."USERS" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(100 BYTE), 
	"USER_PWD" VARCHAR2(100 BYTE), 
	"USER_NAME" VARCHAR2(100 BYTE), 
	"USER_PHONE" VARCHAR2(100 BYTE), 
	"USER_EMAIL" VARCHAR2(100 BYTE), 
	"USER_GENDER" VARCHAR2(50 BYTE), 
	"USER_JOINDATE" DATE, 
	"USER_TYPE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into MOREMORE.USERS
SET DEFINE OFF;
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (1,'admin00','qwqwqw111','강감찬','8117-8174','user1@test.com','남자',to_date('19/01/01','RR/MM/DD'),'관리자');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (2,'admin11','qwqwqw222','연개소문','1949-9363','user2@test.com','남자',to_date('19/01/02','RR/MM/DD'),'관리자');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (3,'funding00','qwqwqw333','계백','0020-8389','user3@test.com','남자',to_date('19/01/03','RR/MM/DD'),'펀딩 판매자');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (4,'goods00','qwqwqw444','로제','8837-5232','user4@test.com','여자',to_date('19/01/04','RR/MM/DD'),'상품 판매자');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (5,'users00','qwqwqw555','에스파','4924-1642','test@com','여자',to_date('19/01/05','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (6,'auseruser1','qwqwqw666','김슬기','0705-7655','test@com','여자',to_date('19/01/06','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (7,'useruser20','qwqwqw777','김화사','0235-3872','test11@com','남자',to_date('19/01/07','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (8,'test11241','qwqwqw888','오서현','0322-2379','test@com','남자',to_date('19/01/08','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (9,'qqqq3232','qwqwqw999','김지수','0201-8448','ttt@com','여자',to_date('19/01/09','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (10,'qwqw99993','qwqwqw1110','웬디','0019-1293','tttt@cod','남자',to_date('19/01/10','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (11,'qwqw89893','qwqwqw1221','손나은','6622-7527','dtttt@com','여자',to_date('19/01/11','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (12,'wewe89894','qwqwqw1332','이혜리','1083-4856','test11@com','남자',to_date('19/01/12','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (13,'test91125','qwqwqw1443','조유나','0646-6496','test@com','남자',to_date('19/01/13','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (14,'test911225','qwqwqw1554','닝닝','7526-6767','test@com','남자',to_date('19/01/14','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (15,'test19995','qwqwqw1665','예리','7695-9865','erw44@com','남자',to_date('19/01/15','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (16,'aaa18886','qwqwqw1776','유아','0025-8755','test11@com','남자',to_date('19/01/16','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (17,'qwqw17777','qwqwqw1887','김윈터','0221-9441','asd5656@com','남자',to_date('19/01/17','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (18,'rtr19993','qwqwqw1998','홍태웅','7617-7439','dwqk9@com','남자',to_date('19/01/18','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (19,'vds19992','qwqwqw2109','제갈은숙','0646-6957','grjf22@com','남자',to_date('19/01/19','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (20,'tgvd12341','qwqwqw2220','정창준','2961-7311','jrene@com','남자',to_date('19/01/20','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (21,'tgvd12352','qwqwqw2331','추윤아','3413-2871','tz0ys@com','남자',to_date('19/01/21','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (22,'tgvd12363','qwqwqw2442','송태호','7879-9936','lrxwk@com','남자',to_date('19/01/22','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (23,'tgvd12374','qwqwqw2553','장은진','9649-6663','nbvlk@com','남자',to_date('19/01/23','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (24,'tgvd12381','qwqwqw2664','윤유연','0054-8984','ewqqd@com','여자',to_date('19/01/24','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (25,'useruser30','qwqwqw2775','양종현','0039-7863','wqeqd@com','남자',to_date('19/01/25','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (26,'useruser40','qwqwqw2886','류기환','0223-5974','savs@com','여자',to_date('19/01/26','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (27,'test113q','qwqwqw2997','양태연','0168-5391','rger@com','남자',to_date('19/01/27','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (28,'Tttt2324q','qwqwqw3108','배성훈','9097-7284','dqwsx@com','남자',to_date('19/01/28','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (29,'qwqw7979a','qwqwqw3219','전영혜','8676-7134','saxc@com','남자',to_date('19/01/29','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (30,'qwqw6969s','qwqwqw3330','윤용태','0010-2840','wqqw@com','남자',to_date('19/01/30','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (31,'wewe8990s','qwqwqw3441','권춘수','1378-8744','yrjutu@com','여자',to_date('20/02/01','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (32,'test9113f','qwqwqw3552','고미정','5422-9815','hthte@com','남자',to_date('20/02/02','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (33,'test91123f','qwqwqw3663','최경하','8022-1389','weffew@com','여자',to_date('20/02/03','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (34,'test1999a','qwqwqw3774','예도훈','8359-9491','sas@com','남자',to_date('20/02/04','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (35,'aaa1889v','qwqwqw3885','이준석','0005-8597','saax@com','남자',to_date('20/02/05','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (36,'qwqw1778v','qwqwqw3996','노우식','0931-2391','cccd@com','남자',to_date('20/02/06','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (37,'rtr2000v','qwqwqw4107','예경진','4131-1445','saas@com','남자',to_date('20/02/07','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (38,'vds2000j','qwqwqw4218','백준혁','8790-2383','kwffek@com','여자',to_date('20/02/08','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (39,'test2000lk','qwqwqw4329','한용진','9965-3479','adwjd@com','남자',to_date('20/02/09','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (40,'aaa1890k','qwqwqw4440','장바다','9810-9716','qwdlq@com','여자',to_date('20/02/10','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (41,'qwqw1779k','qwqwqw4551','서빛나','1306-5359','adsads788@com','남자',to_date('20/02/11','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (42,'rtr2001k','qwqwqw4662','성조은','5355-9538','adwad7@com','남자',to_date('20/02/12','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (43,'vds2001z','qwqwqw4773','정새롬','5138-4531','bebbf67@com','남자',to_date('20/02/13','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (44,'useruser5z','qwqwqw4884','황보나봄','0038-8593','asasqq899@com','남자',to_date('20/02/14','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (45,'useruser6x','qwqwqw4995','이마음','2917-9957','qefkqfe88@com','여자',to_date('20/02/15','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (46,'test114x','qwqwqw5106','권산다라','4139-3593','addwl78@com','남자',to_date('20/02/16','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (47,'Tttt2325v','qwqwqw5217','황바람','0482-6348','qefkewfk00@com','여자',to_date('20/02/17','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (48,'qwqw5959v','qwqwqw5328','배아람','0086-3560','sa0sa0@com','남자',to_date('20/02/18','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (49,'qwqw4949b','qwqwqw5439','사공하얀','8894-4712','adad24@com','남자',to_date('20/02/19','RR/MM/DD'),'회원');
Insert into MOREMORE.USERS (USER_NO,USER_ID,USER_PWD,USER_NAME,USER_PHONE,USER_EMAIL,USER_GENDER,USER_JOINDATE,USER_TYPE) values (50,'bnbn999b','qwqwqw999','윤빛나','0260-6128?','qdwoqwo32@com','남자',to_date('20/02/20','RR/MM/DD'),'회원');
