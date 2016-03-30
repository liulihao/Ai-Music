# MySQL-Front 5.1  (Build 3.35)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: users
# ------------------------------------------------------
# Server version 5.1.32-community

DROP DATABASE IF EXISTS `users`;
CREATE DATABASE `users` /*!40100 DEFAULT CHARACTER SET big5 */;
USE `users`;

#
# Source for table users
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_nkname` varchar(12) DEFAULT NULL,
  `user_id` varchar(12) NOT NULL DEFAULT '',
  `user_password` varchar(12) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_gen` varchar(12) DEFAULT NULL,
  `user_birth` varchar(12) DEFAULT NULL,
  `user_city` varchar(12) DEFAULT NULL,
  `user_pic` varchar(22) DEFAULT NULL,
  `user_intro` varchar(255) DEFAULT '',
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `user_authority` int(1) DEFAULT '0',
  `user_count` int(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=big5 ROW_FORMAT=COMPRESSED;

#
# Dumping data for table users
#
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` VALUES (36,'趙雲珊','毛毛','amemo','12345','yschao77@yahoo.com.tw','Female','1988/03/04','TPE','MVA200.jpg','青春的拋物線  \r<br>把未來駛於相遇的地點\r<br>至高後才了解','2009-09-25 15:12:24','2009-12-14 23:34:59','2009-12-14 23:46:22',0,216);
INSERT INTO `users` VALUES (58,'Mr.N','Mr.N','nnn9999','123','nnn@gmail.com','Male','1983/07/13','TPE',NULL,'那些你堅守的謹慎我的羞赧','2009-09-26 14:38:43','2009-09-29 12:33:52',NULL,1,15);
INSERT INTO `users` VALUES (65,'管理者','管理者','admin','12345','yschao77@yahoo.com.tw','Male',NULL,NULL,NULL,NULL,'2009-09-27 23:20:22','2009-12-17 10:41:48','2009-12-17 10:43:35',3,17);
INSERT INTO `users` VALUES (67,'劉力豪','豪','howard','123','495741085@mail.fju.edu.tw','Male','1987/12/24','台北市','1.jpg','回到最初的美好\r<br>找回最真實的感動\r<br>那一年的幸福時光','2009-09-29 18:06:56','2009-12-10 19:49:14','2009-10-30 00:41:06',0,227);
INSERT INTO `users` VALUES (69,'林佩穎','Queen','queen','123','queen@pchome.com.tw','Female','1987/12/03','TAIPEI','478.gif','熱愛日本音樂~最愛搖滾樂了!!!\r<br>\r<br>當我真心在追尋我的夢想時，\r<br>每一天都是繽紛的，\r<br>因為我知道，\r<br>每一個小時都是在實現夢想的一部分。','2009-09-30 18:55:07','2009-12-01 22:31:26','2009-10-21 21:29:19',0,71);
INSERT INTO `users` VALUES (102,'邱偉','奇魔','kimosky','123','yschao77@gmail.com','Male','1988/10/10','TPE','noimage.jpg','','2009-10-02 18:47:46','2009-10-21 21:26:28','2009-10-21 21:27:59',0,67);
INSERT INTO `users` VALUES (106,'力豪','H','howard1224','12345','495741085@mail.fju.edu.tw','Male','1987/12/24','台北','noimage.jpg','','2009-10-08 01:14:22','2009-10-21 21:31:02','2009-10-21 21:31:20',0,61);
INSERT INTO `users` VALUES (107,'多喝水','多喝水','water','12345','495741085@mail.fju.edu.tw','Male','1990/08/19','台中','IMG1.jpg','','2009-10-08 02:21:09','2009-10-30 01:05:46','2009-10-30 01:05:57',0,42);
INSERT INTO `users` VALUES (108,'典心','典心','dessert','12345','dessert@gmail.com','Female','1988/10/02','新竹','4462.jpg','好男人猶如一杯白開水，\r<br>對身體有益，\r<br>喝來卻索然無味；\r<br>壞男人猶如一杯烈酒，\r<br>誘人陷溺沉淪，\r<br>永遠學不會淺嚐輒止！','2009-10-10 14:35:28','2009-10-30 01:06:13','2009-10-30 01:06:35',0,90);
INSERT INTO `users` VALUES (109,'席絹','席絹','Jenny','12345','jenny@hotmail.com','Female','1982/06/10','台南','s456.gif','','2009-10-10 15:19:39','2009-10-20 19:52:25','2009-10-20 19:55:14',0,72);
INSERT INTO `users` VALUES (110,'邱偉民','uni','kimo1020','601128','thefirstsky@hotmail.com','Male','1987/10/20','台北','1218897592.jpg','看天國  看快活  \r<br>看眼角耳際開出花朵\r<br>看飛過天堂人間生的耳膜\r<br>儘管痛苦麻痺還是那麼多  \r<br>天空就算不藍或許還有彩虹\r<br>找線索  找窗口 \r<br>鑽出海平面烏雲的舌頭要解脫','2009-10-11 21:36:45','2009-10-26 15:25:37','2009-10-26 15:25:44',0,83);
INSERT INTO `users` VALUES (111,'蘇詠凱','蘇詠凱','chair','495742168','k90034@hotmail.com','Male','1988/08/30','city','group-therapy.jpg','幾天前才剛從芭瑪水災中脫困的宜蘭，今天又再降下大雨，冬山鄉等低漥地區再度水淹及膝，一週內兩度大雨成災，汪洋一片，遭洪水淹入家門的民眾苦不堪言。','2009-10-12 03:26:40','2009-10-30 01:06:57','2009-10-30 01:11:07',0,58);
INSERT INTO `users` VALUES (112,'陳敬宏','Boss','Boss1012','20091012','kimo@hotmail.com','Male','1987/10/20','台中','5262.JPG','剛剛看了好多以前的照片\r<br>有的照片離上次看的時間已經可以用年份來算\r<br>好多遺失的回憶又回到我的腦子裡\r<br>好多以前的朋友現在居然連電話號碼都不見了\r<br>真的會感嘆一口氣　\r<br>時間過好快...　','2009-10-12 23:07:06','2009-12-06 18:30:55','2009-12-06 18:34:05',0,181);
INSERT INTO `users` VALUES (113,'葉彥伶','大尾','a1973207','12345','a1973207@hotmail.com','Female','1987/09/11','台北','noimage.jpg','','2009-10-14 14:16:18','2009-10-30 00:42:36','2009-10-30 00:42:38',0,92);
INSERT INTO `users` VALUES (114,'沈宛瑩','小胖寶寶','milkbaby424','495741449','milkbaby424@hotmail.com','Female','1988/04/24','台北','117997.JPG','大家好~','2009-10-15 17:53:19','2009-10-30 01:10:54','2009-10-30 00:52:41',0,101);
INSERT INTO `users` VALUES (115,'劉昇倫','老倫','andy00284200','andy00284','andy002842000@hotmail.com','Male','1989/09/05','台北縣','The Very Best Of.jpg','','2009-10-16 14:33:07','2009-10-29 23:23:56','2009-10-29 23:34:00',0,101);
INSERT INTO `users` VALUES (116,'吳丞祐','阿公','dear0000','00000','dearjohn10704@yahoo.com.tw','Male','1988/10/04','Taipei','noimage.jpg','','2009-10-16 17:25:49','2009-10-30 00:51:46','2009-10-30 00:51:59',0,63);
INSERT INTO `users` VALUES (117,'夏帆','Kaho','kaho630','12345','k90685@yahoo.com.tw','Female','1991/06/30','台北','kaho00.JPG','歸根曰靜，是謂復命。\r<br>復命曰常，知常曰明。\r<br>不知常，妄作，凶。\r<br>','2009-10-16 21:43:08','2009-10-21 21:24:27','2009-10-21 21:26:20',0,61);
INSERT INTO `users` VALUES (118,'阿蛤大王','蛤','qzeric','12345','ericserena2002@hotmail.com','Male','1930/01/01','台北','noimage.jpg','','2009-10-17 22:37:48','2009-10-21 01:34:40','2009-10-21 01:34:54',0,76);
INSERT INTO `users` VALUES (119,'陳俞凡','芋頭','itaro','12345','yschao77@yahoo.com.tw','Male','1986/10/14','TPE','4.png','最遙遠的距離\r<br>最靠近你','2009-10-21 12:12:20','2009-10-30 00:45:52','2009-10-30 00:49:25',0,71);
INSERT INTO `users` VALUES (120,'王亞榆','逗趣','wendy','12345','wendy1224@homail.com','Female','1987/12/24','屏東市','pic.jpg','在終點的哨聲響起前\r<br>總以為可以這樣下去','2009-10-21 12:13:58','2009-12-17 10:40:12','2009-12-17 10:40:21',0,402);
INSERT INTO `users` VALUES (121,'黃聖佑','紅豆','redbean','12345','495741085@mail.fju.edu.tw','Male','1987/10/08','台北','Living On The Edge.jpg','喜歡翻唱別人的歌曲\r<br>\r<br>目前也在學習創作中','2009-10-21 12:40:59','2009-10-30 01:09:36','2009-10-30 01:10:27',0,276);
INSERT INTO `users` VALUES (122,'陳漢威','MAS','massy','12345','yschao77@yahoo.com.tw','Male','1988/04/05','台中','justchewy.jpg','初試啼聲\r<br>請大家多多指教','2009-10-21 12:42:32','2009-10-26 19:40:27','2009-10-26 19:45:57',0,108);
INSERT INTO `users` VALUES (123,'趙雲珊','毛毛','yschao77','12345','yschao77@yahoo.com.tw','Female','1988/02/28','TPE','1.jpg','','2009-10-21 13:52:55','2009-10-30 00:25:29','2009-10-29 23:39:58',0,7);
INSERT INTO `users` VALUES (124,'秦睦軒','艾迪秦','eddie77823','123456','eddie77823@yahoo.com.tw','Male','1988/08/23','Taipei','powerliver.jpg','喔喔~~好酷的網站!!','2009-10-22 00:25:30','2009-10-30 00:53:14','2009-10-30 00:53:43',0,24);
INSERT INTO `users` VALUES (125,'吳涵之','Kaito','kaitozoe','12345','kaitozoe@gmail.com','Male','1989/08/22','新竹','P5010086.JPG','','2009-10-23 22:19:23','2009-10-30 00:49:34','2009-10-30 00:50:41',0,9);
INSERT INTO `users` VALUES (126,'陳家蓉','galon','kkkinn','760310','kkkinn@hotmail.com','Female','1987/03/10','台北','5.jpg','','2009-10-23 22:26:26','2009-10-29 23:36:23','2009-10-29 23:37:07',0,5);
INSERT INTO `users` VALUES (128,'楊昇儒','貍貓山','shengju1029','vul3xu6a','shengju1029@hotmail.com','Male','1987/10/29','Kamalan','DSCN7515.JPG','','2009-10-25 17:30:21','2009-10-26 22:47:34','2009-10-26 22:42:38',0,16);
INSERT INTO `users` VALUES (129,'張郁琪','yuki','astrochi','mjk9990','mjk9990@hotmail.com','Female','1988/08/16','高雄','yuki.JPG','','2009-10-25 17:32:44','2009-10-29 23:35:03','2009-10-29 23:35:32',0,7);
INSERT INTO `users` VALUES (131,'方瓊儀','低調蟲','fun210148','iloj1314','fun210148@hotmail.com','Female','1987/11/27','台南','DSC06032.JPG','','2009-10-26 23:35:28',NULL,NULL,0,10);
INSERT INTO `users` VALUES (132,'黃威豪','demo','demoboy','495742716','gn30272@hotmail.com','Male','1987/05/27','Taipei','noimage.jpg','','2009-11-04 13:29:57','2009-11-04 13:33:54','2009-11-04 13:41:50',0,2);
INSERT INTO `users` VALUES (133,'邱偉&#29641;','kimooo','kimokimo','kimo123','thefirstsky@hotmail.com','Male','1987/12/11','TPE','noimage.jpg','','2009-12-02 01:49:58','2009-12-15 10:03:40','2009-12-15 10:06:18',0,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
