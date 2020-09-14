--�������̺�
create table users(
    userNo number not null,
    id VARCHAR2(50) not null,
    firstName varchar2(50),
    lastName varchar2(50),
    nickName varchar2(50) not null,
    password varchar2(50) not null,
    joinDate date not null,
    age number not null,
    userImg varchar2(500),
    userInfo varchar2(1000),
    email varchar2(100),
    gender varchar2(10),
    constraint users_pk primary key(userNo)
);

--�������̺�
create table folder(
    folderNo number not null,
    userNo number not null,
    folderName varchar2(50) not null,
    groupNo number not null,
    rootNo number not null,
    orderNo number not null,
    depth number not null,
    regDate date not null,
    constraint folder_pk primary key(folderNo),
    constraint folder_fk foreign key(userNo) references users(userNo)
);

--������
create sequence folderNo start with 1 increment by 1;
create sequence setNo start with 1 increment by 1;

--��Ʈ���̺�
create table sets(
    setNo number not null,
    folderNo number not null,
    userNo number not null,
    setName varchar2(50) not null,
    setExplain varchar2(1000),
    regDate date not null,
    setImg varchar2(500),
    tag varchar2(100),
    setlike number,
    setdislike number,
    constraint sets_pk primary key(setNo),
    constraint sets_fk_folderNo foreign key(folderNo) references folder(folderNo),
    constraint sets_fk_userNo foreign key(userNo) references users(userNo)
);

select *
from users;

select *
from folder
order by orderno asc;

select *
from sets;

delete from folder
where folderno = 18;


insert into users values(2, '456', '����12', '��34', '�贩��123', '1234', sysdate, 26, '', '', '', '');

insert into folder values(folderNo.nextval, 2, '����2', folderNo.nextval, 0, 1, 0, sysdate);

insert into folder values(folderNo.nextval, 1, '����1-1', 1, 1, 2, 1, sysdate);

insert into folder values(folderNo.nextval, 1, '����1-1-1', 1, 8, 3, 2, sysdate);
insert into folder values(folderNo.nextval, 1, '����1-1-2', 1, 8, 4, 2, sysdate);
insert into folder values(folderNo.nextval, 1, '����1-2', 1, 1, 5, 1, sysdate);
insert into folder values(folderNo.nextval, 1, '����1-3', 1, 1, 6, 1, sysdate);
insert into folder values(folderNo.nextval, 1, '����1-3-1', 1, 12, 7, 2, sysdate);

insert into sets values(setNo.nextval, 1, 1, '��Ʈ1', '', sysdate, '', '', 12, 34);

insert into sets values(setNo.nextval, 15, 1, '��Ʈ2', '', sysdate, '', '', 12, 34);


select sets.*, users.id
from sets, users
where sets.userNo = users.userNo
and sets.folderNo = 1
order by sets.regDate desc;

