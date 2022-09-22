<<<<<<< HEAD
=======
CREATE TABLE com_info(
 com_num                             NUMBER(20)       NOT NULL,
 mem_num                             NUMBER(20)       NOT NULL,
 com_name                            VARCHAR2(50)       NOT NULL,
 com_title                           VARCHAR2(50)       NOT NULL,
 com_career                          VARCHAR2(10)       NOT NULL,
 com_pay                             VARCHAR2(20)       NOT NULL,
 com_edu                             VARCHAR2(10)       NOT NULL,
 com_time                            VARCHAR2(30)       NOT NULL,
 com_empType                         VARCHAR2(15)       NOT NULL,
 com_tag                             VARCHAR2(30)       NULL ,
 com_zipcode                         NUMBER(6)       NOT NULL,
 com_address1                        VARCHAR2(30)       NOT NULL,
 com_address2                        VARCHAR2(20)       NOT NULL,
 com_schedule                        DATE       NOT NULL,
 com_part                            VARCHAR2(30)       NOT NULL,
 com_filename                        VARCHAR2(100)       NOT NULL,
 com_photo                           BLOB       NOT NULL,
 com_comTitle                        VARCHAR2(100)       NOT NULL,
 com_comContent                      VARCHAR2(1000)       NOT NULL,
 com_hit                             NUMBER(8)       default 0  NOT NULL,
 constraint company_pk primary key (com_num),
 constraint company_fk foreign key (mem_num) references member_detail (mem_num)
);

create sequence com_info_seq;


create TABLE com_scrap(
  scrap_num     NUMBER(20) not null,
  mem_num       NUMBER(20) not null,
  com_num       NUMBER(20) not null,
  constraint scrap_pk primary key  (scrap_num),
  constraint scrap_fk foreign key  (mem_num) references member_detail (mem_num),
  constraint scrap_fk2 foreign key (com_num) references com_info(com_num)
);

create sequence com_scrap_seq;

create table com_review(
  re_num   NUMBER(20) not null,
  mem_num NUMBER(20) not null,
  com_num NUMBER(20) not null,
  re_title VARCHAR2(40) not null,
  re_company VARCHAR2(20) not null,
  re_content VARCHAR2(1000) not null,
  re_regdate date default SYSDATE not null,
  constraint review_pk primary key (re_num),
  constraint review_fk foreign key (mem_num) references member_detail (mem_num),
  constraint review_fk2 foreign key (com_num) references com_info (com_num)
);
create sequence com_review_seq;

create table com_apply(
  apply_num NUMBER(20) not null,
  mem_num NUMBER(20) not null,
  com_num NUMBER(20) not null,
  constraint apply_pk primary key (apply_num),
  constraint apply_fk foreign key (mem_num) references member_detail (mem_num),
  constraint apply_fk2 foreign key (com_num) references com_info (com_num)
);

create sequence com_apply_seq;
>>>>>>> branch 'main' of https://github.com/park-kyutae/Coudy.git
