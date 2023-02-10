/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 10/02/2023 12:39:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `startDate` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `endDate` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('37f7e38fd878474082c3e5fe0a601310', '58dbef8cae4f454cb9819bf3854a19a0', '发传单', '2022-03-16', '2022-03-26', '123454', '很赚钱的生意', '2022-03-16 18:54:27', '超极用户', '2022-03-22 21:02:00', '小小晓');
INSERT INTO `tbl_activity` VALUES ('5c52197cda2e4478b8935403807c9f9c', '4d399a9d2e574d028c695191f14dfd5b', '吹嘘离开', '2022-03-18', '2022-03-26', '0', '', '2022-03-23 20:26:51', '公共', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('818094d50b044771932b1421769f6ec4', '58dbef8cae4f454cb9819bf3854a19a0', '插队', '2022-03-10', '2022-04-02', '2898', '哈哈哈，及不过我爸\n多点成本多点爱', '2022-03-16 19:41:11', '超极用户', '2022-03-23 20:06:05', '小小晓');
INSERT INTO `tbl_activity` VALUES ('83fc369a68db4fedbfa42851f928d697', '58dbef8cae4f454cb9819bf3854a19a0', '打架', '2022-03-16', '2031-01-04', '300', '虽说成本理论是0，但是还是需要医药费的', '2022-03-16 19:38:57', '超极用户', '2022-03-21 20:47:30', '小小晓');
INSERT INTO `tbl_activity` VALUES ('9132b8d718e9472fae26ce2dc1864664', '58dbef8cae4f454cb9819bf3854a19a0', '卖圣保', '2022-03-09', '2022-03-17', '35', '名字不重要——少买点', '2022-03-16 19:39:18', '超极用户', '2022-03-21 20:56:02', '小小晓');
INSERT INTO `tbl_activity` VALUES ('a728db054ce74894b9d0fa54320aa7ed', '58dbef8cae4f454cb9819bf3854a19a0', '回流身法', '2022-03-11', '2022-03-16', '240', '没有描述', '2022-03-21 19:06:01', NULL, '2022-03-23 20:21:01', '公共');
INSERT INTO `tbl_activity` VALUES ('b4e265e9a74342f1b750e6dd3b143eb6', 'a75979c30fb442dba3cf507160b15ea6', '卖艺', '2022-03-16', '2022-04-14', '0', '无本买卖，很合适', '2022-03-16 19:21:04', '超极用户', '2022-03-16 19:36:20', '超极用户');
INSERT INTO `tbl_activity` VALUES ('b76e605877464e7e87e48d1e9f12ab1c', '264264c552134fd5a75c7ceb85d80b17', '标定', '2022-03-10', '2022-03-30', '20', '帮别人标定相机肯定很挣钱', '2022-03-16 19:36:08', '超极用户', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('bbcc6a99482c4d849c6dc572ec0816ce', '40f6cdea0bd34aceb77492a1656d9fb3', '吃饭', '2022-03-25', '2022-04-09', '27', '只要我吃得多，肥胖就赶不上我', '2022-03-16 19:39:55', '超极用户', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('c08ce99595ec4a75b07f4b69bb27b81e', 'a75979c30fb442dba3cf507160b15ea6', '碰碰车', '2022-03-10', '2022-03-25', '2', '就喜欢碰瓷', '2022-03-16 19:40:23', '超极用户', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('cb1966054cf84fea8687f63b2a87f1f0', '06f5fc056eac41558a964f96daa7f27c', '买例子', '2022-03-25', '2022-07-02', '20', '一个例子需要100元，转疯了', '2022-03-16 19:38:11', '超极用户', '2022-03-16 23:04:54', 'mimi小号');
INSERT INTO `tbl_activity` VALUES ('f67f98363f7d42a4a55a217f5fbeb44d', '0eeb97c2608a42d2be45b1864437da9e', '胸口碎大石', '2022-03-18', '2270-12-31', '1', '主要是要买个大石头和大锤子——想看你一直碎大石', '2022-03-16 19:35:26', '超极用户', '2022-03-16 23:05:38', 'mimi小号');

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0??ʾδ?޸ģ?1??ʾ???޸',
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('01504cba5a3b46f4854688b200f7eb8e', '看着真让人头大', '2022-03-16 22:44:31', 'mimi小号', NULL, NULL, '0', 'b76e605877464e7e87e48d1e9f12ab1c');
INSERT INTO `tbl_activity_remark` VALUES ('0416576fd1b048078aa3a412bb8b41bb', '那我买', '2022-03-16 23:04:38', 'mimi小号', NULL, NULL, '0', 'cb1966054cf84fea8687f63b2a87f1f0');
INSERT INTO `tbl_activity_remark` VALUES ('0a41b22dffad4379b2caa23aa50d470e', '好的-真好', '2022-03-21 19:11:09', NULL, '2022-03-21 19:11:17', NULL, '1', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_activity_remark` VALUES ('0b3f8e58614645fd8762452da197bbd8', '啦啦啦阿联', '2022-03-23 20:22:32', '公共', NULL, NULL, '0', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_activity_remark` VALUES ('274e4da839574d2c903f2880d06b1c12', '不吃可不行', '2022-03-16 22:46:48', 'mimi小号', NULL, NULL, '0', 'bbcc6a99482c4d849c6dc572ec0816ce');
INSERT INTO `tbl_activity_remark` VALUES ('2b7e08c6ea334fe7965961217b823634', '我不买', '2022-03-16 22:51:32', '小小晓', NULL, NULL, '0', 'cb1966054cf84fea8687f63b2a87f1f0');
INSERT INTO `tbl_activity_remark` VALUES ('32838b4b42ed454287e9671df499da69', '正常', '2022-03-22 21:02:07', '小小晓', NULL, NULL, '0', '37f7e38fd878474082c3e5fe0a601310');
INSERT INTO `tbl_activity_remark` VALUES ('3c03cf42185545bc9604b7e28ed93a65', '不许插队', '2022-03-23 20:05:53', '小小晓', NULL, NULL, '0', '818094d50b044771932b1421769f6ec4');
INSERT INTO `tbl_activity_remark` VALUES ('4b3b54cea3564a8a8a52087f3f95f4b2', '呼应是垃圾——说得对', '2022-03-23 20:21:11', '公共', '2022-03-23 20:21:20', '公共', '1', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_activity_remark` VALUES ('54305c8ffd234f468823f2e88efe0aee', '我喜欢——我也是', '2022-03-16 21:55:53', '超极用户', '2022-03-16 22:43:31', 'mimi小号', '1', '818094d50b044771932b1421769f6ec4');
INSERT INTO `tbl_activity_remark` VALUES ('546c5e67b0944dba948dbd01e2255c6b', '哇塞', '2022-03-21 19:19:12', NULL, NULL, NULL, '0', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_activity_remark` VALUES ('567dfe70ce8f4efaa3883dacad9cb747', '撞死他丫的！！！！', '2022-03-16 21:59:44', '超极用户', NULL, NULL, '0', 'c08ce99595ec4a75b07f4b69bb27b81e');
INSERT INTO `tbl_activity_remark` VALUES ('57e23941786c469d91eded70bfc93117', '居然没有', '2022-03-21 20:55:16', '小小晓', NULL, NULL, '0', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_activity_remark` VALUES ('5926f7a065194f61b794fba36ed55eae', '传单', '2022-03-16 23:04:06', 'mimi小号', NULL, NULL, '0', '37f7e38fd878474082c3e5fe0a601310');
INSERT INTO `tbl_activity_remark` VALUES ('662aedcde3a04abfa6350fc0477d04a5', '我也要看', '2022-03-21 20:57:07', '小小晓', NULL, NULL, '0', 'f67f98363f7d42a4a55a217f5fbeb44d');
INSERT INTO `tbl_activity_remark` VALUES ('7cb1caf994c7450ab9732a65ccd3c1aa', '这很奇怪', '2022-03-16 22:44:58', 'mimi小号', NULL, NULL, '0', '83fc369a68db4fedbfa42851f928d697');
INSERT INTO `tbl_activity_remark` VALUES ('876e89c9fb184dc68aa26a71043c0d18', '我出一块石头', '2022-03-21 20:57:28', '小小晓', NULL, NULL, '0', 'f67f98363f7d42a4a55a217f5fbeb44d');
INSERT INTO `tbl_activity_remark` VALUES ('877e916ab6a8405592cc6377b22c18e5', '大家一起来插队', '2022-03-16 22:43:50', 'mimi小号', NULL, NULL, '0', '818094d50b044771932b1421769f6ec4');
INSERT INTO `tbl_activity_remark` VALUES ('985047f63ca0441f89080577f3c1982a', '我也要玩', '2022-03-16 22:07:35', 'mimi小号', NULL, NULL, '0', 'c08ce99595ec4a75b07f4b69bb27b81e');
INSERT INTO `tbl_activity_remark` VALUES ('9a25bb8f22ed4dd1ac25bf4f138c60a6', '静待小小晓表演！！！！！', '2022-03-16 22:46:01', 'mimi小号', NULL, NULL, '0', 'f67f98363f7d42a4a55a217f5fbeb44d');
INSERT INTO `tbl_activity_remark` VALUES ('9a3af503ae1e4b298bb2adb907fc2321', '哈哈哈哈', '2022-03-22 20:53:46', '小小晓', NULL, NULL, '0', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_activity_remark` VALUES ('af5133f6db5748f2bc2a63368e98a5a0', '吃就完了', '2022-03-16 22:46:38', 'mimi小号', NULL, NULL, '0', 'bbcc6a99482c4d849c6dc572ec0816ce');
INSERT INTO `tbl_activity_remark` VALUES ('b324e7312c404c26a3fed2e469e77868', '好烦啊', '2022-03-22 20:50:19', '小小晓', NULL, NULL, '0', 'a728db054ce74894b9d0fa54320aa7ed');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('00864dc8fc8b411b815dbd70780830fa', 'mii', '72dcf08c8ead43d2a967c616df924e74', '0eeb97c2608a42d2be45b1864437da9e', 'lytro', '嘟嘟嘴', '', '333', 'aesaggf', '123', '2173663b40b949ce928db92607b5fe57', 'ff802a03ccea4ded8731427055681d48', '小小晓', '2022-03-22 15:38:06', NULL, NULL, '', '没有', '2022-03-02', '');
INSERT INTO `tbl_clue` VALUES ('135b6cd8271645769c46af899c2a2354', '猪猪侠是否', '176039d2a90e4b1a81c5ab8707268636', '0eeb97c2608a42d2be45b1864437da9e', '美灭国', '弟弟', '3215342198@qq.com', '+8618226187054', '', '3254', '06e3cbdf10a44eca8511dddfc6896c55', '6b86f215e69f4dbd8a2daa22efccf0cf', '小小晓', '2022-03-22 15:41:49', NULL, NULL, '', '', '2022-03-19', '');
INSERT INTO `tbl_clue` VALUES ('381bdf242b254bd0aa7dd9adee0c83bd', '是真的不是个', '31539e7ed8c848fc913e1c2c93d76fd1', '0eeb97c2608a42d2be45b1864437da9e', '十八日发', '', '', '', '', '', '', '', '小小晓', '2022-03-22 15:44:01', NULL, NULL, '', '但是v阿飞', '', '');
INSERT INTO `tbl_clue` VALUES ('3d26b09a720942739c5b2a37b7b4d658', '打他妈的', '45c6ed2da0fd43428160ebf21b9842c4', 'a75979c30fb442dba3cf507160b15ea6', '游戏主播', '', '', '', '', '', '9e6d6e15232549af853e22e703f3e015', '86c56aca9eef49058145ec20d5466c17', '小小晓', '2022-03-17 18:24:04', NULL, NULL, '', '', '', '狗窝');
INSERT INTO `tbl_clue` VALUES ('43c14a5b83e642efa191a941ad42d161', '无法无天', '221c8f20bb334fac88a48fc5c8f41a98', '3162aba1f9b84c9cbe5dd35fc1cea202', '功德', '脱离老师', '3215342198@qq.com', '+8618226187054', 'www.jujubo.com', '122873456', '966170ead6fa481284b7d21f90364984', '48512bfed26145d4a38d3616e2d2cf79', '公共', '2022-03-19 16:42:21', '小小晓', '2022-03-22 13:40:05', '', '这真把', '2022-03-16', '');
INSERT INTO `tbl_clue` VALUES ('7faf15abdef94e5f89b65e4e6fe86f17', '小猪猪', '72dcf08c8ead43d2a967c616df924e74', '264264c552134fd5a75c7ceb85d80b17', '美国', '', '3215342198@qq.com', '+8618226187355', 'www.jujubo.com', '122873456', '310e6a49bd8a4962b3f95a1d92eb76f4', '12302fd42bd349c1bb768b19600e6b20', '小小晓', '2022-03-17 18:12:57', '小小晓', '2022-03-21 21:22:53', '', '', '2022-03-19', '');
INSERT INTO `tbl_clue` VALUES ('94458d9ee18045638edfaa349b0c3425', '小学生', 'e5f383d2622b4fc0959f4fe131dafc80', '4d399a9d2e574d028c695191f14dfd5b', '希望小学', '学习', 'youyou@163.com', '12598336782', 'www.donanan.com', '12356772393', '310e6a49bd8a4962b3f95a1d92eb76f4', '3a39605d67da48f2a3ef52e19d243953', 'mimi小号', '2022-03-17 10:54:03', 'mimi小号', '2022-03-17 12:34:33', '这是一个含好玩的小学生', '', '2022-03-25', '大日本省');
INSERT INTO `tbl_clue` VALUES ('b41379a48edc44c4a0be270f8e6abf42', '干就完了', 'c4f7ddaf3fe74f709198ef48e38084c0', '0eeb97c2608a42d2be45b1864437da9e', '干就完了大公司', '干', 'ganjiuwanle@163.com', '332', '', '112', '966170ead6fa481284b7d21f90364984', 'fd677cc3b5d047d994e16f6ece4d3d45', '小小晓', '2022-03-17 18:09:57', NULL, NULL, '', '', '2056-08-18', '青楼');
INSERT INTO `tbl_clue` VALUES ('b974604a5e9d4d87a588ea150bb336a4', '啊v人防办', 'e5f383d2622b4fc0959f4fe131dafc80', '0eeb97c2608a42d2be45b1864437da9e', 'VS分别是别的人工', '', '', '', '', '', '', '3a39605d67da48f2a3ef52e19d243953', '小小晓', '2022-03-22 15:44:14', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_clue` VALUES ('d10524787a0246c6933216759c300300', '就会快乐健康', '9deb1c95294f4989b9644307c4168a44', '4d399a9d2e574d028c695191f14dfd5b', '剥', '后怕', '', '2342', '', '32462', '06e3cbdf10a44eca8511dddfc6896c55', '3a39605d67da48f2a3ef52e19d243953', '小小晓', '2022-03-22 15:38:40', NULL, NULL, '', '', '2022-06-18', '');
INSERT INTO `tbl_clue` VALUES ('ef0bbf23f2fa4b39863be349432f817c', '小妹子', '176039d2a90e4b1a81c5ab8707268636', '40f6cdea0bd34aceb77492a1656d9fb3', '大妹子', '弟弟', '', '', '', '', '966170ead6fa481284b7d21f90364984', '4d03a42898684135809d380597ed3268', '小小晓', '2022-03-17 18:13:38', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_clue` VALUES ('f5000216d36c49f28c3a6926e8a539a5', '张胜男', '9deb1c95294f4989b9644307c4168a44', '0eeb97c2608a42d2be45b1864437da9e', '日本', '转笔', '888237@qq.com', '1209543896', 'www.jiel.com', '110', '310e6a49bd8a4962b3f95a1d92eb76f4', 'a83e75ced129421dbf11fab1f05cf8b4', '小小晓', '2022-03-17 18:08:44', NULL, NULL, '', '', '', '猪圈');
INSERT INTO `tbl_clue` VALUES ('fbcc0947de2c40a2a3e4d4b6d36e96e8', '无敌', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '东北那嘎达', '老大', '', '110', 'www.baidu.com', '+8618226187054', '2173663b40b949ce928db92607b5fe57', '4d03a42898684135809d380597ed3268', 'mimi小号', '2022-03-17 10:44:36', NULL, NULL, '很厉害的，别小看了', '说话小心点', '2022-03-19', '安徽省合肥市庐江县乐桥镇');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `clueId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('02a97e6d6b1149f1bc2a44069a248e1f', '94458d9ee18045638edfaa349b0c3425', 'cb1966054cf84fea8687f63b2a87f1f0');
INSERT INTO `tbl_clue_activity_relation` VALUES ('11a7e9375750427fb172a29e212e312d', 'b41379a48edc44c4a0be270f8e6abf42', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_clue_activity_relation` VALUES ('4e2dbb54b3104b4cb9aa621bc12de247', '3d26b09a720942739c5b2a37b7b4d658', 'bbcc6a99482c4d849c6dc572ec0816ce');
INSERT INTO `tbl_clue_activity_relation` VALUES ('60fc53df2d5347eb81dc0ba161ccfc04', 'b974604a5e9d4d87a588ea150bb336a4', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_clue_activity_relation` VALUES ('6dc5d7c1738c4afc9bf2c3e227907a69', 'b974604a5e9d4d87a588ea150bb336a4', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_clue_activity_relation` VALUES ('6ed4463a53784e1d95afe58d4b9d1df1', '43c14a5b83e642efa191a941ad42d161', '37f7e38fd878474082c3e5fe0a601310');
INSERT INTO `tbl_clue_activity_relation` VALUES ('9212d9e9effe49288c2e033b103e63f2', 'b974604a5e9d4d87a588ea150bb336a4', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_clue_activity_relation` VALUES ('992c5a4ef4cf46d1a5d6d25ddee070dd', '43c14a5b83e642efa191a941ad42d161', '83fc369a68db4fedbfa42851f928d697');
INSERT INTO `tbl_clue_activity_relation` VALUES ('a1656b7cd7c9471b8e6535916df9ec23', '3d26b09a720942739c5b2a37b7b4d658', '83fc369a68db4fedbfa42851f928d697');
INSERT INTO `tbl_clue_activity_relation` VALUES ('af077490f08b47aeb0c694001a225f8b', '94458d9ee18045638edfaa349b0c3425', 'f67f98363f7d42a4a55a217f5fbeb44d');
INSERT INTO `tbl_clue_activity_relation` VALUES ('c988b89ed8574e5e8ca06a58c718d4f4', '3d26b09a720942739c5b2a37b7b4d658', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_clue_activity_relation` VALUES ('d16c7102cede4e8aa5c1d96c058e0f32', 'b41379a48edc44c4a0be270f8e6abf42', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_clue_activity_relation` VALUES ('d99025364bc5472a8fa3ff751905c180', '43c14a5b83e642efa191a941ad42d161', 'b76e605877464e7e87e48d1e9f12ab1c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('daf964f32841402e9226dfcab7252beb', '3d26b09a720942739c5b2a37b7b4d658', 'f67f98363f7d42a4a55a217f5fbeb44d');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e531b7535b284ed6bcb8f081c6b90a9f', '3d26b09a720942739c5b2a37b7b4d658', 'cb1966054cf84fea8687f63b2a87f1f0');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clueId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('6cac00ca3d294c1fb911998336329b9f', '好的', '小小晓', '2022-03-22 12:41:44', NULL, NULL, '0', 'b41379a48edc44c4a0be270f8e6abf42');
INSERT INTO `tbl_clue_remark` VALUES ('6f36755600224c2493aed68c334aca8a', '最喜欢卖', '公共', '2022-03-17 18:20:17', NULL, NULL, '0', 'b41379a48edc44c4a0be270f8e6abf42');
INSERT INTO `tbl_clue_remark` VALUES ('901f60af143e43708d0b91b16088d3ce', '没有头发就是厉害', '小小晓', '2022-03-22 13:40:27', NULL, NULL, '0', '43c14a5b83e642efa191a941ad42d161');
INSERT INTO `tbl_clue_remark` VALUES ('d9b90fdf6ceb4c428e27624b2080c473', '我省不太行', 'mimi小号', '2022-03-17 12:34:09', NULL, NULL, '0', '94458d9ee18045638edfaa349b0c3425');
INSERT INTO `tbl_clue_remark` VALUES ('ecd6a7da890a46f7ab9093b83b88c090', '不能，', '小小晓', '2022-03-23 20:15:11', NULL, NULL, '0', 'b974604a5e9d4d87a588ea150bb336a4');

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `birth` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('3428d199c30d49ef8ecfcfda472b1f52', '0eeb97c2608a42d2be45b1864437da9e', '12302fd42bd349c1bb768b19600e6b20', 'fd915804a17b4214a2bcf5cb7eb7ae53', '嘟嘟', '0dd915ae99ce4fed90b1b10dca62e62e', '', '', '', '2022-05-13', '小小晓', '2022-03-23 20:16:59', NULL, NULL, '', '', '2022-03-26', '');
INSERT INTO `tbl_contacts` VALUES ('35153a3b1b6a4a5eb19a2c0c6681a1d9', '3162aba1f9b84c9cbe5dd35fc1cea202', 'ff802a03ccea4ded8731427055681d48', '55599ff25e814bdaa81095512f8e5181', '没有名字的', '176039d2a90e4b1a81c5ab8707268636', '', '333', '', '2022-03-22', '公共', '2022-03-20 23:07:39', '公共', '2022-03-20 23:07:53', '', '', '2022-03-11', '');
INSERT INTO `tbl_contacts` VALUES ('425b8b42a8d64b6684a1238a82297600', '58dbef8cae4f454cb9819bf3854a19a0', '', 'dc2f26fb54004a0ebdaff8747138c5fa', '打包v', '67165c27076e4c8599f42de57850e39c', '', '', '德国坦克谬', NULL, '小小晓', '2022-03-22 15:50:35', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_contacts` VALUES ('43dbb92290654411af3aab11bf8aefbe', 'a75979c30fb442dba3cf507160b15ea6', 'db867ea866bc44678ac20c8a4a8bfefb', 'fd915804a17b4214a2bcf5cb7eb7ae53', '打胎那个', '31539e7ed8c848fc913e1c2c93d76fd1', 'chengcai_xu@163.com', '', '干饭王', NULL, '小小晓', '2022-03-22 15:46:14', NULL, NULL, '', '', '2022-03-18', '');
INSERT INTO `tbl_contacts` VALUES ('450d613c625f47f0bec68f4a28268a2d', '58dbef8cae4f454cb9819bf3854a19a0', '72f13af8f5d34134b5b3f42c5d477510', '55599ff25e814bdaa81095512f8e5181', '张飞', '0dd915ae99ce4fed90b1b10dca62e62e', '3215342198@qq.com', '15800703451', '吃饭', NULL, '公共', '2022-03-19 16:44:22', NULL, NULL, '哈哈哈哈', '', '2022-03-18', '乐桥镇鳌山村');
INSERT INTO `tbl_contacts` VALUES ('472ff2d26dc34be1bd034757f7d59d97', '264264c552134fd5a75c7ceb85d80b17', 'db867ea866bc44678ac20c8a4a8bfefb', '2fac0b9a2f934b3d9033b886c9bbfd95', '快捷键皮惨', '45c6ed2da0fd43428160ebf21b9842c4', 'chengcai_xu@163.com', '', '学习', NULL, '小小晓', '2022-03-23 12:30:27', NULL, NULL, '', '', '2022-06-24', '');
INSERT INTO `tbl_contacts` VALUES ('492b729c6a964f089d7eac05c089a9f6', '06f5fc056eac41558a964f96daa7f27c', 'ff802a03ccea4ded8731427055681d48', 'aa04b429bf49402085b7b58299f8496f', '安抚v发', 'c4f7ddaf3fe74f709198ef48e38084c0', '23543', '254326', '按动时', NULL, '小小晓', '2022-03-22 15:53:29', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_contacts` VALUES ('579beaa7a56a4f46961c092cf4e271d2', '4d399a9d2e574d028c695191f14dfd5b', 'a83e75ced129421dbf11fab1f05cf8b4', 'f2c72939655b4a929112c973103ecaa2', '普通', '67165c27076e4c8599f42de57850e39c', 'youxianag', '233', 'wu', NULL, '小小晓', '2022-03-22 15:31:17', NULL, NULL, '', '纪要', '2022-03-18', '');
INSERT INTO `tbl_contacts` VALUES ('5f3111865e8b4262992e27b793e08b9b', '0eeb97c2608a42d2be45b1864437da9e', '6b86f215e69f4dbd8a2daa22efccf0cf', 'f2c72939655b4a929112c973103ecaa2', '都是啊的女', 'b3fd1e06866648bca016a34c15e9b0b0', '2523452', '2435', '没有', '2022-03-26', '小小晓', '2022-03-22 17:31:15', '小小晓', '2022-03-22 20:59:29', '', '纪要', '2022-03-18', '就反击');
INSERT INTO `tbl_contacts` VALUES ('6a9a7ccd79684d41bca18aa8bb3ff663', '0eeb97c2608a42d2be45b1864437da9e', 'fd677cc3b5d047d994e16f6ece4d3d45', 'c37514962d7344bcaade5857d8566ab3', '张胜男', '31539e7ed8c848fc913e1c2c93d76fd1', '32七42', '33254', '靠卖哦', NULL, '小小晓', '2022-03-22 15:53:01', NULL, NULL, '', '', '2022-03-12', '');
INSERT INTO `tbl_contacts` VALUES ('6b149ea1e6b0447f801d5205cb3c8f23', 'a75979c30fb442dba3cf507160b15ea6', '6b86f215e69f4dbd8a2daa22efccf0cf', 'b16fc9f6ec4d4244ae1a5552ee404221', '论科技和生产力的发展', 'b3fd1e06866648bca016a34c15e9b0b0', '', '', '干活', NULL, '公共', '2022-03-19 16:43:46', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_contacts` VALUES ('6b6ec37645c54f298c45906bd8038610', 'a75979c30fb442dba3cf507160b15ea6', '6b86f215e69f4dbd8a2daa22efccf0cf', '14c215f72a954cd398a3fda37334ba8a', '卢拉', '9deb1c95294f4989b9644307c4168a44', '', '2543', '啊v的', '', '小小晓', '2022-03-22 19:12:52', NULL, NULL, '很强', '甘丽', '2022-03-26', '奥里给');
INSERT INTO `tbl_contacts` VALUES ('725c5ee8259c46378d37d717189eecd3', '3162aba1f9b84c9cbe5dd35fc1cea202', 'db867ea866bc44678ac20c8a4a8bfefb', 'b357c865605a4ff5926b2ec197cf25ab', '接近于', '7328a7d8b7be475c98bfda24aa8b5902', '3215342198@qq.com', '122873456', '叫一下', '2022-03-19', '小小晓', '2022-03-22 15:57:50', '小小晓', '2022-03-22 19:09:50', '', '', '2022-08-19', '虚无');
INSERT INTO `tbl_contacts` VALUES ('7a13a4e3187849fca2393b38c8b2f03d', '0eeb97c2608a42d2be45b1864437da9e', 'a83e75ced129421dbf11fab1f05cf8b4', 'c231948d9dce4bae851c39b077da28f1', '三个人凤凰不如', '72dcf08c8ead43d2a967c616df924e74', '34635', '53654876', '243的公司负担', NULL, '小小晓', '2022-03-22 15:45:25', NULL, NULL, '分别是个人你要推翻', 'var额上的也就等同于', '2022-03-25', 'v啊散热还有日剧');
INSERT INTO `tbl_contacts` VALUES ('8c23ee8a460640d5ba6fb30f89492523', '4d399a9d2e574d028c695191f14dfd5b', 'b924d911426f4bc5ae3876038bc7e0ad', '5e784685187c4ace920803a9a42fc0b4', '不是大人', 'c4f7ddaf3fe74f709198ef48e38084c0', '11290@qq.com', '112', '玩', NULL, '公共', '2022-03-19 16:41:35', NULL, NULL, '', '没有纪要', '2022-03-17', '游乐园');
INSERT INTO `tbl_contacts` VALUES ('8d8d8a9b8f8e474eaa112fb385338f1f', '0eeb97c2608a42d2be45b1864437da9e', 'b924d911426f4bc5ae3876038bc7e0ad', '574479ab5ab14ef1b03e2ba218b0507f', '猪猪侠', '221c8f20bb334fac88a48fc5c8f41a98', '3215342198@qq.com', '122873456', '弟弟', NULL, '公共', '2022-03-23 20:27:31', NULL, NULL, '', '', '2022-03-26', '');
INSERT INTO `tbl_contacts` VALUES ('a06f23e0f51d41148b93b83449304105', '3162aba1f9b84c9cbe5dd35fc1cea202', '72f13af8f5d34134b5b3f42c5d477510', 'c39532d533a9454b8e3e276f4936a9a9', '丽丽', 'e5f383d2622b4fc0959f4fe131dafc80', '3215342198@qq.com', '', '', NULL, '小小晓', '2022-03-22 15:39:46', NULL, NULL, '', '希金斯浦东', '2022-03-26', '啊VS发');
INSERT INTO `tbl_contacts` VALUES ('b317207a929d45b4bd41778af0e09bde', '4d399a9d2e574d028c695191f14dfd5b', 'fb65d7fdb9c6483db02713e6bc05dd19', '4da24d8695e1406b9e0c6c30b6338551', '112', '7328a7d8b7be475c98bfda24aa8b5902', '3215342198@qq.com', '', '', NULL, '公共', '2022-03-19 16:44:55', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_contacts` VALUES ('b42199e696f74878b1a0061fe55f587e', '0eeb97c2608a42d2be45b1864437da9e', '6b86f215e69f4dbd8a2daa22efccf0cf', '4da24d8695e1406b9e0c6c30b6338551', '一个', '9deb1c95294f4989b9644307c4168a44', 'mm@qq.com', '23632', '没有', '2022-03-16', '小小晓', '2022-03-21 13:15:09', NULL, NULL, '', '', '2022-03-16', '');
INSERT INTO `tbl_contacts` VALUES ('cf29e7c627684970ae066c788a64d118', '40f6cdea0bd34aceb77492a1656d9fb3', '0fe33840c6d84bf78df55d49b169a894', '6bb0113cc41a4eb3b40fb183e49560a1', '市场', '0dd915ae99ce4fed90b1b10dca62e62e', 'buzhengjing@163.com', '134-12345625', '吃饭', '2022-03-23', '公共', '2022-03-18 21:41:36', '小小晓', '2022-03-21 13:02:20', '很好', '打就完了', '2030-08-16', '老人家所在');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('06df2703d1584733a547316e87cb30b1', '5f3111865e8b4262992e27b793e08b9b', '818094d50b044771932b1421769f6ec4');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('08b042728413440fba31ce5b2fb17804', '7a13a4e3187849fca2393b38c8b2f03d', 'cb1966054cf84fea8687f63b2a87f1f0');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('383c5fa9536c4a4093832453752c7fd9', '7a13a4e3187849fca2393b38c8b2f03d', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('40dbd190638a43ab900c44fb159823d0', '6a9a7ccd79684d41bca18aa8bb3ff663', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('82ff1438c7004f2db1748a79bed84c6d', '425b8b42a8d64b6684a1238a82297600', 'b4e265e9a74342f1b750e6dd3b143eb6');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('86b12a0ad4244da1ba817ac02550aebe', '425b8b42a8d64b6684a1238a82297600', 'a728db054ce74894b9d0fa54320aa7ed');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('ae3d389856cc43b4bb39146d5e0bb3aa', '725c5ee8259c46378d37d717189eecd3', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('b0d9f192a4db4df5a682115a4367de09', '5f3111865e8b4262992e27b793e08b9b', '37f7e38fd878474082c3e5fe0a601310');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('e0da3ae7ad1445d5b8fd466274ddb125', '425b8b42a8d64b6684a1238a82297600', '83fc369a68db4fedbfa42851f928d697');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('ee015e7270a84523a70e3701d0c8a0ac', '425b8b42a8d64b6684a1238a82297600', '9132b8d718e9472fae26ce2dc1864664');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('f3fce99f95c54c6fb917696726206add', '7a13a4e3187849fca2393b38c8b2f03d', 'b76e605877464e7e87e48d1e9f12ab1c');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('0468f05b0f0e4baf874ba5d5b9910859', '就比u', '小小晓', '2022-03-22 18:57:22', NULL, NULL, '0', '425b8b42a8d64b6684a1238a82297600');
INSERT INTO `tbl_contacts_remark` VALUES ('1055967815694fa6bfa3d63f8fe09c1d', '就不给', '小小晓', '2022-03-22 19:10:00', NULL, NULL, '0', '725c5ee8259c46378d37d717189eecd3');
INSERT INTO `tbl_contacts_remark` VALUES ('35d0d1ec4e2849328dcb92f227e0d25c', '偶哟二五年', '小小晓', '2022-03-22 20:59:14', NULL, NULL, '0', '5f3111865e8b4262992e27b793e08b9b');
INSERT INTO `tbl_contacts_remark` VALUES ('7dc2297a469942be8e90e3fa0f41c907', '？？？', '小小晓', '2022-03-22 20:22:10', NULL, NULL, '0', '425b8b42a8d64b6684a1238a82297600');
INSERT INTO `tbl_contacts_remark` VALUES ('7fb672a09d41476caf0000eaa5cf27d0', '好的', '小小晓', '2022-03-22 18:54:08', NULL, NULL, '0', 'f1c58c9af2c74c1288c02964f6b4d0be');
INSERT INTO `tbl_contacts_remark` VALUES ('a879d1dccd2f47b2813294d145649269', '是不是没有', '小小晓', '2022-03-22 19:21:15', NULL, NULL, '0', '43dbb92290654411af3aab11bf8aefbe');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('14c215f72a954cd398a3fda37334ba8a', '58dbef8cae4f454cb9819bf3854a19a0', 'super', 'www.super.com', '110', '公共', '2022-03-19 21:16:03', '小小晓', '2022-03-22 19:11:47', '甘丽', '2022-03-26', '很强', '奥里给');
INSERT INTO `tbl_customer` VALUES ('2fac0b9a2f934b3d9033b886c9bbfd95', '264264c552134fd5a75c7ceb85d80b17', '带比较多', 'www.jujubo.com', '122873456', '小小晓', '2022-03-23 12:30:27', NULL, NULL, '', '2022-06-24', '', '');
INSERT INTO `tbl_customer` VALUES ('4da24d8695e1406b9e0c6c30b6338551', '4d399a9d2e574d028c695191f14dfd5b', '东南大学', '', '+8618226187054', '公共', '2022-03-19 16:44:55', '公共', '2022-03-20 13:26:22', '', '2022-03-16', '', '');
INSERT INTO `tbl_customer` VALUES ('55599ff25e814bdaa81095512f8e5181', '58dbef8cae4f454cb9819bf3854a19a0', '东南大学2号', 'www.donanan.com', '+8618226187054', '公共', '2022-03-19 16:44:22', '公共', '2022-03-20 23:07:13', '', '2022-03-18', '哈哈哈哈', '村民组');
INSERT INTO `tbl_customer` VALUES ('574479ab5ab14ef1b03e2ba218b0507f', '0eeb97c2608a42d2be45b1864437da9e', '美国', 'www.jujubo.com', '+8618226187054', '公共', '2022-03-23 20:27:31', NULL, NULL, '', '2022-03-26', '', '');
INSERT INTO `tbl_customer` VALUES ('5e784685187c4ace920803a9a42fc0b4', '4d399a9d2e574d028c695191f14dfd5b', '儿童乐园', 'www.bushidaren.com', '24537', '公共', '2022-03-19 16:41:35', '公共', '2022-03-19 22:29:24', '没有纪要', '2022-03-17', '', '游乐园');
INSERT INTO `tbl_customer` VALUES ('65226351466e44478facebed659129eb', '0eeb97c2608a42d2be45b1864437da9e', '不是公司', 'www.pianren.com', '112', '公共', '2022-03-19 21:14:13', NULL, NULL, '没有', '', '', '没有地址');
INSERT INTO `tbl_customer` VALUES ('6bb0113cc41a4eb3b40fb183e49560a1', '40f6cdea0bd34aceb77492a1656d9fb3', '不正经', 'www.buzhengjing.com', '111-210', '公共', '2022-03-18 21:41:36', NULL, NULL, '打就完了', '2030-08-16', '很好', '老人家所在');
INSERT INTO `tbl_customer` VALUES ('7acbd42b6c5445529dfb0805583d2bd6', '264264c552134fd5a75c7ceb85d80b17', '标定公司', 'www.zzy.com', '3473', '公共', '2022-03-19 22:24:38', NULL, NULL, '灭有', '2022-03-16', '', '');
INSERT INTO `tbl_customer` VALUES ('a970545389014c6c906435ce3c4da6dc', '06f5fc056eac41558a964f96daa7f27c', '招标下', 'http://yjsxk.urp.seu.edu.cn/yjsxkapp/sys/xsxkapp/index.html', '234', '公共', '2022-03-21 12:35:58', NULL, NULL, '', '2022-03-09', '', '');
INSERT INTO `tbl_customer` VALUES ('aa04b429bf49402085b7b58299f8496f', '06f5fc056eac41558a964f96daa7f27c', '打赏v方式', '', '23524', '小小晓', '2022-03-22 15:53:29', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_customer` VALUES ('ad7263ea0e6c46609967cad5bc7e2a29', '264264c552134fd5a75c7ceb85d80b17', '一闪一闪亮星星', 'www.www.com', '345', '公共', '2022-03-19 21:15:31', NULL, NULL, '', '', '', '目的低');
INSERT INTO `tbl_customer` VALUES ('b16fc9f6ec4d4244ae1a5552ee404221', 'a75979c30fb442dba3cf507160b15ea6', '据举报', 'www.jujubo.com', '122873456', '公共', '2022-03-19 16:43:46', '公共', '2022-03-19 22:28:55', '', '2022-03-22', '', '禁停');
INSERT INTO `tbl_customer` VALUES ('b357c865605a4ff5926b2ec197cf25ab', '3162aba1f9b84c9cbe5dd35fc1cea202', '韩国', 'www.jujubo.com', '+8618226187054', '小小晓', '2022-03-22 15:57:50', '小小晓', '2022-03-22 20:58:57', '及哟啊', '2022-08-19', '小兔子啊', '虚无');
INSERT INTO `tbl_customer` VALUES ('bfb4bc7116504a5fb9abc5cecade4b28', '4d399a9d2e574d028c695191f14dfd5b', '里格朗而当', 'ww.liji.com', '15800703451', '小小晓', '2022-03-22 16:00:06', NULL, NULL, '没有联系过', '2022-03-12', '没有描述', '村民组');
INSERT INTO `tbl_customer` VALUES ('c231948d9dce4bae851c39b077da28f1', '0eeb97c2608a42d2be45b1864437da9e', '风水宝地沟通', '的VS热风', 'v发的是法人', '小小晓', '2022-03-22 15:45:25', NULL, NULL, 'var额上的也就等同于', '2022-03-25', '分别是个人你要推翻', 'v啊散热还有日剧');
INSERT INTO `tbl_customer` VALUES ('c37514962d7344bcaade5857d8566ab3', '0eeb97c2608a42d2be45b1864437da9e', '来回v哦就', '', '125445', '小小晓', '2022-03-22 15:53:01', NULL, NULL, '', '2022-03-12', '', '');
INSERT INTO `tbl_customer` VALUES ('c39532d533a9454b8e3e276f4936a9a9', '3162aba1f9b84c9cbe5dd35fc1cea202', '东被大学', '', '+8618226187054', '小小晓', '2022-03-22 15:39:46', NULL, NULL, '希金斯浦东', '2022-03-26', '', '啊VS发');
INSERT INTO `tbl_customer` VALUES ('d6da258f4f864027a6f0617e103d2ab9', '06f5fc056eac41558a964f96daa7f27c', '五天', 'https://baidu.com', '237-9075676', '公共', '2022-03-20 13:12:26', '公共', '2022-03-20 13:21:02', '特别重要', '2022-03-16', '很大的公司', '没有');
INSERT INTO `tbl_customer` VALUES ('dc2f26fb54004a0ebdaff8747138c5fa', '58dbef8cae4f454cb9819bf3854a19a0', 'v发生变更的', '', '', '小小晓', '2022-03-22 15:50:35', NULL, NULL, '', '', '', '');
INSERT INTO `tbl_customer` VALUES ('ee96ab31f3c3466f80287d7598195d95', '3162aba1f9b84c9cbe5dd35fc1cea202', '想你了', 'http://yjsxk.urp.seu.edu.cn/yjsxkapp/sys/xsxkapp/index.html', '110', '公共', '2022-03-20 13:25:54', NULL, NULL, '', '2022-03-07', '', '');
INSERT INTO `tbl_customer` VALUES ('f2c72939655b4a929112c973103ecaa2', '4d399a9d2e574d028c695191f14dfd5b', '美德', '', '234', '小小晓', '2022-03-22 15:31:17', NULL, NULL, '纪要', '2022-03-18', '', '');
INSERT INTO `tbl_customer` VALUES ('fd915804a17b4214a2bcf5cb7eb7ae53', 'a75979c30fb442dba3cf507160b15ea6', '日湖啊', 'aoirc.agihaoi', '15800703451', '小小晓', '2022-03-22 15:46:14', NULL, NULL, '', '2022-03-18', '', '');

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('03f0cf82d4c74e4abbeb3a23c34e249a', '不好', '小小晓', '2022-03-22 18:57:13', NULL, NULL, '0', 'dc2f26fb54004a0ebdaff8747138c5fa');
INSERT INTO `tbl_customer_remark` VALUES ('1fe739e03a2b48f2831cd1314b48e909', '不要鞋子', '小小晓', '2022-03-22 20:59:03', NULL, NULL, '0', 'b357c865605a4ff5926b2ec197cf25ab');
INSERT INTO `tbl_customer_remark` VALUES ('2eb8999ed4ab4c69849365907b1ae064', '我不管', '小小晓', '2022-03-22 19:12:01', NULL, NULL, '0', '14c215f72a954cd398a3fda37334ba8a');
INSERT INTO `tbl_customer_remark` VALUES ('3c65891323ed4ef18c69afcf614ebd53', '没有备注', '小小晓', '2022-03-22 19:21:04', NULL, NULL, '0', 'fd915804a17b4214a2bcf5cb7eb7ae53');
INSERT INTO `tbl_customer_remark` VALUES ('681f17a1ab9d48d38c4a9642c6bd4656', '备注', '小小晓', '2022-03-22 17:30:30', NULL, NULL, '0', 'f2c72939655b4a929112c973103ecaa2');
INSERT INTO `tbl_customer_remark` VALUES ('79e7c2c467da4e8ebb0aa35218d8f684', '没有问', '小小晓', '2022-03-22 17:38:02', '小小晓', '2022-03-22 17:38:56', '1', 'c231948d9dce4bae851c39b077da28f1');
INSERT INTO `tbl_customer_remark` VALUES ('8b04d3a286b941598d97a69805cf051c', '我不要面子的啊——对你不要', '公共', '2022-03-20 18:52:51', '公共', '2022-03-20 19:08:34', '1', 'b16fc9f6ec4d4244ae1a5552ee404221');
INSERT INTO `tbl_customer_remark` VALUES ('908038dc0f0a41ba92d5ce0f5b0d8b0f', '灭有暖', '小小晓', '2022-03-22 19:07:05', NULL, NULL, '0', 'b357c865605a4ff5926b2ec197cf25ab');
INSERT INTO `tbl_customer_remark` VALUES ('96fd0da5ff054f1c8a1736eba78bbd4c', '整个人都不好了，我也是醉了', '公共', '2022-03-20 17:11:59', '公共', '2022-03-20 19:12:10', '1', 'b16fc9f6ec4d4244ae1a5552ee404221');
INSERT INTO `tbl_customer_remark` VALUES ('a59fb3f6a22b494c99acf90df346f8f8', '备注', '小小晓', '2022-03-22 19:13:41', NULL, NULL, '0', '55599ff25e814bdaa81095512f8e5181');
INSERT INTO `tbl_customer_remark` VALUES ('d07cd3a0c9134b6fa49cd398b7868ffb', '目的地', '小小晓', '2022-03-22 17:36:13', NULL, NULL, '0', '6bb0113cc41a4eb3b40fb183e49560a1');
INSERT INTO `tbl_customer_remark` VALUES ('d8b261a3aa6643c491837901e169a5b4', '一个人', '小小晓', '2022-03-22 19:13:03', NULL, NULL, '0', '14c215f72a954cd398a3fda37334ba8a');
INSERT INTO `tbl_customer_remark` VALUES ('e1f276aafc1e461bb07a3c5ffeafe088', '人很好', '公共', '2022-03-20 17:11:39', NULL, NULL, '0', 'ee96ab31f3c3466f80287d7598195d95');
INSERT INTO `tbl_customer_remark` VALUES ('ec7967656fd543b0876b1a7062ae77b0', '不是的', '小小晓', '2022-03-22 18:24:07', NULL, NULL, '0', 'dc2f26fb54004a0ebdaff8747138c5fa');
INSERT INTO `tbl_customer_remark` VALUES ('fa2d47886b5147e59a330cd211e68c9e', 'i九八v', '小小晓', '2022-03-22 19:21:47', NULL, NULL, '0', 'a970545389014c6c906435ce3c4da6dc');

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `id` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1009', '不知道行不子那个', '不行', '', '');
INSERT INTO `tbl_dept` VALUES ('1029', '我就不信了', '', '', '');
INSERT INTO `tbl_dept` VALUES ('1032', '我就空了', '我不管', '', '');
INSERT INTO `tbl_dept` VALUES ('1110', '财务部', '张飞', '010-84846005', '很会飞');
INSERT INTO `tbl_dept` VALUES ('1120', '销售部', '关与', '84846005', '很仗义');
INSERT INTO `tbl_dept` VALUES ('1209', '吼', '', '', '');
INSERT INTO `tbl_dept` VALUES ('2001', '睡觉不', '不睡', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('2003', '干活不', '不敢', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('2042', '再相信你一次', '', '', '');
INSERT INTO `tbl_dept` VALUES ('2901', '打豆豆', '大家', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('2991', '重启不', '不重启', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('3001', '加班部', '就要', NULL, '专门加班');
INSERT INTO `tbl_dept` VALUES ('3110', '外援不', '不雅', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('3112', '索引部', '引力', NULL, NULL);
INSERT INTO `tbl_dept` VALUES ('4401', '台哦月饼', '吃饭最厉害', '21-11802983', '吃急眼了');
INSERT INTO `tbl_dept` VALUES ('A001', '管理部', 'xcc', '84846003', 'super menerge');
INSERT INTO `tbl_dept` VALUES ('A002', '收钱部', 'xcc', '+8618226187054', '只负责收钱');
INSERT INTO `tbl_dept` VALUES ('A003', '躺尸部', '僵尸先生', '2001-014014914', '要死就来躺尸部，一起来躺尸');
INSERT INTO `tbl_dept` VALUES ('A006', '营营部', '大营子', '110', '');
INSERT INTO `tbl_dept` VALUES ('B002', '吃饭部', '饕餮', '84846023', '只吃不干活的存在');

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '????????????????Ϊ?գ????ܺ??????ġ?',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '??????????UUID',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????Ϊ?գ?????Ҫ??ͬһ???ֵ????????ֵ?ֵ?????ظ???????Ψһ?ԡ?',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????Ϊ?',
  `orderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????Ϊ?գ?????Ϊ?յ?ʱ????Ҫ???????????',
  `typeCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '???',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0dd915ae99ce4fed90b1b10dca62e62e', '大人', '大人', '6', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('221c8f20bb334fac88a48fc5c8f41a98', '小姐', '小姐', '7', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07成交', '07成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01资质审查', '01资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08丢失的线索', '08丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('45c6ed2da0fd43428160ebf21b9842c4', '哥哥', '哥哥', '9', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09因竞争丢失关闭', '09因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72dcf08c8ead43d2a967c616df924e74', '大侠', '大侠', '8', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7328a7d8b7be475c98bfda24aa8b5902', '儿砸', '儿砸', '11', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9deb1c95294f4989b9644307c4168a44', '大妹子', '大妹子', '12', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02需求分析', '02需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05提案/报价', '05提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b3fd1e06866648bca016a34c15e9b0b0', '美眉', '美眉', '10', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03价值建议', '03价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c4f7ddaf3fe74f709198ef48e38084c0', '馆长', '馆长', '13', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04确定决策者', '04确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06谈判/复审', '06谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('027f59ad8b534a1a93c859f56514e31c', '06f5fc056eac41558a964f96daa7f27c', '567', '打赏v方式-ibia', '2030-12-19', 'aa04b429bf49402085b7b58299f8496f', '9ff57750fac04f15b10ce1bbb5bb8bab', NULL, NULL, 'f67f98363f7d42a4a55a217f5fbeb44d', '492b729c6a964f089d7eac05c089a9f6', '小小晓', '2022-03-22 15:53:29', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('05da8d47c851405b9ec1b8f6a03b6775', '3162aba1f9b84c9cbe5dd35fc1cea202', '222', '东被大学-被俩吧', '2022-03-22', 'c39532d533a9454b8e3e276f4936a9a9', 'ab8c2a3dc05f4e3dbc7a0405f721b040', NULL, NULL, '9132b8d718e9472fae26ce2dc1864664', 'a06f23e0f51d41148b93b83449304105', '小小晓', '2022-03-22 15:39:46', NULL, NULL, '', '希金斯浦东', '2022-03-26');
INSERT INTO `tbl_tran` VALUES ('07933115b6d44d7ea72bcd9e504cf7d8', '58dbef8cae4f454cb9819bf3854a19a0', '', '撒旦v', '2022-03-29', 'a970545389014c6c906435ce3c4da6dc', 'e44be1d99158476e8e44778ed36f4355', '', '', '', '', '超极用户', '2022-03-24 08:56:04', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('0d9884e5bc264c7c8088d99241a5769a', '58dbef8cae4f454cb9819bf3854a19a0', '', '很苦逼', '2022-03-31', '14c215f72a954cd398a3fda37334ba8a', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '', '', '6b6ec37645c54f298c45906bd8038610', '超极用户', '2022-03-24 08:55:46', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('1a97a6b6b6564ca18e3b803798ac855a', '0eeb97c2608a42d2be45b1864437da9e', '346', '来回v哦就-扫弄', '2022-07-01', 'c37514962d7344bcaade5857d8566ab3', '37ef211719134b009e10b7108194cf46', '97d1128f70294f0aac49e996ced28c8a', 'a83e75ced129421dbf11fab1f05cf8b4', 'b76e605877464e7e87e48d1e9f12ab1c', '6a9a7ccd79684d41bca18aa8bb3ff663', '小小晓', '2022-03-22 15:53:01', '小小晓', '2022-03-23 18:06:49', '', '', '2022-03-12');
INSERT INTO `tbl_tran` VALUES ('1c8c7cf93e534065a9141a6dbc1181dd', '58dbef8cae4f454cb9819bf3854a19a0', '1300', 'v发生变更的-搜啊hi', '2030-08-31', 'dc2f26fb54004a0ebdaff8747138c5fa', 'c13ad8f9e2f74d5aa84697bb243be3bb', '954b410341e7433faa468d3c4f7cf0d2', '6b86f215e69f4dbd8a2daa22efccf0cf', 'cb1966054cf84fea8687f63b2a87f1f0', '425b8b42a8d64b6684a1238a82297600', '小小晓', '2022-03-22 15:50:35', '小小晓', '2022-03-23 17:55:27', '尤金可以不', '', '2022-03-05');
INSERT INTO `tbl_tran` VALUES ('1d373b8219e14961971270ff996d9b05', '58dbef8cae4f454cb9819bf3854a19a0', '', '最大v', '2022-03-21', 'a970545389014c6c906435ce3c4da6dc', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '', '超极用户', '2022-03-24 08:56:16', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('22061d72b0354e1db88f11b7d74e0885', '3162aba1f9b84c9cbe5dd35fc1cea202', '679', '韩国-取下', '2022-07-08', 'b357c865605a4ff5926b2ec197cf25ab', '391807b5324d4f16bd58c882750ee632', NULL, NULL, '818094d50b044771932b1421769f6ec4', '725c5ee8259c46378d37d717189eecd3', '小小晓', '2022-03-22 15:57:50', NULL, NULL, '', '', '2022-08-19');
INSERT INTO `tbl_tran` VALUES ('228e1d318e2c415ebb401cca41ba5d12', 'a75979c30fb442dba3cf507160b15ea6', '1', 'www.jujubo.com-拒绝不', '2022-12-31', 'b16fc9f6ec4d4244ae1a5552ee404221', '68a1b1e814d5497a999b8f1298ace62b', '954b410341e7433faa468d3c4f7cf0d2', '3a39605d67da48f2a3ef52e19d243953', 'f67f98363f7d42a4a55a217f5fbeb44d', '6b149ea1e6b0447f801d5205cb3c8f23', '公共', '2022-03-19 16:43:46', '小小晓', '2022-03-23 19:54:47', '哎，没办法', '', '2022-03-12');
INSERT INTO `tbl_tran` VALUES ('25ee1ab43746403ba8926ab34ad9db52', '58dbef8cae4f454cb9819bf3854a19a0', '', '她她她', '2022-03-26', '7acbd42b6c5445529dfb0805583d2bd6', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '', '超极用户', '2022-03-24 08:57:09', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('2d3af0fd628c4fba9f8a33339dc2f637', '3162aba1f9b84c9cbe5dd35fc1cea202', '666', '你妹的', '2022-03-23', '55599ff25e814bdaa81095512f8e5181', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '954b410341e7433faa468d3c4f7cf0d2', '6b86f215e69f4dbd8a2daa22efccf0cf', '9132b8d718e9472fae26ce2dc1864664', '43dbb92290654411af3aab11bf8aefbe', '小小晓', '2022-03-23 15:38:20', '公共', '2022-03-23 20:22:09', '', '', '');
INSERT INTO `tbl_tran` VALUES ('3202d1c0dc9542588b4a69f9fa687962', '58dbef8cae4f454cb9819bf3854a19a0', '', '撒DVD', '2022-03-26', '14c215f72a954cd398a3fda37334ba8a', '37ef211719134b009e10b7108194cf46', '', '', '', '6b6ec37645c54f298c45906bd8038610', '超极用户', '2022-03-24 08:55:25', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('340ab379ab464d53a12b6d82e45f0443', '4d399a9d2e574d028c695191f14dfd5b', '22', '东南大学-没有', '2030-12-27', '4da24d8695e1406b9e0c6c30b6338551', '68a1b1e814d5497a999b8f1298ace62b', NULL, NULL, '818094d50b044771932b1421769f6ec4', 'b317207a929d45b4bd41778af0e09bde', '公共', '2022-03-19 16:44:55', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('3e9dae58ac8f444685a2b08425fefd40', '58dbef8cae4f454cb9819bf3854a19a0', '', '达成', '2022-03-15', '14c215f72a954cd398a3fda37334ba8a', '37ef211719134b009e10b7108194cf46', '', '', '', '6b6ec37645c54f298c45906bd8038610', '超极用户', '2022-03-24 08:55:11', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('4bfadf1ea60f4d5f8e4f04996cdb9753', '0eeb97c2608a42d2be45b1864437da9e', '10000', '不不不', '2022-03-25', 'f2c72939655b4a929112c973103ecaa2', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '97d1128f70294f0aac49e996ced28c8a', '6b86f215e69f4dbd8a2daa22efccf0cf', '9132b8d718e9472fae26ce2dc1864664', '5f3111865e8b4262992e27b793e08b9b', '小小晓', '2022-03-23 20:05:17', '小小晓', '2022-03-23 20:05:33', '', '', '2022-03-26');
INSERT INTO `tbl_tran` VALUES ('566752d1d5dd4752970628965b1f4aca', '4d399a9d2e574d028c695191f14dfd5b', '12', '儿童乐园-吃饭服务', '2022-03-19', '5e784685187c4ace920803a9a42fc0b4', 'e44be1d99158476e8e44778ed36f4355', NULL, NULL, 'c08ce99595ec4a75b07f4b69bb27b81e', '8c23ee8a460640d5ba6fb30f89492523', '公共', '2022-03-19 16:41:35', NULL, NULL, '', '没有纪要', '2022-03-17');
INSERT INTO `tbl_tran` VALUES ('5766741697a340a98ab7bfbb77e78c57', '0eeb97c2608a42d2be45b1864437da9e', '', '没有的事情', '2022-03-26', '2fac0b9a2f934b3d9033b886c9bbfd95', 'c13ad8f9e2f74d5aa84697bb243be3bb', '954b410341e7433faa468d3c4f7cf0d2', 'ff802a03ccea4ded8731427055681d48', '', '8c23ee8a460640d5ba6fb30f89492523', '小小晓', '2022-03-23 18:00:38', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('5a68ee4cb90c46f0a472cac27ba7906e', '0eeb97c2608a42d2be45b1864437da9e', '32', 'hi个', '2022-03-18', '2fac0b9a2f934b3d9033b886c9bbfd95', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', 'db867ea866bc44678ac20c8a4a8bfefb', '', '472ff2d26dc34be1bd034757f7d59d97', '小小晓', '2022-03-23 18:02:04', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('5af5f621114040d2bd507221e1bb104c', '58dbef8cae4f454cb9819bf3854a19a0', '', 'ds', '2022-03-26', 'dc2f26fb54004a0ebdaff8747138c5fa', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '', '', '', '超极用户', '2022-03-24 08:52:51', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('64e7949b9a854e26af26397b727711d9', '58dbef8cae4f454cb9819bf3854a19a0', '', '大v的', '2022-03-23', '14c215f72a954cd398a3fda37334ba8a', '37ef211719134b009e10b7108194cf46', '', '', '', '6b6ec37645c54f298c45906bd8038610', '超极用户', '2022-03-24 08:55:36', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('6510f90afb4d4cc69728a93fb64a9c1f', '264264c552134fd5a75c7ceb85d80b17', '234', '带比较多-一个', '2022-03-25', '2fac0b9a2f934b3d9033b886c9bbfd95', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', 'bbcc6a99482c4d849c6dc572ec0816ce', '472ff2d26dc34be1bd034757f7d59d97', '小小晓', '2022-03-23 12:30:27', '小小晓', '2022-03-23 16:57:07', '', '', '2022-06-24');
INSERT INTO `tbl_tran` VALUES ('6b00c9523fc04748ba59b57a98b3b8f4', '0eeb97c2608a42d2be45b1864437da9e', '4000', '某的', '2022-03-26', 'c39532d533a9454b8e3e276f4936a9a9', 'e81577d9458f4e4192a44650a3a3692b', '954b410341e7433faa468d3c4f7cf0d2', 'db867ea866bc44678ac20c8a4a8bfefb', 'bbcc6a99482c4d849c6dc572ec0816ce', '6b6ec37645c54f298c45906bd8038610', '小小晓', '2022-03-23 15:08:21', '小小晓', '2022-03-23 19:45:39', '', '', '2022-03-11');
INSERT INTO `tbl_tran` VALUES ('6e0de59a8f8c4feeb14420e1cbc6a4fe', '58dbef8cae4f454cb9819bf3854a19a0', '', '异样要', '2022-04-02', 'a970545389014c6c906435ce3c4da6dc', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '', '超极用户', '2022-03-24 08:56:39', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('74bd437132e0480ba160dceab0f252af', '58dbef8cae4f454cb9819bf3854a19a0', '', '如发生的', '2022-03-18', 'aa04b429bf49402085b7b58299f8496f', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '', '超极用户', '2022-03-24 08:52:33', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('7a97441a29af4d70bbe213d44fe70542', '0eeb97c2608a42d2be45b1864437da9e', '222', '美国-第二部分是', '2022-03-26', '574479ab5ab14ef1b03e2ba218b0507f', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', 'b924d911426f4bc5ae3876038bc7e0ad', 'bbcc6a99482c4d849c6dc572ec0816ce', '8d8d8a9b8f8e474eaa112fb385338f1f', '公共', '2022-03-23 20:27:31', '超极用户', '2022-03-24 08:51:21', '', '', '2022-03-26');
INSERT INTO `tbl_tran` VALUES ('7e66d7b6db8e49fbbd30cac259bb92b3', '0eeb97c2608a42d2be45b1864437da9e', '10000000', '风水宝地沟通-弟弟', '2022-12-30', 'c231948d9dce4bae851c39b077da28f1', '9ff57750fac04f15b10ce1bbb5bb8bab', '97d1128f70294f0aac49e996ced28c8a', '6b86f215e69f4dbd8a2daa22efccf0cf', 'a728db054ce74894b9d0fa54320aa7ed', '7a13a4e3187849fca2393b38c8b2f03d', '小小晓', '2022-03-22 15:45:25', '小小晓', '2022-03-23 18:07:42', '分别是个人你要推翻', 'var额上的也就等同于', '2022-03-25');
INSERT INTO `tbl_tran` VALUES ('8d05350c89a3498f8e0db36fbd5d3e29', '58dbef8cae4f454cb9819bf3854a19a0', '22', 'hi个反对VS', '2022-03-29', '5e784685187c4ace920803a9a42fc0b4', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '', '', '8c23ee8a460640d5ba6fb30f89492523', '超极用户', '2022-03-24 08:54:56', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('a0fd5b79644549d4b42983c0cfd34ee4', '4d399a9d2e574d028c695191f14dfd5b', '11', '什么都不是', '2022-04-01', 'f2c72939655b4a929112c973103ecaa2', 'ab8c2a3dc05f4e3dbc7a0405f721b040', NULL, NULL, 'c08ce99595ec4a75b07f4b69bb27b81e', '579beaa7a56a4f46961c092cf4e271d2', '小小晓', '2022-03-22 15:31:17', NULL, NULL, '', '纪要', '2022-03-18');
INSERT INTO `tbl_tran` VALUES ('af07a014d8384148bf27d0f694fbcf62', '58dbef8cae4f454cb9819bf3854a19a0', '0', '东南大学-张给', '2030-07-17', '55599ff25e814bdaa81095512f8e5181', '29805c804dd94974b568cfc9017b2e4c', NULL, NULL, '83fc369a68db4fedbfa42851f928d697', '450d613c625f47f0bec68f4a28268a2d', '公共', '2022-03-19 16:44:22', NULL, NULL, '哈哈哈哈', '', '2022-03-18');
INSERT INTO `tbl_tran` VALUES ('afac2cbc707a417bac7b6f72efba3fda', '4d399a9d2e574d028c695191f14dfd5b', '89', '里格朗而当-iuu', '2022-03-25', 'bfb4bc7116504a5fb9abc5cecade4b28', '9ff57750fac04f15b10ce1bbb5bb8bab', '954b410341e7433faa468d3c4f7cf0d2', '6b86f215e69f4dbd8a2daa22efccf0cf', 'b4e265e9a74342f1b750e6dd3b143eb6', '472ff2d26dc34be1bd034757f7d59d97', '小小晓', '2022-03-22 16:00:06', '小小晓', '2022-03-23 17:46:17', '没有描述', '没有联系过', '2022-03-12');
INSERT INTO `tbl_tran` VALUES ('b35725b409de414ebcceccc54cf330bd', '58dbef8cae4f454cb9819bf3854a19a0', '', '一下啊看', '2022-03-11', '6bb0113cc41a4eb3b40fb183e49560a1', '391807b5324d4f16bd58c882750ee632', '', '', '', 'cf29e7c627684970ae066c788a64d118', '超极用户', '2022-03-24 08:53:45', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('b678164bf4104a92b1fb38c5f49b579f', '58dbef8cae4f454cb9819bf3854a19a0', '', '小信息', '2022-03-24', 'd6da258f4f864027a6f0617e103d2ab9', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '', '', '', '超极用户', '2022-03-24 08:57:54', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('be4008579ca24fe1b63e926e3ce5b672', '58dbef8cae4f454cb9819bf3854a19a0', '', '哇哇哇哇', '2022-03-12', 'a970545389014c6c906435ce3c4da6dc', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '', '超极用户', '2022-03-24 08:56:27', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('c0f0751a8fe74ff797f2418a55b7c1ac', '58dbef8cae4f454cb9819bf3854a19a0', '', 'davddd', '2022-03-11', 'b16fc9f6ec4d4244ae1a5552ee404221', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '', '', '6b149ea1e6b0447f801d5205cb3c8f23', '超极用户', '2022-03-24 08:53:25', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('c7c6a31abcf84ec7ba81468a3d0e5568', '58dbef8cae4f454cb9819bf3854a19a0', '', 'idbVS吧', '2022-05-13', '5e784685187c4ace920803a9a42fc0b4', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '', '', '8c23ee8a460640d5ba6fb30f89492523', '超极用户', '2022-03-24 08:54:38', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('cd9ae5dcbe7f469b9b7a6cd7163633f7', '58dbef8cae4f454cb9819bf3854a19a0', '', '就可惜', '2022-03-12', '5e784685187c4ace920803a9a42fc0b4', '68a1b1e814d5497a999b8f1298ace62b', '', '', '', '8c23ee8a460640d5ba6fb30f89492523', '超极用户', '2022-03-24 08:54:04', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('d702a10ec7a24c4d866ce394022454fa', '40f6cdea0bd34aceb77492a1656d9fb3', '10000000', '不正经-市场', '2022-03-18', '6bb0113cc41a4eb3b40fb183e49560a1', 'c13ad8f9e2f74d5aa84697bb243be3bb', NULL, NULL, '9132b8d718e9472fae26ce2dc1864664', 'cf29e7c627684970ae066c788a64d118', '公共', '2022-03-18 21:41:36', NULL, NULL, '很好', '打就完了', '2030-08-16');
INSERT INTO `tbl_tran` VALUES ('e64c07454a0a484b80c3a5c5aa69a50e', '58dbef8cae4f454cb9819bf3854a19a0', '', 'sgbfd', '2022-03-19', '2fac0b9a2f934b3d9033b886c9bbfd95', 'e81577d9458f4e4192a44650a3a3692b', '', '', '', '472ff2d26dc34be1bd034757f7d59d97', '超极用户', '2022-03-24 09:49:56', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('e80eb45e95614cf2a9f04af537146ea1', '58dbef8cae4f454cb9819bf3854a19a0', '', '钱钱钱', '2022-03-26', '7acbd42b6c5445529dfb0805583d2bd6', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '', '', '', '超极用户', '2022-03-24 08:57:21', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('ec010c793edc4ed1a5cdca3264c262a8', '58dbef8cae4f454cb9819bf3854a19a0', '', '爱吃v', '2022-04-02', '5e784685187c4ace920803a9a42fc0b4', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '', '', '8c23ee8a460640d5ba6fb30f89492523', '超极用户', '2022-03-24 08:54:17', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('ee22980b487540e0b851e0d164ebb683', '58dbef8cae4f454cb9819bf3854a19a0', '', '的日本', '2022-03-19', 'c37514962d7344bcaade5857d8566ab3', '9ff57750fac04f15b10ce1bbb5bb8bab', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', '', '', '超极用户', '2022-03-24 08:52:07', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('fbccc6214e0a4bc8a99e93805e35734f', '58dbef8cae4f454cb9819bf3854a19a0', '', 'iii', '2022-03-30', 'd6da258f4f864027a6f0617e103d2ab9', 'e44be1d99158476e8e44778ed36f4355', '', '', '', '', '超极用户', '2022-03-24 08:57:40', NULL, NULL, '', '', '');

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('04cefe98ffdc4e1ba5552a90f63d2fed', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-26', '2022-03-24 08:57:09', '超极用户', '25ee1ab43746403ba8926ab34ad9db52');
INSERT INTO `tbl_tran_history` VALUES ('07612b0744b24528aa9997b02d2e184a', 'e44be1d99158476e8e44778ed36f4355', '32', '2022-03-18', '2022-03-23 18:02:04', '小小晓', '5a68ee4cb90c46f0a472cac27ba7906e');
INSERT INTO `tbl_tran_history` VALUES ('195d7df0f1c341e09f912bab5b7a3fa7', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '666', '2022-03-23', '2022-03-23 20:22:09', '公共', '2d3af0fd628c4fba9f8a33339dc2f637');
INSERT INTO `tbl_tran_history` VALUES ('1b30dbf6314e47d7813126c3b0bb2e44', 'c13ad8f9e2f74d5aa84697bb243be3bb', '10', '2022-03-25', '2022-03-23 20:05:17', '小小晓', '4bfadf1ea60f4d5f8e4f04996cdb9753');
INSERT INTO `tbl_tran_history` VALUES ('278cf3bbb2894ccba0d5c295c7195ecb', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '2022-03-26', '2022-03-24 08:52:51', '超极用户', '5af5f621114040d2bd507221e1bb104c');
INSERT INTO `tbl_tran_history` VALUES ('2952cc339ca14e90a34bb6e3fecd3eb6', 'c13ad8f9e2f74d5aa84697bb243be3bb', '1300', '2030-08-31', '2022-03-23 17:55:27', NULL, '1c8c7cf93e534065a9141a6dbc1181dd');
INSERT INTO `tbl_tran_history` VALUES ('296e87c40ac84cc8b3ddbcfe57935ade', '37ef211719134b009e10b7108194cf46', '', '2022-03-15', '2022-03-24 08:55:11', '超极用户', '3e9dae58ac8f444685a2b08425fefd40');
INSERT INTO `tbl_tran_history` VALUES ('2c8e828ec7a74d4891c0781f58f23577', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-04-02', '2022-03-24 08:56:39', '超极用户', '6e0de59a8f8c4feeb14420e1cbc6a4fe');
INSERT INTO `tbl_tran_history` VALUES ('2eccd8a199c44c9bb9f6191284f42c79', '7c07db3146794c60bf975749952176df', '222', '2022-03-26', '2022-03-23 20:27:31', '公共', '7a97441a29af4d70bbe213d44fe70542');
INSERT INTO `tbl_tran_history` VALUES ('30c8b97c47a54aa8baa753e96b3a6391', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '2022-03-26', '2022-03-24 08:57:21', '超极用户', 'e80eb45e95614cf2a9f04af537146ea1');
INSERT INTO `tbl_tran_history` VALUES ('30dd732021434a4bbe9c9a1a926bfd36', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '2022-03-31', '2022-03-24 08:55:47', '超极用户', '0d9884e5bc264c7c8088d99241a5769a');
INSERT INTO `tbl_tran_history` VALUES ('35daf704e0eb450180df1078a135a71f', '37ef211719134b009e10b7108194cf46', '346', '2022-07-01', '2022-03-23 18:06:49', NULL, '1a97a6b6b6564ca18e3b803798ac855a');
INSERT INTO `tbl_tran_history` VALUES ('36fd904825dc49c7aabbb57cf6402380', 'e44be1d99158476e8e44778ed36f4355', '234', '2022-03-25', '2022-03-23 12:30:27', '小小晓', '6510f90afb4d4cc69728a93fb64a9c1f');
INSERT INTO `tbl_tran_history` VALUES ('3bd79240aea5453eb60aa257facd35bd', '391807b5324d4f16bd58c882750ee632', '', '2022-03-11', '2022-03-24 08:53:45', '超极用户', 'b35725b409de414ebcceccc54cf330bd');
INSERT INTO `tbl_tran_history` VALUES ('3c9d6843c3684424a635c7e6b8dae604', '37ef211719134b009e10b7108194cf46', '', '2022-03-23', '2022-03-24 08:55:36', '超极用户', '64e7949b9a854e26af26397b727711d9');
INSERT INTO `tbl_tran_history` VALUES ('40f899f363a6448789d0ac9f184064b5', '29805c804dd94974b568cfc9017b2e4c', '520000', '2022-12-31', '2022-03-23 19:54:14', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('4201d695dcb9422b912e3c7a7ba43b57', '9ff57750fac04f15b10ce1bbb5bb8bab', '10000000', '2022-12-30', '2022-03-23 18:07:42', NULL, '7e66d7b6db8e49fbbd30cac259bb92b3');
INSERT INTO `tbl_tran_history` VALUES ('4405588e63a74fd78f4236c77d8ea079', 'e81577d9458f4e4192a44650a3a3692b', '20000', '2022-12-31', '2022-03-23 19:54:04', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('462c9e97fbc34c0398f9872b503e7045', '68a1b1e814d5497a999b8f1298ace62b', '', '2022-03-12', '2022-03-24 08:54:04', '超极用户', 'cd9ae5dcbe7f469b9b7a6cd7163633f7');
INSERT INTO `tbl_tran_history` VALUES ('511df6dec8f94059b00f21ca5c6a1273', '9ff57750fac04f15b10ce1bbb5bb8bab', '70', '2022-12-31', '2022-03-23 19:53:21', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('5168b411ff584419943004400cd21f98', 'e44be1d99158476e8e44778ed36f4355', '1000', '2022-12-31', '2022-03-23 19:53:43', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('52e5d76c924a4b7889b5e9af1933044a', 'e44be1d99158476e8e44778ed36f4355', '', '2022-03-29', '2022-03-24 08:56:04', '超极用户', '07933115b6d44d7ea72bcd9e504cf7d8');
INSERT INTO `tbl_tran_history` VALUES ('681af1feae40428e8f4fd23f220df4d3', 'e81577d9458f4e4192a44650a3a3692b', '4000', '2022-03-26', '2022-03-23 19:45:39', NULL, '6b00c9523fc04748ba59b57a98b3b8f4');
INSERT INTO `tbl_tran_history` VALUES ('6a107b62ee634c6eb8ffc2f049fea51a', 'e44be1d99158476e8e44778ed36f4355', '', '2022-03-30', '2022-03-24 08:57:40', '超极用户', 'fbccc6214e0a4bc8a99e93805e35734f');
INSERT INTO `tbl_tran_history` VALUES ('6a747efecf8a4e4583d01831a90f875c', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '2022-04-02', '2022-03-24 08:54:17', '超极用户', 'ec010c793edc4ed1a5cdca3264c262a8');
INSERT INTO `tbl_tran_history` VALUES ('76002c6275e6490984cc8a885b9c059a', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '2022-03-24', '2022-03-24 08:57:54', '超极用户', 'b678164bf4104a92b1fb38c5f49b579f');
INSERT INTO `tbl_tran_history` VALUES ('7d852a25d8ed44d887bf772a22953c91', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '2000', '2022-12-31', '2022-03-23 19:53:53', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('83e22f70eabe4cb18cb7536765645a87', '391807b5324d4f16bd58c882750ee632', '100', '2022-12-31', '2022-03-23 19:54:26', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('898709f9864a40fbaf0dca408c331882', 'c13ad8f9e2f74d5aa84697bb243be3bb', '345476', '2022-03-26', '2022-03-23 15:08:21', '小小晓', '6b00c9523fc04748ba59b57a98b3b8f4');
INSERT INTO `tbl_tran_history` VALUES ('a9da2eb2796b409e959e6f6435ad5046', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-11', '2022-03-24 08:53:25', '超极用户', 'c0f0751a8fe74ff797f2418a55b7c1ac');
INSERT INTO `tbl_tran_history` VALUES ('ab2f988fde524f788a51e0d19ec88b26', '9ff57750fac04f15b10ce1bbb5bb8bab', '22', '2022-03-29', '2022-03-24 08:54:56', '超极用户', '8d05350c89a3498f8e0db36fbd5d3e29');
INSERT INTO `tbl_tran_history` VALUES ('ac581b5b16ec4a1881ee9c3d8e059421', 'e81577d9458f4e4192a44650a3a3692b', '', '2022-03-19', '2022-03-24 09:49:56', '超极用户', 'e64c07454a0a484b80c3a5c5aa69a50e');
INSERT INTO `tbl_tran_history` VALUES ('acf1e07e76ad4a17bd94c57bc3c21c43', 'c13ad8f9e2f74d5aa84697bb243be3bb', '700', '2022-12-31', '2022-03-23 19:53:32', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('afeae9024db6489c8b1fdaf8786e2054', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-21', '2022-03-24 08:56:16', '超极用户', '1d373b8219e14961971270ff996d9b05');
INSERT INTO `tbl_tran_history` VALUES ('b6a6e3ad100a4ce5a4dc795c76944af1', 'e44be1d99158476e8e44778ed36f4355', '345476', '2022-03-26', '2022-03-23 19:44:14', NULL, '6b00c9523fc04748ba59b57a98b3b8f4');
INSERT INTO `tbl_tran_history` VALUES ('be3405a4a9134636aecdfce3bcc55290', '37ef211719134b009e10b7108194cf46', '35', '2022-12-31', '2022-03-23 19:50:20', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('ce275c3317634bf894915c1ca57603af', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '10000', '2022-03-25', '2022-03-23 20:05:33', '小小晓', '4bfadf1ea60f4d5f8e4f04996cdb9753');
INSERT INTO `tbl_tran_history` VALUES ('cf7fc07d3daf40a381b2cda4d9ce8a65', '68a1b1e814d5497a999b8f1298ace62b', '1', '2022-12-31', '2022-03-23 19:54:47', '小小晓', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_history` VALUES ('d25b9574bc9d44ba85cae762cb7b6bd8', '37ef211719134b009e10b7108194cf46', '', '2022-03-26', '2022-03-24 08:55:25', '超极用户', '3202d1c0dc9542588b4a69f9fa687962');
INSERT INTO `tbl_tran_history` VALUES ('d9ff38163c9d47b9b8cb8e199fb6f53a', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '', '2022-05-13', '2022-03-24 08:54:38', '超极用户', 'c7c6a31abcf84ec7ba81468a3d0e5568');
INSERT INTO `tbl_tran_history` VALUES ('ddf903bb54f1408a9e9c82d9d7bce0f9', 'c13ad8f9e2f74d5aa84697bb243be3bb', '66', '2022-03-23', '2022-03-23 15:38:20', '小小晓', '2d3af0fd628c4fba9f8a33339dc2f637');
INSERT INTO `tbl_tran_history` VALUES ('df0c6333675b4ca0916cbf1a00ae1866', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-18', '2022-03-24 08:52:33', '超极用户', '74bd437132e0480ba160dceab0f252af');
INSERT INTO `tbl_tran_history` VALUES ('df3d11bc956540f39fe6915eaf5898c1', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '2300', '2022-03-26', '2022-03-23 19:45:24', NULL, '6b00c9523fc04748ba59b57a98b3b8f4');
INSERT INTO `tbl_tran_history` VALUES ('dfac8e68ad6d4282af6a0f8c22568203', 'c13ad8f9e2f74d5aa84697bb243be3bb', '222', '2022-03-26', '2022-03-24 08:51:21', '超极用户', '7a97441a29af4d70bbe213d44fe70542');
INSERT INTO `tbl_tran_history` VALUES ('f1d73a7f7eb64f96ae53faec98d7b46d', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-12', '2022-03-24 08:56:27', '超极用户', 'be4008579ca24fe1b63e926e3ce5b672');
INSERT INTO `tbl_tran_history` VALUES ('f7d45176adc74f1b9ca14a48c73bc772', '9ff57750fac04f15b10ce1bbb5bb8bab', '', '2022-03-19', '2022-03-24 08:52:07', '超极用户', 'ee22980b487540e0b851e0d164ebb683');
INSERT INTO `tbl_tran_history` VALUES ('f9802101493c470d93926420a02ad71c', 'c13ad8f9e2f74d5aa84697bb243be3bb', '', '2022-03-26', '2022-03-23 18:00:38', '小小晓', '5766741697a340a98ab7bfbb77e78c57');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------
INSERT INTO `tbl_tran_remark` VALUES ('1f235e79f6c941bc81b1d6715e02adec', '咋样', '公共', '2022-03-23 20:22:18', NULL, NULL, '0', '2d3af0fd628c4fba9f8a33339dc2f637');
INSERT INTO `tbl_tran_remark` VALUES ('37365955a97e452ba5ec0ceacc537614', '额-嗯', '小小晓', '2022-03-23 17:57:03', '小小晓', '2022-03-23 17:57:11', '1', '1c8c7cf93e534065a9141a6dbc1181dd');
INSERT INTO `tbl_tran_remark` VALUES ('42e2b82621044f39a68a6f404f5d7a7f', '好的', '小小晓', '2022-03-23 16:56:58', NULL, NULL, '0', '6510f90afb4d4cc69728a93fb64a9c1f');
INSERT INTO `tbl_tran_remark` VALUES ('7b10f6b6429241ca9faab9a577cdf40d', 'l历史的进程', '小小晓', '2022-03-23 19:50:05', NULL, NULL, '0', '228e1d318e2c415ebb401cca41ba5d12');
INSERT INTO `tbl_tran_remark` VALUES ('9354607ee91f404a92b71349f981453c', '好啊', '小小晓', '2022-03-23 18:07:11', NULL, NULL, '0', '7e66d7b6db8e49fbbd30cac259bb92b3');
INSERT INTO `tbl_tran_remark` VALUES ('eb2973682efa4f23a13eeb50d772cbdc', '没有，我不是', '小小晓', '2022-03-23 17:49:48', NULL, NULL, '0', '6510f90afb4d4cc69728a93fb64a9c1f');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expireTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lockState` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allowIps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '李四', '202cb962ac59075b964b07152d234b70', 'ls@163.com', '2018-11-27 21:50:05', '0', 'A001', '', '2018-11-22 12:11:40', '李四', '2022-03-14 20:13:18', '超极用户');
INSERT INTO `tbl_user` VALUES ('0eeb97c2608a42d2be45b1864437da9e', 'hy', '小小晓', '202cb962ac59075b964b07152d234b70', '213172265@seu.edu.cn', '2025-07-17 13:12:25', '1', 'A006', '', NULL, NULL, '2022-03-23 20:25:58', '公共');
INSERT INTO `tbl_user` VALUES ('264264c552134fd5a75c7ceb85d80b17', 'zzy', '张正友', '202cb962ac59075b964b07152d234b70', '213172265@seu.edu.cn', '2022-03-17 10:50:55', '1', 'A003', '', '2022-03-14 12:19:33', '超极用户', '2022-03-14 20:05:43', '超极用户');
INSERT INTO `tbl_user` VALUES ('3162aba1f9b84c9cbe5dd35fc1cea202', 'gg', '公共', '202cb962ac59075b964b07152d234b70', '', '2230-12-31 19:18:23', '1', 'A002', '', '2022-03-17 18:19:10', '小小晓', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '张三', '202cb962ac59075b964b07152d234b70', 'zsmd@qq.com', '2018-11-30 23:50:55', '1', 'A001', '192.168.1.1', '2018-11-22 11:37:34', '张三', '2022-03-15 13:33:00', '超极用户');
INSERT INTO `tbl_user` VALUES ('4d399a9d2e574d028c695191f14dfd5b', 'mimi', 'mimi小号', '202cb962ac59075b964b07152d234b70', '213172265@seu.edu.cn', '2030-12-28 19:59:52', '1', '1032', '', '2022-03-16 22:00:40', '超极用户', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('58dbef8cae4f454cb9819bf3854a19a0', 'xcc', '超极用户', '81dc9bdb52d04dc20036dbd8313ed055', 'super@163.com', '2100-12-30 12:59:59', '1', 'A001', NULL, '2022-03-12 09:09:09', '超极用户', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('a75979c30fb442dba3cf507160b15ea6', 'yume', '乐迷', '289dff07669d7a23de0ef88d2f7129e7', '3215342198@qq.com', '2022-03-18 14:36:09', '1', '2042', '', '2022-03-14 21:36:48', '超极用户', '2022-03-15 13:30:44', '超极用户');

SET FOREIGN_KEY_CHECKS = 1;
