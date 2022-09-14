

create table STUDY_TODO
(
    TODO_NUM      NUMBER(10)   not null
        constraint STUDY_TODO_PK
        primary key,
    TODO_CONTENT  VARCHAR2(10) not null,
    TODO_PROGRESS NUMBER(10)   not null,
    MEM_NUM       NUMBER(10)   not null
        constraint TODO_MEMNUM
        references MEMBER
)
    /

create table STUDY_DAILY
(
    DAILY_NUM          NUMBER(10)   not null
        constraint STUDY_DAILY_PK
        primary key,
    DAILY_IS_COMPLETED NUMBER       not null,
    MEM_NUM            NUMBER(10)   not null
        constraint MEM_NUM
        references MEMBER,
    DAILY_CONTENT      VARCHAR2(10) not null
)
    /

create table STUDY_FEEDBACK
(
    FEEDBACK_NUM        NUMBER(10)   not null
        constraint STUDY_FEEDBACK_PK
        primary key,
    FEEDBACK_CONTENT    VARCHAR2(10) not null,
    MEM_NUM             NUMBER(10)   not null
        constraint FEEDBACK_MEMNUM
        references MEMBER,
    FEEDBACK_WRITE_DATE DATE         not null
)
    /

create table CHAT
(
    CHAT_NUM  NUMBER(10)     not null
        constraint CHAT_PK
        primary key,
    CHAT_NAME VARCHAR2(1000) not null
)
    /

create table CHAT_MEMBER
(
    CHAT_NUM NUMBER(10) not null
        constraint CHATMEM_CHATNUM
        references CHAT,
    MEM_NUM  NUMBER(10) not null
        constraint CHATMEM_MEMNUM
        references MEMBER
)
    /

create table CHAT_LOG
(
    CHAT_LOG_NUM NUMBER(10)   not null
        constraint CHAT_LOG_PK
        primary key,
    MEM_NUM      NUMBER(10)   not null
        constraint CHATLOG_MEMNUM
        references MEMBER,
    CHAT_MESSAGE VARCHAR2(10) not null,
    CHAT_FILE    VARCHAR2(10) not null,
    CHAT_NUM     NUMBER(10)   not null
        constraint CHAT_NUM
        references CHAT
)
    /

create table STUDY_PLAN
(
    PLAN_NUM          NUMBER(10)   not null
        constraint STUDY_PLAN_PK
        primary key,
    STUDY_NUM         NUMBER(10)   not null
        constraint STUDY_NUM2
        references STUDYGROUP,
    PLAN_CONTENT      VARCHAR2(10) not null,
    PLAN_START_DATE   DATE         not null,
    PLAN_END_DATE     DATE         not null,
    PLAN_COLOR        VARCHAR2(10) not null,
    MEM_NUM           NUMBER(10)   not null
        constraint FOREIGN_KEY_NAME
        references MEMBER,
    PLAN_IS_COMPLETED NUMBER(10)   not null
)
    /
