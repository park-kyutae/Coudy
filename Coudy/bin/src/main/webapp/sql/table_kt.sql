
CREATE TABLE techblog(
	tech_num number not null,
	tech_title varchar2(150) not null,
	tech_name varchar2(30) not null,
	tech_date DATE default sysdate not null,
	tech_modifydate DATE,
	tech_photo blob,
	tech_photoname varchar2(100),
	tech_content varchar2(1000) not null,
	tech_hit number(8) default 0 not null,
	tech_kategorie VARCHAR2(30) not null,
	tech_tag VARCHAR2(30) not null,
	mem_num number not null,
	constraint techblog_pk primary key (tech_num),
 	constraint techblog_fk foreign key (mem_num)
                       references member_detail (mem_num)
);

create sequence techblog_seq;

create table techblog_reply(
	tech_re_num number not null,
	tech_re_content varchar2(900) not null,
	tech_re_date DATE default sysdate not null,
	tech_re_modifydate date,
	tech_num number not null,
	mem_num number not null,
	constraint techblog_reply_pk primary key (tech_re_num),
 	constraint techblog_reply_fk1 foreign key (tech_num)
                       references techblog (tech_num),
	constraint techblog_reply_fk2 foreign key (mem_num)
                       references member_detail(mem_num)
);

create sequence techblog_reply_seq;

create table techblog_re_fav(
	tech_refav_num number not null,
	tech_re_num number not null,
	tech_num number not null,
	mem_num number not null,
	constraint techblog_re_fav_pk primary key (tech_refav_num),
 	constraint techblog_re_fav_fk1 foreign key (tech_re_num)
                       references techblog_reply (tech_re_num),
	constraint techblog_re_fav_fk2 foreign key (tech_num)
                       references techblog (tech_num),
	constraint techblog_re_fav_fk3 foreign key (mem_num)
                       references member_detail(mem_num)
);

create sequence techblog_re_fav_seq;

create table techblog_fav(
	tech_fav_num number not null,
	tech_num number not null,
	mem_num number not null,
	constraint techblog_fav_pk primary key (tech_fav_num),
	constraint techblog_fav_fk1 foreign key (tech_num)
                       references techblog (tech_num),
	constraint techblog_fav_fk2 foreign key (mem_num)
                       references member_detail(mem_num)
);

create sequence techblog_fav_seq;

