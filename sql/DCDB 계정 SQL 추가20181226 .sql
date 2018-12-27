--
COMMENT ON COLUMN DC_BOARD_USED_TB.GOODSNAME IS '물품명';
COMMENT ON COLUMN DC_BOARD_GROUP_TB.ENDDATE IS '마감일';
COMMENT ON COLUMN DC_BOARD_GROUP_TB.GOODSNAME IS '물품명';

CREATE OR REPLACE VIEW DC_BOARD_GROUP_VIEW
AS
SELECT G.NO, G.BOARDNO, G.GOODSNAME, G.PRICE, G.ENDDATE, G.DEPOSIT,
    G.MAXCOUNT, G.CURRENTCOUNT, B.TITLE, B.CONTENT,
    (SELECT NAME FROM DC_GOODS_CATEGORY_TB GC WHERE GC.NO=G.GOODSNO)GOODSCATEGORY,
    (SELECT NICKNAME FROM DC_MEMBER_TB M WHERE M.NO=B.MEMBERNO) MEMBER,
    (SELECT VALUE FROM DC_CODE_TB C WHERE C.ID=G.STATUS) GSTATUS,
    (SELECT VALUE FROM DC_CODE_TB C WHERE C.ID=G.DEALTYPE) DEALTYPE,
    B.WRITEDATE,B.VIEWCOUNT, B.STATUS
FROM DC_BOARD_GROUP_TB G
JOIN DC_BOARD_TB B ON (G.BOARDNO=B.NO)
WITH READ ONLY;

commit;
---------------------------------------
--썸네일 가져오는 쿼리입니당
SELECT SUBSTR(BEF, 0, INSTR(BEF, '"')-1) THUMBNAIL
FROM (SELECT SUBSTR(CONTENT, INSTR(CONTENT, 'img src="')+9) BEF
FROM DC_BOARD_GROUP_VIEW WHERE BOARDNO=11);

---------------------------------------
ALTER TABLE DC_MEMBER_TB ADD (DEPOSIT VARCHAR2(50));
COMMENT ON COLUMN DC_MEMBER_TB.DEPOSIT IS '사용자 계좌 번호';
COMMIT;

---------------------------------------
ALTER TABLE DC_MEMBER_TB ADD(BANK VARCHAR2(50));
COMMENT ON COLUMN DC_MEMBER_TB.BANK IS '사용자 은행';

ALTER TABLE DC_MEMBER_TB ADD CONSTRAINT FK_MEMBER_TO_BANK FOREIGN KEY (
   BANK
)
REFERENCES DC_CODE_TB (
   ID
);
COMMIT;
--------------------------------------
INSERT INTO "DCDB"."DC_CODE_TB" (ID, VALUE, ATT) VALUES ('BANK001', '기업은행', '은행정보');
INSERT INTO "DCDB"."DC_CODE_TB" (ID, VALUE, ATT) VALUES ('BANK002', '국민은행', '은행정보');
INSERT INTO "DCDB"."DC_CODE_TB" (ID, VALUE, ATT) VALUES ('BANK003', '카카오뱅크', '은행정보');
INSERT INTO "DCDB"."DC_CODE_TB" (ID, VALUE, ATT) VALUES ('BANK004', '신한은행', '은행정보');
INSERT INTO "DCDB"."DC_CODE_TB" (ID, VALUE, ATT) VALUES ('BANK005', '농협', '은행정보');

COMMIT;


