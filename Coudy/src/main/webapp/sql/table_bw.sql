--스터디 모집 게시판
create table studygroup(
                           study_num number not null,
                           stack varchar2(90) not null,
                           name varchar2(15) not null,
                           description clob not null,
                           limit number(2) default 1 not null,
                           location varchar2(15) not null,
                           pic varchar2(15),
                           purpose varchar2(100) not null,
                           reg_date date default sysdate not null,
                           limit_date date not null,
                           start_date date not null,
                           end_date date not null,
                           modify_date date,
                           mem_num number not null,
                           constraint studygroup_pk primary key (study_num),
                           constraint studygroup_fk foreign key (mem_num)
                               references member (mem_num)
);

create sequence studygroup_seq;

--스터디 모집 게시판
create table study_user(
                           study_user_num number not null,
                           registered CHAR default 'N' not null,
                           is_group_manager CHAR default 'N' not null,
                           study_num number not null,
                           mem_num number not null,
                           constraint study_user_pk primary key (study_user_num),
                           constraint study_user_fk1 foreign key (study_num)
                               references studygroup (study_num),
                           constraint study_user_fk2 foreign key (mem_num)
                               references member (mem_num)
);

create sequence study_user_seq;


--스터디 지원 테이블
create table application(
                            application_num number not null,
                            career clob not null,
                            meet_time varchar2(100) not null,
                            request varchar2(100) not null,
                            reg_date date default sysdate not null,
                            study_num number not null,
                            mem_num number not null,
                            constraint application_pk primary key (application_num),
                            constraint application_fk1 foreign key (study_num)
                                references studygroup (study_num),
                            constraint application_fk2 foreign key (mem_num)
                                references member (mem_num)
);

create sequence application_seq;

--스터디 리뷰 테이블
create table studygroup_review(
                            studygroup_review_num number not null,
                            content varchar2(900) not null,
                            reg_date date default sysdate not null,
                            modify_date date,
                            studygroup_review_ip varchar2(40) not null,
                            study_num number not null,
                            mem_num number not null,
                            constraint studygroup_review_pk primary key (studygroup_review_num),
                            constraint studygroup_review_fk1 foreign key (study_num)
                                references studygroup (study_num),
                            constraint studygroup_review_fk2 foreign key (mem_num)
                                references member (mem_num)
);

create sequence studygroup_review_seq;

