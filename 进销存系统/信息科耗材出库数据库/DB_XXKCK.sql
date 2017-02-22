/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.16 : Database - test
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `xxk`;

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `CLID` smallint(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `DLID` tinyint(3) unsigned zerofill DEFAULT NULL,
  `CLMC` varchar(10) NOT NULL DEFAULT ' ',
  `CLDW` varchar(1) DEFAULT NULL,
  `CLJS` varchar(50) DEFAULT NULL,
  `CLPY` varchar(10) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`CLID`),
  UNIQUE KEY `CLMC` (`CLMC`),
  KEY `FK_ID` (`DLID`),
  FULLTEXT KEY `CLPY` (`CLPY`),
  CONSTRAINT `FK_ID` FOREIGN KEY (`DLID`) REFERENCES `tb_category_kind` (`DLID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='材料表';

/*Data for the table `tb_category` */

insert  into `tb_category`(`CLID`,`DLID`,`CLMC`,`CLDW`,`CLJS`,`CLPY`) values (0001,001,'278','只','HP1566','278'),(0004,001,'CE323','只','胃镜室，病理科','CE323'),(0005,001,'ZP-101','只','三星','ZP-101'),(0006,001,'18','只','中医理疗科','18'),(0007,001,'2612','只','HP1020,门诊药房，出院结账，一站式,B超室','2612'),(0008,002,'鼠标','只','','SB'),(0009,001,'TK-1103','只','京瓷','TK-1103'),(0010,002,'显示器','个',NULL,'XSQ'),(0011,002,'键盘','个',NULL,'JP'),(0012,001,'CT201921富士','个','手术室','CT201921'),(0013,001,'436','只','人事科','436'),(0014,001,'280','只','检验科','280'),(0015,001,'388','只','后勤中心,妇保门诊','388'),(0016,001,'MPG-51粉','个','文印室','MPG-51'),(0017,001,'CF210','个','B超室','CF210'),(0018,001,'CE321','只','病理科','CE321'),(0019,001,'CE322','只','胃镜室','CE322'),(0020,002,'电源','个',NULL,'DY'),(0021,002,'固态硬盘','个',NULL,'GTYP');

/*Table structure for table `tb_category_kind` */

DROP TABLE IF EXISTS `tb_category_kind`;

CREATE TABLE `tb_category_kind` (
  `DLID` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `DLMC` varchar(10) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`DLID`),
  UNIQUE KEY `DLMC` (`DLMC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='材料大类表';

/*Data for the table `tb_category_kind` */

insert  into `tb_category_kind`(`DLID`,`DLMC`) values (003,'复印纸'),(004,'打印机'),(002,'电脑配件'),(001,'硒鼓');

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `KSID` smallint(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `KSMC` varchar(10) NOT NULL DEFAULT ' ',
  `KSMCPY` varchar(10) NOT NULL DEFAULT ' ',
  `KSLXID` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`KSID`),
  UNIQUE KEY `KSMC` (`KSMC`),
  KEY `FK_KSLX` (`KSLXID`),
  KEY `KSMCPY` (`KSMCPY`),
  CONSTRAINT `FK_KSLX` FOREIGN KEY (`KSLXID`) REFERENCES `tb_dept_kind` (`KSLXID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='申请科室表';

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`KSID`,`KSMC`,`KSMCPY`,`KSLXID`) values (0001,'一站式','YZS',002),(0002,'二病区','EBQ',002),(0003,'手术室','SSS',002),(0004,'四病区','SBQ',002),(0005,'五病区','WBQ',002),(0006,'六病区','LBQ',002),(0007,'七病区','QBQ',002),(0008,'八病区','BBQ',002),(0009,'九病区','JBQ',002),(0010,'十病区','SHBQ',002),(0011,'ICU','ICU',002),(0012,'胃镜室','WJS',001),(0013,'中医理疗科','ZHYLLK',001),(0014,'出院结账','CHYJZH',002),(0015,'药剂科','YJK',004),(0016,'五官科','WGK',001),(0017,'病理科','BLK',001),(0018,'芝村骨伤','ZHCGSH',006),(0019,'东安','DA',006),(0020,'B超室','BCS',001),(0021,'西药房','XYF',001),(0022,'中药房','ZYF',001),(0023,'病区药房','BQYF',002),(0024,'药库','YK',004),(0025,'民利','ML',006),(0026,'细菌室','XJS',001),(0027,'人事科','RSK',003),(0028,'体检中心','TJZX',003),(0029,'新益','XY',006),(0030,'检验科','JYK',001),(0031,'急诊室','JZS',001),(0032,'后勤中心','HQZX',003),(0033,'文印室','WYS',003),(0034,'财务科','CWK',003),(0035,'基建科','JJK',003),(0036,'心电图','XDT',001),(0037,'御驾桥','YJQ',006),(0038,'妇保门诊','FBMZ',001),(0039,'城郊','CJ',006),(0040,'新桥','XQ',006),(0041,'血透室','XTS',002),(0042,'方便门诊','FBMZ',001),(0043,'挂号室','GHS',001),(0044,'分娩室','FMS',002),(0045,'语溪社区','YXSQ',006),(0046,'联丰','LF',006),(0047,'眼科','YK',001),(0054,'留良','LL',006),(0055,'外联部','WLB',003),(0056,'利顺','LS',006),(0057,'五丰','WF',006),(0058,'上莫','SM',006),(0059,'城东','CD',006),(0060,'湾里村','WLC',006),(0061,'南新','NX',006),(0062,'景卫','JW',006),(0063,'中夫','ZF',006),(0064,'李家坝','LJB',006),(0065,'店家塘','DJT',006),(0066,'陈家埭','CJD',006),(0067,'茅桥埭','MQD',006),(0068,'李家浜','LJB',006);

/*Table structure for table `tb_dept_kind` */

DROP TABLE IF EXISTS `tb_dept_kind`;

CREATE TABLE `tb_dept_kind` (
  `KSLXID` tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `KSLXMC` varchar(8) NOT NULL DEFAULT ' ',
  `MCPY` varchar(8) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`KSLXID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_dept_kind` */

insert  into `tb_dept_kind`(`KSLXID`,`KSLXMC`,`MCPY`) values (001,'门诊楼','MZL'),(002,'住院楼','JZL'),(003,'行政楼','XZL'),(004,'综合楼','ZHL'),(005,'崇德分院','CDFY'),(006,'社区卫生服务站','SQWSFWZ');

/*Table structure for table `tb_employee` */

DROP TABLE IF EXISTS `tb_employee`;

CREATE TABLE `tb_employee` (
  `YGID` tinyint(3) unsigned zerofill NOT NULL,
  `YGXM` char(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`YGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职工信息表';

/*Data for the table `tb_employee` */

insert  into `tb_employee`(`YGID`,`YGXM`) values (001,'曹宏艳'),(002,'朱国强'),(003,'于智慧'),(004,'戴彬彬'),(005,'张晓杰');

/*Table structure for table `tb_stock_out` */

DROP TABLE IF EXISTS `tb_stock_out`;

CREATE TABLE `tb_stock_out` (
  `CKID` mediumint(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `CKSJ` date NOT NULL DEFAULT '2016-01-01',
  `CLID` smallint(4) unsigned zerofill DEFAULT NULL,
  `SQSL` tinyint(4) NOT NULL DEFAULT '0',
  `SFSL` tinyint(4) NOT NULL DEFAULT '0',
  `KSID` smallint(4) unsigned zerofill DEFAULT NULL,
  `YGID` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`CKID`),
  KEY `FK_CLID` (`CLID`),
  KEY `FK_KSID` (`KSID`),
  KEY `FK_YGID` (`YGID`),
  CONSTRAINT `FK_CLID` FOREIGN KEY (`CLID`) REFERENCES `tb_category` (`CLID`),
  CONSTRAINT `FK_KSID` FOREIGN KEY (`KSID`) REFERENCES `tb_dept` (`KSID`),
  CONSTRAINT `FK_YGID` FOREIGN KEY (`YGID`) REFERENCES `tb_employee` (`YGID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='出库详情表';

/*Data for the table `tb_stock_out` */

insert  into `tb_stock_out`(`CKID`,`CKSJ`,`CLID`,`SQSL`,`SFSL`,`KSID`,`YGID`) values (00000001,'2016-12-16',0004,1,1,0012,004),(00000002,'2016-12-16',0001,1,1,0004,005),(00000003,'2016-12-16',0008,1,1,0011,005),(00000004,'2016-12-16',0005,1,1,0015,002),(00000009,'2016-12-17',0008,1,1,0017,005),(00000010,'2016-12-18',0001,1,1,0011,003),(00000011,'2016-12-19',0007,1,1,0001,003),(00000012,'2016-12-19',0009,1,1,0018,003),(00000013,'2016-12-20',0011,1,1,0008,005),(00000014,'2016-12-21',0001,2,2,0002,005),(00000015,'2016-12-21',0007,1,1,0019,003),(00000016,'2016-12-22',0007,4,4,0020,005),(00000017,'2016-12-23',0001,1,1,0005,003),(00000018,'2016-12-24',0005,1,1,0024,003),(00000019,'2016-11-02',0008,1,1,0004,005),(00000020,'2016-11-02',0007,3,3,0014,004),(00000021,'2016-11-02',0010,1,1,0010,004),(00000022,'2016-11-03',0001,2,2,0009,004),(00000023,'2016-11-02',0001,1,1,0011,004),(00000024,'2016-11-04',0010,1,1,0002,003),(00000025,'2016-11-04',0011,1,1,0007,004),(00000026,'2016-11-04',0001,1,1,0005,005),(00000027,'2016-11-04',0009,1,1,0025,005),(00000028,'2016-11-05',0012,2,2,0003,005),(00000029,'2016-11-05',0001,1,1,0004,005),(00000030,'2016-11-06',0008,1,1,0014,003),(00000031,'2016-11-07',0001,3,3,0021,004),(00000032,'2016-11-07',0007,2,2,0006,005),(00000033,'2016-11-07',0001,1,1,0028,005),(00000034,'2016-11-07',0013,1,1,0027,003),(00000035,'2016-11-08',0005,1,1,0029,003),(00000036,'2016-11-08',0001,1,1,0006,005),(00000037,'2016-11-09',0005,1,1,0006,005),(00000038,'2016-11-09',0001,1,1,0002,004),(00000039,'2016-11-09',0007,1,1,0008,005),(00000040,'2016-11-11',0001,1,1,0002,003),(00000041,'2016-11-11',0014,1,1,0030,003),(00000042,'2016-11-11',0005,1,1,0031,003),(00000043,'2016-11-12',0015,1,1,0032,003),(00000044,'2016-11-12',0001,1,1,0011,003),(00000045,'2016-11-12',0007,1,1,0001,005),(00000046,'2016-11-15',0016,1,1,0033,004),(00000047,'2016-11-15',0001,2,2,0023,004),(00000048,'2016-11-15',0001,1,1,0004,003),(00000049,'2016-11-16',0017,1,1,0020,003),(00000050,'2016-11-16',0007,3,3,0020,003),(00000051,'2016-11-16',0018,1,1,0017,003),(00000052,'2016-11-16',0004,1,1,0017,005),(00000053,'2016-11-17',0007,2,2,0022,004),(00000054,'2016-11-17',0001,1,1,0022,004),(00000055,'2016-11-17',0007,4,4,0034,003),(00000056,'2016-11-18',0009,2,2,0036,003),(00000057,'2016-11-18',0008,1,1,0007,004),(00000058,'2016-11-18',0009,1,1,0037,003),(00000059,'2016-11-21',0015,1,1,0038,005),(00000060,'2016-11-21',0007,1,1,0007,005),(00000061,'2016-11-21',0009,2,2,0039,002),(00000062,'2016-11-21',0005,1,1,0040,002),(00000063,'2016-11-22',0006,2,2,0013,003),(00000064,'2016-11-22',0019,1,1,0012,005),(00000065,'2016-11-22',0001,2,2,0002,005),(00000066,'2016-11-23',0007,2,2,0021,005),(00000067,'2016-11-23',0001,2,2,0021,005),(00000068,'2016-11-23',0007,2,2,0014,005),(00000069,'2016-11-24',0015,1,1,0021,005),(00000070,'2016-11-24',0001,2,2,0008,004),(00000071,'2016-11-25',0001,1,1,0011,005),(00000072,'2016-11-25',0009,1,1,0041,003),(00000073,'2016-11-28',0011,1,1,0005,004),(00000074,'2016-11-28',0011,1,1,0042,003),(00000075,'2016-11-28',0020,1,1,0043,003),(00000076,'2016-11-29',0005,2,2,0029,003),(00000077,'2016-11-30',0001,1,1,0001,005),(00000078,'2016-11-30',0006,1,1,0013,005),(00000079,'2016-11-30',0015,1,1,0033,004),(00000080,'2016-11-30',0017,1,1,0033,004),(00000081,'2016-12-03',0001,3,3,0021,003),(00000082,'2016-12-05',0001,2,2,0002,004),(00000083,'2016-12-05',0001,2,2,0044,005),(00000084,'2016-12-06',0009,1,1,0045,005),(00000085,'2016-12-07',0021,1,1,0004,005),(00000086,'2016-12-07',0001,2,2,0009,004),(00000087,'2016-12-08',0001,1,1,0004,003),(00000088,'2016-12-12',0005,1,1,0046,002),(00000089,'2016-12-13',0007,1,1,0008,005),(00000090,'2016-11-14',0007,1,1,0047,005),(00000091,'2016-12-26',0009,2,2,0054,005),(00000092,'2016-12-26',0005,1,1,0015,005),(00000093,'2016-12-27',0017,1,1,0020,005),(00000094,'2016-12-27',0001,2,2,0028,003),(00000095,'2016-12-27',0001,1,1,0055,003),(00000096,'2016-12-27',0014,2,2,0030,003);

/* Procedure structure for procedure `p_q_cat` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_q_cat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_q_cat`(mc varchar(10))
BEGIN
	select * from test.tb_category where CLMC LIKE CONCAT('%',mc,'%')
	UNION
	SELECT * FROM test.tb_category WHERE MATCH(CLPY) AGAINST(CONCAT('%',mc,'%'));
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_q_cat_dept` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_q_cat_dept` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_q_cat_dept`(mc varchar(10))
BEGIN
		
SELECT cat.CLMC AS '品名', dept.KSMC AS '科室名称' FROM
(SELECT CLID,KSID FROM tb_stock_out where KSID in (select KSID from tb_dept where KSMCPY LIKE CONCAT('%',mc,'%')  ) GROUP BY KSID,CLID) AS t1 INNER JOIN tb_category AS cat
ON t1.CLID = CAT.CLID
INNER JOIN tb_dept dept
ON t1.KSID = dept.KSID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_show_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_show_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_show_stock`()
BEGIN
	select * from view_detail;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_tj_stock` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_tj_stock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_tj_stock`()
BEGIN
	
SELECT t1.CKSJ AS '出库时间',cat.CLMC AS '品名', t1.sl AS '实发数量',cat.CLDW AS '材料单位', dept.KSMC AS '科室名称' FROM
(SELECT CKSJ,CLID,KSID,SUM(SFSL) AS sl FROM tb_stock_out GROUP BY CKSJ,KSID,CLID) AS t1 INNER JOIN tb_category AS cat
ON t1.CLID = CAT.CLID
INNER JOIN tb_dept dept
ON t1.KSID = dept.KSID
ORDER BY t1.CKSJ,dept.KSMC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_tj_stock_date` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_tj_stock_date` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_tj_stock_date`(y int,m int)
BEGIN
	SELECT cat.CLMC AS '品名', t1.sl AS '实发数量',cat.CLDW AS '材料单位' FROM
(SELECT CLID,SUM(SFSL) AS sl FROM tb_stock_out where YEAR(CKSJ) = Y AND MONTH(CKSJ) = m GROUP BY CLID ) AS t1 INNER JOIN tb_category AS cat
ON t1.CLID = CAT.CLID
ORDER BY cat.CLMC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_tj_stock_dept_date` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_tj_stock_dept_date` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_tj_stock_dept_date`(y int,M INT)
BEGIN
		
SELECT cat.CLMC AS '品名', t1.sl AS '实发数量',cat.CLDW AS '材料单位', dept.KSMC AS '科室名称',t1.KSID,dept.KSLXID FROM(
(SELECT CKSJ,CLID,KSID,SUM(SFSL) AS sl FROM tb_stock_out WHERE (year(CKSJ) = Y AND MONTH(CKSJ) = M) GROUP BY KSID,CLID) AS t1 INNER JOIN tb_category AS cat
ON t1.CLID = CAT.CLID
INNER JOIN tb_dept dept
ON t1.KSID = dept.KSID)
ORDER BY dept.KSLXID ASC,t1.KSID ASC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `p_tj_stock_year` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_tj_stock_year` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `p_tj_stock_year`(y int)
BEGIN
	SELECT cat.CLMC AS '品名', t1.sl AS '实发数量',cat.CLDW AS '材料单位' FROM
(SELECT CLID,SUM(SFSL) AS sl FROM tb_stock_out where YEAR(CKSJ) = Y GROUP BY CLID ) AS t1 INNER JOIN tb_category AS cat
ON t1.CLID = CAT.CLID
ORDER BY cat.CLMC;
    END */$$
DELIMITER ;

/*Table structure for table `view_cat` */

DROP TABLE IF EXISTS `view_cat`;

/*!50001 DROP VIEW IF EXISTS `view_cat` */;
/*!50001 DROP TABLE IF EXISTS `view_cat` */;

/*!50001 CREATE TABLE  `view_cat`(
 `材料编号` smallint(4) unsigned zerofill ,
 `材料名称` varchar(10) ,
 `材料单位` varchar(1) 
)*/;

/*Table structure for table `view_detail` */

DROP TABLE IF EXISTS `view_detail`;

/*!50001 DROP VIEW IF EXISTS `view_detail` */;
/*!50001 DROP TABLE IF EXISTS `view_detail` */;

/*!50001 CREATE TABLE  `view_detail`(
 `出库编号` mediumint(8) unsigned zerofill ,
 `出库时间` date ,
 `品名` varchar(10) ,
 `申请数量` tinyint(4) ,
 `实发数量` tinyint(4) ,
 `材料单位` varchar(1) ,
 `申请科室` varchar(10) ,
 `领物人` char(4) 
)*/;

/*Table structure for table `view_ksxx` */

DROP TABLE IF EXISTS `view_ksxx`;

/*!50001 DROP VIEW IF EXISTS `view_ksxx` */;
/*!50001 DROP TABLE IF EXISTS `view_ksxx` */;

/*!50001 CREATE TABLE  `view_ksxx`(
 `科室编号` smallint(4) unsigned zerofill ,
 `科室名称` varchar(10) ,
 `科室位置` varchar(8) 
)*/;

/*View structure for view view_cat */

/*!50001 DROP TABLE IF EXISTS `view_cat` */;
/*!50001 DROP VIEW IF EXISTS `view_cat` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_cat` AS select `tb_category`.`CLID` AS `材料编号`,`tb_category`.`CLMC` AS `材料名称`,`tb_category`.`CLDW` AS `材料单位` from `tb_category` */;

/*View structure for view view_detail */

/*!50001 DROP TABLE IF EXISTS `view_detail` */;
/*!50001 DROP VIEW IF EXISTS `view_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_detail` AS select `sout`.`CKID` AS `出库编号`,`sout`.`CKSJ` AS `出库时间`,`cat`.`CLMC` AS `品名`,`sout`.`SQSL` AS `申请数量`,`sout`.`SFSL` AS `实发数量`,`cat`.`CLDW` AS `材料单位`,`dept`.`KSMC` AS `申请科室`,`emp`.`YGXM` AS `领物人` from (((`tb_stock_out` `sout` join `tb_category` `cat` on((`sout`.`CLID` = `cat`.`CLID`))) join `tb_dept` `dept` on((`sout`.`KSID` = `dept`.`KSID`))) join `tb_employee` `emp` on((`sout`.`YGID` = `emp`.`YGID`))) */;

/*View structure for view view_ksxx */

/*!50001 DROP TABLE IF EXISTS `view_ksxx` */;
/*!50001 DROP VIEW IF EXISTS `view_ksxx` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ksxx` AS select `t1`.`KSID` AS `科室编号`,`t1`.`KSMC` AS `科室名称`,`t2`.`KSLXMC` AS `科室位置` from (`tb_dept` `t1` join `tb_dept_kind` `t2` on((`t1`.`KSLXID` = `t2`.`KSLXID`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
