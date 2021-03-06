--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-02-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER_CENTER
--------------------------------------------------------

  CREATE TABLE "MOREMORE"."CUSTOMER_CENTER" 
   (	"CUSTOMER_NO" VARCHAR2(200 BYTE), 
	"USER_NO" NUMBER, 
	"CUSTOMER_SUBJECT" VARCHAR2(300 BYTE), 
	"CUSTOMER_CONTENT" VARCHAR2(3000 BYTE), 
	"CUSTOMER_IMAGE" VARCHAR2(300 BYTE), 
	"CUSTOMER_REGDATE" DATE, 
	"CUSTOMER_CATEGORY" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_NO" IS '고객센터 글번호';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_SUBJECT" IS '글제목';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_CONTENT" IS '글내용';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_IMAGE" IS '글 이미지';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_REGDATE" IS '글 작성일';
   COMMENT ON COLUMN "MOREMORE"."CUSTOMER_CENTER"."CUSTOMER_CATEGORY" IS '글 카테고리';
REM INSERTING into MOREMORE.CUSTOMER_CENTER
SET DEFINE OFF;
Insert into MOREMORE.CUSTOMER_CENTER (CUSTOMER_NO,USER_NO,CUSTOMER_SUBJECT,CUSTOMER_CONTENT,CUSTOMER_IMAGE,CUSTOMER_REGDATE,CUSTOMER_CATEGORY) values ('5',21,'아이디와 패스워드를 잊어버렸을때 ','아이디와 패스워드 찾기를 한다 ','images/logo4.png',to_date('22/03/02','RR/MM/DD'),'공지사항');
--------------------------------------------------------
--  DDL for Index PK_CUSTOMER_CENTER
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOREMORE"."PK_CUSTOMER_CENTER" ON "MOREMORE"."CUSTOMER_CENTER" ("CUSTOMER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CUSTOMER_CENTER
--------------------------------------------------------

  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" ADD CONSTRAINT "PK_CUSTOMER_CENTER" PRIMARY KEY ("CUSTOMER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_REGDATE" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "MOREMORE"."CUSTOMER_CENTER" MODIFY ("CUSTOMER_NO" NOT NULL ENABLE);
