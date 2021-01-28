CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_admin` AS
select `Admin`.`Aid`      AS `Aid`,
       `Admin`.`AName`    AS `AName`,
       `Admin`.`Level`    AS `Level`,
       `Admin`.`APhone`   AS `APhone`,
       `Admin`.`AAccount` AS `AAccount`
from `Admin`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_c_shopcart` AS
select `Customer`.`Cid`     AS `Cid`,
       `Goods`.`GName`      AS `GName`,
       `Goods`.`SPrice`     AS `SPrice`,
       `ShopCart`.`INumber` AS `INumber`,
       `Goods`.`GStatus`    AS `GStatus`
from ((`ShopCart` join `Goods`)
         join `Customer`)
where ((`Goods`.`Gid` = `ShopCart`.`Gid`) and (`Customer`.`Cid` = `ShopCart`.`Cid`));

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_customer` AS
select `Customer`.`CAccount`                                   AS `CAccount`,
       `Customer`.`CName`                                      AS `CName`,
       (case `Customer`.`CSex` when 'f' then '女' else '男' end) AS `CSex`,
       timestampdiff(YEAR, `Customer`.`Birthday`, curdate())   AS `CAge`,
       `Customer`.`CPhone`                                     AS `CPhone`,
       `Customer`.`CAddress`                                   AS `CAddress`
from `Customer`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_discuss` AS
select `Customer`.`CName`  AS `CName`,
       `Goods`.`GName`     AS `GName`,
       `Discuss`.`Content` AS `Content`,
       `Discuss`.`DTime`   AS `DTime`
from ((`Discuss` join `Goods`)
         join `Customer`)
where ((`Customer`.`Cid` = `Discuss`.`Cid`) and (`Discuss`.`Gid` = `Goods`.`Gid`))
order by `Discuss`.`DTime` desc;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_goods` AS
select `Goods`.`Gid`                                             AS `Gid`,
       `Kinds`.`KName`                                           AS `KName`,
       `Goods`.`GName`                                           AS `GName`,
       (case `Goods`.`Promotion` when 'y' then '是' else '否' end) AS `Promotion`,
       `Goods`.`SaleNum`                                         AS `SaleNum`,
       `Goods`.`GAddress`                                        AS `GAddress`,
       `Goods`.`SPrice`                                          AS `SPrice`,
       `Goods`.`GStatus`                                         AS `GStatus`
from (`Goods`
         join `Kinds`)
where (`Kinds`.`Kid` = `Goods`.`Kid`);

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_kinds` AS
select `Kinds`.`Kid` AS `Kid`, `Kinds`.`KName` AS `KName`
from `Kinds`
order by `Kinds`.`Kid`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_manipulate` AS
select `Manage`.`Aid`    AS `Aid`,
       `Admin`.`AName`   AS `AName`,
       `Goods`.`Gid`     AS `Gid`,
       `Goods`.`GName`   AS `GName`,
       `Manage`.`Record` AS `Record`,
       `Manage`.`MTime`  AS `MTime`
from ((`Manage` join `Goods`)
         join `Admin`)
where ((`Manage`.`Aid` = `Admin`.`Aid`) and (`Manage`.`Gid` = `Goods`.`Gid`));

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_notice_a` AS
select `Notice`.`Aid` AS `id`, `Admin`.`AName` AS `name`, `Notice`.`NContent` AS `content`, `Notice`.`NTime` AS `time`
from (`Notice`
         join `Admin`)
where (`Notice`.`Aid` = `Admin`.`Aid`);

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_notice_c` AS
select `Notice`.`NContent` AS `Content`, `Notice`.`NTime` AS `Time`
from `Notice`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_order_a` AS
select `Orders`.`Oid`     AS `o_id`,
       `Customer`.`Cid`   AS `c_id`,
       `Customer`.`CName` AS `c_name`,
       `Goods`.`Gid`      AS `g_id`,
       `Goods`.`GName`    AS `g_name`,
       `Orders`.`GNumber` AS `number`,
       `Orders`.`Fare`    AS `fare`,
       `Orders`.`Remarks` AS `remarks`,
       `Orders`.`Status`  AS `status`
from ((`Orders` join `Goods`)
         join `Customer`)
where ((`Orders`.`Cid` = `Customer`.`Cid`) and (`Orders`.`Gid` = `Goods`.`Gid`))
order by `Orders`.`OTime`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_order_c` AS
select `Orders`.`Oid`                               AS `oid`,
       `Customer`.`CName`                           AS `c_name`,
       `Goods`.`GName`                              AS `g_name`,
       `Orders`.`GNumber`                           AS `number`,
       `Orders`.`OTime`                             AS `time`,
       sum((`Orders`.`GNumber` * `Goods`.`SPrice`)) AS `price`
from ((`Orders` join `Customer`)
         join `Goods`)
where ((`Goods`.`Gid` = `Orders`.`Gid`) and (`Customer`.`Cid` = `Orders`.`Cid`))
group by `Orders`.`Cid`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_permission` AS
select `Permission`.`Level` AS `Level`, `Permission`.`PName` AS `PName`, `Permission`.`Illustration` AS `Illustration`
from `Permission`;

CREATE ALGORITHM = UNDEFINED DEFINER =`oss`@`%` SQL SECURITY DEFINER VIEW `The_shopcart` AS
select `Customer`.`Cid`     AS `Aid`,
       `Customer`.`CName`   AS `CName`,
       `Goods`.`Gid`        AS `Gid`,
       `Goods`.`GName`      AS `GName`,
       `ShopCart`.`INumber` AS `INumber`
from ((`Customer` join `Goods`)
         join `ShopCart`)
where ((`ShopCart`.`Cid` = `Customer`.`Cid`) and (`Goods`.`Gid` = `ShopCart`.`Gid`));

