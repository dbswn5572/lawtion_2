--------------------------�ı�Խ��� ���̺� & ������--------------------------------------------
CREATE TABLE LAWTION_REVIEW_BOARD(
      NO      NUMBER(4) CONSTRAINT PK_LAWTION_REVIEW_BOARD_NO PRIMARY KEY,
      TITLE   VARCHAR2(50) NOT NULL,
      CATEGORY  VARCHAR2(20) NOT NULL,
      RDATE   DATE,
      HITS    NUMBER(4),
      LAWYER VARCHAR2(30),
      LAWSUIT    VARCHAR(50),
      CONTENT VARCHAR2(500) NOT NULL,
      FNAME   VARCHAR2(100),
      RFNAME  VARCHAR2(200)
);
SELECT * FROM LAWTION_REVIEW_BOARD; 
CREATE SEQUENCE SEQU_LAWTION_REVIEW_BOARD
    START WITH  1
    INCREMENT BY 1;
SELECT * FROM LAWTION_REVIEW_BOARD;
----------------------�ϼҿ��Խ��� ���̺� & ������-------------------------------------------------

CREATE TABLE LAWTION_TALK_BOARD(
      NO      NUMBER(4) CONSTRAINT PK_LAWTION_TALK_BOARD_NO PRIMARY KEY,
      TITLE   VARCHAR2(50) NOT NULL,
      TDATE   DATE,
      HITS    NUMBER(4),
      CONTENT VARCHAR2(500) NOT NULL,
      FNAME   VARCHAR2(100),
      RFNAME  VARCHAR2(200)
);

CREATE SEQUENCE SEQU_LAWTION_TALK_BOARD
    START WITH  1
    INCREMENT BY 1;

----------------------------�������� ���̺�---------------------------------------------
CREATE TABLE LAWTION_NOTICE(
    NO      NUMBER(4) CONSTRAINT PK_LAWTION_NOTICE_NO PRIMARY KEY,
    TITLE   VARCHAR(80) NOT NULL,
    RDATE   DATE,
    HITS    NUMBER(4),
    CONTENT VARCHAR(500) NOT NULL,
    FNAME   VARCHAR(100),
    RFNAME  VARCHAR(200)
);

insert into lawtion_notice values(1,'����','20170511',4,'����',null,null);

CREATE SEQUENCE SEQU_LAWTION_NOTICE
    START WITH  1
    INCREMENT BY 1;
    
select rownum, no, title,rdate from lawtion_notice;

select * from (select no,title,rdate,hits,content,fname,lag(no,1,0) over (order by no) as per_seq,lag(title,1,'�����۾���')
  over (order by no) as pre_title,lag(to_char(rdate,'yyyy-mm-dd')) over (order by no) as pre_rdate, lag(hits,1,0)
  over (order by no) as pre_hits, lag(content,1,'�����۾���') over (order by no) as pre_content,lag(fname,1,'�����۾���')
  over (order by no) as pre_fname from lawtion_notice) where no=104;

select * from (select no,title,rdate,hits,content,fname,lead(no,1,0) over (order by no) as next_seq,lead(title,1,'���ı۾���')
  over (order by no) as next_title,lag(to_char(rdate,'yyyy-mm-dd')) over (order by no) as pre_rdate, lead(hits,1,0)
  over (order by no) as next_hits, lead(content,1,'���ı۾���') over (order by no) as next_content,lead(fname,1,'���ı۾���')
  over (order by no) as next_fname from lawtion_notice) where no=104;
  
