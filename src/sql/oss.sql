use OnlineShoppingSystem;

-- 管理员表
create table Admin (
                       Aid varchar(36) primary key ,
                       AName varchar(20) not null,
                       Level varchar(10),
                       APhone char(11) not null unique,check(REGEXP_LIKE(APhone, '^[1][356789][0-9]{9}$')),
                       AAccount varchar(12) not null unique,check (char_length(AAccount) >= 6 and char_length(AAccount) <= 12),
                       APwd varchar(12) not null,check (char_length(APwd) >= 6 and char_length(APwd) <= 12),
                       CONSTRAINT Permission_id_fk_1 FOREIGN KEY (Level) REFERENCES Permission(Level)
#         on delete set null
                           on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 商品品类表
create table Kinds(
                      Kid varchar(36) primary key,
                      KName varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 商品表
create table Goods(
                      Gid varchar(36) primary key,
                      Kid varchar(36),
                      GName varchar(100) not null,
                      Promotion char(1) not null, check ( Promotion = 'y' or Promotion = 'n'),
                      Repertory int not null, check ( Repertory >= 0 ),
                      SaleNum int not null, check ( SaleNum >= 0 ),
                      Picture varchar(100), -- url
                      Introduce varchar(255),
                      GAddress varchar(255) not null,
                      PPrice double not null, check ( PPrice >= 0 ),
                      SPrice double not null, check ( SPrice >= 0 ),
                      GStatus varchar(10) not null,-- 下架、在售、不可见
                      CONSTRAINT Kinds_id_fk_1 FOREIGN KEY (Kid) REFERENCES Kinds(Kid)
#         on delete set null
                          on update cascade,
                      INDEX GName_index (GName(100))
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 管理表
create table Manage(
                       Aid varchar(36),
                       Gid varchar(36),
                       Record varchar(100),
                       MTime datetime,
                       primary key (Aid,Gid),
                       CONSTRAINT Admin_id_fk_1 FOREIGN KEY (Aid) REFERENCES Admin(Aid)
#         on delete cascade
                           on update cascade,
                       CONSTRAINT Goods_id_fk_1 FOREIGN KEY (Gid) REFERENCES Goods(Gid)
#         on delete set null
                           on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 客户表
create table Customer(
                         Cid varchar(36)  primary key,
                         CName varchar(20) not null,
                         CPhone varchar(20) not null unique,check(REGEXP_LIKE(CPhone, '^[1][356789][0-9]{9}$')),
                         CAccount varchar(12) not null unique,check ( char_length(CAccount) >= 6 and char_length(CAccount) <= 12 ),
                         CPwd varchar(12) not null,check (char_length(CPwd) >= 6 and char_length(CPwd) <= 12),
                         CAddress varchar(255),
                         Balance double, check ( Balance >= 0 ),
                         CSex char(1),check ( CSex = '男' or CSex = '女'),
                         Birthday date
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 订单表
create table Orders(
                       Oid varchar(36) primary key,
                       OTime datetime,
                       Cid varchar(36),
                       Gid varchar(36),
                       GNumber int not null,check ( GNumber > 0 ),
                       Status varchar(100),
                       Remarks varchar(255),
                       Fare double not null ,check ( Fare >= 0 ),
                       CONSTRAINT Goods_id_fk_2 FOREIGN KEY (Gid) REFERENCES Goods(Gid)
#         on delete set null
                           on update cascade,
                       CONSTRAINT Customer_id_fk_1 FOREIGN KEY (Cid) REFERENCES Customer(Cid)
#         on delete set null
                           on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 购物车表
create table ShopCart (
                          Cid varchar(36),
                          Gid varchar(36),
                          INumber int not null, check ( INumber > 0 ),
                          primary key(Cid,Gid),
                          CONSTRAINT Goods_id_fk_3 FOREIGN KEY (Gid) REFERENCES Goods(Gid)
# 	    on delete set null
                              on update cascade,
                          CONSTRAINT Customer_id_fk_2 FOREIGN KEY (Cid) REFERENCES Customer(Cid)
#         on delete set null
                              on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 评论表
create table Discuss (
                         Did varchar(36) primary key,
                         Gid varchar(36),
                         Cid varchar(36),
                         Content varchar(255) not null,
                         DTime datetime,
                         CONSTRAINT Goods_id_fk_4 FOREIGN KEY (Gid) REFERENCES Goods(Gid)
#         on delete set null
                             on update cascade,
                         CONSTRAINT Customer_id_fk_3 FOREIGN KEY (Cid) REFERENCES Customer(Cid)
#         on delete set null
                             on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 权限表
create table Permission
(
    Level varchar(10) primary key,
    PName varchar(20) not null,
    Illustration varchar(255)
);