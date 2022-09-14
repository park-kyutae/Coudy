
--회원관리
create table member(
	mem_num number not null,
	auth number(1) default 2 not null, -- 0 탈퇴회원, 1정지회원, 2일반회원, 3관리자
	
	constraint member_pk primary key (mem_num)
);

--회원정보

create table member_detail(
	mem_num number not null,
	name varchar2(30) not null,
	id varchar2(15) unique not null,
	passwd varchar2(12) not null,
	phone varchar2(15) not null,
	email varchar2(50) not null,
	zipcode varchar2(5) not null,
	address1 varchar2(90) not null,
	address2 varchar2(90) not null,
	photo blob,
	photo_name varchar2(100),
	reg_date date default sysdate not null,
	modify_date date,
	constraint member_detail_pk primary key (mem_num),
	constraint member_detail_fk1 foreign key (mem_num) 
							references member(mem_num)
);


create sequence member_seq;



/* Table Name: 고객센터 */

CREATE TABLE service_board   (
      board_num           NUMBER(10)       	NOT NULL,
      board_title         VARCHAR2(30)     	NOT NULL,
      board_content       VARCHAR2(1000)   	NOT NULL,
      board_hit           NUMBER(10)       	NOT NULL,
      board_reg_date      DATE				not null,
      board_filename      VARCHAR2(10),
      board_ip            VARCHAR2(10)     	NOT NULL,
      auth                NUMBER(1),	   	not null,
      mem_num             NUMBER(12) 		not null,
      constraint board_pk primary key (board_num),
      constraint board_fk foreign key (mem_num) references member(mem_num)
);

create sequence board_seq;