commit;
---------------------�ϼҿ��Խ��� ��� ���̺� & ������------------------------------------
CREATE TABLE LAWTION_TALK_REPLY(
  RID   NUMBER(4) PRIMARY KEY,
  REPLYER VARCHAR2(20) NOT NULL,
  CONTENT VARCHAR2(100) NOT NULL,
  RDATE DATE,
  TID   NUMBER(4) REFERENCES LAWTION_TALK_BOARD(NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQU_LAWTION_TALK_REPLY
    START WITH  1
    INCREMENT BY 1;

SELECT * FROM LAWTION_TALK_REPLY;

---------------------�ı�Խ��� ��� ���̺� & ������--------------------------------------------


CREATE TABLE LAWTION_REVIEW_REPLY(
  RID   NUMBER(4) PRIMARY KEY,
  REPLYER VARCHAR2(20) NOT NULL,
  CONTENT VARCHAR2(100) NOT NULL,
  RDATE DATE,
  REVIEWID   NUMBER(4) REFERENCES LAWTION_REVIEW_BOARD(NO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQU_LAWTION_REVIEW_REPLY
    START WITH  1
    INCREMENT BY 1;


SELECT * FROM LAWTION_REVIEW_REPLY;
drop table lawtion_introduce;

--------------------��ȣ�� �⺻���� ���̺�  & ������------------------------------------------------
create table lawtion_introduce(
  no    number(4) constraint lawtion_introduce_no_pk primary key,
  name  varchar2(100) ,
  dname varchar2(200) ,
  part  varchar2(200) 
  );

create sequence sequ_lawtion_introduce
  start with 1
  increment by 1;
  

-------------------��ȣ�� �⺻���� ���̺�  & ������ DB(insert)-------------------------------------------------
/*�������̺�*/
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������μ���','�Ǽ�,����');

insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������μ���','�Ǽ�,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�����','�������μ���','�Ǽ�,����');
commit;
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'����ȯ','���������¾�','�λ�,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�����','�������������','��ȥ,�λ�');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'��ν�','�������������','����,������');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'������','�������������','����,����,����');
insert into lawtion_introduce 
  values(sequ_lawtion_introduce.nextval,'�̽¹�','�������������','����,����');
commit;

SELECT * FROM LAWTION_INTRODUCE;

-------------------��ȣ�� �¼� + ��»��� ���̺�----------------------------------------------------
create table introduce_member(
  no        number(4) constraint introduce_member_no_fk references lawtion_introduce(no),
  carrer    varchar2(500),
  trial     number(4),
  win       number(4),
  lose      number(4)
);

desc introduce_member;
select * from introduce_member;
drop table introduce_member;
select * from introduce_member;
------------------��ȣ�� �¼� + ��»��� ���̺� DB (insert)----------------------------------------
insert into introduce_member
  values(41,'������б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
  commit;
insert into introduce_member
  values(42,'�λ���б� �濵�а� ����<br>�λ�������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(43,'�뱸���б� �濵�а� ����<br>�뱸������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(44,'���ִ��б� �濵�а� ����<br>����������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(45,'��õ���б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(46,'�����б� �濵�а� ����<br>���������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(47,'�������б� �濵�а� ����<br>����������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);
insert into introduce_member
  values(48,'��õ���б� �濵�а� ����<br>��õ������� �������� �ǻ�<br>����������� ���� �ǻ�<br>
  �ȶ� �����繫��(2012-2017.03)<br>�������� ���� ��ǥ(2017.08-����)',30,23,7);

commit;

select l.no,name,dname,part,carrer,trial,win,lose 
					from lawtion_introduce l, introduce_member m
					where l.no=m.no and l.no=41;

------------------------------�Ϲ� ȸ������ DB-------------------------------------
CREATE TABLE JOIN_NORMAL(
  ID VARCHAR2(30) CONSTRAINT PK_NORMAL_ID PRIMARY KEY,
  PASSWORD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  BIRTH VARCHAR2(30) NOT NULL,
  JDATE VARCHAR2(30)
  );

------------------------------��ȣ�� ȸ������ DB---------------------------------------

CREATE TABLE JOIN_LAWYER(
  ID VARCHAR2(30) CONSTRAINT PK_LAYER_ID PRIMARY KEY,
  PASSWORD VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  BIRTH VARCHAR2(30) NOT NULL,
  JDATE VARCHAR2(30),
  LICENSE_NO VARCHAR2(30),
  BUSINESS_NO VARCHAR2(30),
  LICENSE VARCHAR2(100),
  BUSINESS VARCHAR2(100),
  RLICENSE VARCHAR2(100),
  RBUSINESS VARCHAR2(100)
  );

----------------------- ���� �Ƿ� ���̺� & ������ ���� -------------------------
create table precedent_normal(
  no        number(4) primary key,
  title     varchar2(50) not null,
  content   varchar2(500),
  result    varchar2(10) not null,
  hits      number(4)
);

create table precedent_review(
  no        number(4) primary key,
  title     varchar2(50) not null,
  content   varchar2(500),
  result    varchar2(10) not null,
  lname     varchar2(10) not null,
  hits      number(4)
);

create table precedent_search(
  sno number(4) primary key,
  keyword varchar2(50) not null,
  sdate date
);
drop table precedent_normal;
CREATE SEQUENCE SEQU_precedent_normal
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE SEQU_precedent_review
  START WITH 1
  INCREMENT BY 1;
  
CREATE SEQUENCE SEQU_precedent_search
  START WITH 1
  INCREMENT BY 1;

--���� �Ƿ� ���̺� ���� ����--
insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�1','����','�����', '����1', '�¼�', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�2','�λ�','�������', '����2', '�м�', 0);

insert into precedent_normal 
  values(sequ_precedent_normal.nextval,'�Ҽ�3','Ư��','�ϱ޽�', '����3', '�¼�', 0);
  
--�ı� �Ƿ� ���̺� ���� ����--
insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�1','����','�����', '����1', '�¼�', '�輱��', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�2','�λ�','�������', '����2', '�м�', '������', 0);

insert into precedent_review 
  values(sequ_precedent_review.nextval,'�Ҽ�3','Ư��','�ϱ޽�', '����3', '�м�', '������', 0);
  
------------------------------
create table lawtion_auction_board(
  no number(4) constraint pk_lawtion_auction_board_no primary key,
  id varchar2(50) not null,
  title varchar2(50) not null,
  content varchar2(500),
  fname varchar2(100),
  adate date,
  hits number(4),
  category varchar2(50),
  edate varchar2(50),
  area varchar2(50),
  agree varchar2(50),
  bidding number(4)
);

create sequence sequ_lawtion_auction_board
  start with 1
  increment by 1;
  
create table lawtion_auction_comment(
  cno number(4) primary key,
  id varchar2(50) not null,
  content varchar2(500),
  cdate date,
  ano number(4),
  lawyer number(4),
  cost number(10,0),
  CONSTRAINT fk_lawtion_auction_comment_ano foreign key(ano) REFERENCES lawtion_auction_board(no) ON DELETE CASCADE
);

create sequence sequ_lawtion_auction_comment
  start with 1
  increment by 1;
commit;
