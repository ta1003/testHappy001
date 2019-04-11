CREATE TABLE ANSWERBOARD2(
	SEQ NUMBER NOT NULL,
	ID VARCHAR2(10) NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	REFER NUMBER NOT NULL,
	STEP NUMBER NOT NULL,
	DEPTH NUMBER NOT NULL,
	READCOUNT NUMBER NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT ANSWERBOARD2_PK PRIMARY KEY(SEQ)
);

CREATE SEQUENCE ANSWERBOARD2_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE MEMBER2(
	ID VARCHAR2(10) NOT NULL,
	PW VARCHAR2(25) NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	AUTH CHAR(1) NOT NULL,
	DELFLAG CHAR(1) NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT MEMBER2_CK CHECK (AUTH IN ('A','U')),
	CONSTRAINT MEMBER2_PK PRIMARY KEY(ID)
);

ALTER TABLE ANSWERBOARD2 ADD CONSTRAINT ANSWERBOARD2_FK FOREIGN KEY(ID) REFERENCES MEMBER2(ID);


INSERT INTO MEMBER2
(ID, PW, NAME, AUTH, DELFLAG, REGDATE)
VALUES('TEST001', 'TEST001', 'TEST1', 'A', 'Y', SYSDATE);

INSERT INTO MEMBER2
(ID, PW, NAME, AUTH, DELFLAG, REGDATE)
VALUES('TEST002', 'TEST002', 'TEST1', 'A', 'N', SYSDATE);

--MEMBER
--SELECT
SELECT ID,PW,NAME,AUTH,DELFLAG,REGDATE FROM MEMBER2 ORDER BY AUTH,REGDATE;

--SIGNUP

INSERT INTO MEMBER2
(ID, PW, NAME, AUTH, DELFLAG, REGDATE)
VALUES('TEST001', 'TEST001', 'TEST1', 'A', 'Y', SYSDATE);

-- IDDUPLICATION CHECK 
SELECT count(ID) ID FROM MEMBER2 WHERE ID='TEST001';

-- LOGIN MEMBER
SELECT ID,PW,AUTH,NAME FROM MEMBER2 WHERE ID='TEST001' AND PW='TEST001';

--------------------------- ANSWERBOARD
-- WRITEBOARD
INSERT INTO ANSWERBOARD2
(SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG)
VALUES(ANSWERBOARD2_SEQ.NEXTVAL, 'TEST001', '글제목', '테스트 글작성', 
(SELECT NVL(MAX(REFER),0)+1 FROM ANSWERBOARD2), 0, 0, 0, SYSDATE, 'N');

-- REPLYBOARDUP
UPDATE ANSWERBOARD2 SET STEP = STEP+1 
WHERE STEP>(SELECT STEP FROM ANSWERBOARD2 WHERE SEQ='');
AND REFER = (SELECT REFER FROM ANSWERBOARD2 WHERE SEQ='');
-- REPLYINSERT
INSERT INTO ANSWERBOARD2
(SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG)
VALUES
(ANSWERBOARD2_SEQ.NEXTVAL,'','','',
(SELECT REFER FROM ANSWERBOARD2 WHERE SEQ=''),
(SELECT STEP+1 FROM ANSWERBOARD2 WHERE SEQ=''),
(SELECT "DEPTH" FROM ANSWERBOARD2 WHERE SEQ=''),
0,SYSDATE,'N');

--getOneBoard
SELECT SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2
WHERE SEQ = '3';

--readcountBoard
UPDATE ANSWERBOARD2 SET READCOUNT = READCOUNT+1 WHERE SEQ='3';

-- modifyBoard
UPDATE ANSWERBOARD2 SET TITLE ='수정된제목', CONTENT='수정된내용' WHERE SEQ='3';

-- DELFLAG BOARD 
UPDATE ANSWERBOARD2 SET DELFLAG = 'Y' WHERE DELFLAG = 'N' AND SEQ IN(,,);

-- deleteBoardSel
SELECT  SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2
WHERE REFER = (SELECT REFER FROM ANSWERBOARD2 WHERE SEQ='1')
AND STEP >= (SELECT STEP FROM ANSWERBOARD2 WHERE SEQ='1')
AND "DEPTH" >= (SELECT "DEPTH" FROM ANSWERBOARD2 WHERE SEQ='1')
ORDER BY REFER DESC , STEP;

-- deleteBoard
DELETE FROM ANSWERBOARD2 WHERE SEQ IN(,);

-- USERBOARDLIST
SELECT  SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2 WHERE DELFLAG='N' ORDER BY REFER DESC , STEP;
-- ADMINBOARDLIST
SELECT  SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2 ORDER BY REFER DESC , STEP;

-- userBoardListRow
SELECT SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM (SELECT ROWNUM RNUM , SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM(SELECT  SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2 WHERE DELFLAG='N' ORDER BY REFER DESC , STEP))
WHERE RNUM BETWEEN 1 AND 10;

-- userBoardListTotal
SELECT COUNT(*) FROM ANSWERBOARD2 WHERE DELFLAG ='N';

-- AdminBoardListRow
SELECT SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM (SELECT ROWNUM RNUM , SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM(SELECT  SEQ, ID, TITLE, CONTENT, REFER, STEP, "DEPTH", READCOUNT, REGDATE, DELFLAG 
FROM ANSWERBOARD2 ORDER BY REFER DESC , STEP))
WHERE RNUM BETWEEN 1 AND 10;

-- AdminBoardListTotal
SELECT COUNT(*) FROM ANSWERBOARD2;