/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.27 : Database - placelist
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`placelist` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `placelist`;

/*Table structure for table `hotplace` */

DROP TABLE IF EXISTS `hotplace`;

CREATE TABLE `hotplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_img` varchar(200) DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_level` varchar(10) DEFAULT NULL,
  `s_area` varchar(100) DEFAULT NULL,
  `s_price` int(11) DEFAULT NULL,
  `s_soldnum` int(11) DEFAULT NULL,
  `sight_hot` int(10) DEFAULT NULL,
  `s_replace` varchar(100) DEFAULT NULL,
  `s_slogen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

/*Data for the table `hotplace` */

insert  into `hotplace`(`id`,`s_img`,`s_name`,`s_level`,`s_area`,`s_price`,`s_soldnum`,`sight_hot`,`s_replace`,`s_slogen`) values (91,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','镇北堡西部影城','5A','宁夏·银川·西夏区',50,38,0,'宁夏省银川市西夏区镇北堡西部影城','邂逅“东方好莱坞”'),(92,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','鸣翠湖滑雪场','0','宁夏·银川·兴庆区',58,18,0,'宁夏回族自治区银川市兴庆区掌政镇境内','银川鸣翠湖国家湿地公园距首府银川仅9公里，是我国第三家，是国家AAAA级旅游景区、国家水利风景区，全国青少年户外体育活动'),(93,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','苏峪口滑雪场','0','宁夏·银川·苏峪口国家森林公园',58,4,1,'宁夏回族自治区银川贺兰县苏峪口国际森林公园内','专业的滑雪设备带给你舒心的滑雪体验'),(94,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','西夏陵','4A','宁夏·银川·西夏区',60,18,1,'宁夏回族自治区银川市西夏区贺兰山东麓','赏夏陵冬韵，探神秘古国'),(95,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','贺兰山岩画','4A','宁夏·银川·贺兰县',30,8,1,'宁夏回族自治区银川市贺兰县贺兰山东麓贺兰口','刻在岩石上的金戈铁马'),(96,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','中华回乡文化园','4A','宁夏·银川·永宁县',21,20,0,'银川南 宁夏银川市永宁县城西高速路口','领略回族历史宗教风俗文化的多姿多彩'),(97,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','青铜峡中华黄河楼','4A','宁夏·吴忠·青铜峡市',30,4,0,'宁夏自治区吴忠青铜峡市黄河路与滨河大道交叉处','屋面铺装金黄色琉璃瓦，整体风格恢弘大气'),(98,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','银川瑞信天沐温泉','0','宁夏·银川·西夏区',78,6,0,'宁夏银川市西夏区镇北堡镇瑞信•镇北堡温泉度假小镇','您养生休闲、旅游度假，快乐生活的源泉'),(99,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','阅海公园滑雪场','0','宁夏·银川·金凤区',88,16,1,'宁夏回族自治区银川金凤区阅海公园滑雪场','滑雪一般的爱好者和初学者的绝佳去处'),(100,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','沙坡头旅游区','5A','宁夏·中卫·沙坡头区',45,4,1,'宁夏回族自治区中卫市沙坡头区迎水桥镇','欧亚大通道，古丝绸之路的必经之地'),(101,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','水洞沟旅游区','5A','宁夏·银川·灵武市',90,10,1,'宁夏银川市灵武市临河镇水洞沟旅游景区','古人类、古长城遗址地'),(102,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','沙湖旅游区','5A','宁夏·石嘴山·平罗县',3,30,1,'宁夏省石嘴山市平罗县境内西大滩','看珍鸟奇禽，群鸟嬉戏的绝佳之地'),(103,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','腾格里湖湿地金沙岛','4A','宁夏·中卫·沙坡头区',3,93,0,'宁夏回族自治区中卫市迎水镇城区西约7公里','沙漠中的伊甸园'),(104,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','鸣翠湖国家湿地公园','4A','宁夏·银川·兴庆区',158,76,1,'宁夏回族自治区银川市兴庆区掌政镇东1公里','湖光戏柳，草树烟绵，百鸟翔集，鱼跃其间'),(105,'http://img1.qunarzz.com/sight/p0/1607/96/96ef74117278c2b2b4.img.jpg_280x200_9fff4bce.jpg','宁夏园艺产业园','0','宁夏·银川·贺兰县',48,66,0,'宁夏银川市贺兰县习岗镇经济桥四社宁夏园艺产业园','集观光、休闲、度假为一体的现代化园区');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
