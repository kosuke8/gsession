create table ENQ_MAIN
(
        EMN_SID          bigint          not null,
        EMN_DATA_KBN     integer                 ,
        ETP_SID          integer                 ,
        EMN_TITLE        varchar(100)            ,
        EMN_PRI_KBN      integer                 ,
        EMN_DESC         text                    ,
        EMN_DESC_PLAIN   text                    ,
        EMN_ATTACH_KBN   integer                 ,
        EMN_ATTACH_ID    varchar(100)            ,
        EMN_ATTACH_NAME  varchar(100)            ,
        EMN_ATTACH_POS   integer                 ,
        EMN_OPEN_STR     date                    ,
        EMN_OPEN_END     date                    ,
        EMN_OPEN_END_KBN integer                 ,
        EMN_RES_END      date                    ,
        EMN_ANS_PUB_STR  date                    ,
        EMN_ANONY        integer                 ,
        EMN_ANS_OPEN     integer                 ,
        EMN_SEND_GRP     bigint                  ,
        EMN_SEND_USR     bigint                  ,
        EMN_SEND_NAME    varchar(100)            ,
        EMN_TARGET       integer                 ,
        EMN_QUESEC_TYPE  integer         not null,
        EMN_AUID         integer         not null,
        EMN_ADATE        timestamp       not null,
        EMN_EUID         integer         not null,
        EMN_EDATE        timestamp       not null,
        primary key (EMN_SID)
);