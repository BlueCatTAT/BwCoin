/*
 Navicat Premium Data Transfer

 Source Server         : top
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 203.195.169.13:3306
 Source Schema         : bwcoin

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 10/08/2020 10:31:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bw_account
-- ----------------------------
DROP TABLE IF EXISTS `bw_account`;
CREATE TABLE `bw_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `balance` decimal(15, 5) NULL DEFAULT 0.00000 COMMENT '杠杆账户',
  `BTC_balance` decimal(15, 5) NULL DEFAULT 0.00000 COMMENT 'BTC可用余额',
  `ETH_balance` decimal(15, 5) NULL DEFAULT 0.00000 COMMENT 'ETH可用余额',
  `LBTH_balance` decimal(15, 5) NULL DEFAULT 0.00000 COMMENT 'LBTH可用余额',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0正常，1禁用',
  `currency` decimal(15, 5) NULL DEFAULT NULL COMMENT '已借币种数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户币种账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_account
-- ----------------------------
INSERT INTO `bw_account` VALUES (1, 7, 1996852.99000, 14.00000, 20.00000, 15.00000, 0, 300.00000);
INSERT INTO `bw_account` VALUES (2, 1, 18.25000, 51.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (3, 2, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (4, 3, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (5, 8, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (6, 9, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (7, 10, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);
INSERT INTO `bw_account` VALUES (8, 11, 0.00000, 0.00000, 0.00000, 0.00000, 0, NULL);

-- ----------------------------
-- Table structure for bw_activity
-- ----------------------------
DROP TABLE IF EXISTS `bw_activity`;
CREATE TABLE `bw_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `currency_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '币种id',
  `least` decimal(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '最少投票数量',
  `maximum` decimal(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '最多投票数量',
  `x_currency_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '消耗币种id',
  `consume_number` decimal(11, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '每1票消耗多少币种',
  `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '投票规则',
  `support` decimal(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '支持票数量',
  `oppose` decimal(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '反对票数量',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `etime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投票上币活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_activity
-- ----------------------------
INSERT INTO `bw_activity` VALUES (4, '超级金融链', 1, 2, 5000, 3, 0.10000, '的非官方的个多福多寿', 5, 0, 1589428148, NULL, 1);
INSERT INTO `bw_activity` VALUES (5, NULL, 1, 1, 1500, 4, 0.03000, '是电风扇的分公司的范德萨范德萨范德萨', 0, 0, 1589370649, NULL, 0);
INSERT INTO `bw_activity` VALUES (6, '', 1, 1, 150, 4, 0.05000, '是大公司大概是的副驾驶的开发可手动加水淀粉的顺口溜付款了鼓风', 0, 0, 1589435936, NULL, 0);
INSERT INTO `bw_activity` VALUES (17, 'CureWorldCosplay', 1, 1, 1000, 2, 0.01000, '时代峰峻速度快感受到开发基维斯反弹就四个速度快放假速度快港交所的咖啡机是考虑到减肥是客观上给谁看的感觉速度快放假速度快放假说的福建省的开关机斯柯达', 1, 0, 1589428231, NULL, 1);
INSERT INTO `bw_activity` VALUES (18, '一根太阳线', 4, 10, 1000, 1, 0.00010, '<p>一根太阳线即将上线</p>', 20, 10, 1589611790, NULL, 1);

-- ----------------------------
-- Table structure for bw_auktion
-- ----------------------------
DROP TABLE IF EXISTS `bw_auktion`;
CREATE TABLE `bw_auktion`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_id` int(5) UNSIGNED NOT NULL COMMENT '拍卖期次',
  `award_btc` decimal(15, 6) UNSIGNED NULL DEFAULT NULL COMMENT '奖品BTC数量',
  `award_usdt` decimal(15, 3) UNSIGNED NULL DEFAULT NULL COMMENT '奖品usdt数量',
  `award_eth` decimal(15, 3) UNSIGNED NULL DEFAULT NULL COMMENT '奖品eth数量',
  `award_lbth` decimal(15, 3) UNSIGNED NULL DEFAULT NULL COMMENT '奖品lbth数量',
  `start_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '活动开启时间',
  `end_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '活动结束时间',
  `payer` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '买单者',
  `winner` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '获胜者',
  `status` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '拍卖状态（0开启 1关闭）',
  `fomo_price` decimal(15, 3) UNSIGNED NULL DEFAULT NULL COMMENT '当前最大金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代币拍卖' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_auktion
-- ----------------------------
INSERT INTO `bw_auktion` VALUES (1, 2, 0.000158, 100.000, 0.000, 0.000, 1590119720, 1590810920, 2, 1, 0, 1000.000);

-- ----------------------------
-- Table structure for bw_auktion_user
-- ----------------------------
DROP TABLE IF EXISTS `bw_auktion_user`;
CREATE TABLE `bw_auktion_user`  (
  `id` int(11) UNSIGNED NOT NULL,
  `f_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT 'fomo活动ID',
  `u_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户钱包地址',
  `price` decimal(15, 3) UNSIGNED NULL DEFAULT NULL COMMENT '用户拍卖金额',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '拍卖时间',
  `award` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获得奖品'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拍卖用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_cbsx
-- ----------------------------
DROP TABLE IF EXISTS `bw_cbsx`;
CREATE TABLE `bw_cbsx`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `period` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动期次',
  `currency_id` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '理财币种',
  `x_currency_id` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '利息币种',
  `ac_method` enum('活期模式','定期模式') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '活期模式' COMMENT '理财模式 ',
  `fee` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '手续费',
  `total` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '理财总量',
  `start_mun` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '已理财量',
  `start_buy_mun` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '单次起购数量 ',
  `financial_cycle` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '理财周期',
  `time_type` enum('分','时','日','月','年') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '日' COMMENT '时间类型',
  `cycle_max` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '周期限额',
  `cycle_fee` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '周期利息',
  `start_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '开启时间',
  `end_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '1可用 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '持币生息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_cbsx
-- ----------------------------
INSERT INTO `bw_cbsx` VALUES (1, '20200518', 4, 4, '定期模式', 3, 100, 33, 0, 1, '月', 1, 30, 1589385600, 1602432000, 1);
INSERT INTO `bw_cbsx` VALUES (2, '20200519', 4, 4, '定期模式', 3, 100, 21, 5, 6, '时', 10, 30, 1590076800, 1589472000, 1);
INSERT INTO `bw_cbsx` VALUES (3, '20200106', 1, 1, '活期模式', 3, 100, 1, 5, 5, '日', 10, 30, 1578326400, 1581004800, 1);

-- ----------------------------
-- Table structure for bw_coin_trading
-- ----------------------------
DROP TABLE IF EXISTS `bw_coin_trading`;
CREATE TABLE `bw_coin_trading`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `type` enum('sell','buy') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买/出售',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `coin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '币币交易' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_coin_trading
-- ----------------------------
INSERT INTO `bw_coin_trading` VALUES (1, 3, 'sell', 2.00000, '19036.08000USDT', 1591185502, 'btc');
INSERT INTO `bw_coin_trading` VALUES (2, 1, 'sell', 0.01000, '91.4479USDT', 1593411781, 'btc');
INSERT INTO `bw_coin_trading` VALUES (3, 1, 'buy', 1.00000, '9144.3800USDT', 1593411812, 'btc');

-- ----------------------------
-- Table structure for bw_config_sms_yu
-- ----------------------------
DROP TABLE IF EXISTS `bw_config_sms_yu`;
CREATE TABLE `bw_config_sms_yu`  (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'region_id',
  `sms_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `sms_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sms_id',
  `sms_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sms_name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_config_sms_yu
-- ----------------------------
INSERT INTO `bw_config_sms_yu` VALUES (1, 'LTAI4FqU1euBNBiz3c2mnRUc', 'eTf4YwLzDYqxQ5GkKGCC9uCuKnjLK9', 'SMS_186940883', '龙霸网络');
INSERT INTO `bw_config_sms_yu` VALUES (2, 'LTAI4Fq1WQfch2HXJgr6yYMm', 'xOnev9jwcsHfm3rH8k0Pkc1zBsPBYQ', 'SMS_182515024', '掌上衣橱');

-- ----------------------------
-- Table structure for bw_currency
-- ----------------------------
DROP TABLE IF EXISTS `bw_currency`;
CREATE TABLE `bw_currency`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `status` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '币种' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_currency
-- ----------------------------
INSERT INTO `bw_currency` VALUES (1, 'BTC', 1, '/public/upload/2020-05-12/1589275883388034.jpg');
INSERT INTO `bw_currency` VALUES (2, 'ETH', 1, '/public/upload/2020-05-12/1589275895739596.jpg');
INSERT INTO `bw_currency` VALUES (3, 'USDT', 1, '/public/upload/2020-05-12/1589275908770303.png');
INSERT INTO `bw_currency` VALUES (4, 'LBTH', 1, '/public/upload/2020-05-12/1589275920341287.jpg');

-- ----------------------------
-- Table structure for bw_currencyinterest
-- ----------------------------
DROP TABLE IF EXISTS `bw_currencyinterest`;
CREATE TABLE `bw_currencyinterest`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `period` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动期次',
  `cbsx_id` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '活动ID',
  `user_id` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `currency_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '存币数量',
  `cycle_fee` decimal(5, 2) UNSIGNED NULL DEFAULT NULL COMMENT '利率',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '存币时间',
  `financial_cycle` int(3) NULL DEFAULT NULL COMMENT '理财周期',
  `time_type` enum('分','时','日','月','年') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间类型',
  `order_status` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '订单状态（1涨息中 0已完成 2中途提现）',
  `x_currency_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '利息币种',
  `count` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '累计次数',
  `profit` decimal(10, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '累计获利',
  `ac_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存币模式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '持币生息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_currencyinterest
-- ----------------------------
INSERT INTO `bw_currencyinterest` VALUES (1, '20200518', 1, 1, 'LBTH', 10, 30.00, 1589876996, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (2, '20200518', 1, 1, 'LBTH', 10, 30.00, 1589877061, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (3, '20200519', 2, 1, 'LBTH', 20, 30.00, 1589877078, 6, '时', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (4, '20200106', 3, 1, 'BTC', 1, 30.00, 1589877407, 5, '日', 1, 'BTC', 0, 0.000, '活期模式');
INSERT INTO `bw_currencyinterest` VALUES (5, '20200518', 1, 2, 'LBTH', 1, 30.00, 1592641709, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (6, '20200518', 1, 2, 'LBTH', 1, 30.00, 1592641780, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (7, '20200518', 1, 2, 'LBTH', 1, 30.00, 1593412143, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (8, '20200518', 1, 2, 'LBTH', 10, 30.00, 1593412174, 1, '月', 1, 'LBTH', 0, 0.000, '定期模式');
INSERT INTO `bw_currencyinterest` VALUES (9, '20200519', 2, 2, 'LBTH', 1, 30.00, 1593479600, 6, '时', 1, 'LBTH', 0, 0.000, '定期模式');

-- ----------------------------
-- Table structure for bw_deposit
-- ----------------------------
DROP TABLE IF EXISTS `bw_deposit`;
CREATE TABLE `bw_deposit`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种（1btc 2eth 3usdt 4lbth）',
  `token_num` decimal(13, 3) UNSIGNED NULL DEFAULT NULL COMMENT '金额',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '充值时间',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值地址',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '0未支付 1已支付 2待审核 3审核失败',
  `black` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '区块高度',
  `info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驳回描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_deposit
-- ----------------------------
INSERT INTO `bw_deposit` VALUES (5, 1, 'USDT', 12.000, 1589956794, '', 1, 1111, NULL);
INSERT INTO `bw_deposit` VALUES (6, 1, 'USDT', 100.000, 1590040001, '', 1, 111, NULL);
INSERT INTO `bw_deposit` VALUES (7, 1, 'BTC', 100.000, 1590040162, '', 1, 1, NULL);
INSERT INTO `bw_deposit` VALUES (8, 1, 'BTC', 100.000, 1590040211, '', 1, 1, NULL);
INSERT INTO `bw_deposit` VALUES (9, 1, 'USDT', 100.000, 1590040277, '', 1, 1, NULL);
INSERT INTO `bw_deposit` VALUES (10, 3, 'USDT', 50000.000, 1591185472, '', 1, 10, NULL);
INSERT INTO `bw_deposit` VALUES (11, 2, 'USDT', 10000.000, 1592480246, '', 1, 12, NULL);
INSERT INTO `bw_deposit` VALUES (12, 2, 'BTC', 10000.000, 1592480255, '', 1, 12, NULL);
INSERT INTO `bw_deposit` VALUES (13, 2, 'LBTH', 10000.000, 1592480264, '', 1, 1, NULL);
INSERT INTO `bw_deposit` VALUES (14, 2, 'ETH', 10000.000, 1592480274, '', 1, 1, NULL);

-- ----------------------------
-- Table structure for bw_fiatcoin
-- ----------------------------
DROP TABLE IF EXISTS `bw_fiatcoin`;
CREATE TABLE `bw_fiatcoin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `type_sale` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '挂卖类型( 0 卖 1买）',
  `coin` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '币种',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `y_num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '剩余数量',
  `price` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '价格',
  `payment` int(2) UNSIGNED NULL DEFAULT 1 COMMENT '支付方式（1支付宝）',
  `min` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最小价格',
  `max` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最高价格',
  `status` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '状态（0进行中 和 1收摊）',
  `transactions` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '交易次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '法币交易挂单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_fund_transfer
-- ----------------------------
DROP TABLE IF EXISTS `bw_fund_transfer`;
CREATE TABLE `bw_fund_transfer`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(50) UNSIGNED NOT NULL COMMENT '用户ID',
  `start` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出账户',
  `end` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入账户',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '划转数量',
  `coin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '划转时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资金划转' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_fund_transfer
-- ----------------------------
INSERT INTO `bw_fund_transfer` VALUES (1, 1, '币币账户', '杆杆账户', 10.00000, 'btc', 1591950333);
INSERT INTO `bw_fund_transfer` VALUES (2, 1, '币币账户', '杆杆账户', 10.00000, 'btc', 1591950348);
INSERT INTO `bw_fund_transfer` VALUES (3, 1, '币币账户', '杆杆账户', 30.00000, 'btc', 1591950387);
INSERT INTO `bw_fund_transfer` VALUES (4, 1, '币币账户', '合约账户', 10.00000, 'btc', 1591950400);
INSERT INTO `bw_fund_transfer` VALUES (5, 1, '币币账户', '杆杆账户', 1.00000, 'btc', 1592537578);
INSERT INTO `bw_fund_transfer` VALUES (6, 1, '币币账户', '合约账户', 1.00000, 'btc', 1592537585);
INSERT INTO `bw_fund_transfer` VALUES (7, 1, '币币账户', '杆杆账户', 1.00000, 'btc', 1592537623);
INSERT INTO `bw_fund_transfer` VALUES (8, 1, '币币账户', '杆杆账户', 1.00000, 'btc', 1592538327);
INSERT INTO `bw_fund_transfer` VALUES (9, 1, '币币账户', '合约账户', 1.00000, 'btc', 1592538343);
INSERT INTO `bw_fund_transfer` VALUES (10, 1, '币币账户', '合约账户', 3000.00000, 'usdt', 1593683169);

-- ----------------------------
-- Table structure for bw_heyue
-- ----------------------------
DROP TABLE IF EXISTS `bw_heyue`;
CREATE TABLE `bw_heyue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `usdt` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'USDT可用余额',
  `btc` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'BTC可用余额',
  `eth` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'ETH可用余额',
  `lbth` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'LBTH可用余额',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户合约账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_heyue
-- ----------------------------
INSERT INTO `bw_heyue` VALUES (1, 1, 2999.90370, 12.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (2, 2, 0.00000, 0.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (3, 3, 0.00000, 0.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (4, 7, 10.00000, 20.00000, 30.00000, 40.00000, 0);
INSERT INTO `bw_heyue` VALUES (5, 8, 0.00000, 0.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (6, 9, 0.00000, 0.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (7, 10, 0.00000, 0.00000, 0.00000, 0.00000, 0);
INSERT INTO `bw_heyue` VALUES (8, 11, 0.00000, 0.00000, 0.00000, 0.00000, 0);

-- ----------------------------
-- Table structure for bw_heyue_data
-- ----------------------------
DROP TABLE IF EXISTS `bw_heyue_data`;
CREATE TABLE `bw_heyue_data`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '支付价格',
  `multiple` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '倍数',
  `lots` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '手数',
  `type` enum('看涨','看跌','平空','平多') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '看涨' COMMENT '类型',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `coin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `market_price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '市场价格',
  `margin` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '保证金',
  `fee` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '手续费',
  `fact_profits` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最终盈亏',
  `overnight` decimal(15, 5) UNSIGNED NULL DEFAULT 0.20000 COMMENT '隔夜费金额',
  `overnight_money` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '隔夜费金额',
  `status` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '交易状态:0.挂单中,1.交易中,2.平仓中,3.已平仓,4.已撤单',
  `settled` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '结算状态:0.未结算,1.已结算',
  `transaction_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '交易时间',
  `handle_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '平仓时间',
  `complete_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合约交易记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_heyue_data
-- ----------------------------
INSERT INTO `bw_heyue_data` VALUES (1, 1, 0.00530, 50, 1.00000, '看涨', 1593683179, 'lbth', 0.17630, 0.00390, 0.00140, NULL, 0.20000, NULL, 0, 0, NULL, NULL, NULL);
INSERT INTO `bw_heyue_data` VALUES (2, 1, 0.09100, 50, 20.00000, '平多', 1593683255, 'btc', 0.17780, 0.06260, 0.02840, NULL, 0.20000, NULL, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bw_huobi_ticker
-- ----------------------------
DROP TABLE IF EXISTS `bw_huobi_ticker`;
CREATE TABLE `bw_huobi_ticker`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '首页行情数据id',
  `symbol` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易对',
  `amount` decimal(20, 4) UNSIGNED NULL DEFAULT NULL COMMENT '以基础币种计量的交易量',
  `count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '交易笔数',
  `open` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '开盘价',
  `close` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '最新价',
  `low` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '最低价',
  `high` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '最高价',
  `vol` decimal(20, 10) NULL DEFAULT NULL COMMENT '以报价币种计量的交易量',
  `bid` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '买一价',
  `bidSize` decimal(20, 4) UNSIGNED NULL DEFAULT NULL COMMENT '买一量',
  `ask` decimal(20, 6) UNSIGNED NULL DEFAULT NULL COMMENT '卖一价',
  `askSize` decimal(20, 4) UNSIGNED NULL DEFAULT NULL COMMENT '卖一量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 556 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '火币实时行情' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bw_huobi_ticker
-- ----------------------------
INSERT INTO `bw_huobi_ticker` VALUES (1, 'tnbbtc', 17976647.0000, 2682, 0.000000, 0.000000, 0.000000, 0.000000, 2.5800396145, 0.000000, 837203.0000, 0.000000, 34212.0000);
INSERT INTO `bw_huobi_ticker` VALUES (2, 'paybtc', 245834.6600, 1333, 0.000005, 0.000005, 0.000004, 0.000005, 1.1211552508, 0.000004, 1857.0300, 0.000005, 1148.6100);
INSERT INTO `bw_huobi_ticker` VALUES (3, 'gnteth', 182840.1300, 642, 0.000213, 0.000217, 0.000213, 0.000222, 39.7511533742, 0.000217, 6930.0000, 0.000219, 543.7000);
INSERT INTO `bw_huobi_ticker` VALUES (4, 'smtusdt', 15778536.3649, 2537, 0.003043, 0.003069, 0.003012, 0.003195, 48447.4086920680, 0.003045, 2337.0000, 0.003078, 16633.0000);
INSERT INTO `bw_huobi_ticker` VALUES (5, 'ltcht', 1042.5945, 348, 11.088444, 10.985186, 10.934515, 11.174221, 11592.9024851940, 10.987175, 4.7825, 11.041373, 4.7896);
INSERT INTO `bw_huobi_ticker` VALUES (6, 'mtlbtc', 8721.6001, 1389, 0.000036, 0.000036, 0.000035, 0.000036, 0.3133351214, 0.000036, 388.4668, 0.000036, 62.0000);
INSERT INTO `bw_huobi_ticker` VALUES (7, 'yeeeth', 12391453.7400, 1727, 0.000005, 0.000005, 0.000005, 0.000005, 64.2940430723, 0.000005, 198057.1100, 0.000005, 64000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (8, 'appcbtc', 120880.3519, 1130, 0.000004, 0.000004, 0.000004, 0.000004, 0.4827354000, 0.000004, 4504.2100, 0.000004, 6125.3600);
INSERT INTO `bw_huobi_ticker` VALUES (9, 'idtbtc', 2291266.3100, 2144, 0.000000, 0.000000, 0.000000, 0.000000, 0.8354160192, 0.000000, 2346.3200, 0.000000, 1369.0700);
INSERT INTO `bw_huobi_ticker` VALUES (10, 'atombtc', 67018.2793, 3391, 0.000341, 0.000336, 0.000336, 0.000342, 22.7604954549, 0.000336, 14.7100, 0.000337, 5.2000);
INSERT INTO `bw_huobi_ticker` VALUES (11, 'aacbtc', 2414442.6504, 2282, 0.000004, 0.000004, 0.000004, 0.000004, 9.1507758345, 0.000004, 2768.7400, 0.000004, 3845.6700);
INSERT INTO `bw_huobi_ticker` VALUES (12, 'aidoceth', 9193939.3800, 2336, 0.000008, 0.000007, 0.000007, 0.000008, 69.6120324291, 0.000007, 34703.7800, 0.000007, 31300.0000);
INSERT INTO `bw_huobi_ticker` VALUES (13, 'bsvbtc', 25917.1532, 22153, 0.028076, 0.027355, 0.027335, 0.028117, 714.0054156151, 0.027355, 0.0290, 0.027378, 1.0811);
INSERT INTO `bw_huobi_ticker` VALUES (14, 'htbtc', 1085577.9508, 24412, 0.000545, 0.000537, 0.000536, 0.000548, 588.8141433206, 0.000537, 99.8000, 0.000537, 17.0500);
INSERT INTO `bw_huobi_ticker` VALUES (15, 'iostht', 1389537.4247, 3790, 0.000835, 0.000860, 0.000830, 0.000875, 1176.6766911629, 0.000853, 276095.2646, 0.000877, 107037.0328);
INSERT INTO `bw_huobi_ticker` VALUES (16, 'ogousdt', 17050861.5921, 4019, 0.009364, 0.009945, 0.009079, 0.010043, 159979.4431413400, 0.009911, 40000.0000, 0.009998, 2000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (17, 'dashht', 236.3615, 223, 19.779745, 19.964789, 19.580239, 20.000000, 4660.6194227958, 19.761566, 1.6813, 19.944036, 12.9079);
INSERT INTO `bw_huobi_ticker` VALUES (18, 'datxeth', 75958043.4200, 1613, 0.000001, 0.000001, 0.000001, 0.000001, 76.6340599292, 0.000001, 447112.8300, 0.000001, 23143.6200);
INSERT INTO `bw_huobi_ticker` VALUES (19, 'elfusdt', 2200504.6592, 2112, 0.063200, 0.062500, 0.062200, 0.064000, 138684.2084925800, 0.062400, 14573.8833, 0.062700, 7598.7840);
INSERT INTO `bw_huobi_ticker` VALUES (20, 'soceth', 3217355.4300, 2042, 0.000018, 0.000018, 0.000018, 0.000019, 58.1726738424, 0.000018, 5913.9400, 0.000018, 127423.1700);
INSERT INTO `bw_huobi_ticker` VALUES (21, 'manaeth', 511044.7420, 1020, 0.000159, 0.000162, 0.000158, 0.000168, 83.0062942500, 0.000162, 25691.0000, 0.000163, 50589.0000);
INSERT INTO `bw_huobi_ticker` VALUES (22, 'zilbtc', 8667023.7300, 2354, 0.000001, 0.000001, 0.000001, 0.000001, 5.2270573333, 0.000001, 32600.0000, 0.000001, 170734.5400);
INSERT INTO `bw_huobi_ticker` VALUES (23, 'atpusdt', 57001740.4305, 1923, 0.001930, 0.001870, 0.001840, 0.001930, 107118.5755235000, 0.001870, 426935.3800, 0.001880, 252228.2800);
INSERT INTO `bw_huobi_ticker` VALUES (24, 'paxhusd', 134438.4704, 226, 0.999900, 1.000200, 0.999800, 1.000300, 134455.2595403300, 1.000000, 3047.7867, 1.000100, 1952.2836);
INSERT INTO `bw_huobi_ticker` VALUES (25, 'gxceth', 22583.7631, 2099, 0.002376, 0.002354, 0.002331, 0.002381, 53.3068717488, 0.002340, 17.0556, 0.002368, 4.0659);
INSERT INTO `bw_huobi_ticker` VALUES (26, 'iosteth', 13988792.3132, 4568, 0.000019, 0.000019, 0.000019, 0.000021, 264.6618442381, 0.000019, 19100.0000, 0.000019, 9200.0000);
INSERT INTO `bw_huobi_ticker` VALUES (27, 'muskbtc', 26369949.2600, 2178, 0.000000, 0.000000, 0.000000, 0.000000, 1.8767549930, 0.000000, 18255.8500, 0.000000, 58304.6300);
INSERT INTO `bw_huobi_ticker` VALUES (28, 'crousdt', 4142424.9907, 5920, 0.050100, 0.050200, 0.049500, 0.050900, 208650.2556670700, 0.050200, 4523.7500, 0.050300, 1491.9100);
INSERT INTO `bw_huobi_ticker` VALUES (29, 'xmxeth', 29254749.8500, 1751, 0.000002, 0.000002, 0.000002, 0.000002, 66.0117288046, 0.000002, 705926.8700, 0.000002, 373766.0000);
INSERT INTO `bw_huobi_ticker` VALUES (30, 'nasbtc', 119695.9140, 2598, 0.000037, 0.000037, 0.000036, 0.000037, 4.3770041813, 0.000037, 570.0000, 0.000037, 1644.8875);
INSERT INTO `bw_huobi_ticker` VALUES (31, 'wanbtc', 594735.0183, 4978, 0.000019, 0.000020, 0.000019, 0.000020, 11.4285799035, 0.000020, 1212.5900, 0.000020, 2000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (32, 'paiusdt', 23231519.1033, 2979, 0.013601, 0.013140, 0.013081, 0.013850, 310034.0516663200, 0.013136, 5500.0000, 0.013190, 3000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (33, 'daceth', 8541857.5100, 2130, 0.000006, 0.000006, 0.000006, 0.000007, 53.8513497333, 0.000006, 37658.6000, 0.000006, 16588.2000);
INSERT INTO `bw_huobi_ticker` VALUES (34, 'ycceth', 20610563.1400, 17706, 0.000032, 0.000032, 0.000031, 0.000033, 659.2393327628, 0.000032, 6857.9300, 0.000032, 2185.7900);
INSERT INTO `bw_huobi_ticker` VALUES (35, 'mexeth', 33095548.7800, 2037, 0.000001, 0.000001, 0.000001, 0.000001, 43.9123735544, 0.000001, 253254.0700, 0.000001, 100000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (36, 'scbtc', 8735112.7400, 2025, 0.000000, 0.000000, 0.000000, 0.000000, 1.6595648880, 0.000000, 4960.0000, 0.000000, 844.3500);
INSERT INTO `bw_huobi_ticker` VALUES (37, 'dgbeth', 1844821.0200, 2177, 0.000034, 0.000038, 0.000033, 0.000041, 66.7988387881, 0.000036, 8061.4000, 0.000038, 1148.3500);
INSERT INTO `bw_huobi_ticker` VALUES (38, 'dashbtc', 12945.0339, 6805, 0.010756, 0.010672, 0.010648, 0.010811, 139.8628870470, 0.010656, 19.9676, 0.010667, 7.8360);
INSERT INTO `bw_huobi_ticker` VALUES (39, 'dogeusdt', 88704365.1895, 3998, 0.001974, 0.001979, 0.001964, 0.002012, 175733.7466189900, 0.001979, 355809.8300, 0.001981, 59678.1600);
INSERT INTO `bw_huobi_ticker` VALUES (40, 'thetabtc', 173019.1791, 2105, 0.000011, 0.000011, 0.000011, 0.000011, 1.9261762925, 0.000011, 6713.5500, 0.000011, 2338.4000);
INSERT INTO `bw_huobi_ticker` VALUES (41, 'meetbtc', 1488111.1400, 2515, 0.000001, 0.000001, 0.000001, 0.000001, 1.2529906773, 0.000001, 100242.0700, 0.000001, 25796.4400);
INSERT INTO `bw_huobi_ticker` VALUES (42, 'nodeht', 2164194.2100, 2076, 0.000319, 0.000318, 0.000314, 0.000325, 692.9665519900, 0.000320, 77588.8400, 0.000322, 192137.0300);
INSERT INTO `bw_huobi_ticker` VALUES (43, 'newht', 5451173.4205, 686, 0.000109, 0.000111, 0.000107, 0.000111, 592.0127860152, 0.000110, 1280.2442, 0.000111, 8931.3508);
INSERT INTO `bw_huobi_ticker` VALUES (44, 'waxpbtc', 3565948.2062, 6338, 0.000004, 0.000004, 0.000004, 0.000004, 14.3022881333, 0.000004, 6288.9858, 0.000004, 58123.5567);
INSERT INTO `bw_huobi_ticker` VALUES (45, 'lxtusdt', 71987330.0611, 4480, 0.001827, 0.001792, 0.001732, 0.001828, 130021.3290031800, 0.001790, 621322.0300, 0.001795, 113603.8200);
INSERT INTO `bw_huobi_ticker` VALUES (46, 'astbtc', 67672.7980, 73, 0.000002, 0.000002, 0.000002, 0.000002, 0.1320430500, 0.000002, 4721.0000, 0.000002, 2323.0000);
INSERT INTO `bw_huobi_ticker` VALUES (47, 'mdsbtc', 8128585.0000, 2496, 0.000000, 0.000000, 0.000000, 0.000000, 3.4691800619, 0.000000, 2054.0000, 0.000000, 13402.0000);
INSERT INTO `bw_huobi_ticker` VALUES (48, 'xvgeth', 2852676.1700, 1987, 0.000016, 0.000016, 0.000015, 0.000016, 45.0311743284, 0.000016, 7800.0000, 0.000016, 25476.7600);
INSERT INTO `bw_huobi_ticker` VALUES (49, 'mteth', 162147870.0100, 5469, 0.000004, 0.000004, 0.000004, 0.000004, 666.0152807320, 0.000004, 19333.8500, 0.000004, 281652.2500);
INSERT INTO `bw_huobi_ticker` VALUES (50, 'onteth', 60135.4785, 2265, 0.002372, 0.002405, 0.002358, 0.002417, 143.4840754298, 0.002400, 350.8000, 0.002407, 351.5465);
INSERT INTO `bw_huobi_ticker` VALUES (51, 'dcreth', 1518.3429, 2410, 0.072105, 0.072862, 0.071597, 0.076305, 110.5899595163, 0.072716, 0.9550, 0.073009, 9.0996);
INSERT INTO `bw_huobi_ticker` VALUES (52, 'propyeth', 336835.7493, 2201, 0.000239, 0.000248, 0.000235, 0.000280, 84.9105002454, 0.000246, 630.0000, 0.000248, 674.8700);
INSERT INTO `bw_huobi_ticker` VALUES (53, 'sntbtc', 2419718.0085, 1284, 0.000002, 0.000002, 0.000002, 0.000002, 5.6762454301, 0.000002, 126040.0000, 0.000002, 173897.0000);
INSERT INTO `bw_huobi_ticker` VALUES (54, 'zrxbtc', 256705.2846, 2595, 0.000024, 0.000024, 0.000024, 0.000025, 6.2726053284, 0.000024, 1091.1200, 0.000024, 4402.1800);
INSERT INTO `bw_huobi_ticker` VALUES (55, 'reqbtc', 742328.1026, 350, 0.000001, 0.000001, 0.000001, 0.000001, 0.9156069780, 0.000001, 12987.6000, 0.000001, 6400.0000);
INSERT INTO `bw_huobi_ticker` VALUES (56, 'btmusdt', 16485524.0185, 5014, 0.058100, 0.058000, 0.056900, 0.059400, 960575.5277758900, 0.057800, 32822.5700, 0.058100, 27677.3200);
INSERT INTO `bw_huobi_ticker` VALUES (57, 'smtbtc', 4844076.0000, 2251, 0.000000, 0.000000, 0.000000, 0.000000, 2.1187621745, 0.000000, 2308.0000, 0.000000, 553739.0000);
INSERT INTO `bw_huobi_ticker` VALUES (58, 'elaeth', 8398.6500, 2112, 0.006580, 0.006652, 0.006491, 0.007175, 55.7099155204, 0.006616, 62.5600, 0.006687, 7.4700);
INSERT INTO `bw_huobi_ticker` VALUES (59, 'edubtc', 37683671.1000, 1140, 0.000000, 0.000000, 0.000000, 0.000000, 0.4063109571, 0.000000, 1933888.0800, 0.000000, 20803.1600);
INSERT INTO `bw_huobi_ticker` VALUES (60, 'faireth', 42648600.0700, 13709, 0.000006, 0.000007, 0.000006, 0.000007, 274.0762058573, 0.000007, 226854.5400, 0.000007, 21524.5200);
INSERT INTO `bw_huobi_ticker` VALUES (61, 'mtxeth', 99000.7200, 38, 0.000106, 0.000110, 0.000106, 0.000112, 10.9301990629, 0.000109, 14394.7500, 0.000111, 930.0000);
INSERT INTO `bw_huobi_ticker` VALUES (62, 'steemeth', 84239.5584, 2090, 0.000889, 0.000887, 0.000866, 0.000906, 74.8363076300, 0.000884, 400.0000, 0.000889, 2104.4809);
INSERT INTO `bw_huobi_ticker` VALUES (63, 'kaneth', 45017000.4300, 12357, 0.000013, 0.000013, 0.000012, 0.000013, 571.8242348940, 0.000013, 3850.0000, 0.000013, 5750.0000);
INSERT INTO `bw_huobi_ticker` VALUES (64, 'npxseth', 24059116.4900, 293, 0.000001, 0.000001, 0.000001, 0.000001, 16.3159246665, 0.000001, 7002932.5300, 0.000001, 6147284.6000);
INSERT INTO `bw_huobi_ticker` VALUES (65, 'ethbtc', 118248.0182, 66784, 0.024490, 0.023989, 0.023961, 0.024523, 2853.4807868914, 0.023989, 23.6887, 0.023994, 48.9236);
INSERT INTO `bw_huobi_ticker` VALUES (66, 'vsysusdt', 7639638.1189, 1669, 0.024500, 0.024200, 0.024000, 0.024700, 185059.8537661000, 0.024100, 10997.6000, 0.024200, 4558.9300);
INSERT INTO `bw_huobi_ticker` VALUES (67, 'batusdt', 375252.1818, 2172, 0.164800, 0.165300, 0.162400, 0.168500, 61864.4482259000, 0.165000, 1487.5000, 0.165600, 710.0000);
INSERT INTO `bw_huobi_ticker` VALUES (68, 'zechusd', 924.3338, 257, 39.030000, 38.420000, 38.410000, 39.540000, 35998.8955482890, 38.150000, 4.5549, 38.270000, 16.6334);
INSERT INTO `bw_huobi_ticker` VALUES (69, 'bkbteth', 20704796.9400, 1738, 0.000002, 0.000002, 0.000002, 0.000002, 40.4628367067, 0.000002, 201600.0000, 0.000002, 61000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (70, 'sntusdt', 6229264.9781, 3227, 0.016545, 0.016447, 0.016336, 0.016800, 102869.3360760800, 0.016411, 37402.4627, 0.016484, 600.0000);
INSERT INTO `bw_huobi_ticker` VALUES (71, 'kcashht', 9166502.6177, 2554, 0.002320, 0.002066, 0.002066, 0.002364, 19307.9418784570, 0.002058, 110458.2680, 0.002086, 5300.6160);
INSERT INTO `bw_huobi_ticker` VALUES (72, 'saltbtc', 84962.1540, 2047, 0.000007, 0.000007, 0.000007, 0.000008, 0.6319558442, 0.000007, 107.0966, 0.000007, 23.6806);
INSERT INTO `bw_huobi_ticker` VALUES (73, 'xmrusdt', 24510.4723, 7791, 56.140000, 56.430000, 55.200000, 57.560000, 1372514.0999096000, 56.360000, 0.4500, 56.430000, 19.6270);
INSERT INTO `bw_huobi_ticker` VALUES (74, 'pcbtc', 874186214.8300, 5132, 0.000000, 0.000000, 0.000000, 0.000000, 5.3229918544, 0.000000, 100000.0000, 0.000000, 16121375.7600);
INSERT INTO `bw_huobi_ticker` VALUES (75, 'omgeth', 51662.3269, 400, 0.003263, 0.003304, 0.003246, 0.003307, 168.6209552112, 0.003304, 423.9600, 0.003315, 623.4200);
INSERT INTO `bw_huobi_ticker` VALUES (76, 'manausdt', 3098018.5342, 808, 0.027400, 0.027500, 0.027100, 0.027900, 85194.9686420000, 0.027400, 100793.1200, 0.027500, 65296.3500);
INSERT INTO `bw_huobi_ticker` VALUES (77, 'etcusdt', 2576133.2960, 57517, 5.415100, 5.351700, 5.340000, 5.561600, 13913117.2113520000, 5.350000, 624.0000, 5.351700, 80.7741);
INSERT INTO `bw_huobi_ticker` VALUES (78, 'iotabtc', 473459.7752, 913, 0.000022, 0.000022, 0.000022, 0.000022, 10.5309366684, 0.000022, 206.8800, 0.000022, 3213.8900);
INSERT INTO `bw_huobi_ticker` VALUES (79, 'ektusdt', 59707321.2607, 946, 0.007400, 0.007300, 0.007100, 0.007400, 431426.3794470000, 0.007200, 6249797.6200, 0.007300, 399360.2100);
INSERT INTO `bw_huobi_ticker` VALUES (80, 'bcvbtc', 4962592.3500, 2461, 0.000001, 0.000001, 0.000001, 0.000001, 3.2003563379, 0.000001, 1996.0000, 0.000001, 2000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (81, 'ctxceth', 720009.9100, 2266, 0.000518, 0.000535, 0.000509, 0.000561, 380.3405871890, 0.000533, 150.0000, 0.000540, 1717.8000);
INSERT INTO `bw_huobi_ticker` VALUES (82, 'cvcoineth', 250688.2698, 1639, 0.000155, 0.000153, 0.000149, 0.000159, 37.9166606454, 0.000150, 500.0000, 0.000159, 330.0000);
INSERT INTO `bw_huobi_ticker` VALUES (83, 'cnnbtc', 312458233.0317, 795, 0.000000, 0.000000, 0.000000, 0.000000, 2.1560190195, 0.000000, 28763818.3100, 0.000000, 33806340.7600);
INSERT INTO `bw_huobi_ticker` VALUES (84, 'evxeth', 102895.2900, 2299, 0.000870, 0.000905, 0.000861, 0.000919, 91.0158561652, 0.000893, 329.0700, 0.000916, 604.0000);
INSERT INTO `bw_huobi_ticker` VALUES (85, 'akrobtc', 2227284.2000, 926, 0.000000, 0.000000, 0.000000, 0.000000, 0.9899615003, 0.000000, 252280.2600, 0.000000, 523510.3700);
INSERT INTO `bw_huobi_ticker` VALUES (86, 'snceth', 5877323.9876, 1157, 0.000104, 0.000104, 0.000101, 0.000106, 606.5488746247, 0.000103, 406.6100, 0.000104, 2968.2100);
INSERT INTO `bw_huobi_ticker` VALUES (87, 'ttbtc', 7170573.3376, 996, 0.000001, 0.000001, 0.000001, 0.000001, 5.6773656040, 0.000001, 794135.1200, 0.000001, 1437477.8600);
INSERT INTO `bw_huobi_ticker` VALUES (88, 'rteeth', 50891257.6982, 2138, 0.000002, 0.000002, 0.000002, 0.000003, 123.9316579718, 0.000002, 118959.3500, 0.000002, 15544.4400);
INSERT INTO `bw_huobi_ticker` VALUES (89, 'steemusdt', 3104198.0125, 4686, 0.152200, 0.149900, 0.148800, 0.153800, 469152.6456751900, 0.149900, 4956.5235, 0.150100, 6999.9999);
INSERT INTO `bw_huobi_ticker` VALUES (90, 'hptusdt', 133854286.0095, 21523, 0.005018, 0.004935, 0.004916, 0.005050, 667017.2212467100, 0.004927, 72502.8255, 0.004935, 182.4056);
INSERT INTO `bw_huobi_ticker` VALUES (91, 'nknht', 366872.0300, 3783, 0.003990, 0.004124, 0.003954, 0.004384, 1494.1379212300, 0.004061, 17130.6500, 0.004149, 80152.7800);
INSERT INTO `bw_huobi_ticker` VALUES (92, 'rsrht', 1626912.2000, 1972, 0.000679, 0.000674, 0.000660, 0.000690, 1100.6044574700, 0.000672, 64146.9200, 0.000678, 328954.8400);
INSERT INTO `bw_huobi_ticker` VALUES (93, 'engeth', 1569.1324, 19, 0.000959, 0.000961, 0.000912, 0.000961, 1.4713591163, 0.000829, 40.3378, 0.000905, 305.3335);
INSERT INTO `bw_huobi_ticker` VALUES (94, 'ektbtc', 2334727.9000, 6883, 0.000001, 0.000001, 0.000001, 0.000001, 2.4000864804, 0.000001, 2734.0300, 0.000001, 600.0000);
INSERT INTO `bw_huobi_ticker` VALUES (95, 'bttbtc', 293171949.9076, 12696, 0.000000, 0.000000, 0.000000, 0.000000, 9.5271301173, 0.000000, 1893832.3300, 0.000000, 44231635.5000);
INSERT INTO `bw_huobi_ticker` VALUES (96, 'akrousdt', 10328787.2656, 1163, 0.003070, 0.003130, 0.003070, 0.003230, 32395.9671568900, 0.003120, 136691.8500, 0.003160, 47834.8200);
INSERT INTO `bw_huobi_ticker` VALUES (97, 'gnxeth', 4519766.0000, 1038, 0.000042, 0.000041, 0.000039, 0.000042, 185.2127919700, 0.000040, 52996.0000, 0.000042, 58211.0000);
INSERT INTO `bw_huobi_ticker` VALUES (98, 'lambht', 866260.6338, 6338, 0.003265, 0.003347, 0.003223, 0.003397, 2850.0525697249, 0.003340, 8839.3541, 0.003364, 2891.0788);
INSERT INTO `bw_huobi_ticker` VALUES (99, 'zlaeth', 1456035.1600, 1479, 0.000021, 0.000021, 0.000020, 0.000023, 31.2734055496, 0.000020, 14477.6300, 0.000022, 5800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (100, 'actusdt', 29631626.7851, 5507, 0.004828, 0.004802, 0.004724, 0.004913, 142014.3928476200, 0.004781, 7192.0000, 0.004808, 7205.6000);
INSERT INTO `bw_huobi_ticker` VALUES (101, 'shebtc', 15224429.0700, 2227, 0.000000, 0.000000, 0.000000, 0.000000, 0.9440393077, 0.000000, 285573.7600, 0.000000, 4420.9100);
INSERT INTO `bw_huobi_ticker` VALUES (102, 'lsketh', 8675.6434, 2060, 0.006196, 0.006084, 0.005973, 0.006268, 53.2778261736, 0.006061, 13.8750, 0.006104, 70.9108);
INSERT INTO `bw_huobi_ticker` VALUES (103, 'grseth', 47176.8488, 1548, 0.000900, 0.000903, 0.000895, 0.000942, 42.6929789958, 0.000900, 109.2812, 0.000907, 935.6561);
INSERT INTO `bw_huobi_ticker` VALUES (104, 'bhdbtc', 9790.0782, 2830, 0.000757, 0.000769, 0.000743, 0.000822, 7.4773210228, 0.000767, 7.0227, 0.000774, 7.9000);
INSERT INTO `bw_huobi_ticker` VALUES (105, 'linkusdt', 5032861.1715, 54987, 3.393100, 3.418200, 3.336100, 3.552000, 16983022.7813620000, 3.416800, 1563.2000, 3.419600, 2.5000);
INSERT INTO `bw_huobi_ticker` VALUES (106, 'gasbtc', 3096.0564, 406, 0.000160, 0.000157, 0.000157, 0.000162, 0.4927874633, 0.000157, 1226.8807, 0.000158, 18.0000);
INSERT INTO `bw_huobi_ticker` VALUES (107, 'bhtusdt', 14078577.4644, 9251, 0.053900, 0.054437, 0.052723, 0.058000, 765447.5596805900, 0.054325, 3963.6000, 0.054601, 200.0000);
INSERT INTO `bw_huobi_ticker` VALUES (108, 'nanobtc', 54666.3832, 2310, 0.000079, 0.000079, 0.000078, 0.000080, 4.3169868380, 0.000079, 40.9600, 0.000079, 191.5100);
INSERT INTO `bw_huobi_ticker` VALUES (109, 'sbtcbtc', 5092.1161, 64, 0.000088, 0.000087, 0.000087, 0.000088, 0.4507139889, 0.000086, 515.3854, 0.000089, 45.4544);
INSERT INTO `bw_huobi_ticker` VALUES (110, 'pvtbtc', 31783718.0000, 3965, 0.000000, 0.000000, 0.000000, 0.000000, 1.2705534505, 0.000000, 165393.0100, 0.000000, 13933.1700);
INSERT INTO `bw_huobi_ticker` VALUES (111, 'xembtc', 709487.3000, 1236, 0.000005, 0.000005, 0.000005, 0.000005, 3.7626817578, 0.000005, 63458.3100, 0.000005, 7613.8100);
INSERT INTO `bw_huobi_ticker` VALUES (112, 'tosbtc', 6125502.7300, 1744, 0.000000, 0.000000, 0.000000, 0.000000, 0.6333511615, 0.000000, 124214.8300, 0.000000, 12000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (113, 'mcobtc', 123294.3786, 7715, 0.000733, 0.000733, 0.000730, 0.000737, 90.3687875332, 0.000731, 208.5690, 0.000735, 22.9213);
INSERT INTO `bw_huobi_ticker` VALUES (114, 'phxbtc', 1718852.6200, 2025, 0.000000, 0.000000, 0.000000, 0.000000, 0.4480781598, 0.000000, 32126.0800, 0.000000, 44191.2200);
INSERT INTO `bw_huobi_ticker` VALUES (115, 'ncashbtc', 29401626.3246, 2259, 0.000000, 0.000000, 0.000000, 0.000000, 0.7713048742, 0.000000, 388000.0000, 0.000000, 169108.8100);
INSERT INTO `bw_huobi_ticker` VALUES (116, 'trxusdt', 470894335.8940, 35725, 0.012964, 0.012790, 0.012752, 0.013243, 6076396.6557473000, 0.012790, 469.2300, 0.012794, 1328.3600);
INSERT INTO `bw_huobi_ticker` VALUES (117, 'dgdeth', 442.8206, 2109, 0.191254, 0.190829, 0.190607, 0.192984, 84.6985689689, 0.190607, 328.9933, 0.191320, 2.7498);
INSERT INTO `bw_huobi_ticker` VALUES (118, 'newbtc', 38861744.8300, 1520, 0.000000, 0.000000, 0.000000, 0.000000, 2.2935807694, 0.000000, 859565.9000, 0.000000, 23000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (119, 'lbaeth', 4084443.0612, 1268, 0.000060, 0.000060, 0.000057, 0.000061, 240.2782782504, 0.000059, 9184.9509, 0.000060, 74870.8477);
INSERT INTO `bw_huobi_ticker` VALUES (120, 'butbtc', 30452072.3000, 4985, 0.000000, 0.000000, 0.000000, 0.000000, 3.4283086896, 0.000000, 201218.0300, 0.000000, 40204.9400);
INSERT INTO `bw_huobi_ticker` VALUES (121, 'hb10usdt', 898397.6575, 23743, 0.423500, 0.418900, 0.416600, 0.430000, 377919.3569398000, 0.418900, 15.2213, 0.419000, 1842.7363);
INSERT INTO `bw_huobi_ticker` VALUES (122, 'uipbtc', 3223910.7600, 4299, 0.000001, 0.000001, 0.000001, 0.000001, 1.8306816836, 0.000001, 16746.8400, 0.000001, 2202.7700);
INSERT INTO `bw_huobi_ticker` VALUES (123, 'etchusd', 4208.8051, 276, 5.400200, 5.389000, 5.389000, 5.545900, 22816.7606169700, 5.351600, 32.2669, 5.362800, 194.6690);
INSERT INTO `bw_huobi_ticker` VALUES (124, 'mtnbtc', 1734142.6200, 2117, 0.000000, 0.000000, 0.000000, 0.000000, 0.5233045621, 0.000000, 57818.0500, 0.000000, 1319.6600);
INSERT INTO `bw_huobi_ticker` VALUES (125, 'zeneth', 1362.2590, 2063, 0.032748, 0.032532, 0.032018, 0.033857, 44.9837481126, 0.032232, 2.4000, 0.032833, 6.5324);
INSERT INTO `bw_huobi_ticker` VALUES (126, 'atpht', 1920935.7700, 3575, 0.000503, 0.000494, 0.000482, 0.000523, 947.9765568100, 0.000493, 71729.0000, 0.000498, 229081.5600);
INSERT INTO `bw_huobi_ticker` VALUES (127, 'hoteth', 4808882.1818, 1663, 0.000009, 0.000009, 0.000008, 0.000009, 41.4850416733, 0.000009, 735.2200, 0.000009, 3675.9100);
INSERT INTO `bw_huobi_ticker` VALUES (128, 'fsnbtc', 6697.2400, 4220, 0.000111, 0.000109, 0.000107, 0.000112, 0.7352899969, 0.000108, 584.1700, 0.000109, 36.7900);
INSERT INTO `bw_huobi_ticker` VALUES (129, 'ocnbtc', 299835631.9129, 3025, 0.000000, 0.000000, 0.000000, 0.000000, 11.6679574813, 0.000000, 238000.0000, 0.000000, 1025401.4400);
INSERT INTO `bw_huobi_ticker` VALUES (130, 'uuueth', 23755436.9100, 3889, 0.000004, 0.000004, 0.000004, 0.000004, 96.8312829980, 0.000004, 68071.1900, 0.000004, 202400.0000);
INSERT INTO `bw_huobi_ticker` VALUES (131, 'xlmeth', 1349384.1564, 590, 0.000287, 0.000288, 0.000283, 0.000288, 387.1981861100, 0.000287, 285731.7556, 0.000288, 31622.4000);
INSERT INTO `bw_huobi_ticker` VALUES (132, 'trxeth', 14573468.5780, 1854, 0.000075, 0.000076, 0.000075, 0.000076, 1105.8855680630, 0.000076, 67100.0000, 0.000076, 120274.1700);
INSERT INTO `bw_huobi_ticker` VALUES (133, 'cvcusdt', 2576554.0539, 693, 0.019100, 0.018800, 0.018700, 0.019600, 48999.5162084790, 0.018800, 3075.8200, 0.018900, 310.6000);
INSERT INTO `bw_huobi_ticker` VALUES (134, 'topcbtc', 11223733.3500, 3619, 0.000001, 0.000001, 0.000001, 0.000001, 7.5505361915, 0.000001, 24408.0900, 0.000001, 3000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (135, 'nulseth', 74313.8481, 1995, 0.001130, 0.001157, 0.001123, 0.001162, 86.0269401357, 0.001147, 51.0000, 0.001164, 1210.0957);
INSERT INTO `bw_huobi_ticker` VALUES (136, 'quneth', 9687753.6500, 7049, 0.000021, 0.000021, 0.000021, 0.000022, 208.0993558279, 0.000021, 14717.2100, 0.000022, 12945.8300);
INSERT INTO `bw_huobi_ticker` VALUES (137, 'zecusdt', 366462.6379, 34315, 39.130000, 38.160000, 38.010000, 39.660000, 14217107.4178450000, 38.160000, 2.7844, 38.190000, 4.5647);
INSERT INTO `bw_huobi_ticker` VALUES (138, 'stketh', 6401150.9600, 2126, 0.000008, 0.000009, 0.000008, 0.000010, 56.8693679587, 0.000009, 9124.4900, 0.000009, 32000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (139, 'nexoeth', 4234136.3266, 1801, 0.000656, 0.000652, 0.000650, 0.000660, 2762.1411643931, 0.000650, 25719.2747, 0.000653, 57651.2563);
INSERT INTO `bw_huobi_ticker` VALUES (140, 'ekoeth', 12409865.2600, 2609, 0.000005, 0.000005, 0.000005, 0.000005, 60.2492559371, 0.000005, 69367.3300, 0.000005, 263303.9400);
INSERT INTO `bw_huobi_ticker` VALUES (141, 'ardrbtc', 88620.7362, 667, 0.000005, 0.000005, 0.000005, 0.000005, 0.4308342304, 0.000005, 1357.1500, 0.000005, 1829.2800);
INSERT INTO `bw_huobi_ticker` VALUES (142, 'vsysht', 194686.5900, 3945, 0.006418, 0.006403, 0.006250, 0.006562, 1235.9376354900, 0.006340, 13554.2600, 0.006453, 35116.5200);
INSERT INTO `bw_huobi_ticker` VALUES (143, 'uuubtc', 29393245.2001, 4190, 0.000000, 0.000000, 0.000000, 0.000000, 2.9007069071, 0.000000, 22903.3400, 0.000000, 16000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (144, 'eosht', 99802.3275, 1657, 0.692554, 0.688451, 0.680151, 0.705000, 69176.9709050860, 0.685930, 1313.8902, 0.688781, 7.6976);
INSERT INTO `bw_huobi_ticker` VALUES (145, 'bchhusd', 498.9366, 975, 233.090000, 230.640000, 228.340000, 240.000000, 115797.6928740000, 230.490000, 6.5070, 230.830000, 0.7542);
INSERT INTO `bw_huobi_ticker` VALUES (146, '18ceth', 8192818.5100, 2337, 0.000013, 0.000013, 0.000013, 0.000013, 105.8901105901, 0.000013, 156700.0000, 0.000013, 1074.4700);
INSERT INTO `bw_huobi_ticker` VALUES (147, 'uipeth', 5628169.4400, 4268, 0.000024, 0.000024, 0.000023, 0.000024, 132.4573390515, 0.000024, 1128.7400, 0.000024, 12496.9700);
INSERT INTO `bw_huobi_ticker` VALUES (148, 'bixusdt', 1009935.2466, 4719, 0.079318, 0.078327, 0.075701, 0.079318, 79330.9792045370, 0.078207, 65.2115, 0.078447, 39.5622);
INSERT INTO `bw_huobi_ticker` VALUES (149, 'paibtc', 11305502.2339, 2231, 0.000002, 0.000002, 0.000002, 0.000002, 21.7145751636, 0.000002, 61900.0000, 0.000002, 2342.9500);
INSERT INTO `bw_huobi_ticker` VALUES (150, 'ckbht', 1692478.7600, 3533, 0.001295, 0.001287, 0.001274, 0.001305, 2187.1387112700, 0.001284, 25394.3500, 0.001290, 245.2600);
INSERT INTO `bw_huobi_ticker` VALUES (151, 'trioeth', 24142039.6100, 2152, 0.000003, 0.000003, 0.000003, 0.000003, 82.3960087600, 0.000003, 88699.3300, 0.000003, 4667.1400);
INSERT INTO `bw_huobi_ticker` VALUES (152, 'btteth', 220581221.1900, 12316, 0.000001, 0.000001, 0.000001, 0.000001, 294.5244406140, 0.000001, 614854.2200, 0.000001, 1624096.2700);
INSERT INTO `bw_huobi_ticker` VALUES (153, 'icxbtc', 141466.9721, 2407, 0.000033, 0.000033, 0.000033, 0.000033, 4.6872515964, 0.000033, 90.9300, 0.000033, 60.0000);
INSERT INTO `bw_huobi_ticker` VALUES (154, 'engbtc', 62009.3760, 461, 0.000019, 0.000020, 0.000019, 0.000021, 1.2161116934, 0.000020, 91.2500, 0.000020, 255.0000);
INSERT INTO `bw_huobi_ticker` VALUES (155, 'aebtc', 708675.2000, 2274, 0.000014, 0.000014, 0.000014, 0.000015, 10.1669679862, 0.000014, 3227.3700, 0.000014, 2500.0000);
INSERT INTO `bw_huobi_ticker` VALUES (156, 'lbausdt', 86337488.1241, 9793, 0.010288, 0.010023, 0.009840, 0.010430, 857726.7601422800, 0.009989, 2120.0000, 0.010060, 4859.5601);
INSERT INTO `bw_huobi_ticker` VALUES (157, 'nasusdt', 1069865.6225, 5137, 0.258000, 0.259300, 0.254600, 0.271200, 275509.3770289200, 0.258900, 623.0000, 0.260100, 1544.7285);
INSERT INTO `bw_huobi_ticker` VALUES (158, 'dogebtc', 34195687.5044, 3010, 0.000000, 0.000000, 0.000000, 0.000000, 9.6375162074, 0.000000, 2296.9400, 0.000000, 10096.2000);
INSERT INTO `bw_huobi_ticker` VALUES (159, 'lymeth', 5980612.9700, 2044, 0.000008, 0.000008, 0.000007, 0.000008, 45.9073767678, 0.000007, 4729.8600, 0.000008, 68714.8000);
INSERT INTO `bw_huobi_ticker` VALUES (160, 'gnxbtc', 3389639.0000, 2319, 0.000001, 0.000001, 0.000001, 0.000001, 3.3376501529, 0.000001, 904.0000, 0.000001, 1700.0000);
INSERT INTO `bw_huobi_ticker` VALUES (161, 'nodeusdt', 171889876.5479, 3152, 0.001234, 0.001216, 0.001200, 0.001239, 210601.0053398000, 0.001213, 348767.2700, 0.001216, 254044.1186);
INSERT INTO `bw_huobi_ticker` VALUES (162, 'iriseth', 548539.4208, 191, 0.000061, 0.000061, 0.000060, 0.000062, 33.5320753971, 0.000062, 5727.0294, 0.000063, 485.8372);
INSERT INTO `bw_huobi_ticker` VALUES (163, 'grsbtc', 34237.5046, 1960, 0.000022, 0.000022, 0.000022, 0.000022, 0.7506446232, 0.000022, 110.0000, 0.000022, 906.8100);
INSERT INTO `bw_huobi_ticker` VALUES (164, 'utketh', 7265240.3100, 1491, 0.000052, 0.000051, 0.000050, 0.000052, 374.6092339971, 0.000051, 8.6000, 0.000051, 537.0000);
INSERT INTO `bw_huobi_ticker` VALUES (165, 'btchusd', 545.0052, 6281, 7073.370000, 7052.910000, 6962.810000, 7200.000000, 3823836.7527699000, 7052.490000, 0.0247, 7059.300000, 1.2000);
INSERT INTO `bw_huobi_ticker` VALUES (166, 'cmtusdt', 9200914.8495, 2366, 0.007436, 0.007533, 0.007306, 0.007684, 69027.3734719550, 0.007522, 998.0000, 0.007554, 1012.2080);
INSERT INTO `bw_huobi_ticker` VALUES (167, 'zjltbtc', 51739641.9913, 2585, 0.000000, 0.000000, 0.000000, 0.000000, 5.5156359742, 0.000000, 9689.9200, 0.000000, 140781.2500);
INSERT INTO `bw_huobi_ticker` VALUES (168, 'qspbtc', 51133.0000, 58, 0.000001, 0.000001, 0.000001, 0.000001, 0.0552655800, 0.000001, 7944.0000, 0.000001, 195.0000);
INSERT INTO `bw_huobi_ticker` VALUES (169, 'eoshusd', 170949.0265, 1044, 2.674200, 2.604300, 2.583300, 2.720000, 451068.3946053100, 2.602100, 938.0501, 2.607500, 53.6630);
INSERT INTO `bw_huobi_ticker` VALUES (170, 'qashbtc', 327642.2676, 1825, 0.000005, 0.000005, 0.000005, 0.000005, 1.6784577617, 0.000005, 6922.0508, 0.000005, 82.2093);
INSERT INTO `bw_huobi_ticker` VALUES (171, 'arpaht', 639954.6700, 3554, 0.002070, 0.002087, 0.001998, 0.002163, 1331.6230295800, 0.002080, 4.1200, 0.002113, 97699.9900);
INSERT INTO `bw_huobi_ticker` VALUES (172, 'wicceth', 81820.5500, 1948, 0.000889, 0.000904, 0.000881, 0.000950, 73.6615440798, 0.000894, 2635.0400, 0.000922, 769.7700);
INSERT INTO `bw_huobi_ticker` VALUES (173, 'maneth', 332539.3811, 913, 0.000082, 0.000085, 0.000081, 0.000087, 27.6827061818, 0.000085, 609.7913, 0.000088, 5425.9616);
INSERT INTO `bw_huobi_ticker` VALUES (174, 'docketh', 382160.6949, 243, 0.000025, 0.000024, 0.000024, 0.000026, 9.6512991781, 0.000025, 398138.4159, 0.000026, 18698.4473);
INSERT INTO `bw_huobi_ticker` VALUES (175, 'bcxbtc', 3215683.4827, 52, 0.000000, 0.000000, 0.000000, 0.000000, 0.2034986071, 0.000000, 16286.6450, 0.000000, 16006.7148);
INSERT INTO `bw_huobi_ticker` VALUES (176, 'ethusdt', 1928014.7273, 461094, 172.570000, 169.120000, 168.230000, 174.740000, 326521049.2583700000, 169.120000, 15.2038, 169.130000, 10.8910);
INSERT INTO `bw_huobi_ticker` VALUES (177, 'tusdhusd', 3309.6669, 26, 0.999900, 0.999900, 0.999800, 1.001000, 3310.8224454400, 0.999900, 420000.0000, 1.000900, 173.5098);
INSERT INTO `bw_huobi_ticker` VALUES (178, 'gtht', 8585.1900, 3870, 0.113441, 0.113705, 0.112749, 0.114150, 974.2984070600, 0.112830, 23.1100, 0.114119, 280.7200);
INSERT INTO `bw_huobi_ticker` VALUES (179, 'kcasheth', 22787125.0400, 3304, 0.000051, 0.000046, 0.000046, 0.000052, 1108.6358740812, 0.000046, 2000.0000, 0.000047, 12986.8100);
INSERT INTO `bw_huobi_ticker` VALUES (180, 'hitusdt', 523728374.0903, 421, 0.000055, 0.000055, 0.000054, 0.000055, 28395.6576864420, 0.000053, 57838155.7513, 0.000055, 51488230.5948);
INSERT INTO `bw_huobi_ticker` VALUES (181, 'cvntbtc', 48929547.5845, 10033, 0.000001, 0.000001, 0.000001, 0.000001, 58.9995216979, 0.000001, 17880.3800, 0.000001, 14816.7000);
INSERT INTO `bw_huobi_ticker` VALUES (182, 'dateth', 19607673.9300, 2194, 0.000004, 0.000004, 0.000004, 0.000004, 77.2701186840, 0.000004, 64436.9700, 0.000004, 65286.2000);
INSERT INTO `bw_huobi_ticker` VALUES (183, 'buteth', 26337215.5300, 5126, 0.000005, 0.000005, 0.000004, 0.000005, 120.9550838137, 0.000005, 320596.6100, 0.000005, 41225.1200);
INSERT INTO `bw_huobi_ticker` VALUES (184, 'xrpbtc', 19512449.4234, 9250, 0.000027, 0.000027, 0.000027, 0.000027, 525.2110272400, 0.000027, 10000.0000, 0.000027, 22420.0000);
INSERT INTO `bw_huobi_ticker` VALUES (185, 'xmreth', 1139.0324, 975, 0.324872, 0.332025, 0.324410, 0.334472, 377.2512124871, 0.333254, 0.3300, 0.333949, 55.0726);
INSERT INTO `bw_huobi_ticker` VALUES (186, 'hitbtc', 74496791.8600, 766, 0.000000, 0.000000, 0.000000, 0.000000, 0.5785067835, 0.000000, 10935290.4200, 0.000000, 111120.5800);
INSERT INTO `bw_huobi_ticker` VALUES (187, 'htusdt', 8037688.6104, 76074, 3.842400, 3.784800, 3.772000, 3.878000, 30613819.6543000000, 3.780800, 178.7700, 3.784200, 13.8900);
INSERT INTO `bw_huobi_ticker` VALUES (188, 'seelebtc', 94997526.3900, 2931, 0.000010, 0.000010, 0.000010, 0.000010, 954.5275691512, 0.000010, 3516.8000, 0.000010, 6419.9900);
INSERT INTO `bw_huobi_ticker` VALUES (189, 'getbtc', 1543268.9500, 1502, 0.000001, 0.000001, 0.000001, 0.000001, 0.8082920668, 0.000001, 1947.0400, 0.000001, 5512.7400);
INSERT INTO `bw_huobi_ticker` VALUES (190, 'egccbtc', 80262488.2691, 1194, 0.000000, 0.000000, 0.000000, 0.000000, 0.9302206833, 0.000000, 934778.4800, 0.000000, 417274.3100);
INSERT INTO `bw_huobi_ticker` VALUES (191, 'nknusdt', 21832971.9562, 5389, 0.015369, 0.015554, 0.015336, 0.016700, 340898.2147752400, 0.015483, 5871.0600, 0.015571, 1085.0200);
INSERT INTO `bw_huobi_ticker` VALUES (192, 'waveseth', 7786.3935, 1985, 0.005814, 0.005942, 0.005785, 0.006018, 45.8062713142, 0.005889, 49.9580, 0.005989, 451.4772);
INSERT INTO `bw_huobi_ticker` VALUES (193, 'nexobtc', 6233309.4191, 3530, 0.000016, 0.000016, 0.000016, 0.000016, 98.5734537032, 0.000016, 2577.5200, 0.000016, 600.0000);
INSERT INTO `bw_huobi_ticker` VALUES (194, 'omgusdt', 1226125.9500, 4097, 0.561200, 0.558900, 0.551500, 0.572200, 680932.9197140100, 0.558800, 320.0000, 0.560100, 964.6980);
INSERT INTO `bw_huobi_ticker` VALUES (195, 'btcusdt', 72754.2800, 636756, 7045.170000, 7048.170000, 6952.010000, 7190.000000, 510562918.8724700000, 7048.170000, 0.5600, 7048.180000, 0.4101);
INSERT INTO `bw_huobi_ticker` VALUES (196, 'vidyht', 2914787.4100, 1826, 0.000165, 0.000164, 0.000162, 0.000171, 480.0563531400, 0.000162, 18407.1800, 0.000167, 182772.8000);
INSERT INTO `bw_huobi_ticker` VALUES (197, 'zlabtc', 1079035.3000, 1559, 0.000001, 0.000001, 0.000000, 0.000001, 0.5476166746, 0.000000, 98781.5900, 0.000001, 54510.2300);
INSERT INTO `bw_huobi_ticker` VALUES (198, 'cvceth', 321294.0000, 1474, 0.000112, 0.000111, 0.000110, 0.000113, 35.8947371500, 0.000110, 731.0000, 0.000112, 1060.0000);
INSERT INTO `bw_huobi_ticker` VALUES (199, 'batbtc', 158764.0000, 2364, 0.000023, 0.000023, 0.000023, 0.000024, 3.7144198900, 0.000023, 170.0000, 0.000024, 1090.0000);
INSERT INTO `bw_huobi_ticker` VALUES (200, 'powreth', 114895.0000, 1804, 0.000337, 0.000343, 0.000336, 0.000363, 39.1848441500, 0.000342, 1080.0000, 0.000345, 1000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (201, 'pvtht', 5218312.1900, 1577, 0.000075, 0.000074, 0.000071, 0.000075, 382.9523088500, 0.000074, 406823.1500, 0.000075, 47875.3900);
INSERT INTO `bw_huobi_ticker` VALUES (202, 'lskbtc', 15952.7109, 2299, 0.000149, 0.000146, 0.000145, 0.000153, 2.3570105778, 0.000146, 14.6500, 0.000147, 427.1823);
INSERT INTO `bw_huobi_ticker` VALUES (203, 'elfeth', 265309.0000, 2028, 0.000367, 0.000370, 0.000363, 0.000392, 98.3456436100, 0.000369, 770.0000, 0.000371, 1069.0000);
INSERT INTO `bw_huobi_ticker` VALUES (204, 'knceth', 28202.2600, 1621, 0.002773, 0.002818, 0.002749, 0.002835, 78.7070745151, 0.002803, 128.0000, 0.002833, 151.0000);
INSERT INTO `bw_huobi_ticker` VALUES (205, 'iotausdt', 1829262.7025, 2776, 0.156900, 0.155600, 0.154300, 0.160700, 285212.4687605800, 0.155400, 6474.5437, 0.155600, 8979.4014);
INSERT INTO `bw_huobi_ticker` VALUES (206, 'eosusdt', 27345932.2236, 175895, 2.669100, 2.602700, 2.580000, 2.719000, 72159236.8274140000, 2.602200, 9.5172, 2.602400, 43.8169);
INSERT INTO `bw_huobi_ticker` VALUES (207, 'mxbtc', 194726.2700, 4543, 0.000014, 0.000014, 0.000014, 0.000014, 2.6893187704, 0.000014, 135.7500, 0.000014, 109.8800);
INSERT INTO `bw_huobi_ticker` VALUES (208, 'algoeth', 268261.9767, 2438, 0.001060, 0.001084, 0.001057, 0.001094, 284.9684645326, 0.001083, 2888.2553, 0.001089, 4605.3360);
INSERT INTO `bw_huobi_ticker` VALUES (209, 'ugasbtc', 302622.1400, 294, 0.000002, 0.000002, 0.000002, 0.000002, 0.5954180296, 0.000002, 9536.0000, 0.000002, 6000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (210, 'kmdbtc', 364359.3482, 5536, 0.000083, 0.000083, 0.000080, 0.000093, 30.0662004238, 0.000083, 375.3700, 0.000083, 1501.2200);
INSERT INTO `bw_huobi_ticker` VALUES (211, 'mxusdt', 4326446.2023, 4027, 0.097200, 0.096800, 0.095600, 0.100100, 420571.2798919400, 0.096700, 752.1400, 0.097200, 2555.1400);
INSERT INTO `bw_huobi_ticker` VALUES (212, 'ruffusdt', 26005627.6942, 3189, 0.005472, 0.005359, 0.005274, 0.005599, 141153.6331034500, 0.005361, 2100.0000, 0.005381, 2800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (213, 'wtceth', 65981.4445, 2347, 0.001485, 0.001606, 0.001470, 0.001664, 100.0671682817, 0.001598, 41.0733, 0.001612, 380.8135);
INSERT INTO `bw_huobi_ticker` VALUES (214, 'arpausdt', 31637034.3344, 6326, 0.007915, 0.007876, 0.007687, 0.007952, 252092.0414371300, 0.007858, 4494.0000, 0.007891, 3000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (215, 'nccbtc', 5865418.0200, 2083, 0.000000, 0.000000, 0.000000, 0.000000, 0.5134349674, 0.000000, 1448.0000, 0.000000, 3444.3300);
INSERT INTO `bw_huobi_ticker` VALUES (216, 'dashusdt', 168359.4591, 32127, 75.810000, 75.170000, 74.510000, 77.300000, 12701290.9839230000, 75.110000, 11.6866, 75.160000, 0.1327);
INSERT INTO `bw_huobi_ticker` VALUES (217, 'hthusd', 78652.7684, 1171, 3.843300, 3.782000, 3.782000, 3.874000, 299831.1594456000, 3.785100, 46.0300, 3.794600, 262.6500);
INSERT INTO `bw_huobi_ticker` VALUES (218, 'cmteth', 817614.7700, 1298, 0.000043, 0.000045, 0.000043, 0.000045, 35.8267550599, 0.000044, 7200.0000, 0.000045, 10202.5000);
INSERT INTO `bw_huobi_ticker` VALUES (219, 'lxteth', 14116793.6900, 5329, 0.000011, 0.000011, 0.000010, 0.000011, 149.0225859850, 0.000011, 3539.3100, 0.000011, 8000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (220, 'gtcbtc', 1802567.3200, 2228, 0.000001, 0.000001, 0.000001, 0.000001, 1.0117143132, 0.000001, 198.9800, 0.000001, 92440.0300);
INSERT INTO `bw_huobi_ticker` VALUES (221, 'socusdt', 44104114.3693, 3325, 0.003006, 0.003079, 0.003006, 0.003255, 137617.5149546000, 0.003066, 20595.7300, 0.003093, 33856.1100);
INSERT INTO `bw_huobi_ticker` VALUES (222, 'portaleth', 23599185.9000, 2282, 0.000005, 0.000005, 0.000005, 0.000005, 121.2741808509, 0.000005, 2527.1300, 0.000005, 2264.1300);
INSERT INTO `bw_huobi_ticker` VALUES (223, 'appceth', 103351.1110, 667, 0.000164, 0.000163, 0.000161, 0.000168, 17.0017817280, 0.000162, 3078.0000, 0.000167, 9329.7147);
INSERT INTO `bw_huobi_ticker` VALUES (224, 'croht', 39726.3807, 2254, 0.013000, 0.013200, 0.013000, 0.013200, 523.3079760000, 0.013100, 19490.1200, 0.013300, 2638.6300);
INSERT INTO `bw_huobi_ticker` VALUES (225, 'newusdt', 348187629.3165, 2005, 0.000420, 0.000418, 0.000410, 0.000426, 144694.8000100900, 0.000418, 72217.6512, 0.000419, 115951.4850);
INSERT INTO `bw_huobi_ticker` VALUES (226, 'zilusdt', 34771473.1566, 3494, 0.004288, 0.004244, 0.004210, 0.004342, 147177.2222611100, 0.004241, 2600.0000, 0.004247, 15800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (227, 'gvebtc', 16914570.1800, 1351, 0.000000, 0.000000, 0.000000, 0.000000, 0.3187552502, 0.000000, 54347.8300, 0.000000, 1026210.4200);
INSERT INTO `bw_huobi_ticker` VALUES (228, 'polybtc', 555509.0085, 527, 0.000003, 0.000003, 0.000003, 0.000003, 1.5206725577, 0.000003, 6084.9900, 0.000003, 3406.6600);
INSERT INTO `bw_huobi_ticker` VALUES (229, 'blzeth', 47514.5900, 24, 0.000087, 0.000087, 0.000087, 0.000087, 4.1632634122, 0.000087, 9071.9700, 0.000088, 23.8500);
INSERT INTO `bw_huobi_ticker` VALUES (230, 'cnnsht', 1074112.3000, 3901, 0.000780, 0.000803, 0.000774, 0.000804, 844.7554941000, 0.000793, 42525.9800, 0.000808, 14541.9200);
INSERT INTO `bw_huobi_ticker` VALUES (231, 'sspeth', 399779101.7600, 1579, 0.000000, 0.000000, 0.000000, 0.000000, 148.4583569639, 0.000000, 250000.0000, 0.000000, 6423945.4500);
INSERT INTO `bw_huobi_ticker` VALUES (232, 'chateth', 1312423.9300, 323, 0.000006, 0.000006, 0.000006, 0.000007, 7.9824872844, 0.000006, 6671.3400, 0.000006, 101085.1300);
INSERT INTO `bw_huobi_ticker` VALUES (233, 'hceth', 11285.0877, 1504, 0.006002, 0.006085, 0.005982, 0.006197, 68.5822439935, 0.006073, 195.3785, 0.006095, 1115.1620);
INSERT INTO `bw_huobi_ticker` VALUES (234, 'payeth', 100730.7900, 265, 0.000193, 0.000185, 0.000182, 0.000196, 18.8196952088, 0.000188, 55.2800, 0.000190, 1320.0000);
INSERT INTO `bw_huobi_ticker` VALUES (235, 'tnbeth', 5727833.0000, 1636, 0.000006, 0.000006, 0.000006, 0.000006, 34.0825930400, 0.000006, 254435.0000, 0.000006, 22266.0000);
INSERT INTO `bw_huobi_ticker` VALUES (236, 'abteth', 136146.2600, 2199, 0.000493, 0.000497, 0.000487, 0.000510, 66.8645072333, 0.000495, 293.8800, 0.000499, 22.4500);
INSERT INTO `bw_huobi_ticker` VALUES (237, 'pvtusdt', 328405539.8269, 1109, 0.000285, 0.000282, 0.000278, 0.000288, 91956.7437823900, 0.000282, 705377.1300, 0.000284, 199627.0800);
INSERT INTO `bw_huobi_ticker` VALUES (238, 'bchusdt', 314260.5420, 135922, 232.320000, 230.310000, 227.500000, 239.890000, 72648104.6321600000, 230.380000, 1.0013, 230.390000, 0.4950);
INSERT INTO `bw_huobi_ticker` VALUES (239, 'rcccbtc', 4645218.0900, 5196, 0.000001, 0.000001, 0.000001, 0.000001, 3.0354646112, 0.000001, 72359.9100, 0.000001, 4011.2700);
INSERT INTO `bw_huobi_ticker` VALUES (240, 'ethhusd', 5510.0910, 1816, 173.000000, 169.160000, 168.670000, 175.000000, 923402.1039540000, 169.180000, 2.4984, 169.390000, 1.0205);
INSERT INTO `bw_huobi_ticker` VALUES (241, 'wprbtc', 735490.7200, 2025, 0.000001, 0.000001, 0.000001, 0.000001, 0.5477180675, 0.000001, 11122.0000, 0.000001, 7737.2800);
INSERT INTO `bw_huobi_ticker` VALUES (242, 'fttbtc', 41276.2983, 2359, 0.000382, 0.000380, 0.000379, 0.000383, 15.7479258726, 0.000380, 10097.9400, 0.000380, 3580.1900);
INSERT INTO `bw_huobi_ticker` VALUES (243, 'ruffeth', 2951966.7400, 2232, 0.000032, 0.000032, 0.000031, 0.000033, 93.4899256969, 0.000032, 1557.8000, 0.000032, 98862.2000);
INSERT INTO `bw_huobi_ticker` VALUES (244, 'leteth', 6685269.1300, 2244, 0.000013, 0.000013, 0.000013, 0.000013, 87.4346073619, 0.000013, 489.2400, 0.000013, 23317.2600);
INSERT INTO `bw_huobi_ticker` VALUES (245, 'fairbtc', 39143843.9000, 12695, 0.000000, 0.000000, 0.000000, 0.000000, 6.1151641955, 0.000000, 605008.0800, 0.000000, 76868.9200);
INSERT INTO `bw_huobi_ticker` VALUES (246, 'hptht', 38553089.2405, 13240, 0.001308, 0.001301, 0.001288, 0.001323, 50338.5820373130, 0.001301, 103501.9036, 0.001304, 2424.4408);
INSERT INTO `bw_huobi_ticker` VALUES (247, 'ucbtc', 38768468.3300, 1610, 0.000000, 0.000000, 0.000000, 0.000000, 0.6485476836, 0.000000, 262217.2100, 0.000000, 780159.9900);
INSERT INTO `bw_huobi_ticker` VALUES (248, 'renbtc', 521333.7800, 1998, 0.000008, 0.000008, 0.000008, 0.000008, 4.0141516241, 0.000008, 522.3700, 0.000008, 11362.6700);
INSERT INTO `bw_huobi_ticker` VALUES (249, 'gtbtc', 32453.6200, 4378, 0.000062, 0.000061, 0.000061, 0.000062, 1.9963891672, 0.000061, 397.5000, 0.000062, 19.0000);
INSERT INTO `bw_huobi_ticker` VALUES (250, 'musketh', 30176404.7900, 1893, 0.000003, 0.000003, 0.000003, 0.000003, 88.7227067368, 0.000003, 14364.3000, 0.000003, 36000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (251, 'ftibtc', 117628430.1400, 1353, 0.000000, 0.000000, 0.000000, 0.000000, 1.5151594391, 0.000000, 21425.3600, 0.000000, 617777.8300);
INSERT INTO `bw_huobi_ticker` VALUES (252, 'mexbtc', 14246575.7800, 1984, 0.000000, 0.000000, 0.000000, 0.000000, 0.4581120733, 0.000000, 136569.8400, 0.000000, 120000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (253, 'topht', 1762563.7212, 1860, 0.000257, 0.000257, 0.000255, 0.000261, 452.9822842303, 0.000256, 79330.5851, 0.000259, 11562.6685);
INSERT INTO `bw_huobi_ticker` VALUES (254, 'ttht', 1615182.7926, 5154, 0.001453, 0.001460, 0.001426, 0.001495, 2354.7954673118, 0.001455, 13937.1767, 0.001471, 150000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (255, 'gscbtc', 971498.9200, 2028, 0.000001, 0.000000, 0.000000, 0.000001, 0.4879925422, 0.000000, 2600.0000, 0.000001, 11400.0000);
INSERT INTO `bw_huobi_ticker` VALUES (256, 'itceth', 114510.0000, 1364, 0.000511, 0.000503, 0.000496, 0.000548, 57.4854373000, 0.000500, 588.0000, 0.000506, 960.0000);
INSERT INTO `bw_huobi_ticker` VALUES (257, 'mxht', 195379.8200, 4763, 0.025311, 0.025645, 0.025117, 0.026244, 4967.5939504500, 0.025566, 72.3600, 0.025702, 10.2800);
INSERT INTO `bw_huobi_ticker` VALUES (258, 'covabtc', 38178730.4000, 1605, 0.000000, 0.000000, 0.000000, 0.000000, 0.7833997453, 0.000000, 717085.1400, 0.000000, 1087017.1400);
INSERT INTO `bw_huobi_ticker` VALUES (259, 'btmbtc', 1665628.7800, 2687, 0.000008, 0.000008, 0.000008, 0.000008, 13.8620905026, 0.000008, 5555.9600, 0.000008, 12932.6200);
INSERT INTO `bw_huobi_ticker` VALUES (260, 'adabtc', 4671085.5636, 1039, 0.000005, 0.000005, 0.000005, 0.000005, 22.5050428628, 0.000005, 272125.3100, 0.000005, 162712.2400);
INSERT INTO `bw_huobi_ticker` VALUES (261, 'huobi10', 0.0000, 0, 437.775753, 433.104327, 430.994026, 445.148766, 0.0000000000, 0.000000, 0.0000, 0.000000, 0.0000);
INSERT INTO `bw_huobi_ticker` VALUES (262, 'bixeth', 422977.4987, 2383, 0.000459, 0.000463, 0.000451, 0.000465, 195.7144968427, 0.000464, 119.2864, 0.000467, 345.8146);
INSERT INTO `bw_huobi_ticker` VALUES (263, 'wiccusdt', 2057360.2693, 4185, 0.153600, 0.152100, 0.150700, 0.154700, 313273.7229567000, 0.152000, 2377.8293, 0.152200, 121.3166);
INSERT INTO `bw_huobi_ticker` VALUES (264, 'dtabtc', 64352151.9800, 2086, 0.000000, 0.000000, 0.000000, 0.000000, 1.8221185671, 0.000000, 278485.2500, 0.000000, 141098.0300);
INSERT INTO `bw_huobi_ticker` VALUES (265, 'meeteth', 2256134.5600, 2087, 0.000035, 0.000035, 0.000034, 0.000036, 79.5324564247, 0.000034, 11327.7300, 0.000035, 1212.0300);
INSERT INTO `bw_huobi_ticker` VALUES (266, 'crebtc', 3110808.8500, 2375, 0.000000, 0.000000, 0.000000, 0.000000, 0.5823372130, 0.000000, 16000.0000, 0.000000, 14000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (267, 'fsnht', 8055.8600, 3983, 0.203176, 0.204448, 0.195680, 0.218185, 1650.7257172560, 0.200790, 1697.2907, 0.208634, 95.3433);
INSERT INTO `bw_huobi_ticker` VALUES (268, 'cnnsbtc', 950617.6600, 1617, 0.000000, 0.000000, 0.000000, 0.000000, 0.4020024805, 0.000000, 142448.9300, 0.000000, 98285.9200);
INSERT INTO `bw_huobi_ticker` VALUES (269, 'elausdt', 81797.7996, 2753, 1.136500, 1.126600, 1.113500, 1.149900, 91874.3737142400, 1.126500, 32.2900, 1.126600, 20.8100);
INSERT INTO `bw_huobi_ticker` VALUES (270, 'bfteth', 2209592.2675, 1819, 0.000025, 0.000025, 0.000024, 0.000026, 56.5675941441, 0.000024, 29549.2737, 0.000025, 4278.3503);
INSERT INTO `bw_huobi_ticker` VALUES (271, 'dashhusd', 435.5948, 218, 75.440000, 75.200000, 75.200000, 76.760000, 32626.3888027500, 75.090000, 6.6538, 75.200000, 41.1765);
INSERT INTO `bw_huobi_ticker` VALUES (272, 'bhtht', 279533.4394, 4156, 0.014011, 0.014619, 0.013768, 0.015586, 3964.0298802200, 0.014258, 777.7200, 0.014826, 3055.8200);
INSERT INTO `bw_huobi_ticker` VALUES (273, 'aidocbtc', 25966841.1300, 2537, 0.000000, 0.000000, 0.000000, 0.000000, 4.6855858732, 0.000000, 5719.2000, 0.000000, 86444.3500);
INSERT INTO `bw_huobi_ticker` VALUES (274, 'bcdbtc', 11115.9321, 653, 0.000318, 0.000323, 0.000313, 0.000333, 3.5967035267, 0.000322, 0.7374, 0.000323, 16.3113);
INSERT INTO `bw_huobi_ticker` VALUES (275, 'xzceth', 8431.6044, 4185, 0.020142, 0.020718, 0.020104, 0.021044, 174.0268528303, 0.020622, 28.5428, 0.020810, 3.9516);
INSERT INTO `bw_huobi_ticker` VALUES (276, 'xvgbtc', 11076009.9107, 2772, 0.000000, 0.000000, 0.000000, 0.000000, 4.2459822752, 0.000000, 3135.5900, 0.000000, 1859.3100);
INSERT INTO `bw_huobi_ticker` VALUES (277, 'srneth', 1527784.9269, 2066, 0.000048, 0.000046, 0.000045, 0.000050, 71.8227275357, 0.000046, 912.2600, 0.000047, 17096.0000);
INSERT INTO `bw_huobi_ticker` VALUES (278, 'mtneth', 3672050.1500, 2039, 0.000012, 0.000013, 0.000012, 0.000013, 45.6065148717, 0.000012, 29064.6000, 0.000013, 51115.9400);
INSERT INTO `bw_huobi_ticker` VALUES (279, 'hcusdt', 431805.3410, 5641, 1.036700, 1.027100, 1.020000, 1.060100, 445718.1964928600, 1.026700, 72.9883, 1.028300, 359.9715);
INSERT INTO `bw_huobi_ticker` VALUES (280, 'ontbtc', 105007.6858, 2684, 0.000058, 0.000058, 0.000057, 0.000059, 6.0662071706, 0.000058, 1939.1234, 0.000058, 800.6239);
INSERT INTO `bw_huobi_ticker` VALUES (281, 'rtebtc', 76583232.3048, 3129, 0.000000, 0.000000, 0.000000, 0.000000, 4.5578390589, 0.000000, 34854.9000, 0.000000, 59317.0000);
INSERT INTO `bw_huobi_ticker` VALUES (282, 'ckbbtc', 99394461.6776, 1264, 0.000001, 0.000001, 0.000001, 0.000001, 69.9319929323, 0.000001, 6163719.9500, 0.000001, 3588664.7400);
INSERT INTO `bw_huobi_ticker` VALUES (283, 'evxbtc', 685633.1300, 5625, 0.000021, 0.000022, 0.000021, 0.000022, 14.6805699258, 0.000022, 80.0000, 0.000022, 750.0000);
INSERT INTO `bw_huobi_ticker` VALUES (284, 'npxsbtc', 40041375.2559, 747, 0.000000, 0.000000, 0.000000, 0.000000, 0.6529984177, 0.000000, 955000.0000, 0.000000, 1794172.5600);
INSERT INTO `bw_huobi_ticker` VALUES (285, 'iostusdt', 392933149.8505, 13486, 0.003212, 0.003243, 0.003160, 0.003325, 1268437.5247114000, 0.003240, 0.7850, 0.003245, 121347.8542);
INSERT INTO `bw_huobi_ticker` VALUES (286, 'qunbtc', 10445022.3875, 8068, 0.000001, 0.000001, 0.000001, 0.000001, 5.4365868150, 0.000001, 24083.6500, 0.000001, 19437.1100);
INSERT INTO `bw_huobi_ticker` VALUES (287, 'edueth', 101809251.7700, 2053, 0.000000, 0.000000, 0.000000, 0.000000, 46.1431028384, 0.000000, 96070.1600, 0.000000, 430000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (288, 'lolht', 4736827.9764, 1148, 0.000098, 0.000098, 0.000095, 0.000106, 464.5364477425, 0.000097, 682885.7916, 0.000099, 756033.6428);
INSERT INTO `bw_huobi_ticker` VALUES (289, 'ekteth', 2284055.9152, 3311, 0.000042, 0.000043, 0.000041, 0.000044, 97.2669885079, 0.000043, 827.3101, 0.000043, 24132.3146);
INSERT INTO `bw_huobi_ticker` VALUES (290, 'atomusdt', 849662.3905, 11017, 2.401200, 2.367900, 2.357600, 2.449400, 2032438.7620308000, 2.366600, 806.5300, 2.369500, 584.0400);
INSERT INTO `bw_huobi_ticker` VALUES (291, 'rsrusdt', 139867580.4279, 4318, 0.002613, 0.002555, 0.002525, 0.002650, 358757.0237872100, 0.002551, 146520.0000, 0.002558, 193102.4100);
INSERT INTO `bw_huobi_ticker` VALUES (292, 'thetaeth', 92805.4800, 1938, 0.000456, 0.000458, 0.000452, 0.000471, 42.5814892699, 0.000458, 18949.1800, 0.000465, 824.6000);
INSERT INTO `bw_huobi_ticker` VALUES (293, 'letbtc', 9551591.0100, 2610, 0.000000, 0.000000, 0.000000, 0.000000, 3.0189386097, 0.000000, 6800.0000, 0.000000, 74635.9700);
INSERT INTO `bw_huobi_ticker` VALUES (294, 'gtusdt', 169278.6900, 4504, 0.433500, 0.432200, 0.430300, 0.438400, 73162.6182040000, 0.430500, 6271.6200, 0.433600, 286.6200);
INSERT INTO `bw_huobi_ticker` VALUES (295, 'waxpeth', 141674.7465, 106, 0.000164, 0.000164, 0.000163, 0.000176, 23.6616139361, 0.000164, 2340.0000, 0.000167, 10024.1299);
INSERT INTO `bw_huobi_ticker` VALUES (296, 'forusdt', 1538926.9948, 1683, 0.023440, 0.023274, 0.023005, 0.023783, 35927.5741930500, 0.023149, 687.8000, 0.023496, 3927.2500);
INSERT INTO `bw_huobi_ticker` VALUES (297, 'letusdt', 24438979.7349, 2621, 0.002215, 0.002194, 0.002190, 0.002290, 54380.0092503290, 0.002190, 1383.2713, 0.002197, 13971.0662);
INSERT INTO `bw_huobi_ticker` VALUES (298, 'mdsusdt', 51300661.0127, 3420, 0.003012, 0.002970, 0.002937, 0.003154, 153921.5606703000, 0.002931, 1758.7100, 0.002991, 145575.8200);
INSERT INTO `bw_huobi_ticker` VALUES (299, 'etcht', 11251.8613, 656, 1.416349, 1.411154, 1.402000, 1.560000, 16100.0295126140, 1.410546, 93.4430, 1.417994, 93.4430);
INSERT INTO `bw_huobi_ticker` VALUES (300, 'bsvusdt', 388711.3550, 196193, 197.763300, 192.792000, 191.515800, 198.280800, 75180674.4813620000, 192.792000, 3.3193, 192.841600, 1.5272);
INSERT INTO `bw_huobi_ticker` VALUES (301, 'nanousdt', 85205.3478, 1748, 0.553500, 0.556200, 0.545200, 0.564700, 47410.9036961100, 0.554200, 335.9300, 0.558100, 242.4595);
INSERT INTO `bw_huobi_ticker` VALUES (302, 'rdnbtc', 31583.0000, 1917, 0.000013, 0.000013, 0.000013, 0.000013, 0.4065095300, 0.000013, 79.0000, 0.000013, 523.0000);
INSERT INTO `bw_huobi_ticker` VALUES (303, 'ctxcbtc', 1494465.7615, 3012, 0.000013, 0.000013, 0.000012, 0.000013, 19.0721417528, 0.000013, 1176.6100, 0.000013, 790.0000);
INSERT INTO `bw_huobi_ticker` VALUES (304, 'bchbtc', 36760.1799, 20907, 0.032981, 0.032700, 0.032540, 0.033407, 1210.7051532046, 0.032686, 12.0000, 0.032696, 12.0000);
INSERT INTO `bw_huobi_ticker` VALUES (305, 'reqeth', 886859.4000, 1881, 0.000049, 0.000050, 0.000049, 0.000053, 43.8589804510, 0.000049, 6881.0000, 0.000050, 625.8000);
INSERT INTO `bw_huobi_ticker` VALUES (306, 'uuuusdt', 187915992.5785, 2261, 0.000700, 0.000691, 0.000690, 0.000702, 130239.5525085500, 0.000691, 75710.2900, 0.000692, 1230202.0800);
INSERT INTO `bw_huobi_ticker` VALUES (307, 'sspbtc', 513814432.7600, 2703, 0.000000, 0.000000, 0.000000, 0.000000, 4.6110144520, 0.000000, 720000.0000, 0.000000, 234344.7700);
INSERT INTO `bw_huobi_ticker` VALUES (308, 'iostbtc', 21716428.4834, 5331, 0.000000, 0.000000, 0.000000, 0.000000, 9.9715296852, 0.000000, 38628.2300, 0.000000, 6200.0000);
INSERT INTO `bw_huobi_ticker` VALUES (309, 'btmeth', 1149420.6600, 2646, 0.000336, 0.000343, 0.000333, 0.000345, 394.5717719902, 0.000342, 630.0000, 0.000343, 2160.0000);
INSERT INTO `bw_huobi_ticker` VALUES (310, 'lambbtc', 4164896.6400, 2194, 0.000002, 0.000002, 0.000002, 0.000002, 7.4385972367, 0.000002, 183776.0200, 0.000002, 1400.0000);
INSERT INTO `bw_huobi_ticker` VALUES (311, 'pceth', 131722678.5890, 2838, 0.000000, 0.000000, 0.000000, 0.000000, 32.9483442872, 0.000000, 2419682.0000, 0.000000, 9526828.3281);
INSERT INTO `bw_huobi_ticker` VALUES (312, 'topbtc', 4919837.8539, 1437, 0.000000, 0.000000, 0.000000, 0.000000, 0.6823197990, 0.000000, 2526373.6100, 0.000000, 55452.3700);
INSERT INTO `bw_huobi_ticker` VALUES (313, 'idteth', 3241941.3000, 1984, 0.000015, 0.000015, 0.000015, 0.000015, 49.0063308035, 0.000015, 2781.1100, 0.000015, 22100.0000);
INSERT INTO `bw_huobi_ticker` VALUES (314, 'usdchusd', 149992.1581, 249, 1.000100, 1.000000, 0.999800, 1.000200, 149993.0877064500, 0.999900, 24342.8635, 1.000000, 63025.2057);
INSERT INTO `bw_huobi_ticker` VALUES (315, 'hb10', 0.0000, 0, 0.422600, 0.418000, 0.416000, 0.429700, 0.0000000000, 0.000000, 0.0000, 0.000000, 0.0000);
INSERT INTO `bw_huobi_ticker` VALUES (316, 'akroht', 1197897.7700, 3104, 0.000799, 0.000824, 0.000796, 0.000891, 995.2686252500, 0.000822, 136691.0000, 0.000826, 3208.3100);
INSERT INTO `bw_huobi_ticker` VALUES (317, 'waneth', 156940.6659, 3206, 0.000773, 0.000822, 0.000769, 0.000831, 124.8430529360, 0.000821, 1999.9995, 0.000829, 731.1900);
INSERT INTO `bw_huobi_ticker` VALUES (318, 'xemusdt', 1734716.0568, 922, 0.037400, 0.037300, 0.037100, 0.038100, 64827.5483098400, 0.037300, 38274.3473, 0.037500, 74321.5882);
INSERT INTO `bw_huobi_ticker` VALUES (319, 'dbcbtc', 136677481.4000, 8201, 0.000000, 0.000000, 0.000000, 0.000000, 8.5660303060, 0.000000, 152760.2200, 0.000000, 33072.1000);
INSERT INTO `bw_huobi_ticker` VALUES (320, 'srnbtc', 2441522.8600, 2388, 0.000001, 0.000001, 0.000001, 0.000001, 2.7472385683, 0.000001, 3590.0000, 0.000001, 1746.7700);
INSERT INTO `bw_huobi_ticker` VALUES (321, 'forbtc', 98817.0600, 2086, 0.000003, 0.000003, 0.000003, 0.000003, 0.3280074337, 0.000003, 3766.5500, 0.000003, 129.5200);
INSERT INTO `bw_huobi_ticker` VALUES (322, 'xtzeth', 37714.4396, 2366, 0.011864, 0.012504, 0.011855, 0.012520, 453.1358904552, 0.012487, 226.8778, 0.012516, 82.1806);
INSERT INTO `bw_huobi_ticker` VALUES (323, 'storjusdt', 2025367.2941, 2291, 0.094300, 0.093900, 0.092700, 0.095300, 189412.8955979500, 0.093500, 169.3037, 0.093700, 5790.0000);
INSERT INTO `bw_huobi_ticker` VALUES (324, 'rccceth', 4552376.8132, 4006, 0.000027, 0.000027, 0.000025, 0.000027, 122.0663699207, 0.000026, 1929.8500, 0.000027, 34986.3248);
INSERT INTO `bw_huobi_ticker` VALUES (325, 'ocnusdt', 1259037981.5367, 4650, 0.000252, 0.000270, 0.000252, 0.000290, 344643.1079664000, 0.000269, 75015.1361, 0.000270, 1399870.3497);
INSERT INTO `bw_huobi_ticker` VALUES (326, 'mtht', 7159908.0870, 5857, 0.000184, 0.000179, 0.000175, 0.000189, 1310.0834323387, 0.000176, 189029.0597, 0.000183, 6290.1523);
INSERT INTO `bw_huobi_ticker` VALUES (327, 'neobtc', 13612.0019, 1968, 0.001066, 0.001061, 0.001058, 0.001074, 14.5229582980, 0.001059, 669.4578, 0.001062, 1281.7535);
INSERT INTO `bw_huobi_ticker` VALUES (328, 'gntbtc', 413180.3795, 1150, 0.000005, 0.000005, 0.000005, 0.000005, 2.1720295594, 0.000005, 5447.0300, 0.000005, 7980.0000);
INSERT INTO `bw_huobi_ticker` VALUES (329, 'loombtc', 336215.7638, 198, 0.000002, 0.000002, 0.000002, 0.000002, 0.6833703805, 0.000002, 418.3200, 0.000002, 57540.0900);
INSERT INTO `bw_huobi_ticker` VALUES (330, 'creht', 7881591.6600, 2440, 0.000353, 0.000353, 0.000335, 0.000383, 2780.2914438300, 0.000338, 8822.3700, 0.000380, 84303.4300);
INSERT INTO `bw_huobi_ticker` VALUES (331, 'uipusdt', 62308803.7242, 7420, 0.004110, 0.004006, 0.003965, 0.004110, 250156.1275262400, 0.003979, 3600.0000, 0.004034, 2000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (332, 'iotaeth', 340758.1644, 653, 0.000909, 0.000922, 0.000908, 0.000924, 313.3944522667, 0.000919, 6296.8002, 0.000921, 5043.3788);
INSERT INTO `bw_huobi_ticker` VALUES (333, 'sheeth', 18120048.3500, 2036, 0.000003, 0.000003, 0.000003, 0.000003, 46.7332299935, 0.000003, 256306.0700, 0.000003, 96000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (334, 'nanoeth', 15556.6359, 2034, 0.003219, 0.003299, 0.003198, 0.003323, 50.7250303527, 0.003268, 355.2946, 0.003330, 76.0000);
INSERT INTO `bw_huobi_ticker` VALUES (335, 'neousdt', 181812.9515, 4664, 7.510000, 7.470000, 7.410000, 7.690000, 1361115.4465304000, 7.470000, 587.9876, 7.480000, 377.7725);
INSERT INTO `bw_huobi_ticker` VALUES (336, 'ncceth', 11987696.9300, 2000, 0.000004, 0.000004, 0.000004, 0.000004, 43.7600119829, 0.000004, 135090.4200, 0.000004, 11904.8700);
INSERT INTO `bw_huobi_ticker` VALUES (337, 'yeebtc', 24980808.7639, 2274, 0.000000, 0.000000, 0.000000, 0.000000, 3.1188164947, 0.000000, 6700.1600, 0.000000, 26317.5000);
INSERT INTO `bw_huobi_ticker` VALUES (338, 'hteth', 532233.6121, 11534, 0.022299, 0.022393, 0.022066, 0.022642, 11960.4457347880, 0.022367, 2000.0000, 0.022392, 25.8700);
INSERT INTO `bw_huobi_ticker` VALUES (339, 'acteth', 1827278.1600, 2086, 0.000028, 0.000028, 0.000028, 0.000028, 51.3466582081, 0.000028, 10466.8200, 0.000028, 638.1600);
INSERT INTO `bw_huobi_ticker` VALUES (340, 'bsvhusd', 537.7746, 903, 197.759900, 193.552000, 192.202100, 198.319200, 104441.1888223500, 192.880600, 2.6995, 193.521900, 4.4507);
INSERT INTO `bw_huobi_ticker` VALUES (341, 'nulsusdt', 672558.6573, 2512, 0.196100, 0.195600, 0.193000, 0.200800, 132942.4447616800, 0.194500, 2102.1200, 0.195400, 245.4900);
INSERT INTO `bw_huobi_ticker` VALUES (342, 'portalbtc', 44688025.4400, 2266, 0.000000, 0.000000, 0.000000, 0.000000, 5.6085246658, 0.000000, 2641.8300, 0.000000, 13000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (343, 'omgbtc', 28433.3225, 198, 0.000079, 0.000080, 0.000079, 0.000080, 2.2431999524, 0.000079, 11877.1602, 0.000080, 15220.1284);
INSERT INTO `bw_huobi_ticker` VALUES (344, 'lolbtc', 105865820.4200, 2244, 0.000000, 0.000000, 0.000000, 0.000000, 5.6082487500, 0.000000, 338277.6900, 0.000000, 147625.7100);
INSERT INTO `bw_huobi_ticker` VALUES (345, 'veteth', 4188604.1700, 2211, 0.000022, 0.000022, 0.000022, 0.000023, 93.4143883647, 0.000022, 40334.2600, 0.000022, 166419.0500);
INSERT INTO `bw_huobi_ticker` VALUES (346, 'rcnbtc', 75712.0000, 2028, 0.000008, 0.000008, 0.000008, 0.000008, 0.6302283199, 0.000008, 575.0000, 0.000008, 144.0000);
INSERT INTO `bw_huobi_ticker` VALUES (347, 'zrxusdt', 1236248.8290, 3200, 0.172000, 0.170200, 0.169400, 0.174400, 212864.6543387800, 0.169900, 280.0000, 0.170300, 4140.4700);
INSERT INTO `bw_huobi_ticker` VALUES (348, 'datxbtc', 139612883.1900, 1514, 0.000000, 0.000000, 0.000000, 0.000000, 3.4105291151, 0.000000, 5332.0000, 0.000000, 1923784.5000);
INSERT INTO `bw_huobi_ticker` VALUES (349, 'yccbtc', 21216257.4900, 17989, 0.000001, 0.000001, 0.000001, 0.000001, 16.4467272812, 0.000001, 2538.3600, 0.000001, 1300.0000);
INSERT INTO `bw_huobi_ticker` VALUES (350, 'toseth', 5535388.2600, 1087, 0.000004, 0.000004, 0.000004, 0.000004, 23.5282131661, 0.000004, 50700.0000, 0.000004, 211821.3400);
INSERT INTO `bw_huobi_ticker` VALUES (351, 'xzcusdt', 54867.6374, 4951, 3.476000, 3.507100, 3.468900, 3.590000, 192144.5155985500, 3.504300, 2.4564, 3.510000, 2.9089);
INSERT INTO `bw_huobi_ticker` VALUES (352, 'iicbtc', 119590901.8153, 1842, 0.000000, 0.000000, 0.000000, 0.000000, 1.6481764107, 0.000000, 1606960.5900, 0.000000, 43195.4500);
INSERT INTO `bw_huobi_ticker` VALUES (353, 'elabtc', 20111.2177, 2399, 0.000161, 0.000160, 0.000158, 0.000164, 3.2184620906, 0.000159, 16.0000, 0.000161, 13.0000);
INSERT INTO `bw_huobi_ticker` VALUES (354, 'xrphusd', 163050.2057, 239, 0.189600, 0.187900, 0.186900, 0.193000, 30875.0588228200, 0.187700, 31948.8800, 0.188200, 17548.6500);
INSERT INTO `bw_huobi_ticker` VALUES (355, 'lbabtc', 45619680.6521, 4719, 0.000001, 0.000001, 0.000001, 0.000001, 64.4399298945, 0.000001, 442.0000, 0.000001, 44979.3200);
INSERT INTO `bw_huobi_ticker` VALUES (356, 'egtht', 3709567.2300, 1909, 0.000248, 0.000249, 0.000239, 0.000252, 914.9834547700, 0.000248, 16815.8000, 0.000250, 375305.8300);
INSERT INTO `bw_huobi_ticker` VALUES (357, 'fttht', 5497.4675, 2041, 0.700858, 0.704575, 0.697008, 0.711366, 3865.2899504405, 0.704575, 849.1991, 0.708965, 64.4136);
INSERT INTO `bw_huobi_ticker` VALUES (358, 'dacbtc', 54147376.8300, 4935, 0.000000, 0.000000, 0.000000, 0.000000, 8.2809946907, 0.000000, 1051212.4100, 0.000000, 110536.0200);
INSERT INTO `bw_huobi_ticker` VALUES (359, 'zjlteth', 29256341.8300, 2107, 0.000004, 0.000004, 0.000004, 0.000005, 129.0082203242, 0.000004, 2546.6600, 0.000004, 174055.3100);
INSERT INTO `bw_huobi_ticker` VALUES (360, 'cvnteth', 21835396.3873, 5064, 0.000050, 0.000045, 0.000042, 0.000057, 1092.9539272975, 0.000045, 908.2653, 0.000046, 13424.6574);
INSERT INTO `bw_huobi_ticker` VALUES (361, 'boxbtc', 16678668.0700, 2152, 0.000000, 0.000000, 0.000000, 0.000000, 5.8331817557, 0.000000, 862.4200, 0.000000, 4000.7800);
INSERT INTO `bw_huobi_ticker` VALUES (362, 'hotbtc', 3772991.6600, 1492, 0.000000, 0.000000, 0.000000, 0.000000, 0.7882806220, 0.000000, 4938.2700, 0.000000, 110668.1000);
INSERT INTO `bw_huobi_ticker` VALUES (363, 'ocneth', 55480263.4737, 1848, 0.000001, 0.000002, 0.000001, 0.000002, 87.6052033004, 0.000002, 1677767.7400, 0.000002, 583882.8800);
INSERT INTO `bw_huobi_ticker` VALUES (364, 'btsusdt', 4471373.3918, 723, 0.017000, 0.016900, 0.016800, 0.017300, 75834.0640080000, 0.016900, 408392.4200, 0.017000, 106976.1300);
INSERT INTO `bw_huobi_ticker` VALUES (365, 'arpabtc', 4225252.5596, 1811, 0.000001, 0.000001, 0.000001, 0.000001, 4.8227322067, 0.000001, 144189.2100, 0.000001, 131237.3100);
INSERT INTO `bw_huobi_ticker` VALUES (366, 'stkbtc', 12234451.5830, 2544, 0.000000, 0.000000, 0.000000, 0.000000, 2.6892887397, 0.000000, 16430.9100, 0.000000, 4284.1100);
INSERT INTO `bw_huobi_ticker` VALUES (367, 'pntbtc', 423037851.9000, 972, 0.000000, 0.000000, 0.000000, 0.000000, 3.2175249704, 0.000000, 13157459.6100, 0.000000, 22684339.5500);
INSERT INTO `bw_huobi_ticker` VALUES (368, 'naseth', 42388.0468, 2086, 0.001494, 0.001534, 0.001491, 0.001548, 64.1577076312, 0.001527, 589.4536, 0.001538, 339.0000);
INSERT INTO `bw_huobi_ticker` VALUES (369, 'zenbtc', 3857.3317, 2546, 0.000803, 0.000778, 0.000775, 0.000822, 3.0656862786, 0.000777, 1.5000, 0.000780, 3.2000);
INSERT INTO `bw_huobi_ticker` VALUES (370, 'manbtc', 1199251.7900, 1655, 0.000002, 0.000002, 0.000002, 0.000002, 2.4456466434, 0.000002, 8541.2600, 0.000002, 8700.0000);
INSERT INTO `bw_huobi_ticker` VALUES (371, 'topceth', 30622633.3200, 8788, 0.000027, 0.000028, 0.000027, 0.000029, 852.1642331198, 0.000028, 2250.0000, 0.000028, 15264.7000);
INSERT INTO `bw_huobi_ticker` VALUES (372, 'xlmusdt', 24132843.7236, 11759, 0.049244, 0.048698, 0.048179, 0.049832, 1176241.8350021000, 0.048656, 166.2286, 0.048718, 4000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (373, 'xlmbtc', 2792663.7963, 1756, 0.000007, 0.000007, 0.000007, 0.000007, 19.3934853904, 0.000007, 51174.9200, 0.000007, 23515.9000);
INSERT INTO `bw_huobi_ticker` VALUES (374, 'zecbtc', 44697.1456, 7759, 0.005554, 0.005415, 0.005415, 0.005569, 250.1681530172, 0.005414, 10.8628, 0.005419, 18.4640);
INSERT INTO `bw_huobi_ticker` VALUES (375, 'kanbtc', 42467603.2400, 12267, 0.000000, 0.000000, 0.000000, 0.000000, 13.0829074138, 0.000000, 770.7000, 0.000000, 27246.5200);
INSERT INTO `bw_huobi_ticker` VALUES (376, 'eoseth', 571696.9313, 6534, 0.015470, 0.015394, 0.015259, 0.015605, 8905.1317719662, 0.015387, 300.0000, 0.015392, 300.0000);
INSERT INTO `bw_huobi_ticker` VALUES (377, 'xtzusdt', 1004843.4906, 11334, 2.044800, 2.112300, 2.031900, 2.145700, 2058771.7153252000, 2.112300, 371.8950, 2.115300, 139.4040);
INSERT INTO `bw_huobi_ticker` VALUES (378, 'vsysbtc', 3043807.6900, 2742, 0.000003, 0.000003, 0.000003, 0.000004, 10.5274828916, 0.000003, 11816.8000, 0.000003, 5640.0000);
INSERT INTO `bw_huobi_ticker` VALUES (379, 'embtc', 65313834.5733, 5025, 0.000000, 0.000000, 0.000000, 0.000000, 30.4805266222, 0.000000, 42440.9900, 0.000000, 116931.0800);
INSERT INTO `bw_huobi_ticker` VALUES (380, 'gaseth', 4912.4082, 1201, 0.006523, 0.006563, 0.006446, 0.006686, 32.4362360064, 0.006510, 66.3535, 0.006616, 2.4329);
INSERT INTO `bw_huobi_ticker` VALUES (381, 'etneth', 2585361.1403, 1224, 0.000011, 0.000011, 0.000011, 0.000011, 29.1208866559, 0.000011, 10791.3669, 0.000011, 915.4016);
INSERT INTO `bw_huobi_ticker` VALUES (382, 'mtbtc', 105059096.3700, 6503, 0.000000, 0.000000, 0.000000, 0.000000, 10.4559684293, 0.000000, 104712.0400, 0.000000, 65578.9400);
INSERT INTO `bw_huobi_ticker` VALUES (383, 'aaceth', 2205876.5824, 4934, 0.000154, 0.000163, 0.000153, 0.000163, 346.6037933983, 0.000162, 1818.1400, 0.000163, 200.0000);
INSERT INTO `bw_huobi_ticker` VALUES (384, 'ontusdt', 4039562.9671, 9632, 0.408600, 0.406400, 0.400500, 0.421000, 1637285.0310285000, 0.406100, 325.0000, 0.406400, 137.1340);
INSERT INTO `bw_huobi_ticker` VALUES (385, 'kanusdt', 80183268.4858, 11721, 0.002170, 0.002168, 0.002151, 0.002193, 173694.0727824400, 0.002167, 1240.0000, 0.002171, 252.4094);
INSERT INTO `bw_huobi_ticker` VALUES (386, 'btsbtc', 880586.7886, 1512, 0.000002, 0.000002, 0.000002, 0.000002, 2.1236882014, 0.000002, 135256.2300, 0.000002, 13500.0000);
INSERT INTO `bw_huobi_ticker` VALUES (387, 'wxtusdt', 3412106.7260, 2295, 0.009865, 0.009927, 0.009839, 0.010025, 33860.0576088400, 0.009903, 3800.0000, 0.009950, 4000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (388, 'qtumeth', 45026.7434, 2384, 0.008050, 0.008185, 0.008050, 0.008212, 366.0599357829, 0.008185, 22.6495, 0.008196, 2652.0000);
INSERT INTO `bw_huobi_ticker` VALUES (389, 'onebtc', 1562727.1791, 2438, 0.000001, 0.000001, 0.000001, 0.000001, 1.5692745867, 0.000001, 2336.1500, 0.000001, 205.6600);
INSERT INTO `bw_huobi_ticker` VALUES (390, 'wiccbtc', 77044.9400, 2226, 0.000022, 0.000022, 0.000021, 0.000022, 1.6721376141, 0.000021, 5013.5200, 0.000022, 177.7700);
INSERT INTO `bw_huobi_ticker` VALUES (391, 'swftcbtc', 11849497.0000, 2611, 0.000000, 0.000000, 0.000000, 0.000000, 2.1405924556, 0.000000, 9136.6400, 0.000000, 329992.7000);
INSERT INTO `bw_huobi_ticker` VALUES (392, 'steembtc', 302461.6000, 2753, 0.000022, 0.000021, 0.000021, 0.000022, 6.4883748270, 0.000021, 4.7000, 0.000021, 9001.4100);
INSERT INTO `bw_huobi_ticker` VALUES (393, 'sncbtc', 11844098.7500, 1583, 0.000003, 0.000002, 0.000002, 0.000003, 29.5391553021, 0.000002, 8320.1700, 0.000003, 1606.4200);
INSERT INTO `bw_huobi_ticker` VALUES (394, 'dtausdt', 176377336.7095, 1939, 0.000198, 0.000198, 0.000195, 0.000208, 35163.2167923450, 0.000198, 679371.1772, 0.000201, 25603.9500);
INSERT INTO `bw_huobi_ticker` VALUES (395, 'mtxbtc', 287348.8900, 120, 0.000003, 0.000003, 0.000003, 0.000003, 0.7601737978, 0.000003, 16469.6000, 0.000003, 1065.3400);
INSERT INTO `bw_huobi_ticker` VALUES (396, 'luneth', 11352.6794, 1920, 0.003781, 0.004007, 0.003747, 0.004130, 44.0919444580, 0.003917, 72.7399, 0.003970, 27.6120);
INSERT INTO `bw_huobi_ticker` VALUES (397, 'cvcbtc', 487143.7239, 1279, 0.000003, 0.000003, 0.000003, 0.000003, 1.3227819900, 0.000003, 1236.0000, 0.000003, 5629.0000);
INSERT INTO `bw_huobi_ticker` VALUES (398, 'bateth', 70582.0000, 2020, 0.000953, 0.000981, 0.000951, 0.001006, 68.5340427200, 0.000974, 1475.0000, 0.000986, 5473.0000);
INSERT INTO `bw_huobi_ticker` VALUES (399, 'lambusdt', 41740815.5946, 17756, 0.012555, 0.012693, 0.012305, 0.012927, 524318.4813797400, 0.012681, 1516.7034, 0.012704, 778.3575);
INSERT INTO `bw_huobi_ticker` VALUES (400, 'xrpusdt', 96203512.3167, 60509, 0.190170, 0.187700, 0.186180, 0.193100, 18174377.0640100000, 0.187660, 7961.8400, 0.187770, 1985.7500);
INSERT INTO `bw_huobi_ticker` VALUES (401, 'xmxbtc', 91343803.8402, 2722, 0.000000, 0.000000, 0.000000, 0.000000, 4.9889145316, 0.000000, 363785.3000, 0.000000, 205000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (402, 'hptbtc', 50677485.3695, 21335, 0.000001, 0.000001, 0.000001, 0.000001, 35.8972427189, 0.000001, 2094.0600, 0.000001, 2000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (403, 'bttusdt', 1451276323.4873, 6431, 0.000228, 0.000228, 0.000225, 0.000233, 331308.0408512800, 0.000228, 45000.0000, 0.000228, 1503934.0000);
INSERT INTO `bw_huobi_ticker` VALUES (404, 'vetusdt', 75602797.2704, 3874, 0.003791, 0.003790, 0.003733, 0.003892, 285780.5878602200, 0.003788, 26139.1936, 0.003793, 58013.6138);
INSERT INTO `bw_huobi_ticker` VALUES (405, 'seeleusdt', 100354482.2206, 5011, 0.071295, 0.071391, 0.069563, 0.072000, 7104363.1176060000, 0.071391, 10895.3900, 0.071400, 10000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (406, 'bcveth', 2634479.8200, 2108, 0.000026, 0.000027, 0.000026, 0.000027, 70.0689567911, 0.000027, 1678.9200, 0.000027, 21239.2400);
INSERT INTO `bw_huobi_ticker` VALUES (407, 'btttrx', 314318753.1910, 15466, 0.017603, 0.017826, 0.017551, 0.017914, 5552131.3880182000, 0.017778, 45000.0000, 0.017873, 175532.6000);
INSERT INTO `bw_huobi_ticker` VALUES (408, 'dgbbtc', 1669379.4960, 2619, 0.000001, 0.000001, 0.000001, 0.000001, 1.4456664475, 0.000001, 94.9700, 0.000001, 287.3600);
INSERT INTO `bw_huobi_ticker` VALUES (409, 'vidybtc', 13894380.3400, 2271, 0.000000, 0.000000, 0.000000, 0.000000, 1.2355785408, 0.000000, 493195.0700, 0.000000, 88020.0000);
INSERT INTO `bw_huobi_ticker` VALUES (410, 'propybtc', 420795.0200, 2549, 0.000006, 0.000006, 0.000006, 0.000007, 2.5467471228, 0.000006, 594.7400, 0.000006, 2976.2200);
INSERT INTO `bw_huobi_ticker` VALUES (411, 'linketh', 81238.0511, 5893, 0.019650, 0.020205, 0.019609, 0.020441, 1608.0916924438, 0.020184, 118.9100, 0.020226, 25.7500);
INSERT INTO `bw_huobi_ticker` VALUES (412, 'dcrbtc', 4766.6412, 3414, 0.001760, 0.001748, 0.001748, 0.001808, 8.4351753536, 0.001747, 17.7447, 0.001748, 0.2832);
INSERT INTO `bw_huobi_ticker` VALUES (413, 'atometh', 14110.8485, 2365, 0.013902, 0.014009, 0.013892, 0.014094, 198.7215589769, 0.013999, 146.0654, 0.014026, 83.1560);
INSERT INTO `bw_huobi_ticker` VALUES (414, 'irisusdt', 8715542.7740, 1437, 0.010293, 0.010558, 0.010194, 0.010737, 90454.8726121400, 0.010558, 23648.0000, 0.010595, 7674.1000);
INSERT INTO `bw_huobi_ticker` VALUES (415, 'mdseth', 5904463.0000, 2292, 0.000017, 0.000018, 0.000017, 0.000018, 104.3676947700, 0.000017, 233.0000, 0.000018, 74942.0000);
INSERT INTO `bw_huobi_ticker` VALUES (416, 'egcceth', 118155645.7100, 2067, 0.000000, 0.000000, 0.000000, 0.000000, 56.7714007106, 0.000000, 139474.4400, 0.000000, 6992.7400);
INSERT INTO `bw_huobi_ticker` VALUES (417, 'socbtc', 6907974.8903, 2436, 0.000000, 0.000000, 0.000000, 0.000000, 3.0442814491, 0.000000, 3040.0000, 0.000000, 35750.0000);
INSERT INTO `bw_huobi_ticker` VALUES (418, 'gxcbtc', 41430.4478, 2412, 0.000058, 0.000057, 0.000056, 0.000058, 2.3739317941, 0.000056, 21.4500, 0.000057, 89.9900);
INSERT INTO `bw_huobi_ticker` VALUES (419, 'storjbtc', 486855.2860, 2337, 0.000013, 0.000013, 0.000013, 0.000013, 6.4826527238, 0.000013, 606.5900, 0.000013, 8999.9800);
INSERT INTO `bw_huobi_ticker` VALUES (420, 'bchht', 937.7828, 1418, 60.679449, 60.920697, 59.777777, 62.038348, 56989.9326335050, 60.616815, 3.9852, 60.994598, 0.0272);
INSERT INTO `bw_huobi_ticker` VALUES (421, 'eosbtc', 2454850.5894, 25313, 0.000379, 0.000369, 0.000367, 0.000380, 921.2200141359, 0.000369, 300.0000, 0.000369, 42.0100);
INSERT INTO `bw_huobi_ticker` VALUES (422, 'polyeth', 34544.3471, 128, 0.000114, 0.000112, 0.000110, 0.000115, 3.8501511099, 0.000111, 9950.4405, 0.000113, 3566.6000);
INSERT INTO `bw_huobi_ticker` VALUES (423, 'dgdbtc', 324.9150, 2291, 0.004666, 0.004602, 0.004591, 0.004695, 1.4877494177, 0.004584, 2.1516, 0.004620, 1.5825);
INSERT INTO `bw_huobi_ticker` VALUES (424, 'btgbtc', 2710.1989, 319, 0.001392, 0.001416, 0.001386, 0.001448, 3.8131950005, 0.001414, 29.8204, 0.001416, 32.7612);
INSERT INTO `bw_huobi_ticker` VALUES (425, 'powrbtc', 147681.0000, 1989, 0.000008, 0.000008, 0.000008, 0.000008, 1.2169798600, 0.000008, 15063.0000, 0.000008, 18667.0000);
INSERT INTO `bw_huobi_ticker` VALUES (426, 'ogobtc', 2762410.2100, 2596, 0.000001, 0.000001, 0.000001, 0.000001, 3.7006587577, 0.000001, 60554.9700, 0.000001, 37125.6000);
INSERT INTO `bw_huobi_ticker` VALUES (427, 'ctxcusdt', 5374718.2979, 4145, 0.089200, 0.090500, 0.087500, 0.094800, 484220.3687748400, 0.090200, 1669.9134, 0.090800, 502.4000);
INSERT INTO `bw_huobi_ticker` VALUES (428, 'kncbtc', 72287.0000, 2247, 0.000068, 0.000067, 0.000067, 0.000068, 4.8965108700, 0.000067, 88.0000, 0.000068, 4.0000);
INSERT INTO `bw_huobi_ticker` VALUES (429, 'adausdt', 66518935.4664, 12775, 0.033970, 0.034193, 0.033425, 0.034986, 2251221.2963785000, 0.034194, 153.3518, 0.034230, 39958.0218);
INSERT INTO `bw_huobi_ticker` VALUES (430, 'trxbtc', 39908842.5175, 10705, 0.000002, 0.000002, 0.000002, 0.000002, 73.2973690380, 0.000002, 1777.1600, 0.000002, 110159.0000);
INSERT INTO `bw_huobi_ticker` VALUES (431, 'qtumbtc', 21260.5013, 847, 0.000197, 0.000196, 0.000195, 0.000199, 4.1829637285, 0.000196, 1256.9035, 0.000197, 6099.9007);
INSERT INTO `bw_huobi_ticker` VALUES (432, 'usdthusd', 21624297.9475, 34134, 1.001100, 1.001100, 1.000900, 1.001800, 21651909.4818760000, 1.001100, 37554.1571, 1.001200, 331241.0486);
INSERT INTO `bw_huobi_ticker` VALUES (433, 'bkbtbtc', 6591593.4300, 1298, 0.000000, 0.000000, 0.000000, 0.000000, 0.3125445800, 0.000000, 59572.4300, 0.000000, 25914.1900);
INSERT INTO `bw_huobi_ticker` VALUES (434, 'adxbtc', 61573.1500, 2029, 0.000007, 0.000007, 0.000007, 0.000007, 0.4422606963, 0.000007, 149.9300, 0.000007, 30.2000);
INSERT INTO `bw_huobi_ticker` VALUES (435, 'swftceth', 7582537.9000, 2259, 0.000007, 0.000007, 0.000007, 0.000008, 56.3674588076, 0.000007, 4621.5000, 0.000007, 1442.9800);
INSERT INTO `bw_huobi_ticker` VALUES (436, 'forht', 72568.7600, 1976, 0.006118, 0.006166, 0.005972, 0.006293, 444.5786332400, 0.006107, 23.9700, 0.006225, 34.9700);
INSERT INTO `bw_huobi_ticker` VALUES (437, 'ltcbtc', 38582.5136, 6832, 0.006043, 0.005917, 0.005911, 0.006057, 232.4461950039, 0.005916, 34.8000, 0.005920, 46.2218);
INSERT INTO `bw_huobi_ticker` VALUES (438, 'btseth', 452233.8300, 1344, 0.000099, 0.000100, 0.000098, 0.000102, 45.1408472963, 0.000099, 2958.5700, 0.000100, 196.0000);
INSERT INTO `bw_huobi_ticker` VALUES (439, 'itcusdt', 2428713.4479, 2922, 0.087500, 0.085300, 0.084500, 0.088400, 207754.4816446200, 0.085300, 42.6761, 0.085400, 4365.6239);
INSERT INTO `bw_huobi_ticker` VALUES (440, 'fsnusdt', 199083.3301, 3572, 0.779800, 0.766500, 0.750000, 0.780200, 152990.5267034000, 0.765200, 54.9521, 0.767900, 6674.9634);
INSERT INTO `bw_huobi_ticker` VALUES (441, 'hiteth', 45011086.0000, 478, 0.000000, 0.000000, 0.000000, 0.000000, 14.4767819154, 0.000000, 17800643.2100, 0.000000, 1065598.1800);
INSERT INTO `bw_huobi_ticker` VALUES (442, 'fttusdt', 45260.8666, 2848, 2.696500, 2.678700, 2.656100, 2.735400, 121375.6520179100, 2.677300, 20.0000, 2.681700, 15.9000);
INSERT INTO `bw_huobi_ticker` VALUES (443, 'iiceth', 115243138.4000, 2108, 0.000001, 0.000001, 0.000001, 0.000001, 65.3012419938, 0.000001, 127287.4300, 0.000001, 19960.0000);
INSERT INTO `bw_huobi_ticker` VALUES (444, 'oneusdt', 27691740.1977, 3044, 0.007239, 0.007070, 0.006806, 0.007280, 195153.6737915000, 0.007054, 1789.0500, 0.007088, 23132.0900);
INSERT INTO `bw_huobi_ticker` VALUES (445, 'cnnsusdt', 13960193.6100, 3409, 0.003003, 0.003043, 0.002982, 0.003048, 41825.4296873300, 0.003024, 14027.7600, 0.003050, 3412.0000);
INSERT INTO `bw_huobi_ticker` VALUES (446, 'ugaseth', 145716.0132, 119, 0.000082, 0.000081, 0.000080, 0.000082, 11.9392869963, 0.000081, 14570.0768, 0.000083, 9716.4274);
INSERT INTO `bw_huobi_ticker` VALUES (447, 'wxtbtc', 544758.3200, 2229, 0.000001, 0.000001, 0.000001, 0.000001, 0.7700012090, 0.000001, 698.4900, 0.000001, 379.6400);
INSERT INTO `bw_huobi_ticker` VALUES (448, 'boxeth', 3259588.9300, 2043, 0.000014, 0.000015, 0.000014, 0.000016, 46.9807607342, 0.000014, 22302.9800, 0.000015, 37577.0000);
INSERT INTO `bw_huobi_ticker` VALUES (449, 'cnneth', 188340419.6300, 2107, 0.000000, 0.000000, 0.000000, 0.000000, 54.2396479388, 0.000000, 1028121.7400, 0.000000, 2086931.1300);
INSERT INTO `bw_huobi_ticker` VALUES (450, 'skmht', 2218547.6000, 3761, 0.000382, 0.000380, 0.000368, 0.000383, 832.5022777700, 0.000380, 97093.1100, 0.000382, 1217.6300);
INSERT INTO `bw_huobi_ticker` VALUES (451, 'wavesusdt', 129605.0282, 2835, 1.003800, 1.004500, 0.990900, 1.019500, 129534.4066173900, 1.002500, 7.0700, 1.006000, 652.0400);
INSERT INTO `bw_huobi_ticker` VALUES (452, 'skmusdt', 43461850.0360, 3242, 0.001464, 0.001447, 0.001413, 0.001476, 62283.5314939300, 0.001443, 5988.0000, 0.001452, 14868.2900);
INSERT INTO `bw_huobi_ticker` VALUES (453, 'algobtc', 652570.3000, 3537, 0.000026, 0.000026, 0.000026, 0.000027, 16.8872428662, 0.000026, 1885.8600, 0.000026, 1584.3200);
INSERT INTO `bw_huobi_ticker` VALUES (454, 'seeleeth', 977769.4915, 2582, 0.000413, 0.000423, 0.000405, 0.000424, 408.0755584423, 0.000421, 7003.2400, 0.000424, 6558.3500);
INSERT INTO `bw_huobi_ticker` VALUES (455, 'atpbtc', 9963486.2700, 3011, 0.000000, 0.000000, 0.000000, 0.000000, 2.6648734545, 0.000000, 71729.0000, 0.000000, 46527.9600);
INSERT INTO `bw_huobi_ticker` VALUES (456, 'ncasheth', 39335431.1300, 1998, 0.000001, 0.000001, 0.000001, 0.000001, 42.6455508272, 0.000001, 69397.7300, 0.000001, 236280.6800);
INSERT INTO `bw_huobi_ticker` VALUES (457, 'xrpht', 498560.0224, 1511, 0.049764, 0.049496, 0.048900, 0.050010, 24726.9036162270, 0.049528, 2663.6123, 0.049640, 2.5000);
INSERT INTO `bw_huobi_ticker` VALUES (458, 'ckbusdt', 118013327.2522, 7456, 0.004945, 0.004903, 0.004874, 0.005015, 583638.4962820300, 0.004900, 9040.7400, 0.004906, 34097.8200);
INSERT INTO `bw_huobi_ticker` VALUES (459, 'gtceth', 2068820.5100, 2061, 0.000023, 0.000023, 0.000022, 0.000024, 47.8668232731, 0.000023, 31483.2600, 0.000023, 1997.7000);
INSERT INTO `bw_huobi_ticker` VALUES (460, 'linkbtc', 169892.2769, 6240, 0.000482, 0.000485, 0.000478, 0.000495, 81.8283488174, 0.000484, 264.4000, 0.000485, 152.3400);
INSERT INTO `bw_huobi_ticker` VALUES (461, 'bixbtc', 1097441.3300, 31694, 0.000011, 0.000011, 0.000011, 0.000011, 12.2627030790, 0.000011, 10.7700, 0.000011, 2390.0000);
INSERT INTO `bw_huobi_ticker` VALUES (462, 'aeusdt', 2476635.3116, 2304, 0.101100, 0.100100, 0.099200, 0.104300, 249940.0523501100, 0.100200, 11617.1300, 0.100500, 14043.5400);
INSERT INTO `bw_huobi_ticker` VALUES (463, 'hcbtc', 45748.7300, 2950, 0.000147, 0.000146, 0.000146, 0.000149, 6.7263755795, 0.000146, 13.0000, 0.000146, 53.0000);
INSERT INTO `bw_huobi_ticker` VALUES (464, 'topusdt', 62306140.3512, 4100, 0.000978, 0.000978, 0.000969, 0.000999, 61001.8485874890, 0.000970, 1847552.4982, 0.000982, 376260.3219);
INSERT INTO `bw_huobi_ticker` VALUES (465, 'ttusdt', 48846788.2551, 4769, 0.005627, 0.005536, 0.005486, 0.005650, 272062.7607701400, 0.005527, 2994.0000, 0.005546, 28098.9897);
INSERT INTO `bw_huobi_ticker` VALUES (466, 'paieth', 3589797.5642, 1029, 0.000079, 0.000079, 0.000076, 0.000082, 285.7773919697, 0.000077, 32000.0998, 0.000080, 25298.5597);
INSERT INTO `bw_huobi_ticker` VALUES (467, 'bftbtc', 3384858.7600, 439, 0.000001, 0.000001, 0.000001, 0.000001, 2.0765142903, 0.000001, 35800.8700, 0.000001, 20680.4200);
INSERT INTO `bw_huobi_ticker` VALUES (468, 'ogoht', 408816.2300, 3727, 0.002439, 0.002663, 0.002372, 0.002663, 1005.6031060300, 0.002588, 26161.7000, 0.002686, 8116.6400);
INSERT INTO `bw_huobi_ticker` VALUES (469, 'dockusdt', 6350676.4357, 1724, 0.004330, 0.004325, 0.004281, 0.004413, 27387.4933552000, 0.004296, 21345.6000, 0.004343, 69258.0000);
INSERT INTO `bw_huobi_ticker` VALUES (470, 'ltcusdt', 601330.2349, 60957, 42.600000, 41.740000, 41.510000, 43.000000, 25456036.8615190000, 41.710000, 6.9570, 41.740000, 100.9679);
INSERT INTO `bw_huobi_ticker` VALUES (471, 'ostbtc', 20483090.3211, 1542, 0.000001, 0.000001, 0.000001, 0.000001, 19.8907819584, 0.000001, 37554.7800, 0.000001, 18288.4800);
INSERT INTO `bw_huobi_ticker` VALUES (472, 'xzcbtc', 13631.7383, 4512, 0.000492, 0.000497, 0.000492, 0.000509, 6.7955487421, 0.000495, 263.0350, 0.000497, 17.7051);
INSERT INTO `bw_huobi_ticker` VALUES (473, 'qtumusdt', 879359.1959, 8531, 1.390800, 1.385500, 1.370200, 1.434300, 1216875.5504435000, 1.384200, 203.1451, 1.385500, 229.5981);
INSERT INTO `bw_huobi_ticker` VALUES (474, 'etnbtc', 3113954.0278, 1896, 0.000000, 0.000000, 0.000000, 0.000000, 0.8433121720, 0.000000, 10362.4600, 0.000000, 915.4000);
INSERT INTO `bw_huobi_ticker` VALUES (475, 'qasheth', 145966.2778, 1076, 0.000211, 0.000215, 0.000207, 0.000216, 30.6820947549, 0.000210, 11834.4598, 0.000218, 15504.1531);
INSERT INTO `bw_huobi_ticker` VALUES (476, 'nulsbtc', 175965.4847, 2789, 0.000028, 0.000028, 0.000027, 0.000028, 4.9495348673, 0.000028, 134.0000, 0.000028, 5.0800);
INSERT INTO `bw_huobi_ticker` VALUES (477, 'pnteth', 44328691.0900, 135, 0.000000, 0.000000, 0.000000, 0.000000, 14.0412513196, 0.000000, 3936820.4800, 0.000000, 5976616.1400);
INSERT INTO `bw_huobi_ticker` VALUES (478, 'lunbtc', 5023.5705, 520, 0.000092, 0.000095, 0.000091, 0.000100, 0.4802536416, 0.000094, 303.6871, 0.000096, 147.9833);
INSERT INTO `bw_huobi_ticker` VALUES (479, 'egtbtc', 16892568.3700, 3917, 0.000000, 0.000000, 0.000000, 0.000000, 2.2683709636, 0.000000, 32488.8600, 0.000000, 156000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (480, 'lolusdt', 356964997.0816, 1605, 0.000377, 0.000371, 0.000364, 0.000385, 133474.4820140800, 0.000370, 2175714.2591, 0.000373, 433095.7784);
INSERT INTO `bw_huobi_ticker` VALUES (481, 'emusdt', 201086980.4105, 10646, 0.003052, 0.003327, 0.003011, 0.003512, 654191.2748266200, 0.003315, 38400.0000, 0.003336, 2253.1900);
INSERT INTO `bw_huobi_ticker` VALUES (482, 'mcoeth', 1307.6102, 1830, 0.029982, 0.030553, 0.029858, 0.031636, 39.5915701756, 0.030438, 6.6000, 0.030772, 6.6000);
INSERT INTO `bw_huobi_ticker` VALUES (483, 'wtcbtc', 528632.9753, 5111, 0.000036, 0.000038, 0.000036, 0.000040, 19.6976267400, 0.000038, 555.8000, 0.000039, 85.8700);
INSERT INTO `bw_huobi_ticker` VALUES (484, 'ltchusd', 987.1043, 217, 42.530000, 41.690000, 41.690000, 42.980000, 42106.5165930000, 41.700000, 8.2417, 41.810000, 80.0695);
INSERT INTO `bw_huobi_ticker` VALUES (485, 'uceth', 498441488.1700, 2100, 0.000001, 0.000001, 0.000001, 0.000001, 343.7564263065, 0.000001, 698384.9800, 0.000001, 33411.6700);
INSERT INTO `bw_huobi_ticker` VALUES (486, 'ruffbtc', 4897290.5300, 2497, 0.000001, 0.000001, 0.000001, 0.000001, 3.7718787196, 0.000001, 15200.0000, 0.000001, 3976.0000);
INSERT INTO `bw_huobi_ticker` VALUES (487, 'etcbtc', 159767.5194, 3555, 0.000769, 0.000760, 0.000759, 0.000783, 122.7286930699, 0.000759, 21.0849, 0.000760, 2532.4413);
INSERT INTO `bw_huobi_ticker` VALUES (488, 'bhdusdt', 249680.8527, 7835, 5.311900, 5.404700, 5.256700, 5.843400, 1357146.7091895000, 5.404700, 14.5615, 5.433700, 9.1882);
INSERT INTO `bw_huobi_ticker` VALUES (489, 'tntbtc', 489271.1287, 2333, 0.000007, 0.000007, 0.000006, 0.000007, 3.2106299191, 0.000007, 3344.0000, 0.000007, 103.0000);
INSERT INTO `bw_huobi_ticker` VALUES (490, 'cvcoinbtc', 12334957.1400, 4318, 0.000004, 0.000004, 0.000004, 0.000004, 44.5527536568, 0.000004, 5993.5400, 0.000004, 605.3000);
INSERT INTO `bw_huobi_ticker` VALUES (491, 'icxeth', 39832.0414, 1955, 0.001356, 0.001372, 0.001345, 0.001380, 54.3725480881, 0.001364, 451.0000, 0.001375, 9999.9999);
INSERT INTO `bw_huobi_ticker` VALUES (492, 'gveeth', 40504680.3200, 1449, 0.000001, 0.000001, 0.000001, 0.000001, 32.1624545494, 0.000001, 1443610.0700, 0.000001, 897647.4000);
INSERT INTO `bw_huobi_ticker` VALUES (493, 'lymbtc', 3204275.5700, 1903, 0.000000, 0.000000, 0.000000, 0.000000, 0.5928283783, 0.000000, 5534.0300, 0.000000, 1874.4400);
INSERT INTO `bw_huobi_ticker` VALUES (494, 'ftieth', 59547108.1800, 815, 0.000001, 0.000001, 0.000001, 0.000001, 31.6135334320, 0.000001, 200000.0000, 0.000001, 1501913.8500);
INSERT INTO `bw_huobi_ticker` VALUES (495, 'gsceth', 2201798.6600, 2037, 0.000021, 0.000021, 0.000020, 0.000022, 45.9686244057, 0.000021, 19177.4600, 0.000021, 4448.8200);
INSERT INTO `bw_huobi_ticker` VALUES (496, 'itcbtc', 572608.0000, 2322, 0.000012, 0.000012, 0.000012, 0.000012, 6.9790027200, 0.000012, 30196.0000, 0.000012, 10218.0000);
INSERT INTO `bw_huobi_ticker` VALUES (497, 'nodebtc', 15645335.6696, 2308, 0.000000, 0.000000, 0.000000, 0.000000, 2.7187552555, 0.000000, 133172.1500, 0.000000, 358771.5000);
INSERT INTO `bw_huobi_ticker` VALUES (498, 'algousdt', 6113023.9144, 7127, 0.183100, 0.183600, 0.178800, 0.189700, 1112007.8546562000, 0.183600, 1193.5100, 0.184100, 5083.1800);
INSERT INTO `bw_huobi_ticker` VALUES (499, 'geteth', 4781460.6500, 2136, 0.000023, 0.000022, 0.000021, 0.000023, 103.2321963339, 0.000021, 19079.3400, 0.000022, 9306.3500);
INSERT INTO `bw_huobi_ticker` VALUES (500, 'adaeth', 2594302.9972, 434, 0.000197, 0.000202, 0.000197, 0.000204, 520.5939425404, 0.000202, 143786.9076, 0.000203, 263935.9016);
INSERT INTO `bw_huobi_ticker` VALUES (501, 'crobtc', 9788436.6180, 8287, 0.000007, 0.000007, 0.000007, 0.000007, 70.3007486112, 0.000007, 2226.5500, 0.000007, 2015.3000);
INSERT INTO `bw_huobi_ticker` VALUES (502, 'dtaeth', 39920764.3500, 1830, 0.000001, 0.000001, 0.000001, 0.000001, 46.7996708917, 0.000001, 268259.7900, 0.000001, 597658.3200);
INSERT INTO `bw_huobi_ticker` VALUES (503, 'utkbtc', 7418735.0800, 1044, 0.000001, 0.000001, 0.000001, 0.000001, 9.3130510628, 0.000001, 7591.9800, 0.000001, 5924.7000);
INSERT INTO `bw_huobi_ticker` VALUES (504, 'elfbtc', 158262.1380, 2079, 0.000009, 0.000009, 0.000009, 0.000009, 1.4208544000, 0.000009, 420.0000, 0.000009, 14.0000);
INSERT INTO `bw_huobi_ticker` VALUES (505, 'wpreth', 1455519.9000, 2023, 0.000030, 0.000031, 0.000030, 0.000032, 44.9873270228, 0.000031, 2600.0000, 0.000032, 4800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (506, 'wxtht', 171233.0100, 2012, 0.002573, 0.002619, 0.002564, 0.002668, 446.7730352300, 0.002593, 4617.7400, 0.002649, 5208.1900);
INSERT INTO `bw_huobi_ticker` VALUES (507, 'covaeth', 32868496.1400, 997, 0.000001, 0.000001, 0.000001, 0.000001, 27.8491184886, 0.000001, 3567060.0587, 0.000001, 1440042.1140);
INSERT INTO `bw_huobi_ticker` VALUES (508, 'kcashbtc', 20006165.3116, 3857, 0.000001, 0.000001, 0.000001, 0.000001, 23.2520040538, 0.000001, 59578.2700, 0.000001, 4000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (509, 'skmbtc', 3471728.7900, 4251, 0.000000, 0.000000, 0.000000, 0.000000, 0.7025317398, 0.000000, 42825.8100, 0.000000, 35961.6800);
INSERT INTO `bw_huobi_ticker` VALUES (510, 'actbtc', 1376261.3900, 2123, 0.000001, 0.000001, 0.000001, 0.000001, 0.9344922706, 0.000001, 1900.0000, 0.000001, 49800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (511, 'gxcusdt', 398880.3291, 3417, 0.405600, 0.398100, 0.396100, 0.411000, 160545.5647666900, 0.397000, 21.0000, 0.399800, 309.1874);
INSERT INTO `bw_huobi_ticker` VALUES (512, '18cbtc', 13128417.9700, 2318, 0.000000, 0.000000, 0.000000, 0.000000, 4.1206055457, 0.000000, 24334.8400, 0.000000, 31724.4200);
INSERT INTO `bw_huobi_ticker` VALUES (513, 'reneth', 313228.7288, 2343, 0.000314, 0.000326, 0.000311, 0.000334, 98.4335093455, 0.000325, 58.5343, 0.000328, 3299.7712);
INSERT INTO `bw_huobi_ticker` VALUES (514, 'ekobtc', 12431491.6000, 3800, 0.000000, 0.000000, 0.000000, 0.000000, 1.4614418725, 0.000000, 31000.0000, 0.000000, 215237.6700);
INSERT INTO `bw_huobi_ticker` VALUES (515, 'lambeth', 10898815.4012, 7920, 0.000073, 0.000075, 0.000072, 0.000076, 802.9613665296, 0.000075, 8839.7100, 0.000075, 4500.0000);
INSERT INTO `bw_huobi_ticker` VALUES (516, 'dcrusdt', 9439.3475, 3409, 12.471100, 12.334400, 12.161000, 12.732700, 117048.7776265900, 12.297100, 3.3333, 12.371700, 1.3000);
INSERT INTO `bw_huobi_ticker` VALUES (517, 'manabtc', 1046373.0000, 1504, 0.000004, 0.000004, 0.000004, 0.000004, 4.0865276100, 0.000004, 76781.0000, 0.000004, 77688.0000);
INSERT INTO `bw_huobi_ticker` VALUES (518, 'dogeeth', 18481989.9600, 1911, 0.000011, 0.000012, 0.000011, 0.000012, 215.4242320781, 0.000012, 2301.1100, 0.000012, 341352.6300);
INSERT INTO `bw_huobi_ticker` VALUES (519, 'datbtc', 29198633.3600, 2545, 0.000000, 0.000000, 0.000000, 0.000000, 2.8305418941, 0.000000, 4117246.4800, 0.000000, 43196.5400);
INSERT INTO `bw_huobi_ticker` VALUES (520, 'gntusdt', 1273270.6981, 790, 0.036700, 0.036700, 0.036400, 0.037600, 47116.0896529200, 0.036700, 39204.7244, 0.036800, 7638.2695);
INSERT INTO `bw_huobi_ticker` VALUES (521, 'rsrbtc', 25851620.0475, 2304, 0.000000, 0.000000, 0.000000, 0.000000, 9.4512456262, 0.000000, 285300.0000, 0.000000, 64800.0000);
INSERT INTO `bw_huobi_ticker` VALUES (522, 'aeeth', 389732.4282, 1292, 0.000586, 0.000592, 0.000581, 0.000599, 232.6940657813, 0.000592, 6520.1212, 0.000595, 7191.9333);
INSERT INTO `bw_huobi_ticker` VALUES (523, 'wtcusdt', 1653667.8276, 5145, 0.255800, 0.272100, 0.250800, 0.284400, 432700.3456962600, 0.270500, 1725.1582, 0.272900, 1485.3326);
INSERT INTO `bw_huobi_ticker` VALUES (524, 'zileth', 3233412.2327, 2193, 0.000025, 0.000025, 0.000025, 0.000025, 80.4265340898, 0.000025, 83038.2300, 0.000025, 94190.7500);
INSERT INTO `bw_huobi_ticker` VALUES (525, 'triobtc', 65628810.1561, 11324, 0.000000, 0.000000, 0.000000, 0.000000, 5.4273451482, 0.000000, 25253.7600, 0.000000, 47432.0300);
INSERT INTO `bw_huobi_ticker` VALUES (526, 'wavesbtc', 27530.4594, 2337, 0.000142, 0.000142, 0.000141, 0.000144, 3.9227078859, 0.000142, 22.7700, 0.000143, 328.0252);
INSERT INTO `bw_huobi_ticker` VALUES (527, 'loometh', 132778.9568, 143, 0.000084, 0.000084, 0.000082, 0.000085, 11.2895157474, 0.000083, 38770.1400, 0.000085, 40266.1249);
INSERT INTO `bw_huobi_ticker` VALUES (528, 'blzbtc', 162876.3710, 171, 0.000002, 0.000002, 0.000002, 0.000002, 0.3440995415, 0.000002, 11477.2300, 0.000002, 183.5100);
INSERT INTO `bw_huobi_ticker` VALUES (529, 'bhtbtc', 3101331.0779, 6256, 0.000008, 0.000008, 0.000007, 0.000008, 24.0299886601, 0.000008, 4842.7800, 0.000008, 2371.4400);
INSERT INTO `bw_huobi_ticker` VALUES (530, 'vidyusdt', 250744666.6400, 1877, 0.000635, 0.000616, 0.000614, 0.000642, 157176.6636171600, 0.000615, 234000.0000, 0.000620, 336195.6000);
INSERT INTO `bw_huobi_ticker` VALUES (531, 'smteth', 3184664.3735, 2046, 0.000018, 0.000018, 0.000018, 0.000019, 57.5434574200, 0.000018, 20500.0000, 0.000018, 2312.0000);
INSERT INTO `bw_huobi_ticker` VALUES (532, 'emht', 1750749.8200, 2079, 0.000800, 0.000881, 0.000792, 0.000939, 1437.4877816822, 0.000874, 59999.9800, 0.000893, 59999.9600);
INSERT INTO `bw_huobi_ticker` VALUES (533, 'thetausdt', 936003.4136, 2164, 0.078700, 0.077700, 0.077500, 0.079700, 73213.6388256100, 0.077600, 44414.6865, 0.078000, 189.4493);
INSERT INTO `bw_huobi_ticker` VALUES (534, 'irisbtc', 7066877.3919, 1435, 0.000001, 0.000002, 0.000001, 0.000002, 10.4784154667, 0.000001, 141.7400, 0.000002, 2496.2300);
INSERT INTO `bw_huobi_ticker` VALUES (535, 'nknbtc', 3740924.9303, 3611, 0.000002, 0.000002, 0.000002, 0.000002, 8.3000894247, 0.000002, 154543.3000, 0.000002, 55495.1900);
INSERT INTO `bw_huobi_ticker` VALUES (536, 'vetbtc', 16864966.5600, 2852, 0.000001, 0.000001, 0.000001, 0.000001, 9.0950237773, 0.000001, 3300.0000, 0.000001, 137279.6500);
INSERT INTO `bw_huobi_ticker` VALUES (537, 'oneht', 313537.6054, 2041, 0.001884, 0.001866, 0.001775, 0.001964, 580.5407948600, 0.001849, 760.7200, 0.001884, 5247.0000);
INSERT INTO `bw_huobi_ticker` VALUES (538, 'dockbtc', 1786631.5128, 440, 0.000001, 0.000001, 0.000001, 0.000001, 1.0904818384, 0.000001, 201104.1800, 0.000001, 202789.0100);
INSERT INTO `bw_huobi_ticker` VALUES (539, 'ardreth', 43798.2288, 329, 0.000199, 0.000201, 0.000197, 0.000201, 8.7972172605, 0.000200, 35599.9999, 0.000202, 35319.9999);
INSERT INTO `bw_huobi_ticker` VALUES (540, 'sceth', 7920724.0300, 2033, 0.000008, 0.000008, 0.000008, 0.000008, 61.8672481841, 0.000008, 23436.7900, 0.000008, 849999.9900);
INSERT INTO `bw_huobi_ticker` VALUES (541, 'kmdeth', 46059.9323, 2491, 0.003376, 0.003455, 0.003274, 0.003914, 157.5950505582, 0.003443, 25.0978, 0.003466, 398.8582);
INSERT INTO `bw_huobi_ticker` VALUES (542, 'creusdt', 155446555.3000, 3510, 0.001307, 0.001289, 0.001274, 0.001323, 202761.0793992000, 0.001282, 77546.9500, 0.001297, 276000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (543, 'bifibtc', 391488.1501, 18, 0.000000, 0.000000, 0.000000, 0.000000, 0.0420295697, 0.000000, 92650.0000, 0.000000, 18584.7301);
INSERT INTO `bw_huobi_ticker` VALUES (544, 'abtbtc', 212539.3200, 2264, 0.000012, 0.000012, 0.000012, 0.000012, 2.5436269168, 0.000012, 787.2100, 0.000012, 480.0000);
INSERT INTO `bw_huobi_ticker` VALUES (545, 'cmtbtc', 3243963.2781, 698, 0.000001, 0.000001, 0.000001, 0.000001, 3.4396163405, 0.000001, 125708.6700, 0.000001, 98409.6700);
INSERT INTO `bw_huobi_ticker` VALUES (546, 'dbceth', 3661413.4300, 132, 0.000003, 0.000003, 0.000003, 0.000003, 9.5681479926, 0.000003, 108000.0000, 0.000003, 41791.8400);
INSERT INTO `bw_huobi_ticker` VALUES (547, 'renusdt', 2199576.4848, 2770, 0.054000, 0.054743, 0.053147, 0.056000, 117981.4123097900, 0.054761, 573.1000, 0.054982, 2742.5200);
INSERT INTO `bw_huobi_ticker` VALUES (548, 'xmrbtc', 16553.8338, 6266, 0.007959, 0.008005, 0.007928, 0.008075, 132.5065969889, 0.008000, 1.0012, 0.008005, 0.1900);
INSERT INTO `bw_huobi_ticker` VALUES (549, 'mxcbtc', 15950258.2622, 2994, 0.000001, 0.000001, 0.000001, 0.000001, 10.3241566584, 0.000001, 1736.0800, 0.000001, 18210.9200);
INSERT INTO `bw_huobi_ticker` VALUES (550, 'egtusdt', 59645744.9997, 1661, 0.000943, 0.000941, 0.000907, 0.000950, 56404.3384160200, 0.000939, 11688.9300, 0.000945, 124216.0000);
INSERT INTO `bw_huobi_ticker` VALUES (551, 'xtzbtc', 110807.7223, 3551, 0.000290, 0.000300, 0.000290, 0.000302, 32.3525058847, 0.000300, 82.0500, 0.000300, 0.4800);
INSERT INTO `bw_huobi_ticker` VALUES (552, 'zrxeth', 65919.1735, 1729, 0.000997, 0.001005, 0.000991, 0.001028, 66.7353457978, 0.001004, 360.0000, 0.001010, 1453.3300);
INSERT INTO `bw_huobi_ticker` VALUES (553, 'lxtbtc', 25058642.3700, 7784, 0.000000, 0.000000, 0.000000, 0.000000, 6.4485185417, 0.000000, 10617.9400, 0.000000, 83000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (554, 'chatbtc', 4606478.6900, 1977, 0.000000, 0.000000, 0.000000, 0.000000, 0.6682395375, 0.000000, 7022.4700, 0.000000, 19000.0000);
INSERT INTO `bw_huobi_ticker` VALUES (555, 'bhdht', 790.1153, 2019, 1.384500, 1.423300, 1.373900, 1.549100, 1138.2173598800, 1.411300, 90.0435, 1.435700, 20.4215);

-- ----------------------------
-- Table structure for bw_interest
-- ----------------------------
DROP TABLE IF EXISTS `bw_interest`;
CREATE TABLE `bw_interest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '借币类型',
  `amount` decimal(15, 5) NULL DEFAULT NULL COMMENT '借币数量',
  `h_amount` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '已还数量',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '借币时间',
  `rate` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '日息利率',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0未还，1已还',
  `charge` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '手续费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '借币生息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_interest
-- ----------------------------
INSERT INTO `bw_interest` VALUES (1, 7, 'USDT', 60000.00000, 60000.00000, 1591696607, 0.00098, 1, 0.00098);

-- ----------------------------
-- Table structure for bw_lever_multiple
-- ----------------------------
DROP TABLE IF EXISTS `bw_lever_multiple`;
CREATE TABLE `bw_lever_multiple`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT 1 COMMENT '1倍数  2手数',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合约倍数手数设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_lever_multiple
-- ----------------------------
INSERT INTO `bw_lever_multiple` VALUES (3, 1, '30');
INSERT INTO `bw_lever_multiple` VALUES (4, 1, '50');
INSERT INTO `bw_lever_multiple` VALUES (5, 2, '1');
INSERT INTO `bw_lever_multiple` VALUES (6, 2, '5');
INSERT INTO `bw_lever_multiple` VALUES (7, 2, '10');
INSERT INTO `bw_lever_multiple` VALUES (9, 2, '20');

-- ----------------------------
-- Table structure for bw_lever_transaction
-- ----------------------------
DROP TABLE IF EXISTS `bw_lever_transaction`;
CREATE TABLE `bw_lever_transaction`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '买卖类型:1.买入,2.卖出',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `currency` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '交易id',
  `legal` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '法币id',
  `origin_price` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '原始价格',
  `price` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '开仓价格(点差处理之后)',
  `update_price` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '当前价格',
  `target_profit_price` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '止盈价格',
  `stop_loss_price` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '止亏价格',
  `share` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '手数',
  `number` decimal(20, 5) UNSIGNED NOT NULL DEFAULT 0.00000 COMMENT '手数换算数量',
  `multiple` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '倍数',
  `origin_caution_money` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '初始保证金',
  `caution_money` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '当前可用保证金',
  `fact_profits` decimal(20, 8) NOT NULL DEFAULT 0.00000000 COMMENT '最终盈亏',
  `trade_fee` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '交易手续费',
  `overnight` decimal(20, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '隔夜费率,百分比',
  `overnight_money` decimal(20, 8) UNSIGNED NOT NULL DEFAULT 0.00000000 COMMENT '隔夜费金额',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '交易状态:0.挂单中,1.交易中,2.平仓中,3.已平仓,4.已撤单',
  `settled` tinyint(4) NOT NULL DEFAULT 0 COMMENT '结算状态:0.未结算,1.已结算',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '下单时间',
  `transaction_time` decimal(20, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易时间',
  `update_time` decimal(20, 8) NOT NULL DEFAULT 0.00000000 COMMENT '价格刷新时间(毫秒级)',
  `handle_time` decimal(20, 8) NOT NULL DEFAULT 0.00000000 COMMENT '平仓时间',
  `complete_time` decimal(20, 8) NOT NULL DEFAULT 0.00000000 COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `currency`(`currency`) USING BTREE,
  INDEX `legal`(`legal`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_merc_setting
-- ----------------------------
DROP TABLE IF EXISTS `bw_merc_setting`;
CREATE TABLE `bw_merc_setting`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade1` decimal(5, 2) UNSIGNED NOT NULL DEFAULT 0.10 COMMENT '1级代理商',
  `grade2` decimal(5, 2) UNSIGNED NULL DEFAULT 0.10 COMMENT '2级代理商',
  `grade3` decimal(5, 2) UNSIGNED NULL DEFAULT 0.10 COMMENT '3级代理商',
  `grade4` decimal(5, 2) UNSIGNED NULL DEFAULT 0.10 COMMENT '4级代理商',
  `grade5` decimal(5, 2) UNSIGNED NULL DEFAULT 0.10 COMMENT '5级代理商',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商奖励表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merc_setting
-- ----------------------------
INSERT INTO `bw_merc_setting` VALUES (1, 0.10, 0.10, 0.10, 0.10, 0.10);

-- ----------------------------
-- Table structure for bw_merc_user
-- ----------------------------
DROP TABLE IF EXISTS `bw_merc_user`;
CREATE TABLE `bw_merc_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户用户表',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户账号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户密码',
  `login_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `rating` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '等级（共5级）',
  `total_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '总入金',
  `total_withdrawal` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '总出金',
  `deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '充币',
  `withdraw` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '提币',
  `net_price` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '净入金',
  `net_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '净充币',
  `loss` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '亏盈',
  `floor_id` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '父级ID',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '团队',
  `invit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merc_user
-- ----------------------------
INSERT INTO `bw_merc_user` VALUES (1, 'admin', 'admin', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 1590109474, '127.0.0.1', 0, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0, '0', NULL);
INSERT INTO `bw_merc_user` VALUES (2, '13714213050', '6666', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 1587886958, '127.0.0.1', 1, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1, '0,1', NULL);
INSERT INTO `bw_merc_user` VALUES (3, '18318058460', 'openice', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 1592571976, '127.0.0.1', 1, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1, '0,1', NULL);
INSERT INTO `bw_merc_user` VALUES (4, '13666666666', 'test', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 1587986733, '127.0.0.1', 3, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1, '0,1', 'MEDRCHKWSYFRC');
INSERT INTO `bw_merc_user` VALUES (6, 'root123', 'root123', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 1588042433, '127.0.0.1', 0, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0, '0', 'MEDYZTQRJVERC');

-- ----------------------------
-- Table structure for bw_merc_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `bw_merc_user_copy`;
CREATE TABLE `bw_merc_user_copy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `m_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户账号',
  `m_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `total_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '总入金',
  `total_withdrawal` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '总出金',
  `total_transaction` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '交易总额',
  `trading_loss` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '交易盈亏',
  `total_handling_fee` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '总交易手续费',
  `floor_id` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '父级ID',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '团队',
  `invit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `usdt_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '充币',
  `vce_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '充币',
  `btc_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '充币',
  `eth_deposit` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '充币',
  `usdt_withdraw` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '提币',
  `vce_withdraw` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '提币',
  `btc_withdraw` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '提币',
  `eth_withdraw` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '提币',
  `subscription_total` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '申购总额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merc_user_copy
-- ----------------------------
INSERT INTO `bw_merc_user_copy` VALUES (53, '13666666666', 'test', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 4, '0,1,4', 'XDQFTLVGY', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 0.00000);
INSERT INTO `bw_merc_user_copy` VALUES (54, 'root123', 'root123', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 6, '0,6', 'GFRMADXYN', 10000.00000, 10000.00000, 10000.00000, 0.00000, 10.00000, 10.00000, 10.00000, 0.00000, 100.00000);

-- ----------------------------
-- Table structure for bw_merc_user_log
-- ----------------------------
DROP TABLE IF EXISTS `bw_merc_user_log`;
CREATE TABLE `bw_merc_user_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录日志',
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `type` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '类型（1法币入金、2法币出金、3充币、4提币、5申购、6手续费）',
  `info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志明细',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `cointype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种',
  `num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merc_user_log
-- ----------------------------
INSERT INTO `bw_merc_user_log` VALUES (1, 54, 3, '钱包充值', '2020-04-28 16:30:15', 'vce', 10000.00000);
INSERT INTO `bw_merc_user_log` VALUES (2, 54, 4, '钱包提币', '2020-04-28 16:27:45', 'vce', 10.00000);
INSERT INTO `bw_merc_user_log` VALUES (3, 54, 3, '钱包充值', '2020-04-28 16:32:12', 'usdt', 10000.00000);
INSERT INTO `bw_merc_user_log` VALUES (4, 54, 3, '钱包充值', '2020-04-28 16:32:43', 'btc', 10000.00000);
INSERT INTO `bw_merc_user_log` VALUES (5, 54, 4, '钱包提币', '2020-04-28 16:34:25', 'usdt', 10.00000);
INSERT INTO `bw_merc_user_log` VALUES (6, 54, 4, '钱包提币', '2020-04-28 16:34:52', 'btc', 10.00000);
INSERT INTO `bw_merc_user_log` VALUES (8, 54, 5, 'btc申购VCE', '2020-04-28 18:15:44', 'vce', 100.00000);

-- ----------------------------
-- Table structure for bw_merchant
-- ----------------------------
DROP TABLE IF EXISTS `bw_merchant`;
CREATE TABLE `bw_merchant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家名称',
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种名称',
  `number` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `y_number` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '剩余购买数量',
  `min_price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最低额',
  `max_price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最高额',
  `price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '当时行情价',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '生成时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0出售中，1已收盘',
  `type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '0为购买，1为出售',
  `degree` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '成交次数',
  `transactions` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '交易次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4831 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自选商家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merchant
-- ----------------------------
INSERT INTO `bw_merchant` VALUES (4031, '滕枫朱', 'BTC', 29.38384, 29.38384, 69.68470, 2047604.07524, 69684.70000, 1591320262, 0, 0, 28, 30);
INSERT INTO `bw_merchant` VALUES (4032, '尤幸', 'BTC', 32.81669, 32.81669, 20.90541, 2286821.19764, 69684.70000, 1591320263, 0, 0, 23, 31);
INSERT INTO `bw_merchant` VALUES (4033, '钱策菡', 'BTC', 54.18907, 54.18907, 55.74776, 3776149.08622, 69684.70000, 1591320263, 0, 0, 27, 29);
INSERT INTO `bw_merchant` VALUES (4034, '褚玲索', 'BTC', 35.53611, 35.53611, 48.77929, 2476323.16451, 69684.70000, 1591320263, 0, 0, 21, 23);
INSERT INTO `bw_merchant` VALUES (4035, '谭杭', 'BTC', 8.19616, 8.19616, 62.71623, 571146.95075, 69684.70000, 1591320263, 0, 0, 31, 37);
INSERT INTO `bw_merchant` VALUES (4036, '庄希', 'BTC', 54.18161, 54.18161, 6.96847, 3775629.23836, 69684.70000, 1591320263, 0, 0, 28, 29);
INSERT INTO `bw_merchant` VALUES (4037, '文园', 'BTC', 47.30319, 47.30319, 13.93694, 3296308.60419, 69684.70000, 1591320263, 0, 0, 41, 47);
INSERT INTO `bw_merchant` VALUES (4038, '古雷', 'BTC', 95.44994, 95.44994, 62.71623, 6651400.43391, 69684.70000, 1591320263, 0, 0, 39, 43);
INSERT INTO `bw_merchant` VALUES (4039, '傅会', 'BTC', 61.63740, 61.63740, 62.71623, 4295183.72778, 69684.70000, 1591320263, 0, 0, 21, 28);
INSERT INTO `bw_merchant` VALUES (4040, '师师', 'BTC', 10.34550, 10.34550, 55.74776, 720923.06385, 69684.70000, 1591320263, 0, 0, 13, 13);
INSERT INTO `bw_merchant` VALUES (4041, '柯韦严', 'BTC', 39.50480, 39.50480, 62.71623, 2752880.13656, 69684.70000, 1591320263, 0, 0, 47, 54);
INSERT INTO `bw_merchant` VALUES (4042, '容绍伯', 'BTC', 88.61453, 88.61453, 48.77929, 6175076.93869, 69684.70000, 1591320263, 0, 0, 31, 37);
INSERT INTO `bw_merchant` VALUES (4043, '濮阳玛', 'BTC', 13.38922, 13.38922, 6.96847, 933023.77893, 69684.70000, 1591320263, 0, 0, 15, 23);
INSERT INTO `bw_merchant` VALUES (4044, '卞昌', 'BTC', 35.06089, 35.06089, 34.84235, 2443207.60138, 69684.70000, 1591320263, 0, 0, 30, 31);
INSERT INTO `bw_merchant` VALUES (4045, '路英尹', 'BTC', 26.51602, 26.51602, 41.81082, 1847760.89889, 69684.70000, 1591320263, 0, 0, 36, 40);
INSERT INTO `bw_merchant` VALUES (4046, '纪震启', 'BTC', 52.53041, 52.53041, 69.68470, 3660565.86172, 69684.70000, 1591320263, 0, 0, 38, 43);
INSERT INTO `bw_merchant` VALUES (4047, '熊静真', 'BTC', 64.94667, 64.94667, 20.90541, 4525789.21494, 69684.70000, 1591320263, 0, 0, 32, 33);
INSERT INTO `bw_merchant` VALUES (4048, '师轮', 'BTC', 69.11559, 69.11559, 69.68470, 4816299.15447, 69684.70000, 1591320263, 0, 0, 29, 30);
INSERT INTO `bw_merchant` VALUES (4049, '杨维尚', 'BTC', 29.64256, 29.64256, 13.93694, 2065632.90083, 69684.70000, 1591320263, 0, 0, 20, 27);
INSERT INTO `bw_merchant` VALUES (4050, '澹台武司', 'BTC', 2.70812, 2.70812, 20.90541, 188714.52976, 69684.70000, 1591320263, 0, 0, 18, 23);
INSERT INTO `bw_merchant` VALUES (4051, '徐离和逄', 'BTC', 25.26819, 25.26819, 62.71623, 1760806.23969, 69684.70000, 1591320264, 0, 0, 32, 32);
INSERT INTO `bw_merchant` VALUES (4052, '杭周', 'BTC', 10.45140, 10.45140, 62.71623, 728302.67358, 69684.70000, 1591320264, 0, 0, 35, 42);
INSERT INTO `bw_merchant` VALUES (4053, '路贺', 'BTC', 52.02226, 52.02226, 6.96847, 3625155.58142, 69684.70000, 1591320264, 0, 0, 40, 46);
INSERT INTO `bw_merchant` VALUES (4054, '冉毓', 'BTC', 67.98997, 67.98997, 55.74776, 4737860.66245, 69684.70000, 1591320264, 0, 0, 21, 27);
INSERT INTO `bw_merchant` VALUES (4055, '轩辕冠', 'BTC', 28.98254, 28.98254, 20.90541, 2019639.60513, 69684.70000, 1591320264, 0, 0, 50, 54);
INSERT INTO `bw_merchant` VALUES (4056, '贺飘', 'BTC', 4.11061, 4.11061, 20.90541, 286446.62466, 69684.70000, 1591320264, 0, 0, 40, 44);
INSERT INTO `bw_merchant` VALUES (4057, '樊娇', 'BTC', 4.58698, 4.58698, 20.90541, 319642.32520, 69684.70000, 1591320264, 0, 0, 21, 28);
INSERT INTO `bw_merchant` VALUES (4058, '澹台毕', 'BTC', 30.28310, 30.28310, 48.77929, 2110268.73857, 69684.70000, 1591320264, 0, 0, 48, 56);
INSERT INTO `bw_merchant` VALUES (4059, '方朋', 'BTC', 49.69103, 49.69103, 13.93694, 3462704.51824, 69684.70000, 1591320264, 0, 0, 47, 48);
INSERT INTO `bw_merchant` VALUES (4060, '吴子陈', 'BTC', 25.51681, 25.51681, 6.96847, 1778131.24980, 69684.70000, 1591320264, 0, 0, 26, 33);
INSERT INTO `bw_merchant` VALUES (4061, '阙达韵', 'BTC', 56.75131, 56.75131, 55.74776, 3954698.01195, 69684.70000, 1591320264, 0, 0, 39, 39);
INSERT INTO `bw_merchant` VALUES (4062, '傅闵', 'BTC', 42.56104, 42.56104, 27.87388, 2965853.30408, 69684.70000, 1591320264, 0, 0, 22, 30);
INSERT INTO `bw_merchant` VALUES (4063, '毕蝶仇', 'BTC', 90.77149, 90.77149, 27.87388, 6325384.04920, 69684.70000, 1591320264, 0, 0, 20, 21);
INSERT INTO `bw_merchant` VALUES (4064, '赖滢', 'BTC', 51.69439, 51.69439, 55.74776, 3602308.05883, 69684.70000, 1591320264, 0, 0, 46, 47);
INSERT INTO `bw_merchant` VALUES (4065, '姜邦', 'BTC', 55.84849, 55.84849, 34.84235, 3891785.27110, 69684.70000, 1591320264, 0, 0, 19, 19);
INSERT INTO `bw_merchant` VALUES (4066, '水克', 'BTC', 15.37549, 15.37549, 62.71623, 1071436.40800, 69684.70000, 1591320264, 0, 0, 15, 23);
INSERT INTO `bw_merchant` VALUES (4067, '阮萍', 'BTC', 46.65664, 46.65664, 34.84235, 3251253.96140, 69684.70000, 1591320264, 0, 0, 20, 28);
INSERT INTO `bw_merchant` VALUES (4068, '项江', 'BTC', 92.93009, 92.93009, 62.71623, 6475805.44262, 69684.70000, 1591320264, 0, 0, 28, 31);
INSERT INTO `bw_merchant` VALUES (4069, '邵柴', 'BTC', 13.90289, 13.90289, 34.84235, 968818.71878, 69684.70000, 1591320264, 0, 0, 26, 32);
INSERT INTO `bw_merchant` VALUES (4070, '管露蓝', 'BTC', 2.07292, 2.07292, 62.71623, 144450.80832, 69684.70000, 1591320264, 0, 0, 14, 19);
INSERT INTO `bw_merchant` VALUES (4071, '蔡周孟', 'BTC', 24.28830, 24.28830, 55.74776, 1692522.89901, 69684.70000, 1591320264, 0, 0, 39, 46);
INSERT INTO `bw_merchant` VALUES (4072, '杜倩', 'BTC', 11.91394, 11.91394, 34.84235, 830219.33471, 69684.70000, 1591320265, 0, 0, 30, 36);
INSERT INTO `bw_merchant` VALUES (4073, '纪蔡农', 'BTC', 15.08407, 15.08407, 55.74776, 1051128.89272, 69684.70000, 1591320265, 0, 0, 10, 18);
INSERT INTO `bw_merchant` VALUES (4074, '姚恒', 'BTC', 79.03209, 79.03209, 48.77929, 5507327.48202, 69684.70000, 1591320265, 0, 0, 11, 18);
INSERT INTO `bw_merchant` VALUES (4075, '应枫昌', 'BTC', 69.04121, 69.04121, 6.96847, 4811116.00648, 69684.70000, 1591320265, 0, 0, 29, 37);
INSERT INTO `bw_merchant` VALUES (4076, '公羊颜', 'BTC', 60.38532, 60.38532, 48.77929, 4207932.90860, 69684.70000, 1591320265, 0, 0, 14, 19);
INSERT INTO `bw_merchant` VALUES (4077, '宇文荷', 'BTC', 75.91559, 75.91559, 20.90541, 5290155.11447, 69684.70000, 1591320265, 0, 0, 24, 28);
INSERT INTO `bw_merchant` VALUES (4078, '屈英', 'BTC', 8.87698, 8.87698, 48.77929, 618589.68820, 69684.70000, 1591320265, 0, 0, 27, 33);
INSERT INTO `bw_merchant` VALUES (4079, '吴宁', 'BTC', 16.54302, 16.54302, 34.84235, 1152795.38579, 69684.70000, 1591320265, 0, 0, 38, 46);
INSERT INTO `bw_merchant` VALUES (4080, '顾薛', 'BTC', 19.12447, 19.12447, 34.84235, 1332682.95460, 69684.70000, 1591320265, 0, 0, 34, 37);
INSERT INTO `bw_merchant` VALUES (4081, '孙顺', 'BTC', 27.68579, 27.68579, 27.87388, 1929275.97041, 69684.70000, 1591320265, 0, 0, 17, 25);
INSERT INTO `bw_merchant` VALUES (4082, '袁亨甘', 'BTC', 89.72834, 89.72834, 62.71623, 6252692.45439, 69684.70000, 1591320265, 0, 0, 43, 50);
INSERT INTO `bw_merchant` VALUES (4083, '解史', 'BTC', 17.40517, 17.40517, 55.74776, 1212874.04989, 69684.70000, 1591320265, 0, 0, 39, 42);
INSERT INTO `bw_merchant` VALUES (4084, '朱利', 'BTC', 0.76113, 0.76113, 20.90541, 53039.11571, 69684.70000, 1591320265, 0, 0, 10, 16);
INSERT INTO `bw_merchant` VALUES (4085, '弘舒', 'BTC', 14.76677, 14.76677, 55.74776, 1029017.93741, 69684.70000, 1591320265, 0, 0, 19, 26);
INSERT INTO `bw_merchant` VALUES (4086, '温园', 'BTC', 77.95584, 77.95584, 6.96847, 5432329.32364, 69684.70000, 1591320265, 0, 0, 29, 29);
INSERT INTO `bw_merchant` VALUES (4087, '曹宜', 'BTC', 0.15706, 0.15706, 55.74776, 10944.67898, 69684.70000, 1591320265, 0, 0, 28, 29);
INSERT INTO `bw_merchant` VALUES (4088, '毕封', 'BTC', 71.99079, 71.99079, 62.71623, 5016656.60391, 69684.70000, 1591320265, 0, 0, 25, 26);
INSERT INTO `bw_merchant` VALUES (4089, '长孙芬颜', 'BTC', 61.65590, 61.65590, 55.74776, 4296472.89473, 69684.70000, 1591320265, 0, 0, 42, 48);
INSERT INTO `bw_merchant` VALUES (4090, '鲍容菡', 'BTC', 38.02847, 38.02847, 27.87388, 2650002.52340, 69684.70000, 1591320265, 0, 0, 44, 50);
INSERT INTO `bw_merchant` VALUES (4091, '堵古关', 'BTC', 2.83732, 2.83732, 34.84235, 197717.79300, 69684.70000, 1591320265, 0, 0, 11, 13);
INSERT INTO `bw_merchant` VALUES (4092, '荀纪孙', 'BTC', 22.69490, 22.69490, 48.77929, 1581487.29803, 69684.70000, 1591320265, 0, 0, 14, 22);
INSERT INTO `bw_merchant` VALUES (4093, '田岚禄', 'BTC', 79.78378, 79.78378, 48.77929, 5559708.77416, 69684.70000, 1591320265, 0, 0, 36, 44);
INSERT INTO `bw_merchant` VALUES (4094, '田彪屈', 'BTC', 41.21862, 41.21862, 69.68470, 2872307.16911, 69684.70000, 1591320265, 0, 0, 45, 46);
INSERT INTO `bw_merchant` VALUES (4095, '上官青', 'BTC', 74.50243, 74.50243, 69.68470, 5191679.48382, 69684.70000, 1591320265, 0, 0, 41, 45);
INSERT INTO `bw_merchant` VALUES (4096, '东方江', 'BTC', 93.76663, 93.76663, 20.90541, 6534099.48156, 69684.70000, 1591320265, 0, 0, 27, 32);
INSERT INTO `bw_merchant` VALUES (4097, '杜娅米', 'BTC', 66.32881, 66.32881, 48.77929, 4622103.22620, 69684.70000, 1591320265, 0, 0, 20, 23);
INSERT INTO `bw_merchant` VALUES (4098, '文烟', 'BTC', 74.63979, 74.63979, 48.77929, 5201251.37421, 69684.70000, 1591320266, 0, 0, 30, 36);
INSERT INTO `bw_merchant` VALUES (4099, '韩湛', 'BTC', 38.31647, 38.31647, 69.68470, 2670071.71700, 69684.70000, 1591320266, 0, 0, 18, 19);
INSERT INTO `bw_merchant` VALUES (4100, '季蒋', 'BTC', 26.92979, 26.92979, 34.84235, 1876594.33721, 69684.70000, 1591320266, 0, 0, 33, 39);
INSERT INTO `bw_merchant` VALUES (4101, '廖发', 'BTC', 55.77288, 55.77288, 48.77929, 3886516.41093, 69684.70000, 1591320266, 0, 0, 12, 20);
INSERT INTO `bw_merchant` VALUES (4102, '莫初', 'BTC', 83.68853, 83.68853, 48.77929, 5831810.10649, 69684.70000, 1591320266, 0, 0, 19, 24);
INSERT INTO `bw_merchant` VALUES (4103, '阙冠婷', 'BTC', 98.45741, 98.45741, 20.90541, 6860975.07862, 69684.70000, 1591320266, 0, 0, 18, 22);
INSERT INTO `bw_merchant` VALUES (4104, '昌李', 'BTC', 99.54045, 99.54045, 41.81082, 6936446.39611, 69684.70000, 1591320266, 0, 0, 26, 31);
INSERT INTO `bw_merchant` VALUES (4105, '蒲博', 'BTC', 89.32722, 89.32722, 62.71623, 6224740.52753, 69684.70000, 1591320266, 0, 0, 29, 33);
INSERT INTO `bw_merchant` VALUES (4106, '农环剑', 'BTC', 20.88409, 20.88409, 69.68470, 1455301.54642, 69684.70000, 1591320266, 0, 0, 48, 48);
INSERT INTO `bw_merchant` VALUES (4107, '劳海信', 'BTC', 46.92050, 46.92050, 55.74776, 3269640.96635, 69684.70000, 1591320266, 0, 0, 47, 53);
INSERT INTO `bw_merchant` VALUES (4108, '吕琪卫', 'BTC', 80.82807, 80.82807, 20.90541, 5632479.80952, 69684.70000, 1591320266, 0, 0, 21, 24);
INSERT INTO `bw_merchant` VALUES (4109, '关徐', 'BTC', 11.17559, 11.17559, 13.93694, 778767.63647, 69684.70000, 1591320266, 0, 0, 30, 37);
INSERT INTO `bw_merchant` VALUES (4110, '晏黛惠', 'BTC', 0.77212, 0.77212, 20.90541, 53804.95056, 69684.70000, 1591320266, 0, 0, 40, 41);
INSERT INTO `bw_merchant` VALUES (4111, '奚莺', 'BTC', 67.15446, 67.15446, 13.93694, 4679638.39876, 69684.70000, 1591320266, 0, 0, 29, 31);
INSERT INTO `bw_merchant` VALUES (4112, '樊田', 'BTC', 10.91923, 10.91923, 27.87388, 760903.26678, 69684.70000, 1591320266, 0, 0, 31, 32);
INSERT INTO `bw_merchant` VALUES (4113, '令狐艺', 'BTC', 39.61226, 39.61226, 34.84235, 2760368.45442, 69684.70000, 1591320266, 0, 0, 38, 43);
INSERT INTO `bw_merchant` VALUES (4114, '房玛', 'BTC', 65.88940, 65.88940, 62.71623, 4591483.07218, 69684.70000, 1591320266, 0, 0, 40, 40);
INSERT INTO `bw_merchant` VALUES (4115, '符瑞龚', 'BTC', 84.36475, 84.36475, 55.74776, 5878932.29432, 69684.70000, 1591320266, 0, 0, 49, 55);
INSERT INTO `bw_merchant` VALUES (4116, '从虞', 'BTC', 53.63421, 53.63421, 48.77929, 3737483.83358, 69684.70000, 1591320266, 0, 0, 11, 19);
INSERT INTO `bw_merchant` VALUES (4117, '幸策米', 'BTC', 79.01642, 79.01642, 20.90541, 5506235.52277, 69684.70000, 1591320266, 0, 0, 26, 26);
INSERT INTO `bw_merchant` VALUES (4118, '苗勤', 'BTC', 53.12046, 53.12046, 69.68470, 3701683.31896, 69684.70000, 1591320266, 0, 0, 41, 43);
INSERT INTO `bw_merchant` VALUES (4119, '寿平', 'BTC', 19.23891, 19.23891, 41.81082, 1340657.67167, 69684.70000, 1591320266, 0, 0, 20, 26);
INSERT INTO `bw_merchant` VALUES (4120, '庾庆', 'BTC', 58.74036, 58.74036, 6.96847, 4093304.36449, 69684.70000, 1591320267, 0, 0, 22, 26);
INSERT INTO `bw_merchant` VALUES (4121, '容洁徐', 'BTC', 43.57467, 43.57467, 13.93694, 3036487.80654, 69684.70000, 1591320267, 0, 0, 30, 30);
INSERT INTO `bw_merchant` VALUES (4122, '梅玛', 'BTC', 17.78607, 17.78607, 55.74776, 1239416.95212, 69684.70000, 1591320267, 0, 0, 31, 34);
INSERT INTO `bw_merchant` VALUES (4123, '荀卢', 'BTC', 83.27805, 83.27805, 69.68470, 5803205.93083, 69684.70000, 1591320267, 0, 0, 24, 29);
INSERT INTO `bw_merchant` VALUES (4124, '云魏柏', 'BTC', 87.72247, 87.72247, 20.90541, 6112914.00520, 69684.70000, 1591320267, 0, 0, 13, 15);
INSERT INTO `bw_merchant` VALUES (4125, '徐璐', 'BTC', 69.55759, 69.55759, 6.96847, 4847099.79187, 69684.70000, 1591320267, 0, 0, 29, 31);
INSERT INTO `bw_merchant` VALUES (4126, '屈聪', 'BTC', 67.32396, 67.32396, 69.68470, 4691449.95541, 69684.70000, 1591320267, 0, 0, 25, 31);
INSERT INTO `bw_merchant` VALUES (4127, '昌蔡', 'BTC', 70.17192, 70.17192, 6.96847, 4889909.19362, 69684.70000, 1591320267, 0, 0, 19, 25);
INSERT INTO `bw_merchant` VALUES (4128, '印筠伊', 'BTC', 96.47277, 96.47277, 27.87388, 6722676.03561, 69684.70000, 1591320267, 0, 0, 46, 48);
INSERT INTO `bw_merchant` VALUES (4129, '殷瑾农', 'BTC', 34.45878, 34.45878, 27.87388, 2401249.74666, 69684.70000, 1591320267, 0, 0, 21, 26);
INSERT INTO `bw_merchant` VALUES (4130, '杭易', 'BTC', 93.65513, 93.65513, 34.84235, 6526329.63751, 69684.70000, 1591320267, 0, 0, 16, 20);
INSERT INTO `bw_merchant` VALUES (4131, '令狐泽', 'BTC', 43.46238, 43.46238, 34.84235, 3028662.91158, 69684.70000, 1591320267, 0, 1, 11, 13);
INSERT INTO `bw_merchant` VALUES (4132, '诸葛斌妹', 'BTC', 29.88573, 29.88573, 13.93694, 2082578.12933, 69684.70000, 1591320267, 0, 1, 19, 27);
INSERT INTO `bw_merchant` VALUES (4133, '左兴', 'BTC', 6.34501, 6.34501, 41.81082, 442150.11834, 69684.70000, 1591320267, 0, 1, 16, 24);
INSERT INTO `bw_merchant` VALUES (4134, '汤波', 'BTC', 96.78291, 96.78291, 13.93694, 6744288.04847, 69684.70000, 1591320267, 0, 1, 23, 28);
INSERT INTO `bw_merchant` VALUES (4135, '欧阳雷', 'BTC', 14.63357, 14.63357, 41.81082, 1019735.93537, 69684.70000, 1591320267, 0, 1, 20, 22);
INSERT INTO `bw_merchant` VALUES (4136, '纪惠', 'BTC', 65.93879, 65.93879, 6.96847, 4594924.79951, 69684.70000, 1591320267, 0, 1, 34, 34);
INSERT INTO `bw_merchant` VALUES (4137, '单冰姚', 'BTC', 42.47959, 42.47959, 41.81082, 2960177.48527, 69684.70000, 1591320267, 0, 1, 31, 31);
INSERT INTO `bw_merchant` VALUES (4138, '龙彬狄', 'BTC', 86.00910, 86.00910, 13.93694, 5993518.33077, 69684.70000, 1591320267, 0, 1, 27, 29);
INSERT INTO `bw_merchant` VALUES (4139, '东楠', 'BTC', 18.97122, 18.97122, 20.90541, 1322003.77433, 69684.70000, 1591320267, 0, 1, 46, 52);
INSERT INTO `bw_merchant` VALUES (4140, '梅庆柏', 'BTC', 26.21446, 26.21446, 6.96847, 1826746.78076, 69684.70000, 1591320267, 0, 1, 14, 15);
INSERT INTO `bw_merchant` VALUES (4141, '司容柏', 'BTC', 91.04488, 91.04488, 41.81082, 6344435.14933, 69684.70000, 1591320267, 0, 1, 48, 51);
INSERT INTO `bw_merchant` VALUES (4142, '景倩', 'BTC', 10.35871, 10.35871, 20.90541, 721843.59873, 69684.70000, 1591320267, 0, 1, 13, 15);
INSERT INTO `bw_merchant` VALUES (4143, '潘亮', 'BTC', 1.52310, 1.52310, 62.71623, 106136.76657, 69684.70000, 1591320268, 0, 1, 45, 48);
INSERT INTO `bw_merchant` VALUES (4144, '令狐宽毕', 'BTC', 6.76741, 6.76741, 6.96847, 471584.93562, 69684.70000, 1591320268, 0, 1, 29, 31);
INSERT INTO `bw_merchant` VALUES (4145, '单振', 'BTC', 21.61630, 21.61630, 6.96847, 1506325.38061, 69684.70000, 1591320268, 0, 1, 35, 42);
INSERT INTO `bw_merchant` VALUES (4146, '管劳', 'BTC', 75.03484, 75.03484, 55.74776, 5228780.31494, 69684.70000, 1591320268, 0, 1, 26, 33);
INSERT INTO `bw_merchant` VALUES (4147, '米苛潘', 'BTC', 48.41550, 48.41550, 34.84235, 3373819.59285, 69684.70000, 1591320268, 0, 1, 19, 20);
INSERT INTO `bw_merchant` VALUES (4148, '杜陈', 'BTC', 63.66173, 63.66173, 62.71623, 4436248.55653, 69684.70000, 1591320268, 0, 1, 26, 30);
INSERT INTO `bw_merchant` VALUES (4149, '夏云梁', 'BTC', 81.44917, 81.44917, 13.93694, 5675760.97669, 69684.70000, 1591320268, 0, 1, 42, 42);
INSERT INTO `bw_merchant` VALUES (4150, '周清', 'BTC', 39.72821, 39.72821, 6.96847, 2768448.39538, 69684.70000, 1591320268, 0, 1, 47, 49);
INSERT INTO `bw_merchant` VALUES (4151, '寇荀溥', 'BTC', 63.75564, 63.75564, 69.68470, 4442792.64670, 69684.70000, 1591320268, 0, 1, 32, 32);
INSERT INTO `bw_merchant` VALUES (4152, '缪哲路', 'BTC', 92.91487, 92.91487, 13.93694, 6474744.84148, 69684.70000, 1591320268, 0, 1, 49, 51);
INSERT INTO `bw_merchant` VALUES (4153, '茅宗', 'BTC', 74.50120, 74.50120, 20.90541, 5191593.77164, 69684.70000, 1591320268, 0, 1, 39, 46);
INSERT INTO `bw_merchant` VALUES (4154, '裘嵇', 'BTC', 25.52496, 25.52496, 55.74776, 1778699.18011, 69684.70000, 1591320268, 0, 1, 43, 49);
INSERT INTO `bw_merchant` VALUES (4155, '文河', 'BTC', 36.46315, 36.46315, 41.81082, 2540923.66880, 69684.70000, 1591320268, 0, 1, 34, 35);
INSERT INTO `bw_merchant` VALUES (4156, '高奚', 'BTC', 57.12572, 57.12572, 13.93694, 3980788.66048, 69684.70000, 1591320268, 0, 1, 10, 18);
INSERT INTO `bw_merchant` VALUES (4157, '符睿华', 'BTC', 46.76967, 46.76967, 27.87388, 3259130.42304, 69684.70000, 1591320268, 0, 1, 14, 22);
INSERT INTO `bw_merchant` VALUES (4158, '吴良屠', 'BTC', 5.13161, 5.13161, 41.81082, 357594.70336, 69684.70000, 1591320268, 0, 1, 13, 18);
INSERT INTO `bw_merchant` VALUES (4159, '浦菁', 'BTC', 39.24717, 39.24717, 69.68470, 2734927.26729, 69684.70000, 1591320268, 0, 1, 13, 14);
INSERT INTO `bw_merchant` VALUES (4160, '卢许步', 'BTC', 42.52975, 42.52975, 48.77929, 2963672.86982, 69684.70000, 1591320268, 0, 1, 33, 36);
INSERT INTO `bw_merchant` VALUES (4161, '习祝冉', 'BTC', 38.60513, 38.60513, 48.77929, 2690186.90251, 69684.70000, 1591320268, 0, 1, 29, 37);
INSERT INTO `bw_merchant` VALUES (4162, '熊兰庞', 'BTC', 47.25594, 47.25594, 55.74776, 3293016.00211, 69684.70000, 1591320268, 0, 1, 31, 31);
INSERT INTO `bw_merchant` VALUES (4163, '储文', 'BTC', 68.43793, 68.43793, 27.87388, 4769076.62067, 69684.70000, 1591320268, 0, 1, 36, 43);
INSERT INTO `bw_merchant` VALUES (4164, '翟秦', 'BTC', 93.57630, 93.57630, 69.68470, 6520836.39261, 69684.70000, 1591320268, 0, 1, 41, 44);
INSERT INTO `bw_merchant` VALUES (4165, '甄维', 'BTC', 76.67364, 76.67364, 41.81082, 5342979.60130, 69684.70000, 1591320268, 0, 1, 19, 20);
INSERT INTO `bw_merchant` VALUES (4166, '胥善', 'BTC', 43.12065, 43.12065, 55.74776, 3004849.55905, 69684.70000, 1591320268, 0, 1, 16, 21);
INSERT INTO `bw_merchant` VALUES (4167, '令狐岚', 'BTC', 4.29828, 4.29828, 20.90541, 299524.35231, 69684.70000, 1591320268, 0, 1, 49, 53);
INSERT INTO `bw_merchant` VALUES (4168, '陈素于', 'BTC', 46.86961, 46.86961, 55.74776, 3266094.71196, 69684.70000, 1591320268, 0, 1, 44, 48);
INSERT INTO `bw_merchant` VALUES (4169, '万平仇', 'BTC', 75.54925, 75.54925, 6.96847, 5264626.82147, 69684.70000, 1591320268, 0, 1, 37, 45);
INSERT INTO `bw_merchant` VALUES (4170, '喻卿逄', 'BTC', 67.68291, 67.68291, 41.81082, 4716463.27847, 69684.70000, 1591320269, 0, 1, 10, 16);
INSERT INTO `bw_merchant` VALUES (4171, '溥斌沈', 'BTC', 80.37847, 80.37847, 20.90541, 5601149.56840, 69684.70000, 1591320269, 0, 1, 16, 18);
INSERT INTO `bw_merchant` VALUES (4172, '宋康', 'BTC', 42.77617, 42.77617, 27.87388, 2980844.57359, 69684.70000, 1591320269, 0, 1, 42, 48);
INSERT INTO `bw_merchant` VALUES (4173, '宰楠霭', 'BTC', 9.65588, 9.65588, 48.77929, 672867.10103, 69684.70000, 1591320269, 0, 1, 50, 55);
INSERT INTO `bw_merchant` VALUES (4174, '轩辕尚', 'BTC', 40.66202, 40.66202, 48.77929, 2833520.66509, 69684.70000, 1591320269, 0, 1, 47, 55);
INSERT INTO `bw_merchant` VALUES (4175, '房谦颜', 'BTC', 33.45807, 33.45807, 6.96847, 2331515.57052, 69684.70000, 1591320269, 0, 1, 23, 31);
INSERT INTO `bw_merchant` VALUES (4176, '蓝露', 'BTC', 75.16265, 75.16265, 62.71623, 5237686.71645, 69684.70000, 1591320269, 0, 1, 23, 29);
INSERT INTO `bw_merchant` VALUES (4177, '巩范', 'BTC', 79.12118, 79.12118, 6.96847, 5513535.69194, 69684.70000, 1591320269, 0, 1, 44, 52);
INSERT INTO `bw_merchant` VALUES (4178, '舒哲裘', 'BTC', 88.54301, 88.54301, 34.84235, 6170093.08894, 69684.70000, 1591320269, 0, 1, 16, 24);
INSERT INTO `bw_merchant` VALUES (4179, '匡寒吴', 'BTC', 6.74161, 6.74161, 27.87388, 469787.07036, 69684.70000, 1591320269, 0, 1, 15, 23);
INSERT INTO `bw_merchant` VALUES (4180, '闻人廖', 'BTC', 30.77397, 30.77397, 41.81082, 2144474.86725, 69684.70000, 1591320269, 0, 1, 38, 42);
INSERT INTO `bw_merchant` VALUES (4181, '闵冉', 'BTC', 95.61507, 95.61507, 27.87388, 6662907.46842, 69684.70000, 1591320269, 0, 1, 14, 16);
INSERT INTO `bw_merchant` VALUES (4182, '严邵宣', 'BTC', 1.25522, 1.25522, 20.90541, 87469.62913, 69684.70000, 1591320269, 0, 1, 12, 20);
INSERT INTO `bw_merchant` VALUES (4183, '卫邢柴', 'BTC', 11.44531, 11.44531, 62.71623, 797562.99375, 69684.70000, 1591320269, 0, 1, 17, 25);
INSERT INTO `bw_merchant` VALUES (4184, '莫龙', 'BTC', 19.74998, 19.74998, 34.84235, 1376271.43130, 69684.70000, 1591320269, 0, 1, 37, 39);
INSERT INTO `bw_merchant` VALUES (4185, '司徒昌', 'BTC', 28.43624, 28.43624, 41.81082, 1981570.85352, 69684.70000, 1591320269, 0, 1, 36, 40);
INSERT INTO `bw_merchant` VALUES (4186, '夏王陶', 'BTC', 50.39949, 50.39949, 69.68470, 3512073.34080, 69684.70000, 1591320269, 0, 1, 41, 45);
INSERT INTO `bw_merchant` VALUES (4187, '凌馥燕', 'BTC', 24.34765, 24.34765, 69.68470, 1696658.68595, 69684.70000, 1591320269, 0, 1, 12, 16);
INSERT INTO `bw_merchant` VALUES (4188, '窦才郎', 'BTC', 92.51842, 92.51842, 34.84235, 6447118.34217, 69684.70000, 1591320269, 0, 1, 33, 40);
INSERT INTO `bw_merchant` VALUES (4189, '武永温', 'BTC', 26.58231, 26.58231, 34.84235, 1852380.29765, 69684.70000, 1591320269, 0, 1, 47, 54);
INSERT INTO `bw_merchant` VALUES (4190, '闵飞中', 'BTC', 60.86564, 60.86564, 6.96847, 4241403.86370, 69684.70000, 1591320269, 0, 1, 27, 33);
INSERT INTO `bw_merchant` VALUES (4191, '荣飘', 'BTC', 41.32772, 41.32772, 20.90541, 2879909.76988, 69684.70000, 1591320269, 0, 1, 17, 18);
INSERT INTO `bw_merchant` VALUES (4192, '索振', 'BTC', 11.42774, 11.42774, 13.93694, 796338.63357, 69684.70000, 1591320269, 0, 1, 43, 49);
INSERT INTO `bw_merchant` VALUES (4193, '茅毅', 'BTC', 87.70054, 87.70054, 55.74776, 6111385.81973, 69684.70000, 1591320270, 0, 1, 31, 33);
INSERT INTO `bw_merchant` VALUES (4194, '施邦容', 'BTC', 25.62948, 25.62948, 6.96847, 1785982.62495, 69684.70000, 1591320270, 0, 1, 49, 53);
INSERT INTO `bw_merchant` VALUES (4195, '周策', 'BTC', 17.50571, 17.50571, 48.77929, 1219880.14963, 69684.70000, 1591320270, 0, 1, 50, 52);
INSERT INTO `bw_merchant` VALUES (4196, '卞诚蓝', 'BTC', 34.46788, 34.46788, 6.96847, 2401883.87743, 69684.70000, 1591320270, 0, 1, 27, 28);
INSERT INTO `bw_merchant` VALUES (4197, '程文', 'BTC', 12.21113, 12.21113, 62.71623, 850928.93071, 69684.70000, 1591320270, 0, 1, 39, 47);
INSERT INTO `bw_merchant` VALUES (4198, '支湛', 'BTC', 21.94624, 21.94624, 48.77929, 1529317.15052, 69684.70000, 1591320270, 0, 1, 32, 40);
INSERT INTO `bw_merchant` VALUES (4199, '庞咏萧', 'BTC', 93.16252, 93.16252, 62.71623, 6492002.25744, 69684.70000, 1591320270, 0, 1, 31, 35);
INSERT INTO `bw_merchant` VALUES (4200, '任娄洪', 'BTC', 0.70945, 0.70945, 34.84235, 49437.81041, 69684.70000, 1591320270, 0, 1, 34, 36);
INSERT INTO `bw_merchant` VALUES (4201, '霍聂', 'BTC', 31.43666, 31.43666, 27.87388, 2190654.22110, 69684.70000, 1591320270, 0, 1, 20, 21);
INSERT INTO `bw_merchant` VALUES (4202, '仲孙菁', 'BTC', 72.08624, 72.08624, 48.77929, 5023308.00852, 69684.70000, 1591320270, 0, 1, 35, 38);
INSERT INTO `bw_merchant` VALUES (4203, '季静吉', 'BTC', 29.29951, 29.29951, 62.71623, 2041727.56449, 69684.70000, 1591320270, 0, 1, 25, 31);
INSERT INTO `bw_merchant` VALUES (4204, '林凡叶', 'BTC', 91.05245, 91.05245, 69.68470, 6344962.66251, 69684.70000, 1591320270, 0, 1, 24, 27);
INSERT INTO `bw_merchant` VALUES (4205, '穆薛', 'BTC', 16.02632, 16.02632, 13.93694, 1116789.30130, 69684.70000, 1591320270, 0, 1, 20, 23);
INSERT INTO `bw_merchant` VALUES (4206, '费都', 'BTC', 82.44771, 82.44771, 62.71623, 5745343.93703, 69684.70000, 1591320270, 0, 1, 49, 51);
INSERT INTO `bw_merchant` VALUES (4207, '池轮娣', 'BTC', 27.66728, 27.66728, 34.84235, 1927986.10661, 69684.70000, 1591320270, 0, 1, 44, 47);
INSERT INTO `bw_merchant` VALUES (4208, '张龚', 'BTC', 77.66795, 77.66795, 6.96847, 5412267.79536, 69684.70000, 1591320270, 0, 1, 17, 25);
INSERT INTO `bw_merchant` VALUES (4209, '邰申', 'BTC', 2.40921, 2.40921, 27.87388, 167885.07608, 69684.70000, 1591320270, 0, 1, 46, 49);
INSERT INTO `bw_merchant` VALUES (4210, '邹曼安', 'BTC', 94.36118, 94.36118, 6.96847, 6575530.51994, 69684.70000, 1591320270, 0, 1, 30, 33);
INSERT INTO `bw_merchant` VALUES (4211, '罗怡', 'BTC', 77.20525, 77.20525, 20.90541, 5380024.68467, 69684.70000, 1591320270, 0, 1, 44, 49);
INSERT INTO `bw_merchant` VALUES (4212, '魏谦莘', 'BTC', 72.32205, 72.32205, 27.87388, 5039740.35763, 69684.70000, 1591320270, 0, 1, 31, 39);
INSERT INTO `bw_merchant` VALUES (4213, '汪菡陶', 'BTC', 52.78508, 52.78508, 62.71623, 3678312.46427, 69684.70000, 1591320270, 0, 1, 40, 42);
INSERT INTO `bw_merchant` VALUES (4214, '黄湛', 'BTC', 3.40101, 3.40101, 41.81082, 236998.36154, 69684.70000, 1591320271, 0, 1, 44, 47);
INSERT INTO `bw_merchant` VALUES (4215, '伏菊连', 'BTC', 32.25968, 32.25968, 69.68470, 2248006.12289, 69684.70000, 1591320271, 0, 1, 42, 43);
INSERT INTO `bw_merchant` VALUES (4216, '邵曹', 'BTC', 40.84405, 40.84405, 13.93694, 2846205.37103, 69684.70000, 1591320271, 0, 1, 45, 49);
INSERT INTO `bw_merchant` VALUES (4217, '缪萧', 'BTC', 57.39775, 57.39775, 13.93694, 3999744.98942, 69684.70000, 1591320271, 0, 1, 46, 53);
INSERT INTO `bw_merchant` VALUES (4218, '倪费晏', 'BTC', 9.67146, 9.67146, 62.71623, 673952.78866, 69684.70000, 1591320271, 0, 1, 21, 22);
INSERT INTO `bw_merchant` VALUES (4219, '卞璐萱', 'BTC', 9.35344, 9.35344, 62.71623, 651791.66036, 69684.70000, 1591320271, 0, 1, 20, 27);
INSERT INTO `bw_merchant` VALUES (4220, '戚瑾易', 'BTC', 0.40739, 0.40739, 6.96847, 28388.84993, 69684.70000, 1591320271, 0, 1, 14, 22);
INSERT INTO `bw_merchant` VALUES (4221, '蒋平寇', 'BTC', 72.59790, 72.59790, 62.71623, 5058962.88213, 69684.70000, 1591320271, 0, 1, 44, 47);
INSERT INTO `bw_merchant` VALUES (4222, '宗政滢', 'BTC', 74.41157, 74.41157, 13.93694, 5185347.93197, 69684.70000, 1591320271, 0, 1, 30, 31);
INSERT INTO `bw_merchant` VALUES (4223, '丁珍', 'BTC', 45.38773, 45.38773, 6.96847, 3162830.34873, 69684.70000, 1591320271, 0, 1, 45, 47);
INSERT INTO `bw_merchant` VALUES (4224, '宁春', 'BTC', 67.25009, 67.25009, 27.87388, 4686302.34662, 69684.70000, 1591320271, 0, 1, 19, 23);
INSERT INTO `bw_merchant` VALUES (4225, '常天', 'BTC', 44.65800, 44.65800, 62.71623, 3111979.33260, 69684.70000, 1591320271, 0, 1, 37, 38);
INSERT INTO `bw_merchant` VALUES (4226, '徐离古', 'BTC', 92.15204, 92.15204, 20.90541, 6421587.26178, 69684.70000, 1591320271, 0, 1, 49, 57);
INSERT INTO `bw_merchant` VALUES (4227, '阙乐倩', 'BTC', 15.21940, 15.21940, 20.90541, 1060559.32318, 69684.70000, 1591320271, 0, 1, 45, 46);
INSERT INTO `bw_merchant` VALUES (4228, '李震芸', 'BTC', 13.67008, 13.67008, 13.93694, 952595.42377, 69684.70000, 1591320271, 0, 1, 11, 19);
INSERT INTO `bw_merchant` VALUES (4229, '狄发忠', 'BTC', 97.94879, 97.94879, 41.81082, 6825532.04651, 69684.70000, 1591320271, 0, 1, 26, 27);
INSERT INTO `bw_merchant` VALUES (4230, '党珠薛', 'BTC', 86.47755, 86.47755, 55.74776, 6026162.12848, 69684.70000, 1591320271, 0, 1, 47, 54);
INSERT INTO `bw_merchant` VALUES (4231, '贾进', 'ETH', 807.94663, 807.94663, 520.70100, 1402328.72729, 1735.67000, 1591320271, 0, 0, 16, 24);
INSERT INTO `bw_merchant` VALUES (4232, '向薇', 'ETH', 487.13417, 487.13417, 867.83500, 845504.16484, 1735.67000, 1591320271, 0, 0, 24, 32);
INSERT INTO `bw_merchant` VALUES (4233, '项仲', 'ETH', 777.01862, 777.01862, 694.26800, 1348647.90817, 1735.67000, 1591320272, 0, 0, 25, 28);
INSERT INTO `bw_merchant` VALUES (4234, '蒲贞丽', 'ETH', 750.90841, 750.90841, 694.26800, 1303329.19998, 1735.67000, 1591320272, 0, 0, 34, 36);
INSERT INTO `bw_merchant` VALUES (4235, '怀韵威', 'ETH', 568.31412, 568.31412, 1041.40200, 986405.76866, 1735.67000, 1591320272, 0, 0, 17, 21);
INSERT INTO `bw_merchant` VALUES (4236, '邰榕', 'ETH', 629.49897, 629.49897, 867.83500, 1092602.47725, 1735.67000, 1591320272, 0, 0, 31, 34);
INSERT INTO `bw_merchant` VALUES (4237, '通苏', 'ETH', 689.96148, 689.96148, 1214.96900, 1197545.44199, 1735.67000, 1591320272, 0, 0, 10, 11);
INSERT INTO `bw_merchant` VALUES (4238, '燕彬闵', 'ETH', 141.81077, 141.81077, 520.70100, 246136.69916, 1735.67000, 1591320272, 0, 0, 17, 19);
INSERT INTO `bw_merchant` VALUES (4239, '单于峰', 'ETH', 756.71453, 756.71453, 1214.96900, 1313406.70828, 1735.67000, 1591320272, 0, 0, 24, 29);
INSERT INTO `bw_merchant` VALUES (4240, '闻曼', 'ETH', 562.05792, 562.05792, 1735.67000, 975547.07000, 1735.67000, 1591320272, 0, 0, 49, 56);
INSERT INTO `bw_merchant` VALUES (4241, '司诚', 'ETH', 506.88382, 506.88382, 520.70100, 879783.03985, 1735.67000, 1591320272, 0, 0, 28, 28);
INSERT INTO `bw_merchant` VALUES (4242, '袁媛冯', 'ETH', 99.38487, 99.38487, 1041.40200, 172499.33731, 1735.67000, 1591320272, 0, 0, 43, 48);
INSERT INTO `bw_merchant` VALUES (4243, '黎娴亚', 'ETH', 336.10100, 336.10100, 1562.10300, 583360.42267, 1735.67000, 1591320272, 0, 0, 31, 39);
INSERT INTO `bw_merchant` VALUES (4244, '宗政超', 'ETH', 620.09500, 620.09500, 173.56700, 1076280.28865, 1735.67000, 1591320272, 0, 0, 41, 44);
INSERT INTO `bw_merchant` VALUES (4245, '管秋', 'ETH', 200.11112, 200.11112, 347.13400, 347326.86765, 1735.67000, 1591320272, 0, 0, 47, 54);
INSERT INTO `bw_merchant` VALUES (4246, '喻启周', 'ETH', 39.32005, 39.32005, 1041.40200, 68246.63118, 1735.67000, 1591320272, 0, 0, 33, 41);
INSERT INTO `bw_merchant` VALUES (4247, '柯储', 'ETH', 125.72863, 125.72863, 347.13400, 218223.41123, 1735.67000, 1591320272, 0, 0, 45, 52);
INSERT INTO `bw_merchant` VALUES (4248, '欧轮蓓', 'ETH', 532.05469, 532.05469, 1388.53600, 923471.36379, 1735.67000, 1591320272, 0, 0, 14, 16);
INSERT INTO `bw_merchant` VALUES (4249, '贺露诸', 'ETH', 48.65336, 48.65336, 867.83500, 84446.17735, 1735.67000, 1591320272, 0, 0, 45, 49);
INSERT INTO `bw_merchant` VALUES (4250, '司空薇池', 'ETH', 186.16827, 186.16827, 1735.67000, 323126.68119, 1735.67000, 1591320272, 0, 0, 11, 13);
INSERT INTO `bw_merchant` VALUES (4251, '冯项', 'ETH', 934.22878, 934.22878, 520.70100, 1621512.86658, 1735.67000, 1591320272, 0, 0, 49, 49);
INSERT INTO `bw_merchant` VALUES (4252, '常方', 'ETH', 316.08332, 316.08332, 867.83500, 548616.33602, 1735.67000, 1591320272, 0, 0, 32, 39);
INSERT INTO `bw_merchant` VALUES (4253, '秦罗', 'ETH', 877.05343, 877.05343, 694.26800, 1522275.32684, 1735.67000, 1591320272, 0, 0, 18, 18);
INSERT INTO `bw_merchant` VALUES (4254, '荆琛景', 'ETH', 561.94800, 561.94800, 867.83500, 975356.28516, 1735.67000, 1591320273, 0, 0, 26, 29);
INSERT INTO `bw_merchant` VALUES (4255, '古梅瑾', 'ETH', 229.20503, 229.20503, 1562.10300, 397824.29442, 1735.67000, 1591320273, 0, 0, 15, 22);
INSERT INTO `bw_merchant` VALUES (4256, '易裕', 'ETH', 134.07678, 134.07678, 1388.53600, 232713.04474, 1735.67000, 1591320273, 0, 0, 36, 42);
INSERT INTO `bw_merchant` VALUES (4257, '宁保屈', 'ETH', 817.15008, 817.15008, 347.13400, 1418302.87935, 1735.67000, 1591320273, 0, 0, 45, 52);
INSERT INTO `bw_merchant` VALUES (4258, '杜苛金', 'ETH', 767.13784, 767.13784, 1735.67000, 1331498.13475, 1735.67000, 1591320273, 0, 0, 16, 18);
INSERT INTO `bw_merchant` VALUES (4259, '尹启', 'ETH', 477.99636, 477.99636, 1735.67000, 829643.94216, 1735.67000, 1591320273, 0, 0, 23, 23);
INSERT INTO `bw_merchant` VALUES (4260, '喻琪阎', 'ETH', 958.95143, 958.95143, 520.70100, 1664423.22850, 1735.67000, 1591320273, 0, 0, 19, 24);
INSERT INTO `bw_merchant` VALUES (4261, '陈江', 'ETH', 498.03048, 498.03048, 694.26800, 864416.56322, 1735.67000, 1591320273, 0, 0, 18, 19);
INSERT INTO `bw_merchant` VALUES (4262, '卫贤', 'ETH', 263.20062, 263.20062, 173.56700, 456829.42011, 1735.67000, 1591320273, 0, 0, 46, 47);
INSERT INTO `bw_merchant` VALUES (4263, '郭艳朱', 'ETH', 784.08733, 784.08733, 520.70100, 1360916.85606, 1735.67000, 1591320273, 0, 0, 17, 19);
INSERT INTO `bw_merchant` VALUES (4264, '封雯鲍', 'ETH', 127.93716, 127.93716, 520.70100, 222056.69049, 1735.67000, 1591320273, 0, 0, 37, 42);
INSERT INTO `bw_merchant` VALUES (4265, '桑德', 'ETH', 934.17952, 934.17952, 694.26800, 1621427.36747, 1735.67000, 1591320273, 0, 0, 28, 29);
INSERT INTO `bw_merchant` VALUES (4266, '叶盛', 'ETH', 830.72679, 830.72679, 1214.96900, 1441867.56759, 1735.67000, 1591320273, 0, 0, 40, 43);
INSERT INTO `bw_merchant` VALUES (4267, '向兰', 'ETH', 74.86190, 74.86190, 1041.40200, 129935.55397, 1735.67000, 1591320273, 0, 0, 47, 48);
INSERT INTO `bw_merchant` VALUES (4268, '太叔玲', 'ETH', 419.16122, 419.16122, 694.26800, 727525.55471, 1735.67000, 1591320273, 0, 0, 26, 34);
INSERT INTO `bw_merchant` VALUES (4269, '罗春', 'ETH', 745.29431, 745.29431, 1562.10300, 1293584.97503, 1735.67000, 1591320273, 0, 0, 25, 30);
INSERT INTO `bw_merchant` VALUES (4270, '公冶季', 'ETH', 946.63129, 946.63129, 1388.53600, 1643039.53111, 1735.67000, 1591320273, 0, 0, 16, 23);
INSERT INTO `bw_merchant` VALUES (4271, '潘柴', 'ETH', 284.87400, 284.87400, 1735.67000, 494447.25558, 1735.67000, 1591320273, 0, 0, 30, 38);
INSERT INTO `bw_merchant` VALUES (4272, '杨鸿', 'ETH', 24.65184, 24.65184, 347.13400, 42787.45913, 1735.67000, 1591320273, 0, 0, 45, 49);
INSERT INTO `bw_merchant` VALUES (4273, '单荀满', 'ETH', 998.72882, 998.72882, 1562.10300, 1733463.65100, 1735.67000, 1591320273, 0, 0, 24, 25);
INSERT INTO `bw_merchant` VALUES (4274, '都凝', 'ETH', 531.88806, 531.88806, 520.70100, 923182.14910, 1735.67000, 1591320274, 0, 0, 27, 33);
INSERT INTO `bw_merchant` VALUES (4275, '宇文柔房', 'ETH', 734.23270, 734.23270, 1562.10300, 1274385.67040, 1735.67000, 1591320274, 0, 0, 46, 49);
INSERT INTO `bw_merchant` VALUES (4276, '杭昌解', 'ETH', 302.52140, 302.52140, 1041.40200, 525077.31833, 1735.67000, 1591320274, 0, 0, 33, 36);
INSERT INTO `bw_merchant` VALUES (4277, '曲姬穆', 'ETH', 172.88188, 172.88188, 1041.40200, 300065.89265, 1735.67000, 1591320274, 0, 0, 43, 48);
INSERT INTO `bw_merchant` VALUES (4278, '鲍穆', 'ETH', 755.20482, 755.20482, 867.83500, 1310786.34992, 1735.67000, 1591320274, 0, 0, 30, 32);
INSERT INTO `bw_merchant` VALUES (4279, '骆岩', 'ETH', 639.35120, 639.35120, 520.70100, 1109702.69730, 1735.67000, 1591320274, 0, 0, 32, 34);
INSERT INTO `bw_merchant` VALUES (4280, '齐孙溥', 'ETH', 210.33776, 210.33776, 1388.53600, 365076.93989, 1735.67000, 1591320274, 0, 0, 27, 30);
INSERT INTO `bw_merchant` VALUES (4281, '殷冯储', 'ETH', 479.18740, 479.18740, 867.83500, 831711.19455, 1735.67000, 1591320274, 0, 0, 46, 54);
INSERT INTO `bw_merchant` VALUES (4282, '苗洪左', 'ETH', 423.77153, 423.77153, 1388.53600, 735527.53147, 1735.67000, 1591320274, 0, 0, 19, 25);
INSERT INTO `bw_merchant` VALUES (4283, '庾宝梅', 'ETH', 874.08875, 874.08875, 1562.10300, 1517129.62071, 1735.67000, 1591320274, 0, 0, 43, 51);
INSERT INTO `bw_merchant` VALUES (4284, '卢轮颖', 'ETH', 175.03858, 175.03858, 520.70100, 303809.21214, 1735.67000, 1591320274, 0, 0, 47, 47);
INSERT INTO `bw_merchant` VALUES (4285, '阎欢', 'ETH', 984.27415, 984.27415, 347.13400, 1708375.11393, 1735.67000, 1591320274, 0, 0, 48, 49);
INSERT INTO `bw_merchant` VALUES (4286, '上官支', 'ETH', 572.05142, 572.05142, 1388.53600, 992892.48815, 1735.67000, 1591320274, 0, 0, 10, 12);
INSERT INTO `bw_merchant` VALUES (4287, '范姬宗', 'ETH', 915.89984, 915.89984, 1388.53600, 1589699.87529, 1735.67000, 1591320274, 0, 0, 20, 24);
INSERT INTO `bw_merchant` VALUES (4288, '令狐力', 'ETH', 589.00937, 589.00937, 1388.53600, 1022325.89322, 1735.67000, 1591320274, 0, 0, 14, 14);
INSERT INTO `bw_merchant` VALUES (4289, '董方', 'ETH', 316.11294, 316.11294, 520.70100, 548667.74656, 1735.67000, 1591320274, 0, 0, 35, 41);
INSERT INTO `bw_merchant` VALUES (4290, '轩辕腾扶', 'ETH', 780.96096, 780.96096, 1388.53600, 1355490.50944, 1735.67000, 1591320274, 0, 0, 41, 45);
INSERT INTO `bw_merchant` VALUES (4291, '文友奚', 'ETH', 793.80209, 793.80209, 867.83500, 1377778.47355, 1735.67000, 1591320274, 0, 0, 41, 49);
INSERT INTO `bw_merchant` VALUES (4292, '房滢易', 'ETH', 386.95735, 386.95735, 520.70100, 671630.26367, 1735.67000, 1591320274, 0, 0, 16, 20);
INSERT INTO `bw_merchant` VALUES (4293, '龙柏邢', 'ETH', 982.17037, 982.17037, 694.26800, 1704723.64609, 1735.67000, 1591320274, 0, 0, 35, 37);
INSERT INTO `bw_merchant` VALUES (4294, '欧萱', 'ETH', 477.07841, 477.07841, 1214.96900, 828050.68388, 1735.67000, 1591320274, 0, 0, 14, 22);
INSERT INTO `bw_merchant` VALUES (4295, '上官会朋', 'ETH', 454.84219, 454.84219, 1735.67000, 789455.94391, 1735.67000, 1591320274, 0, 0, 49, 51);
INSERT INTO `bw_merchant` VALUES (4296, '严玛', 'ETH', 343.02619, 343.02619, 1388.53600, 595380.26719, 1735.67000, 1591320274, 0, 0, 50, 53);
INSERT INTO `bw_merchant` VALUES (4297, '巩魏', 'ETH', 64.62090, 64.62090, 694.26800, 112160.55750, 1735.67000, 1591320274, 0, 0, 19, 23);
INSERT INTO `bw_merchant` VALUES (4298, '齐颖剑', 'ETH', 64.98128, 64.98128, 1214.96900, 112786.05825, 1735.67000, 1591320275, 0, 0, 35, 41);
INSERT INTO `bw_merchant` VALUES (4299, '寇汤', 'ETH', 752.70076, 752.70076, 520.70100, 1306440.12810, 1735.67000, 1591320275, 0, 0, 43, 45);
INSERT INTO `bw_merchant` VALUES (4300, '鲁凤毕', 'ETH', 494.47000, 494.47000, 173.56700, 858236.74490, 1735.67000, 1591320275, 0, 0, 43, 47);
INSERT INTO `bw_merchant` VALUES (4301, '梅桑', 'ETH', 834.61852, 834.61852, 347.13400, 1448622.32660, 1735.67000, 1591320275, 0, 0, 35, 42);
INSERT INTO `bw_merchant` VALUES (4302, '欧刚', 'ETH', 654.09053, 654.09053, 1388.53600, 1135285.31020, 1735.67000, 1591320275, 0, 0, 29, 34);
INSERT INTO `bw_merchant` VALUES (4303, '翟震', 'ETH', 882.88713, 882.88713, 694.26800, 1532400.70492, 1735.67000, 1591320275, 0, 0, 13, 21);
INSERT INTO `bw_merchant` VALUES (4304, '夏蓉', 'ETH', 305.72916, 305.72916, 1562.10300, 530644.93113, 1735.67000, 1591320275, 0, 0, 35, 42);
INSERT INTO `bw_merchant` VALUES (4305, '雷仪', 'ETH', 758.88448, 758.88448, 520.70100, 1317173.02540, 1735.67000, 1591320275, 0, 0, 45, 51);
INSERT INTO `bw_merchant` VALUES (4306, '吕盛乔', 'ETH', 541.66704, 541.66704, 1562.10300, 940155.23131, 1735.67000, 1591320275, 0, 0, 16, 21);
INSERT INTO `bw_merchant` VALUES (4307, '邰友', 'ETH', 449.81626, 449.81626, 694.26800, 780732.58799, 1735.67000, 1591320275, 0, 0, 12, 20);
INSERT INTO `bw_merchant` VALUES (4308, '戚烁', 'ETH', 851.08752, 851.08752, 1562.10300, 1477207.07583, 1735.67000, 1591320275, 0, 0, 29, 29);
INSERT INTO `bw_merchant` VALUES (4309, '平梁吴', 'ETH', 249.39409, 249.39409, 1214.96900, 432865.84019, 1735.67000, 1591320275, 0, 0, 28, 32);
INSERT INTO `bw_merchant` VALUES (4310, '闵航', 'ETH', 327.81895, 327.81895, 520.70100, 568985.51694, 1735.67000, 1591320275, 0, 0, 41, 47);
INSERT INTO `bw_merchant` VALUES (4311, '庞彪', 'ETH', 959.14375, 959.14375, 1041.40200, 1664757.03256, 1735.67000, 1591320275, 0, 0, 37, 45);
INSERT INTO `bw_merchant` VALUES (4312, '褚林', 'ETH', 275.10531, 275.10531, 1735.67000, 477492.03340, 1735.67000, 1591320275, 0, 0, 49, 50);
INSERT INTO `bw_merchant` VALUES (4313, '颜祥', 'ETH', 276.50678, 276.50678, 1388.53600, 479924.52284, 1735.67000, 1591320275, 0, 0, 26, 32);
INSERT INTO `bw_merchant` VALUES (4314, '贾戚', 'ETH', 405.71730, 405.71730, 694.26800, 704191.34609, 1735.67000, 1591320275, 0, 0, 24, 30);
INSERT INTO `bw_merchant` VALUES (4315, '毛傅元', 'ETH', 852.50596, 852.50596, 347.13400, 1479669.01959, 1735.67000, 1591320275, 0, 0, 29, 30);
INSERT INTO `bw_merchant` VALUES (4316, '单炎成', 'ETH', 791.13734, 791.13734, 1735.67000, 1373153.34691, 1735.67000, 1591320275, 0, 0, 44, 46);
INSERT INTO `bw_merchant` VALUES (4317, '堵峰堂', 'ETH', 26.26400, 26.26400, 694.26800, 45585.63688, 1735.67000, 1591320275, 0, 0, 33, 34);
INSERT INTO `bw_merchant` VALUES (4318, '闻应', 'ETH', 630.54732, 630.54732, 1562.10300, 1094422.06690, 1735.67000, 1591320275, 0, 0, 19, 24);
INSERT INTO `bw_merchant` VALUES (4319, '赫连琳', 'ETH', 721.45562, 721.45562, 347.13400, 1252208.87596, 1735.67000, 1591320275, 0, 0, 36, 43);
INSERT INTO `bw_merchant` VALUES (4320, '向杨刘', 'ETH', 199.82150, 199.82150, 1562.10300, 346824.18290, 1735.67000, 1591320275, 0, 0, 26, 27);
INSERT INTO `bw_merchant` VALUES (4321, '裘寿', 'ETH', 739.62518, 739.62518, 694.26800, 1283745.23617, 1735.67000, 1591320275, 0, 0, 34, 39);
INSERT INTO `bw_merchant` VALUES (4322, '申詹', 'ETH', 30.23056, 30.23056, 867.83500, 52470.27607, 1735.67000, 1591320275, 0, 0, 34, 39);
INSERT INTO `bw_merchant` VALUES (4323, '鲍平', 'ETH', 303.43874, 303.43874, 173.56700, 526669.51785, 1735.67000, 1591320276, 0, 0, 26, 32);
INSERT INTO `bw_merchant` VALUES (4324, '茅连', 'ETH', 238.94688, 238.94688, 867.83500, 414732.93120, 1735.67000, 1591320276, 0, 0, 31, 34);
INSERT INTO `bw_merchant` VALUES (4325, '范英', 'ETH', 280.41920, 280.41920, 1562.10300, 486715.19286, 1735.67000, 1591320276, 0, 0, 38, 46);
INSERT INTO `bw_merchant` VALUES (4326, '邹坚雷', 'ETH', 481.49928, 481.49928, 1388.53600, 835723.85531, 1735.67000, 1591320276, 0, 0, 25, 27);
INSERT INTO `bw_merchant` VALUES (4327, '万珠', 'ETH', 290.84015, 290.84015, 347.13400, 504802.52315, 1735.67000, 1591320276, 0, 0, 23, 25);
INSERT INTO `bw_merchant` VALUES (4328, '元元成', 'ETH', 760.17881, 760.17881, 867.83500, 1319419.55515, 1735.67000, 1591320276, 0, 0, 26, 28);
INSERT INTO `bw_merchant` VALUES (4329, '戴泽秀', 'ETH', 77.96379, 77.96379, 1041.40200, 135319.41138, 1735.67000, 1591320276, 0, 0, 11, 18);
INSERT INTO `bw_merchant` VALUES (4330, '秦致', 'ETH', 791.56493, 791.56493, 694.26800, 1373895.50205, 1735.67000, 1591320276, 0, 0, 48, 51);
INSERT INTO `bw_merchant` VALUES (4331, '皇甫惠', 'ETH', 171.82135, 171.82135, 347.13400, 298225.16255, 1735.67000, 1591320276, 0, 1, 22, 24);
INSERT INTO `bw_merchant` VALUES (4332, '储爱浦', 'ETH', 659.56027, 659.56027, 1041.40200, 1144778.97383, 1735.67000, 1591320276, 0, 1, 34, 34);
INSERT INTO `bw_merchant` VALUES (4333, '终金', 'ETH', 452.19507, 452.19507, 1735.67000, 784861.41714, 1735.67000, 1591320276, 0, 1, 12, 16);
INSERT INTO `bw_merchant` VALUES (4334, '雍行滢', 'ETH', 142.83499, 142.83499, 1041.40200, 247914.40709, 1735.67000, 1591320276, 0, 1, 48, 54);
INSERT INTO `bw_merchant` VALUES (4335, '荀屈', 'ETH', 349.87782, 349.87782, 694.26800, 607272.43583, 1735.67000, 1591320276, 0, 1, 32, 38);
INSERT INTO `bw_merchant` VALUES (4336, '王纨', 'ETH', 289.41239, 289.41239, 1735.67000, 502324.40295, 1735.67000, 1591320276, 0, 1, 25, 26);
INSERT INTO `bw_merchant` VALUES (4337, '支詹', 'ETH', 188.16962, 188.16962, 1041.40200, 326600.36434, 1735.67000, 1591320276, 0, 1, 47, 50);
INSERT INTO `bw_merchant` VALUES (4338, '卢育', 'ETH', 234.02241, 234.02241, 173.56700, 406185.67636, 1735.67000, 1591320276, 0, 1, 16, 19);
INSERT INTO `bw_merchant` VALUES (4339, '穆钧', 'ETH', 298.35003, 298.35003, 1041.40200, 517837.19657, 1735.67000, 1591320276, 0, 1, 19, 26);
INSERT INTO `bw_merchant` VALUES (4340, '陆星时', 'ETH', 30.40465, 30.40465, 1388.53600, 52772.43886, 1735.67000, 1591320276, 0, 1, 15, 19);
INSERT INTO `bw_merchant` VALUES (4341, '党和苏', 'ETH', 981.11768, 981.11768, 694.26800, 1702896.52364, 1735.67000, 1591320276, 0, 1, 29, 29);
INSERT INTO `bw_merchant` VALUES (4342, '齐蓝', 'ETH', 71.97164, 71.97164, 694.26800, 124919.01639, 1735.67000, 1591320276, 0, 1, 41, 42);
INSERT INTO `bw_merchant` VALUES (4343, '蒲颖琴', 'ETH', 439.38813, 439.38813, 520.70100, 762632.79559, 1735.67000, 1591320276, 0, 1, 25, 33);
INSERT INTO `bw_merchant` VALUES (4344, '霍崔胥', 'ETH', 150.26570, 150.26570, 1041.40200, 260811.66751, 1735.67000, 1591320276, 0, 1, 26, 27);
INSERT INTO `bw_merchant` VALUES (4345, '庞奚', 'ETH', 196.26389, 196.26389, 347.13400, 340649.34595, 1735.67000, 1591320276, 0, 1, 21, 27);
INSERT INTO `bw_merchant` VALUES (4346, '项辰花', 'ETH', 104.22906, 104.22906, 867.83500, 180907.25257, 1735.67000, 1591320277, 0, 1, 27, 35);
INSERT INTO `bw_merchant` VALUES (4347, '袁承纪', 'ETH', 156.10616, 156.10616, 1735.67000, 270948.77872, 1735.67000, 1591320277, 0, 1, 35, 37);
INSERT INTO `bw_merchant` VALUES (4348, '谈沈', 'ETH', 403.32780, 403.32780, 867.83500, 700043.96262, 1735.67000, 1591320277, 0, 1, 32, 36);
INSERT INTO `bw_merchant` VALUES (4349, '戚桂', 'ETH', 255.98182, 255.98182, 694.26800, 444299.96551, 1735.67000, 1591320277, 0, 1, 35, 42);
INSERT INTO `bw_merchant` VALUES (4350, '尉迟凤', 'ETH', 194.94455, 194.94455, 867.83500, 338359.40709, 1735.67000, 1591320277, 0, 1, 46, 47);
INSERT INTO `bw_merchant` VALUES (4351, '应韦', 'ETH', 966.47952, 966.47952, 1562.10300, 1677489.50847, 1735.67000, 1591320277, 0, 1, 13, 15);
INSERT INTO `bw_merchant` VALUES (4352, '邵柴', 'ETH', 844.91297, 844.91297, 867.83500, 1466490.09463, 1735.67000, 1591320277, 0, 1, 10, 13);
INSERT INTO `bw_merchant` VALUES (4353, '骆瑶蓉', 'ETH', 928.59740, 928.59740, 1735.67000, 1611738.64925, 1735.67000, 1591320277, 0, 1, 24, 29);
INSERT INTO `bw_merchant` VALUES (4354, '罗奚', 'ETH', 117.16907, 117.16907, 1562.10300, 203366.83972, 1735.67000, 1591320277, 0, 1, 14, 22);
INSERT INTO `bw_merchant` VALUES (4355, '淳于宗尹', 'ETH', 295.68071, 295.68071, 173.56700, 513204.13792, 1735.67000, 1591320277, 0, 1, 48, 49);
INSERT INTO `bw_merchant` VALUES (4356, '寇菡庾', 'ETH', 524.71837, 524.71837, 1388.53600, 910737.93325, 1735.67000, 1591320277, 0, 1, 25, 28);
INSERT INTO `bw_merchant` VALUES (4357, '欧傅', 'ETH', 907.02571, 907.02571, 520.70100, 1574297.31407, 1735.67000, 1591320277, 0, 1, 12, 16);
INSERT INTO `bw_merchant` VALUES (4358, '浦冉', 'ETH', 842.80030, 842.80030, 1214.96900, 1462823.19670, 1735.67000, 1591320277, 0, 1, 25, 32);
INSERT INTO `bw_merchant` VALUES (4359, '令狐学', 'ETH', 622.22351, 622.22351, 1735.67000, 1079974.67960, 1735.67000, 1591320277, 0, 1, 35, 43);
INSERT INTO `bw_merchant` VALUES (4360, '农涛心', 'ETH', 719.68632, 719.68632, 173.56700, 1249137.95503, 1735.67000, 1591320277, 0, 1, 34, 35);
INSERT INTO `bw_merchant` VALUES (4361, '柏昌', 'ETH', 375.37527, 375.37527, 1388.53600, 651527.59488, 1735.67000, 1591320277, 0, 1, 29, 29);
INSERT INTO `bw_merchant` VALUES (4362, '申屠曹叶', 'ETH', 950.08527, 950.08527, 347.13400, 1649034.50058, 1735.67000, 1591320277, 0, 1, 50, 50);
INSERT INTO `bw_merchant` VALUES (4363, '林环杨', 'ETH', 867.32747, 867.32747, 520.70100, 1505394.26985, 1735.67000, 1591320277, 0, 1, 28, 31);
INSERT INTO `bw_merchant` VALUES (4364, '黄融', 'ETH', 871.89050, 871.89050, 1041.40200, 1513314.18413, 1735.67000, 1591320277, 0, 1, 23, 27);
INSERT INTO `bw_merchant` VALUES (4365, '纪娜庞', 'ETH', 47.17740, 47.17740, 1388.53600, 81884.39785, 1735.67000, 1591320277, 0, 1, 42, 48);
INSERT INTO `bw_merchant` VALUES (4366, '庞亨', 'ETH', 399.50316, 399.50316, 1214.96900, 693405.64971, 1735.67000, 1591320277, 0, 1, 45, 47);
INSERT INTO `bw_merchant` VALUES (4367, '张发苗', 'ETH', 764.21789, 764.21789, 1041.40200, 1326430.06513, 1735.67000, 1591320277, 0, 1, 11, 17);
INSERT INTO `bw_merchant` VALUES (4368, '解乐霭', 'ETH', 897.71792, 897.71792, 173.56700, 1558142.06220, 1735.67000, 1591320277, 0, 1, 21, 29);
INSERT INTO `bw_merchant` VALUES (4369, '高房师', 'ETH', 542.49941, 542.49941, 520.70100, 941599.95095, 1735.67000, 1591320278, 0, 1, 33, 37);
INSERT INTO `bw_merchant` VALUES (4370, '澹台龚', 'ETH', 780.37739, 780.37739, 347.13400, 1354477.62450, 1735.67000, 1591320278, 0, 1, 23, 28);
INSERT INTO `bw_merchant` VALUES (4371, '吉发轮', 'ETH', 817.00311, 817.00311, 173.56700, 1418047.78793, 1735.67000, 1591320278, 0, 1, 32, 35);
INSERT INTO `bw_merchant` VALUES (4372, '夏侯致艳', 'ETH', 138.83514, 138.83514, 173.56700, 240971.98744, 1735.67000, 1591320278, 0, 1, 29, 29);
INSERT INTO `bw_merchant` VALUES (4373, '吉龚', 'ETH', 183.96789, 183.96789, 1735.67000, 319307.54763, 1735.67000, 1591320278, 0, 1, 25, 25);
INSERT INTO `bw_merchant` VALUES (4374, '高士希', 'ETH', 685.94555, 685.94555, 1214.96900, 1190575.11276, 1735.67000, 1591320278, 0, 1, 18, 23);
INSERT INTO `bw_merchant` VALUES (4375, '水露', 'ETH', 274.88146, 274.88146, 867.83500, 477103.50367, 1735.67000, 1591320278, 0, 1, 33, 40);
INSERT INTO `bw_merchant` VALUES (4376, '熊羽洋', 'ETH', 59.81389, 59.81389, 1562.10300, 103817.17445, 1735.67000, 1591320278, 0, 1, 28, 34);
INSERT INTO `bw_merchant` VALUES (4377, '蒋汤', 'ETH', 608.57551, 608.57551, 173.56700, 1056286.25544, 1735.67000, 1591320278, 0, 1, 45, 50);
INSERT INTO `bw_merchant` VALUES (4378, '方伯馨', 'ETH', 586.13782, 586.13782, 173.56700, 1017341.83003, 1735.67000, 1591320278, 0, 1, 35, 39);
INSERT INTO `bw_merchant` VALUES (4379, '唐明', 'ETH', 433.59796, 433.59796, 1388.53600, 752582.97123, 1735.67000, 1591320278, 0, 1, 48, 52);
INSERT INTO `bw_merchant` VALUES (4380, '曲唐', 'ETH', 93.04435, 93.04435, 1735.67000, 161494.28696, 1735.67000, 1591320278, 0, 1, 48, 55);
INSERT INTO `bw_merchant` VALUES (4381, '申黛', 'ETH', 248.95603, 248.95603, 694.26800, 432105.51259, 1735.67000, 1591320278, 0, 1, 39, 41);
INSERT INTO `bw_merchant` VALUES (4382, '包素', 'ETH', 521.65291, 521.65291, 1041.40200, 905417.30629, 1735.67000, 1591320278, 0, 1, 11, 16);
INSERT INTO `bw_merchant` VALUES (4383, '萧康琴', 'ETH', 971.96856, 971.96856, 694.26800, 1687016.67053, 1735.67000, 1591320278, 0, 1, 15, 20);
INSERT INTO `bw_merchant` VALUES (4384, '钱管', 'ETH', 817.81653, 817.81653, 694.26800, 1419459.61662, 1735.67000, 1591320278, 0, 1, 29, 30);
INSERT INTO `bw_merchant` VALUES (4385, '戚珠', 'ETH', 308.51747, 308.51747, 1735.67000, 535484.51715, 1735.67000, 1591320278, 0, 1, 47, 48);
INSERT INTO `bw_merchant` VALUES (4386, '皇甫以', 'ETH', 115.20087, 115.20087, 347.13400, 199950.69403, 1735.67000, 1591320278, 0, 1, 30, 36);
INSERT INTO `bw_merchant` VALUES (4387, '龚骅邱', 'ETH', 642.50766, 642.50766, 520.70100, 1115181.27023, 1735.67000, 1591320278, 0, 1, 43, 43);
INSERT INTO `bw_merchant` VALUES (4388, '项梵李', 'ETH', 976.54605, 976.54605, 1214.96900, 1694961.68260, 1735.67000, 1591320278, 0, 1, 48, 51);
INSERT INTO `bw_merchant` VALUES (4389, '缪绿', 'ETH', 835.28634, 835.28634, 1388.53600, 1449781.44174, 1735.67000, 1591320278, 0, 1, 43, 49);
INSERT INTO `bw_merchant` VALUES (4390, '易卓', 'ETH', 416.34722, 416.34722, 1735.67000, 722641.37933, 1735.67000, 1591320278, 0, 1, 41, 48);
INSERT INTO `bw_merchant` VALUES (4391, '李淑高', 'ETH', 511.43125, 511.43125, 1214.96900, 887675.87768, 1735.67000, 1591320278, 0, 1, 21, 22);
INSERT INTO `bw_merchant` VALUES (4392, '令狐利林', 'ETH', 944.34208, 944.34208, 694.26800, 1639066.21799, 1735.67000, 1591320278, 0, 1, 40, 46);
INSERT INTO `bw_merchant` VALUES (4393, '万蒋杜', 'ETH', 159.11128, 159.11128, 173.56700, 276164.67535, 1735.67000, 1591320278, 0, 1, 39, 44);
INSERT INTO `bw_merchant` VALUES (4394, '莫飞涛', 'ETH', 451.15449, 451.15449, 1735.67000, 783055.31365, 1735.67000, 1591320279, 0, 1, 15, 18);
INSERT INTO `bw_merchant` VALUES (4395, '池有沈', 'ETH', 690.11985, 690.11985, 1041.40200, 1197820.32004, 1735.67000, 1591320279, 0, 1, 43, 48);
INSERT INTO `bw_merchant` VALUES (4396, '通伊', 'ETH', 639.69985, 639.69985, 867.83500, 1110307.83864, 1735.67000, 1591320279, 0, 1, 42, 46);
INSERT INTO `bw_merchant` VALUES (4397, '司徒梁曼', 'ETH', 133.98076, 133.98076, 1388.53600, 232546.38570, 1735.67000, 1591320279, 0, 1, 21, 26);
INSERT INTO `bw_merchant` VALUES (4398, '魏发坚', 'ETH', 119.62632, 119.62632, 867.83500, 207631.81483, 1735.67000, 1591320279, 0, 1, 42, 43);
INSERT INTO `bw_merchant` VALUES (4399, '沈翠马', 'ETH', 900.81632, 900.81632, 1214.96900, 1563519.86213, 1735.67000, 1591320279, 0, 1, 14, 15);
INSERT INTO `bw_merchant` VALUES (4400, '堵陆', 'ETH', 139.40318, 139.40318, 520.70100, 241957.91743, 1735.67000, 1591320279, 0, 1, 15, 20);
INSERT INTO `bw_merchant` VALUES (4401, '华严', 'ETH', 514.97495, 514.97495, 1214.96900, 893826.57146, 1735.67000, 1591320279, 0, 1, 44, 52);
INSERT INTO `bw_merchant` VALUES (4402, '戴陈汪', 'ETH', 311.06594, 311.06594, 694.26800, 539907.82007, 1735.67000, 1591320279, 0, 1, 14, 17);
INSERT INTO `bw_merchant` VALUES (4403, '安郝', 'ETH', 919.56235, 919.56235, 520.70100, 1596056.78402, 1735.67000, 1591320279, 0, 1, 45, 53);
INSERT INTO `bw_merchant` VALUES (4404, '伏中', 'ETH', 159.86823, 159.86823, 1735.67000, 277478.49076, 1735.67000, 1591320279, 0, 1, 25, 32);
INSERT INTO `bw_merchant` VALUES (4405, '陶蒲', 'ETH', 690.48820, 690.48820, 867.83500, 1198459.65409, 1735.67000, 1591320279, 0, 1, 48, 56);
INSERT INTO `bw_merchant` VALUES (4406, '甄诚安', 'ETH', 134.27447, 134.27447, 520.70100, 233056.16934, 1735.67000, 1591320279, 0, 1, 26, 30);
INSERT INTO `bw_merchant` VALUES (4407, '上官刚劳', 'ETH', 766.16302, 766.16302, 694.26800, 1329806.16892, 1735.67000, 1591320279, 0, 1, 35, 37);
INSERT INTO `bw_merchant` VALUES (4408, '司马泰成', 'ETH', 364.03634, 364.03634, 867.83500, 631846.95424, 1735.67000, 1591320279, 0, 1, 47, 50);
INSERT INTO `bw_merchant` VALUES (4409, '长孙承苗', 'ETH', 792.94026, 792.94026, 1214.96900, 1376282.62107, 1735.67000, 1591320279, 0, 1, 36, 41);
INSERT INTO `bw_merchant` VALUES (4410, '通月茜', 'ETH', 208.54429, 208.54429, 1214.96900, 361964.06782, 1735.67000, 1591320279, 0, 1, 40, 48);
INSERT INTO `bw_merchant` VALUES (4411, '支露寇', 'ETH', 156.71900, 156.71900, 1562.10300, 272012.46673, 1735.67000, 1591320279, 0, 1, 17, 19);
INSERT INTO `bw_merchant` VALUES (4412, '池刘', 'ETH', 826.01834, 826.01834, 1214.96900, 1433695.25218, 1735.67000, 1591320279, 0, 1, 46, 54);
INSERT INTO `bw_merchant` VALUES (4413, '荣雄', 'ETH', 993.07088, 993.07088, 1214.96900, 1723643.33428, 1735.67000, 1591320280, 0, 1, 38, 45);
INSERT INTO `bw_merchant` VALUES (4414, '上官邓', 'ETH', 911.63457, 911.63457, 173.56700, 1582296.77411, 1735.67000, 1591320280, 0, 1, 43, 51);
INSERT INTO `bw_merchant` VALUES (4415, '陶叶', 'ETH', 800.81235, 800.81235, 173.56700, 1389945.97152, 1735.67000, 1591320280, 0, 1, 31, 32);
INSERT INTO `bw_merchant` VALUES (4416, '谢姬', 'ETH', 222.59680, 222.59680, 867.83500, 386354.58785, 1735.67000, 1591320280, 0, 1, 24, 29);
INSERT INTO `bw_merchant` VALUES (4417, '梅殷怀', 'ETH', 879.24363, 879.24363, 1388.53600, 1526076.79128, 1735.67000, 1591320280, 0, 1, 37, 45);
INSERT INTO `bw_merchant` VALUES (4418, '都巧莎', 'ETH', 775.31174, 775.31174, 1388.53600, 1345685.32776, 1735.67000, 1591320280, 0, 1, 25, 25);
INSERT INTO `bw_merchant` VALUES (4419, '左绿', 'ETH', 627.08990, 627.08990, 694.26800, 1088421.12673, 1735.67000, 1591320280, 0, 1, 31, 38);
INSERT INTO `bw_merchant` VALUES (4420, '严唐', 'ETH', 961.72722, 961.72722, 1214.96900, 1669241.08393, 1735.67000, 1591320280, 0, 1, 24, 32);
INSERT INTO `bw_merchant` VALUES (4421, '薛淑郎', 'ETH', 95.28448, 95.28448, 1562.10300, 165382.41340, 1735.67000, 1591320280, 0, 1, 39, 46);
INSERT INTO `bw_merchant` VALUES (4422, '左秀鲁', 'ETH', 903.50995, 903.50995, 520.70100, 1568195.11491, 1735.67000, 1591320280, 0, 1, 32, 38);
INSERT INTO `bw_merchant` VALUES (4423, '成维莘', 'ETH', 506.16228, 506.16228, 694.26800, 878530.68452, 1735.67000, 1591320280, 0, 1, 11, 16);
INSERT INTO `bw_merchant` VALUES (4424, '黄琛柯', 'ETH', 506.64759, 506.64759, 1562.10300, 879373.02253, 1735.67000, 1591320280, 0, 1, 14, 19);
INSERT INTO `bw_merchant` VALUES (4425, '慕容生', 'ETH', 448.17662, 448.17662, 1735.67000, 777886.71403, 1735.67000, 1591320280, 0, 1, 46, 50);
INSERT INTO `bw_merchant` VALUES (4426, '昌浩', 'ETH', 645.23449, 645.23449, 1735.67000, 1119914.14725, 1735.67000, 1591320280, 0, 1, 38, 42);
INSERT INTO `bw_merchant` VALUES (4427, '申瑞宝', 'ETH', 890.38966, 890.38966, 1214.96900, 1545422.62117, 1735.67000, 1591320280, 0, 1, 19, 22);
INSERT INTO `bw_merchant` VALUES (4428, '郎凡琦', 'ETH', 67.84033, 67.84033, 347.13400, 117748.42557, 1735.67000, 1591320280, 0, 1, 21, 27);
INSERT INTO `bw_merchant` VALUES (4429, '储萱', 'ETH', 892.18372, 892.18372, 1735.67000, 1548536.51729, 1735.67000, 1591320280, 0, 1, 33, 33);
INSERT INTO `bw_merchant` VALUES (4430, '支舒', 'ETH', 719.73671, 719.73671, 173.56700, 1249225.41544, 1735.67000, 1591320280, 0, 1, 37, 40);
INSERT INTO `bw_merchant` VALUES (4431, '潘风阳', 'USDT', 4338.74124, 4338.74124, 5.68064, 30808.53379, 7.10080, 1591320280, 0, 0, 38, 42);
INSERT INTO `bw_merchant` VALUES (4432, '谭竹', 'USDT', 5097.20014, 5097.20014, 2.13024, 36194.19875, 7.10080, 1591320280, 0, 0, 17, 21);
INSERT INTO `bw_merchant` VALUES (4433, '符纨', 'USDT', 2664.36922, 2664.36922, 3.55040, 18919.15295, 7.10080, 1591320280, 0, 0, 17, 19);
INSERT INTO `bw_merchant` VALUES (4434, '寇裘弘', 'USDT', 500.92389, 500.92389, 6.39072, 3556.96035, 7.10080, 1591320280, 0, 0, 50, 52);
INSERT INTO `bw_merchant` VALUES (4435, '吴谈姬', 'USDT', 2465.52583, 2465.52583, 4.97056, 17507.20581, 7.10080, 1591320280, 0, 0, 16, 16);
INSERT INTO `bw_merchant` VALUES (4436, '诸刚哲', 'USDT', 2617.39113, 2617.39113, 4.26048, 18585.57093, 7.10080, 1591320280, 0, 0, 19, 22);
INSERT INTO `bw_merchant` VALUES (4437, '令狐邵诸', 'USDT', 4568.30503, 4568.30503, 3.55040, 32438.62035, 7.10080, 1591320281, 0, 0, 41, 47);
INSERT INTO `bw_merchant` VALUES (4438, '元雷', 'USDT', 1349.33520, 1349.33520, 2.13024, 9581.35938, 7.10080, 1591320281, 0, 0, 41, 49);
INSERT INTO `bw_merchant` VALUES (4439, '古露景', 'USDT', 1594.12652, 1594.12652, 2.13024, 11319.57359, 7.10080, 1591320281, 0, 0, 38, 41);
INSERT INTO `bw_merchant` VALUES (4440, '房香夏', 'USDT', 3515.24735, 3515.24735, 5.68064, 24961.06838, 7.10080, 1591320281, 0, 0, 37, 39);
INSERT INTO `bw_merchant` VALUES (4441, '熊宰', 'USDT', 556.95012, 556.95012, 0.71008, 3954.79141, 7.10080, 1591320281, 0, 0, 50, 53);
INSERT INTO `bw_merchant` VALUES (4442, '黄容逸', 'USDT', 1025.76085, 1025.76085, 4.26048, 7283.72264, 7.10080, 1591320281, 0, 0, 42, 50);
INSERT INTO `bw_merchant` VALUES (4443, '别素成', 'USDT', 3442.91785, 3442.91785, 5.68064, 24447.47106, 7.10080, 1591320281, 0, 0, 23, 30);
INSERT INTO `bw_merchant` VALUES (4444, '宣茅', 'USDT', 2236.39292, 2236.39292, 4.97056, 15880.17884, 7.10080, 1591320281, 0, 0, 33, 38);
INSERT INTO `bw_merchant` VALUES (4445, '冯龙', 'USDT', 2853.16510, 2853.16510, 2.84032, 20259.75474, 7.10080, 1591320281, 0, 0, 14, 14);
INSERT INTO `bw_merchant` VALUES (4446, '向涛贝', 'USDT', 683.89288, 683.89288, 5.68064, 4856.18656, 7.10080, 1591320281, 0, 0, 21, 25);
INSERT INTO `bw_merchant` VALUES (4447, '殷烟', 'USDT', 559.88607, 559.88607, 4.26048, 3975.63900, 7.10080, 1591320281, 0, 0, 47, 54);
INSERT INTO `bw_merchant` VALUES (4448, '傅士', 'USDT', 4185.56574, 4185.56574, 4.97056, 29720.86520, 7.10080, 1591320281, 0, 0, 12, 15);
INSERT INTO `bw_merchant` VALUES (4449, '鲍杰欣', 'USDT', 3899.38595, 3899.38595, 6.39072, 27688.75975, 7.10080, 1591320281, 0, 0, 42, 49);
INSERT INTO `bw_merchant` VALUES (4450, '黄时聪', 'USDT', 5249.53268, 5249.53268, 5.68064, 37275.88165, 7.10080, 1591320281, 0, 0, 31, 39);
INSERT INTO `bw_merchant` VALUES (4451, '丁惠', 'USDT', 4631.70724, 4631.70724, 5.68064, 32888.82676, 7.10080, 1591320281, 0, 0, 27, 32);
INSERT INTO `bw_merchant` VALUES (4452, '施裴', 'USDT', 2244.29617, 2244.29617, 1.42016, 15936.29824, 7.10080, 1591320281, 0, 0, 50, 53);
INSERT INTO `bw_merchant` VALUES (4453, '狄包龙', 'USDT', 4608.48328, 4608.48328, 4.97056, 32723.91807, 7.10080, 1591320281, 0, 0, 46, 54);
INSERT INTO `bw_merchant` VALUES (4454, '公冶彪群', 'USDT', 1363.26038, 1363.26038, 4.26048, 9680.23930, 7.10080, 1591320281, 0, 0, 32, 32);
INSERT INTO `bw_merchant` VALUES (4455, '嵇成', 'USDT', 842.97236, 842.97236, 6.39072, 5985.77813, 7.10080, 1591320281, 0, 0, 16, 19);
INSERT INTO `bw_merchant` VALUES (4456, '严聪黄', 'USDT', 5353.29837, 5353.29837, 1.42016, 38012.70106, 7.10080, 1591320281, 0, 0, 41, 43);
INSERT INTO `bw_merchant` VALUES (4457, '邢程韦', 'USDT', 3863.20663, 3863.20663, 4.26048, 27431.85763, 7.10080, 1591320281, 0, 0, 38, 45);
INSERT INTO `bw_merchant` VALUES (4458, '花汤', 'USDT', 2883.47948, 2883.47948, 6.39072, 20475.01109, 7.10080, 1591320281, 0, 0, 26, 31);
INSERT INTO `bw_merchant` VALUES (4459, '卓航毛', 'USDT', 2399.96363, 2399.96363, 2.13024, 17041.66174, 7.10080, 1591320281, 0, 0, 50, 56);
INSERT INTO `bw_merchant` VALUES (4460, '柯珠', 'USDT', 1013.07519, 1013.07519, 0.71008, 7193.64430, 7.10080, 1591320281, 0, 0, 36, 42);
INSERT INTO `bw_merchant` VALUES (4461, '宣屠', 'USDT', 4275.90897, 4275.90897, 4.97056, 30362.37441, 7.10080, 1591320282, 0, 0, 25, 26);
INSERT INTO `bw_merchant` VALUES (4462, '潘伦吕', 'USDT', 5225.29182, 5225.29182, 4.26048, 37103.75215, 7.10080, 1591320282, 0, 0, 36, 41);
INSERT INTO `bw_merchant` VALUES (4463, '索以陶', 'USDT', 2237.27563, 2237.27563, 4.97056, 15886.44679, 7.10080, 1591320282, 0, 0, 38, 42);
INSERT INTO `bw_merchant` VALUES (4464, '薛金黄', 'USDT', 3293.60168, 3293.60168, 7.10080, 23387.20680, 7.10080, 1591320282, 0, 0, 33, 36);
INSERT INTO `bw_merchant` VALUES (4465, '汪媛伊', 'USDT', 4285.72549, 4285.72549, 0.71008, 30432.07955, 7.10080, 1591320282, 0, 0, 23, 25);
INSERT INTO `bw_merchant` VALUES (4466, '苏星', 'USDT', 1175.27587, 1175.27587, 1.42016, 8345.39889, 7.10080, 1591320282, 0, 0, 42, 46);
INSERT INTO `bw_merchant` VALUES (4467, '卓程曼', 'USDT', 969.84986, 969.84986, 5.68064, 6886.70988, 7.10080, 1591320282, 0, 0, 12, 13);
INSERT INTO `bw_merchant` VALUES (4468, '舒珊', 'USDT', 4879.23353, 4879.23353, 6.39072, 34646.46144, 7.10080, 1591320282, 0, 0, 10, 16);
INSERT INTO `bw_merchant` VALUES (4469, '仇姜', 'USDT', 2664.38363, 2664.38363, 6.39072, 18919.25527, 7.10080, 1591320282, 0, 0, 48, 51);
INSERT INTO `bw_merchant` VALUES (4470, '耿惠', 'USDT', 2386.32502, 2386.32502, 1.42016, 16944.81670, 7.10080, 1591320282, 0, 0, 28, 32);
INSERT INTO `bw_merchant` VALUES (4471, '路兰剑', 'USDT', 5310.96844, 5310.96844, 2.84032, 37712.12469, 7.10080, 1591320282, 0, 0, 37, 39);
INSERT INTO `bw_merchant` VALUES (4472, '阙幸', 'USDT', 5398.10719, 5398.10719, 4.97056, 38330.87953, 7.10080, 1591320282, 0, 0, 34, 39);
INSERT INTO `bw_merchant` VALUES (4473, '储欢', 'USDT', 1525.43704, 1525.43704, 4.26048, 10831.82333, 7.10080, 1591320282, 0, 0, 44, 45);
INSERT INTO `bw_merchant` VALUES (4474, '阙梵', 'USDT', 3665.82776, 3665.82776, 4.26048, 26030.30975, 7.10080, 1591320282, 0, 0, 44, 50);
INSERT INTO `bw_merchant` VALUES (4475, '舒祥苏', 'USDT', 267.97492, 267.97492, 2.84032, 1902.83631, 7.10080, 1591320282, 0, 0, 48, 52);
INSERT INTO `bw_merchant` VALUES (4476, '袁狄', 'USDT', 2341.05822, 2341.05822, 0.71008, 16623.38620, 7.10080, 1591320282, 0, 0, 19, 27);
INSERT INTO `bw_merchant` VALUES (4477, '印冠', 'USDT', 4481.53497, 4481.53497, 5.68064, 31822.48351, 7.10080, 1591320282, 0, 0, 23, 24);
INSERT INTO `bw_merchant` VALUES (4478, '杜俊鹏', 'USDT', 418.60142, 418.60142, 1.42016, 2972.40496, 7.10080, 1591320282, 0, 0, 21, 21);
INSERT INTO `bw_merchant` VALUES (4479, '池娄', 'USDT', 1844.69006, 1844.69006, 5.68064, 13098.77517, 7.10080, 1591320282, 0, 0, 16, 24);
INSERT INTO `bw_merchant` VALUES (4480, '姬全淑', 'USDT', 4065.32677, 4065.32677, 5.68064, 28867.07232, 7.10080, 1591320282, 0, 0, 19, 19);
INSERT INTO `bw_merchant` VALUES (4481, '裘力耿', 'USDT', 984.43686, 984.43686, 1.42016, 6990.28925, 7.10080, 1591320282, 0, 0, 29, 35);
INSERT INTO `bw_merchant` VALUES (4482, '葛骆', 'USDT', 2929.58551, 2929.58551, 2.84032, 20802.40078, 7.10080, 1591320282, 0, 0, 14, 18);
INSERT INTO `bw_merchant` VALUES (4483, '荀张', 'USDT', 1111.71100, 1111.71100, 4.97056, 7894.03746, 7.10080, 1591320282, 0, 0, 29, 33);
INSERT INTO `bw_merchant` VALUES (4484, '邱聂', 'USDT', 1697.22161, 1697.22161, 6.39072, 12051.63120, 7.10080, 1591320282, 0, 0, 15, 15);
INSERT INTO `bw_merchant` VALUES (4485, '莘英娜', 'USDT', 1367.86800, 1367.86800, 4.97056, 9712.95709, 7.10080, 1591320283, 0, 0, 14, 19);
INSERT INTO `bw_merchant` VALUES (4486, '庞博', 'USDT', 4793.89295, 4793.89295, 4.26048, 34040.47505, 7.10080, 1591320283, 0, 0, 39, 46);
INSERT INTO `bw_merchant` VALUES (4487, '金莎枫', 'USDT', 3493.20608, 3493.20608, 2.13024, 24804.55773, 7.10080, 1591320283, 0, 0, 27, 31);
INSERT INTO `bw_merchant` VALUES (4488, '柳徐', 'USDT', 780.55639, 780.55639, 0.71008, 5542.57481, 7.10080, 1591320283, 0, 0, 35, 35);
INSERT INTO `bw_merchant` VALUES (4489, '国海哲', 'USDT', 2967.57615, 2967.57615, 4.97056, 21072.16472, 7.10080, 1591320283, 0, 0, 19, 19);
INSERT INTO `bw_merchant` VALUES (4490, '钱管', 'USDT', 3506.71712, 3506.71712, 5.68064, 24900.49692, 7.10080, 1591320283, 0, 0, 23, 30);
INSERT INTO `bw_merchant` VALUES (4491, '汤罗田', 'USDT', 4279.17689, 4279.17689, 0.71008, 30385.57926, 7.10080, 1591320283, 0, 0, 26, 28);
INSERT INTO `bw_merchant` VALUES (4492, '寿士姚', 'USDT', 3006.24210, 3006.24210, 7.10080, 21346.72390, 7.10080, 1591320283, 0, 0, 37, 40);
INSERT INTO `bw_merchant` VALUES (4493, '左清', 'USDT', 3345.72139, 3345.72139, 7.10080, 23757.29844, 7.10080, 1591320283, 0, 0, 35, 43);
INSERT INTO `bw_merchant` VALUES (4494, '齐强柳', 'USDT', 653.65030, 653.65030, 3.55040, 4641.44005, 7.10080, 1591320283, 0, 0, 26, 29);
INSERT INTO `bw_merchant` VALUES (4495, '广筠', 'USDT', 329.53864, 329.53864, 2.13024, 2339.98797, 7.10080, 1591320283, 0, 0, 11, 18);
INSERT INTO `bw_merchant` VALUES (4496, '葛桂', 'USDT', 2872.31542, 2872.31542, 4.97056, 20395.73733, 7.10080, 1591320283, 0, 0, 49, 52);
INSERT INTO `bw_merchant` VALUES (4497, '陆堵', 'USDT', 486.63152, 486.63152, 2.13024, 3455.47309, 7.10080, 1591320283, 0, 0, 30, 33);
INSERT INTO `bw_merchant` VALUES (4498, '濮阳宽', 'USDT', 2363.44685, 2363.44685, 0.71008, 16782.36339, 7.10080, 1591320283, 0, 0, 43, 50);
INSERT INTO `bw_merchant` VALUES (4499, '司颖纪', 'USDT', 4366.55372, 4366.55372, 4.97056, 31006.02465, 7.10080, 1591320283, 0, 0, 21, 23);
INSERT INTO `bw_merchant` VALUES (4500, '耿伦春', 'USDT', 381.83475, 381.83475, 7.10080, 2711.33219, 7.10080, 1591320283, 0, 0, 50, 53);
INSERT INTO `bw_merchant` VALUES (4501, '晏朗顾', 'USDT', 574.56625, 574.56625, 3.55040, 4079.88002, 7.10080, 1591320283, 0, 0, 37, 37);
INSERT INTO `bw_merchant` VALUES (4502, '逄韦', 'USDT', 4618.83651, 4618.83651, 1.42016, 32797.43429, 7.10080, 1591320283, 0, 0, 24, 30);
INSERT INTO `bw_merchant` VALUES (4503, '匡菁柴', 'USDT', 3527.34722, 3527.34722, 1.42016, 25046.98713, 7.10080, 1591320283, 0, 0, 12, 14);
INSERT INTO `bw_merchant` VALUES (4504, '欧阳梁吉', 'USDT', 4082.35082, 4082.35082, 1.42016, 28987.95670, 7.10080, 1591320283, 0, 0, 12, 14);
INSERT INTO `bw_merchant` VALUES (4505, '嵇雅', 'USDT', 796.38664, 796.38664, 5.68064, 5654.98225, 7.10080, 1591320283, 0, 0, 22, 29);
INSERT INTO `bw_merchant` VALUES (4506, '易航聪', 'USDT', 5359.28315, 5359.28315, 3.55040, 38055.19779, 7.10080, 1591320283, 0, 0, 30, 38);
INSERT INTO `bw_merchant` VALUES (4507, '盛文', 'USDT', 4670.97144, 4670.97144, 7.10080, 33167.63400, 7.10080, 1591320283, 0, 0, 10, 16);
INSERT INTO `bw_merchant` VALUES (4508, '吉谭弘', 'USDT', 3239.99335, 3239.99335, 4.97056, 23006.54477, 7.10080, 1591320283, 0, 0, 31, 39);
INSERT INTO `bw_merchant` VALUES (4509, '惠邓', 'USDT', 147.60218, 147.60218, 4.97056, 1048.09355, 7.10080, 1591320284, 0, 0, 46, 51);
INSERT INTO `bw_merchant` VALUES (4510, '谈杨', 'USDT', 913.05662, 913.05662, 3.55040, 6483.43244, 7.10080, 1591320284, 0, 0, 31, 39);
INSERT INTO `bw_merchant` VALUES (4511, '赫连斌葛', 'USDT', 2642.85065, 2642.85065, 5.68064, 18766.35389, 7.10080, 1591320284, 0, 0, 38, 44);
INSERT INTO `bw_merchant` VALUES (4512, '关云', 'USDT', 4542.10408, 4542.10408, 3.55040, 32252.57265, 7.10080, 1591320284, 0, 0, 14, 18);
INSERT INTO `bw_merchant` VALUES (4513, '史唯', 'USDT', 2530.38324, 2530.38324, 5.68064, 17967.74531, 7.10080, 1591320284, 0, 0, 47, 54);
INSERT INTO `bw_merchant` VALUES (4514, '郑友翰', 'USDT', 533.99185, 533.99185, 2.13024, 3791.76932, 7.10080, 1591320284, 0, 0, 46, 52);
INSERT INTO `bw_merchant` VALUES (4515, '娄威', 'USDT', 521.69301, 521.69301, 0.71008, 3704.43772, 7.10080, 1591320284, 0, 0, 23, 25);
INSERT INTO `bw_merchant` VALUES (4516, '姬固竹', 'USDT', 2139.05840, 2139.05840, 3.55040, 15189.02588, 7.10080, 1591320284, 0, 0, 48, 50);
INSERT INTO `bw_merchant` VALUES (4517, '龙彩曼', 'USDT', 1136.65330, 1136.65330, 4.97056, 8071.14775, 7.10080, 1591320284, 0, 0, 20, 23);
INSERT INTO `bw_merchant` VALUES (4518, '黎庞', 'USDT', 677.92587, 677.92587, 4.97056, 4813.81601, 7.10080, 1591320284, 0, 0, 12, 13);
INSERT INTO `bw_merchant` VALUES (4519, '皇甫欧', 'USDT', 1303.67763, 1303.67763, 5.68064, 9257.15411, 7.10080, 1591320284, 0, 0, 32, 33);
INSERT INTO `bw_merchant` VALUES (4520, '卢剑', 'USDT', 3565.11959, 3565.11959, 3.55040, 25315.20118, 7.10080, 1591320284, 0, 0, 10, 11);
INSERT INTO `bw_merchant` VALUES (4521, '慕容筠', 'USDT', 2146.52019, 2146.52019, 2.84032, 15242.01056, 7.10080, 1591320284, 0, 0, 50, 57);
INSERT INTO `bw_merchant` VALUES (4522, '卫方', 'USDT', 3587.10309, 3587.10309, 6.39072, 25471.30162, 7.10080, 1591320284, 0, 0, 13, 15);
INSERT INTO `bw_merchant` VALUES (4523, '李钟终', 'USDT', 215.39633, 215.39633, 5.68064, 1529.48626, 7.10080, 1591320284, 0, 0, 18, 20);
INSERT INTO `bw_merchant` VALUES (4524, '管幸', 'USDT', 334.98360, 334.98360, 1.42016, 2378.65154, 7.10080, 1591320284, 0, 0, 44, 49);
INSERT INTO `bw_merchant` VALUES (4525, '匡素郑', 'USDT', 5503.36689, 5503.36689, 3.55040, 39078.30761, 7.10080, 1591320284, 0, 0, 33, 39);
INSERT INTO `bw_merchant` VALUES (4526, '池童', 'USDT', 3036.73636, 3036.73636, 2.13024, 21563.25754, 7.10080, 1591320284, 0, 0, 18, 25);
INSERT INTO `bw_merchant` VALUES (4527, '幸江园', 'USDT', 1725.45883, 1725.45883, 4.26048, 12252.13806, 7.10080, 1591320284, 0, 0, 43, 48);
INSERT INTO `bw_merchant` VALUES (4528, '司马邢', 'USDT', 409.47563, 409.47563, 6.39072, 2907.60455, 7.10080, 1591320284, 0, 0, 34, 34);
INSERT INTO `bw_merchant` VALUES (4529, '仇朱宰', 'USDT', 3990.41474, 3990.41474, 4.97056, 28335.13698, 7.10080, 1591320284, 0, 0, 38, 39);
INSERT INTO `bw_merchant` VALUES (4530, '柏谢惠', 'USDT', 5346.40859, 5346.40859, 7.10080, 37963.77811, 7.10080, 1591320284, 0, 0, 20, 22);
INSERT INTO `bw_merchant` VALUES (4531, '单达云', 'USDT', 2588.83711, 2588.83711, 2.84032, 18382.81455, 7.10080, 1591320285, 0, 1, 29, 34);
INSERT INTO `bw_merchant` VALUES (4532, '钟罡', 'USDT', 2198.54386, 2198.54386, 2.84032, 15611.42024, 7.10080, 1591320285, 0, 1, 22, 28);
INSERT INTO `bw_merchant` VALUES (4533, '终陈奚', 'USDT', 682.73966, 682.73966, 4.97056, 4847.99777, 7.10080, 1591320285, 0, 1, 50, 56);
INSERT INTO `bw_merchant` VALUES (4534, '苏达', 'USDT', 1732.17933, 1732.17933, 2.13024, 12299.85898, 7.10080, 1591320285, 0, 1, 25, 25);
INSERT INTO `bw_merchant` VALUES (4535, '谭池', 'USDT', 5176.21758, 5176.21758, 4.26048, 36755.28579, 7.10080, 1591320285, 0, 1, 24, 26);
INSERT INTO `bw_merchant` VALUES (4536, '单致', 'USDT', 1225.76920, 1225.76920, 5.68064, 8703.94193, 7.10080, 1591320285, 0, 1, 27, 35);
INSERT INTO `bw_merchant` VALUES (4537, '赖易', 'USDT', 2730.24811, 2730.24811, 2.13024, 19386.94577, 7.10080, 1591320285, 0, 1, 29, 31);
INSERT INTO `bw_merchant` VALUES (4538, '匡怡', 'USDT', 728.75876, 728.75876, 7.10080, 5174.77020, 7.10080, 1591320285, 0, 1, 33, 41);
INSERT INTO `bw_merchant` VALUES (4539, '聂善', 'USDT', 2876.07603, 2876.07603, 2.84032, 20422.44067, 7.10080, 1591320285, 0, 1, 42, 50);
INSERT INTO `bw_merchant` VALUES (4540, '别和', 'USDT', 4138.19917, 4138.19917, 4.26048, 29384.52466, 7.10080, 1591320285, 0, 1, 12, 19);
INSERT INTO `bw_merchant` VALUES (4541, '谭兰季', 'USDT', 3753.34182, 3753.34182, 5.68064, 26651.72959, 7.10080, 1591320285, 0, 1, 49, 52);
INSERT INTO `bw_merchant` VALUES (4542, '堵樊', 'USDT', 4230.11844, 4230.11844, 2.13024, 30037.22501, 7.10080, 1591320285, 0, 1, 39, 44);
INSERT INTO `bw_merchant` VALUES (4543, '凤丁劳', 'USDT', 2837.21854, 2837.21854, 6.39072, 20146.52140, 7.10080, 1591320285, 0, 1, 27, 29);
INSERT INTO `bw_merchant` VALUES (4544, '邹功杜', 'USDT', 5512.50919, 5512.50919, 5.68064, 39143.22525, 7.10080, 1591320285, 0, 1, 14, 21);
INSERT INTO `bw_merchant` VALUES (4545, '别栋蕊', 'USDT', 2655.66700, 2655.66700, 6.39072, 18857.36023, 7.10080, 1591320285, 0, 1, 24, 29);
INSERT INTO `bw_merchant` VALUES (4546, '孟宝祁', 'USDT', 4965.85019, 4965.85019, 5.68064, 35261.50902, 7.10080, 1591320285, 0, 1, 26, 29);
INSERT INTO `bw_merchant` VALUES (4547, '袁香浦', 'USDT', 3955.14171, 3955.14171, 3.55040, 28084.67025, 7.10080, 1591320285, 0, 1, 46, 50);
INSERT INTO `bw_merchant` VALUES (4548, '宣蓉', 'USDT', 5399.63744, 5399.63744, 2.13024, 38341.74553, 7.10080, 1591320285, 0, 1, 48, 55);
INSERT INTO `bw_merchant` VALUES (4549, '卞强先', 'USDT', 4727.67848, 4727.67848, 3.55040, 33570.29935, 7.10080, 1591320285, 0, 1, 43, 44);
INSERT INTO `bw_merchant` VALUES (4550, '彭心宗', 'USDT', 257.15349, 257.15349, 4.97056, 1825.99550, 7.10080, 1591320285, 0, 1, 38, 46);
INSERT INTO `bw_merchant` VALUES (4551, '王璐', 'USDT', 1531.26046, 1531.26046, 2.84032, 10873.17427, 7.10080, 1591320285, 0, 1, 12, 12);
INSERT INTO `bw_merchant` VALUES (4552, '奚枫袁', 'USDT', 4346.72294, 4346.72294, 6.39072, 30865.21025, 7.10080, 1591320285, 0, 1, 50, 52);
INSERT INTO `bw_merchant` VALUES (4553, '严堵', 'USDT', 670.58634, 670.58634, 5.68064, 4761.69948, 7.10080, 1591320285, 0, 1, 24, 27);
INSERT INTO `bw_merchant` VALUES (4554, '宋婉张', 'USDT', 2345.06166, 2345.06166, 5.68064, 16651.81383, 7.10080, 1591320285, 0, 1, 48, 54);
INSERT INTO `bw_merchant` VALUES (4555, '曲英', 'USDT', 4270.95145, 4270.95145, 4.97056, 30327.17205, 7.10080, 1591320286, 0, 1, 15, 21);
INSERT INTO `bw_merchant` VALUES (4556, '梁新桑', 'USDT', 4235.01850, 4235.01850, 5.68064, 30072.01936, 7.10080, 1591320286, 0, 1, 27, 30);
INSERT INTO `bw_merchant` VALUES (4557, '元达娴', 'USDT', 575.06211, 575.06211, 6.39072, 4083.40103, 7.10080, 1591320286, 0, 1, 12, 20);
INSERT INTO `bw_merchant` VALUES (4558, '广池', 'USDT', 2900.36637, 2900.36637, 6.39072, 20594.92152, 7.10080, 1591320286, 0, 1, 25, 30);
INSERT INTO `bw_merchant` VALUES (4559, '雷伏', 'USDT', 633.41338, 633.41338, 1.42016, 4497.74172, 7.10080, 1591320286, 0, 1, 36, 36);
INSERT INTO `bw_merchant` VALUES (4560, '元悦宜', 'USDT', 5115.77182, 5115.77182, 2.84032, 36326.07253, 7.10080, 1591320286, 0, 1, 24, 32);
INSERT INTO `bw_merchant` VALUES (4561, '诸葛秋', 'USDT', 3266.85229, 3266.85229, 7.10080, 23197.26474, 7.10080, 1591320286, 0, 1, 18, 19);
INSERT INTO `bw_merchant` VALUES (4562, '邱士', 'USDT', 4909.53471, 4909.53471, 4.26048, 34861.62406, 7.10080, 1591320286, 0, 1, 26, 27);
INSERT INTO `bw_merchant` VALUES (4563, '郝东燕', 'USDT', 5394.11766, 5394.11766, 6.39072, 38302.55068, 7.10080, 1591320286, 0, 1, 32, 39);
INSERT INTO `bw_merchant` VALUES (4564, '雷辉志', 'USDT', 293.01737, 293.01737, 4.26048, 2080.65774, 7.10080, 1591320286, 0, 1, 49, 49);
INSERT INTO `bw_merchant` VALUES (4565, '费滢孟', 'USDT', 703.62323, 703.62323, 7.10080, 4996.28783, 7.10080, 1591320286, 0, 1, 34, 38);
INSERT INTO `bw_merchant` VALUES (4566, '程威云', 'USDT', 1101.41410, 1101.41410, 2.84032, 7820.92124, 7.10080, 1591320286, 0, 1, 25, 31);
INSERT INTO `bw_merchant` VALUES (4567, '闻人罡', 'USDT', 586.29939, 586.29939, 5.68064, 4163.19470, 7.10080, 1591320286, 0, 1, 10, 17);
INSERT INTO `bw_merchant` VALUES (4568, '殷习阙', 'USDT', 3238.56358, 3238.56358, 6.39072, 22996.39226, 7.10080, 1591320286, 0, 1, 37, 45);
INSERT INTO `bw_merchant` VALUES (4569, '缪房', 'USDT', 943.67169, 943.67169, 4.26048, 6700.82393, 7.10080, 1591320286, 0, 1, 44, 50);
INSERT INTO `bw_merchant` VALUES (4570, '关震澜', 'USDT', 1478.47777, 1478.47777, 4.26048, 10498.37494, 7.10080, 1591320286, 0, 1, 47, 48);
INSERT INTO `bw_merchant` VALUES (4571, '唐闵', 'USDT', 4737.63502, 4737.63502, 0.71008, 33640.99875, 7.10080, 1591320286, 0, 1, 11, 16);
INSERT INTO `bw_merchant` VALUES (4572, '裘梦茅', 'USDT', 4031.64650, 4031.64650, 4.97056, 28627.91546, 7.10080, 1591320286, 0, 1, 18, 20);
INSERT INTO `bw_merchant` VALUES (4573, '别叶', 'USDT', 4266.88894, 4266.88894, 7.10080, 30298.32498, 7.10080, 1591320286, 0, 1, 24, 27);
INSERT INTO `bw_merchant` VALUES (4574, '洪宁', 'USDT', 951.34406, 951.34406, 2.84032, 6755.30390, 7.10080, 1591320286, 0, 1, 43, 50);
INSERT INTO `bw_merchant` VALUES (4575, '穆郑耿', 'USDT', 5002.20569, 5002.20569, 3.55040, 35519.66216, 7.10080, 1591320286, 0, 1, 20, 27);
INSERT INTO `bw_merchant` VALUES (4576, '严承左', 'USDT', 1516.19456, 1516.19456, 7.10080, 10766.19433, 7.10080, 1591320287, 0, 1, 41, 45);
INSERT INTO `bw_merchant` VALUES (4577, '萧志茅', 'USDT', 249.84692, 249.84692, 4.26048, 1774.11300, 7.10080, 1591320287, 0, 1, 16, 24);
INSERT INTO `bw_merchant` VALUES (4578, '支群', 'USDT', 4729.35438, 4729.35438, 4.97056, 33582.19958, 7.10080, 1591320287, 0, 1, 18, 23);
INSERT INTO `bw_merchant` VALUES (4579, '姬武荔', 'USDT', 222.79501, 222.79501, 1.42016, 1582.02280, 7.10080, 1591320287, 0, 1, 13, 13);
INSERT INTO `bw_merchant` VALUES (4580, '党婵', 'USDT', 2736.23011, 2736.23011, 4.97056, 19429.42276, 7.10080, 1591320287, 0, 1, 30, 32);
INSERT INTO `bw_merchant` VALUES (4581, '屠阮', 'USDT', 3646.15666, 3646.15666, 2.13024, 25890.62921, 7.10080, 1591320287, 0, 1, 44, 48);
INSERT INTO `bw_merchant` VALUES (4582, '茅和先', 'USDT', 5123.61143, 5123.61143, 4.97056, 36381.74004, 7.10080, 1591320287, 0, 1, 23, 31);
INSERT INTO `bw_merchant` VALUES (4583, '单于眉', 'USDT', 1404.77368, 1404.77368, 4.26048, 9975.01694, 7.10080, 1591320287, 0, 1, 33, 34);
INSERT INTO `bw_merchant` VALUES (4584, '溥孔', 'USDT', 1678.01098, 1678.01098, 4.26048, 11915.22036, 7.10080, 1591320287, 0, 1, 12, 15);
INSERT INTO `bw_merchant` VALUES (4585, '鲍国罗', 'USDT', 4886.12479, 4886.12479, 4.26048, 34695.39490, 7.10080, 1591320287, 0, 1, 23, 29);
INSERT INTO `bw_merchant` VALUES (4586, '申屠雨', 'USDT', 1659.52808, 1659.52808, 7.10080, 11783.97699, 7.10080, 1591320287, 0, 1, 17, 22);
INSERT INTO `bw_merchant` VALUES (4587, '姬华唐', 'USDT', 1968.01031, 1968.01031, 6.39072, 13974.44760, 7.10080, 1591320287, 0, 1, 42, 47);
INSERT INTO `bw_merchant` VALUES (4588, '昌苇', 'USDT', 2092.02560, 2092.02560, 4.97056, 14855.05538, 7.10080, 1591320287, 0, 1, 26, 29);
INSERT INTO `bw_merchant` VALUES (4589, '向翰', 'USDT', 3042.19749, 3042.19749, 0.71008, 21602.03593, 7.10080, 1591320287, 0, 1, 17, 23);
INSERT INTO `bw_merchant` VALUES (4590, '伏中', 'USDT', 4962.79449, 4962.79449, 2.13024, 35239.81111, 7.10080, 1591320287, 0, 1, 30, 35);
INSERT INTO `bw_merchant` VALUES (4591, '毕韦东', 'USDT', 4472.27719, 4472.27719, 1.42016, 31756.74587, 7.10080, 1591320287, 0, 1, 32, 33);
INSERT INTO `bw_merchant` VALUES (4592, '邓倪黎', 'USDT', 663.91679, 663.91679, 4.97056, 4714.34034, 7.10080, 1591320287, 0, 1, 41, 41);
INSERT INTO `bw_merchant` VALUES (4593, '凌穆扶', 'USDT', 2397.24521, 2397.24521, 2.84032, 17022.35878, 7.10080, 1591320287, 0, 1, 13, 21);
INSERT INTO `bw_merchant` VALUES (4594, '易孔', 'USDT', 4676.96448, 4676.96448, 7.10080, 33210.18937, 7.10080, 1591320287, 0, 1, 13, 21);
INSERT INTO `bw_merchant` VALUES (4595, '申窦', 'USDT', 5519.43658, 5519.43658, 6.39072, 39192.41526, 7.10080, 1591320287, 0, 1, 22, 28);
INSERT INTO `bw_merchant` VALUES (4596, '蔡烁', 'USDT', 4651.70845, 4651.70845, 7.10080, 33030.85136, 7.10080, 1591320287, 0, 1, 30, 30);
INSERT INTO `bw_merchant` VALUES (4597, '孔成凤', 'USDT', 1728.24854, 1728.24854, 0.71008, 12271.94723, 7.10080, 1591320287, 0, 1, 30, 32);
INSERT INTO `bw_merchant` VALUES (4598, '庄姣', 'USDT', 360.03901, 360.03901, 4.97056, 2556.56500, 7.10080, 1591320288, 0, 1, 20, 27);
INSERT INTO `bw_merchant` VALUES (4599, '桑容', 'USDT', 3675.70571, 3675.70571, 4.97056, 26100.45110, 7.10080, 1591320288, 0, 1, 33, 34);
INSERT INTO `bw_merchant` VALUES (4600, '湛鸿巩', 'USDT', 4776.52653, 4776.52653, 4.97056, 33917.15958, 7.10080, 1591320288, 0, 1, 19, 21);
INSERT INTO `bw_merchant` VALUES (4601, '浦纪', 'USDT', 2775.61992, 2775.61992, 3.55040, 19709.12192, 7.10080, 1591320288, 0, 1, 48, 52);
INSERT INTO `bw_merchant` VALUES (4602, '杭怡幸', 'USDT', 4953.84815, 4953.84815, 0.71008, 35176.28494, 7.10080, 1591320288, 0, 1, 36, 40);
INSERT INTO `bw_merchant` VALUES (4603, '曲兴', 'USDT', 1749.84586, 1749.84586, 2.13024, 12425.30548, 7.10080, 1591320288, 0, 1, 11, 18);
INSERT INTO `bw_merchant` VALUES (4604, '夏辰睿', 'USDT', 3563.44409, 3563.44409, 4.26048, 25303.30379, 7.10080, 1591320288, 0, 1, 47, 48);
INSERT INTO `bw_merchant` VALUES (4605, '甄梅菁', 'USDT', 4006.46205, 4006.46205, 6.39072, 28449.08572, 7.10080, 1591320288, 0, 1, 44, 45);
INSERT INTO `bw_merchant` VALUES (4606, '阎可', 'USDT', 1671.79484, 1671.79484, 2.13024, 11871.08079, 7.10080, 1591320288, 0, 1, 38, 39);
INSERT INTO `bw_merchant` VALUES (4607, '司徒古庾', 'USDT', 1496.42012, 1496.42012, 3.55040, 10625.77998, 7.10080, 1591320288, 0, 1, 31, 39);
INSERT INTO `bw_merchant` VALUES (4608, '任戴程', 'USDT', 118.30584, 118.30584, 6.39072, 840.06610, 7.10080, 1591320288, 0, 1, 26, 34);
INSERT INTO `bw_merchant` VALUES (4609, '单万', 'USDT', 5225.26724, 5225.26724, 0.71008, 37103.57761, 7.10080, 1591320288, 0, 1, 45, 53);
INSERT INTO `bw_merchant` VALUES (4610, '梅石', 'USDT', 1513.86551, 1513.86551, 6.39072, 10749.65621, 7.10080, 1591320288, 0, 1, 18, 21);
INSERT INTO `bw_merchant` VALUES (4611, '凤涛', 'USDT', 4109.47033, 4109.47033, 3.55040, 29180.52691, 7.10080, 1591320288, 0, 1, 31, 35);
INSERT INTO `bw_merchant` VALUES (4612, '曹曼蝶', 'USDT', 5120.66637, 5120.66637, 2.13024, 36360.82776, 7.10080, 1591320288, 0, 1, 20, 25);
INSERT INTO `bw_merchant` VALUES (4613, '关融琪', 'USDT', 5109.90956, 5109.90956, 6.39072, 36284.44580, 7.10080, 1591320288, 0, 1, 33, 38);
INSERT INTO `bw_merchant` VALUES (4614, '唐薇', 'USDT', 3559.44434, 3559.44434, 4.26048, 25274.90236, 7.10080, 1591320288, 0, 1, 41, 49);
INSERT INTO `bw_merchant` VALUES (4615, '祁光民', 'USDT', 3658.58344, 3658.58344, 2.84032, 25978.86929, 7.10080, 1591320288, 0, 1, 24, 25);
INSERT INTO `bw_merchant` VALUES (4616, '邱维树', 'USDT', 3775.17980, 3775.17980, 4.26048, 26806.79672, 7.10080, 1591320288, 0, 1, 34, 36);
INSERT INTO `bw_merchant` VALUES (4617, '习刚', 'USDT', 1247.57547, 1247.57547, 7.10080, 8858.78389, 7.10080, 1591320288, 0, 1, 25, 32);
INSERT INTO `bw_merchant` VALUES (4618, '阮风', 'USDT', 4725.57350, 4725.57350, 4.26048, 33555.35230, 7.10080, 1591320288, 0, 1, 47, 55);
INSERT INTO `bw_merchant` VALUES (4619, '常项', 'USDT', 2571.74052, 2571.74052, 4.97056, 18261.41508, 7.10080, 1591320288, 0, 1, 47, 51);
INSERT INTO `bw_merchant` VALUES (4620, '邱项', 'USDT', 220.85227, 220.85227, 2.13024, 1568.22779, 7.10080, 1591320289, 0, 1, 47, 47);
INSERT INTO `bw_merchant` VALUES (4621, '柯梅怀', 'USDT', 356.57662, 356.57662, 4.97056, 2531.97926, 7.10080, 1591320289, 0, 1, 47, 47);
INSERT INTO `bw_merchant` VALUES (4622, '庞楠', 'USDT', 4398.15865, 4398.15865, 2.13024, 31230.44494, 7.10080, 1591320289, 0, 1, 19, 26);
INSERT INTO `bw_merchant` VALUES (4623, '解高', 'USDT', 4190.55068, 4190.55068, 4.26048, 29756.26226, 7.10080, 1591320289, 0, 1, 10, 10);
INSERT INTO `bw_merchant` VALUES (4624, '杜唐弘', 'USDT', 2682.23618, 2682.23618, 4.26048, 19046.02266, 7.10080, 1591320289, 0, 1, 43, 47);
INSERT INTO `bw_merchant` VALUES (4625, '林承苇', 'USDT', 1708.89666, 1708.89666, 1.42016, 12134.53340, 7.10080, 1591320289, 0, 1, 45, 45);
INSERT INTO `bw_merchant` VALUES (4626, '轩辕纪', 'USDT', 4565.18682, 4565.18682, 2.13024, 32416.47857, 7.10080, 1591320289, 0, 1, 24, 27);
INSERT INTO `bw_merchant` VALUES (4627, '上官严骆', 'USDT', 1918.78198, 1918.78198, 2.13024, 13624.88708, 7.10080, 1591320289, 0, 1, 43, 50);
INSERT INTO `bw_merchant` VALUES (4628, '荆童', 'USDT', 3922.17931, 3922.17931, 2.13024, 27850.61084, 7.10080, 1591320289, 0, 1, 34, 38);
INSERT INTO `bw_merchant` VALUES (4629, '聂毛', 'USDT', 959.64165, 959.64165, 5.68064, 6814.22342, 7.10080, 1591320289, 0, 1, 42, 45);
INSERT INTO `bw_merchant` VALUES (4630, '邹灵', 'USDT', 1508.81252, 1508.81252, 2.84032, 10713.77594, 7.10080, 1591320289, 0, 1, 12, 20);
INSERT INTO `bw_merchant` VALUES (4631, '都有凤', 'LBTH', 1182.26342, 1182.26342, 7.10080, 8395.01609, 7.10080, 1591320289, 0, 0, 23, 28);
INSERT INTO `bw_merchant` VALUES (4632, '许乐宋', 'LBTH', 367.62739, 367.62739, 6.39072, 2610.44857, 7.10080, 1591320289, 0, 0, 21, 28);
INSERT INTO `bw_merchant` VALUES (4633, '索凤', 'LBTH', 81.62544, 81.62544, 2.13024, 579.60592, 7.10080, 1591320289, 0, 0, 34, 38);
INSERT INTO `bw_merchant` VALUES (4634, '索轮', 'LBTH', 4306.98136, 4306.98136, 1.42016, 30583.01324, 7.10080, 1591320289, 0, 0, 45, 50);
INSERT INTO `bw_merchant` VALUES (4635, '金庆', 'LBTH', 942.95167, 942.95167, 7.10080, 6695.71121, 7.10080, 1591320289, 0, 0, 33, 37);
INSERT INTO `bw_merchant` VALUES (4636, '萧宁尤', 'LBTH', 634.35965, 634.35965, 3.55040, 4504.46100, 7.10080, 1591320289, 0, 0, 32, 40);
INSERT INTO `bw_merchant` VALUES (4637, '钟石', 'LBTH', 377.11154, 377.11154, 7.10080, 2677.79362, 7.10080, 1591320289, 0, 0, 42, 44);
INSERT INTO `bw_merchant` VALUES (4638, '成刚胜', 'LBTH', 1960.81025, 1960.81025, 4.26048, 13923.32142, 7.10080, 1591320289, 0, 0, 39, 40);
INSERT INTO `bw_merchant` VALUES (4639, '李柔', 'LBTH', 3788.74323, 3788.74323, 4.97056, 26903.10792, 7.10080, 1591320289, 0, 0, 13, 14);
INSERT INTO `bw_merchant` VALUES (4640, '童闵师', 'LBTH', 3670.65214, 3670.65214, 2.84032, 26064.56671, 7.10080, 1591320289, 0, 0, 33, 34);
INSERT INTO `bw_merchant` VALUES (4641, '仲江', 'LBTH', 1465.60489, 1465.60489, 7.10080, 10406.96720, 7.10080, 1591320289, 0, 0, 32, 39);
INSERT INTO `bw_merchant` VALUES (4642, '盛林', 'LBTH', 130.82522, 130.82522, 7.10080, 928.96372, 7.10080, 1591320289, 0, 0, 39, 47);
INSERT INTO `bw_merchant` VALUES (4643, '倪惠庞', 'LBTH', 674.82250, 674.82250, 4.26048, 4791.77960, 7.10080, 1591320290, 0, 0, 14, 22);
INSERT INTO `bw_merchant` VALUES (4644, '陶桂', 'LBTH', 2866.61830, 2866.61830, 1.42016, 20355.28322, 7.10080, 1591320290, 0, 0, 26, 30);
INSERT INTO `bw_merchant` VALUES (4645, '卢亨', 'LBTH', 3419.51752, 3419.51752, 7.10080, 24281.31000, 7.10080, 1591320290, 0, 0, 37, 44);
INSERT INTO `bw_merchant` VALUES (4646, '房博士', 'LBTH', 473.31086, 473.31086, 0.71008, 3360.88575, 7.10080, 1591320290, 0, 0, 34, 37);
INSERT INTO `bw_merchant` VALUES (4647, '扶欢柏', 'LBTH', 3214.68024, 3214.68024, 6.39072, 22826.80144, 7.10080, 1591320290, 0, 0, 20, 22);
INSERT INTO `bw_merchant` VALUES (4648, '梅荣', 'LBTH', 3679.10070, 3679.10070, 6.39072, 26124.55825, 7.10080, 1591320290, 0, 0, 15, 22);
INSERT INTO `bw_merchant` VALUES (4649, '喻金关', 'LBTH', 580.58016, 580.58016, 2.84032, 4122.58360, 7.10080, 1591320290, 0, 0, 47, 54);
INSERT INTO `bw_merchant` VALUES (4650, '沈王', 'LBTH', 2034.66722, 2034.66722, 6.39072, 14447.76499, 7.10080, 1591320290, 0, 0, 24, 32);
INSERT INTO `bw_merchant` VALUES (4651, '荆娣甄', 'LBTH', 3529.38239, 3529.38239, 4.26048, 25061.43847, 7.10080, 1591320290, 0, 0, 44, 49);
INSERT INTO `bw_merchant` VALUES (4652, '幸阳翟', 'LBTH', 997.85061, 997.85061, 5.68064, 7085.53761, 7.10080, 1591320290, 0, 0, 21, 27);
INSERT INTO `bw_merchant` VALUES (4653, '郑敬', 'LBTH', 2276.36716, 2276.36716, 4.97056, 16164.02792, 7.10080, 1591320290, 0, 0, 14, 22);
INSERT INTO `bw_merchant` VALUES (4654, '翁杜', 'LBTH', 3953.99440, 3953.99440, 5.68064, 28076.52343, 7.10080, 1591320290, 0, 0, 38, 40);
INSERT INTO `bw_merchant` VALUES (4655, '公冶石', 'LBTH', 4423.49416, 4423.49416, 6.39072, 31410.34733, 7.10080, 1591320290, 0, 0, 41, 45);
INSERT INTO `bw_merchant` VALUES (4656, '关曹匡', 'LBTH', 3210.77552, 3210.77552, 4.97056, 22799.07481, 7.10080, 1591320290, 0, 0, 44, 51);
INSERT INTO `bw_merchant` VALUES (4657, '欧阳菊毓', 'LBTH', 2491.65025, 2491.65025, 7.10080, 17692.71009, 7.10080, 1591320290, 0, 0, 32, 35);
INSERT INTO `bw_merchant` VALUES (4658, '汤初凤', 'LBTH', 2747.34078, 2747.34078, 5.68064, 19508.31741, 7.10080, 1591320290, 0, 0, 10, 16);
INSERT INTO `bw_merchant` VALUES (4659, '习邵纪', 'LBTH', 233.26957, 233.26957, 7.10080, 1656.40056, 7.10080, 1591320290, 0, 0, 37, 40);
INSERT INTO `bw_merchant` VALUES (4660, '许德庄', 'LBTH', 4925.10151, 4925.10151, 5.68064, 34972.16080, 7.10080, 1591320290, 0, 0, 38, 40);
INSERT INTO `bw_merchant` VALUES (4661, '苏琪', 'LBTH', 621.88906, 621.88906, 4.97056, 4415.90983, 7.10080, 1591320290, 0, 0, 35, 38);
INSERT INTO `bw_merchant` VALUES (4662, '邹贝', 'LBTH', 1737.06900, 1737.06900, 4.97056, 12334.57955, 7.10080, 1591320290, 0, 0, 38, 44);
INSERT INTO `bw_merchant` VALUES (4663, '连宗', 'LBTH', 454.37809, 454.37809, 4.26048, 3226.44794, 7.10080, 1591320290, 0, 0, 10, 18);
INSERT INTO `bw_merchant` VALUES (4664, '武蔡阙', 'LBTH', 1727.74817, 1727.74817, 2.13024, 12268.39420, 7.10080, 1591320290, 0, 0, 29, 37);
INSERT INTO `bw_merchant` VALUES (4665, '毛娅秋', 'LBTH', 2941.67887, 2941.67887, 4.26048, 20888.27332, 7.10080, 1591320291, 0, 0, 32, 38);
INSERT INTO `bw_merchant` VALUES (4666, '终史丁', 'LBTH', 1741.27380, 1741.27380, 4.97056, 12364.43699, 7.10080, 1591320291, 0, 0, 46, 49);
INSERT INTO `bw_merchant` VALUES (4667, '彭保燕', 'LBTH', 1538.51698, 1538.51698, 3.55040, 10924.70137, 7.10080, 1591320291, 0, 0, 27, 33);
INSERT INTO `bw_merchant` VALUES (4668, '魏仇', 'LBTH', 4244.39409, 4244.39409, 2.13024, 30138.59355, 7.10080, 1591320291, 0, 0, 43, 44);
INSERT INTO `bw_merchant` VALUES (4669, '云戴甄', 'LBTH', 564.33095, 564.33095, 6.39072, 4007.20120, 7.10080, 1591320291, 0, 0, 13, 14);
INSERT INTO `bw_merchant` VALUES (4670, '詹容', 'LBTH', 875.76472, 875.76472, 6.39072, 6218.63012, 7.10080, 1591320291, 0, 0, 21, 28);
INSERT INTO `bw_merchant` VALUES (4671, '颜龙', 'LBTH', 28.49998, 28.49998, 4.97056, 202.37265, 7.10080, 1591320291, 0, 0, 16, 19);
INSERT INTO `bw_merchant` VALUES (4672, '颜裘乔', 'LBTH', 2273.14187, 2273.14187, 2.13024, 16141.12579, 7.10080, 1591320291, 0, 0, 21, 26);
INSERT INTO `bw_merchant` VALUES (4673, '成树', 'LBTH', 4728.51971, 4728.51971, 1.42016, 33576.27275, 7.10080, 1591320291, 0, 0, 37, 43);
INSERT INTO `bw_merchant` VALUES (4674, '桑蓝于', 'LBTH', 2503.36408, 2503.36408, 4.26048, 17775.88765, 7.10080, 1591320291, 0, 0, 49, 51);
INSERT INTO `bw_merchant` VALUES (4675, '傅岩', 'LBTH', 4292.11827, 4292.11827, 2.84032, 30477.47341, 7.10080, 1591320291, 0, 0, 46, 48);
INSERT INTO `bw_merchant` VALUES (4676, '储伯丽', 'LBTH', 1258.04093, 1258.04093, 3.55040, 8933.09703, 7.10080, 1591320291, 0, 0, 12, 15);
INSERT INTO `bw_merchant` VALUES (4677, '都杨詹', 'LBTH', 4498.97005, 4498.97005, 2.13024, 31946.28653, 7.10080, 1591320291, 0, 0, 40, 43);
INSERT INTO `bw_merchant` VALUES (4678, '童尤', 'LBTH', 4693.63866, 4693.63866, 2.84032, 33328.58939, 7.10080, 1591320291, 0, 0, 13, 21);
INSERT INTO `bw_merchant` VALUES (4679, '房桑', 'LBTH', 4449.72442, 4449.72442, 1.42016, 31596.60316, 7.10080, 1591320291, 0, 0, 25, 33);
INSERT INTO `bw_merchant` VALUES (4680, '孟姬林', 'LBTH', 625.71475, 625.71475, 2.84032, 4443.07529, 7.10080, 1591320291, 0, 0, 49, 50);
INSERT INTO `bw_merchant` VALUES (4681, '云陆关', 'LBTH', 3930.62887, 3930.62887, 3.55040, 27910.60948, 7.10080, 1591320291, 0, 0, 11, 14);
INSERT INTO `bw_merchant` VALUES (4682, '广瑗卓', 'LBTH', 1879.54673, 1879.54673, 2.84032, 13346.28542, 7.10080, 1591320291, 0, 0, 47, 55);
INSERT INTO `bw_merchant` VALUES (4683, '罗苑彭', 'LBTH', 2929.76047, 2929.76047, 0.71008, 20803.64314, 7.10080, 1591320291, 0, 0, 10, 12);
INSERT INTO `bw_merchant` VALUES (4684, '昌卢', 'LBTH', 1385.05844, 1385.05844, 4.26048, 9835.02297, 7.10080, 1591320291, 0, 0, 48, 49);
INSERT INTO `bw_merchant` VALUES (4685, '怀秋蒲', 'LBTH', 2431.52099, 2431.52099, 0.71008, 17265.74424, 7.10080, 1591320291, 0, 0, 30, 36);
INSERT INTO `bw_merchant` VALUES (4686, '阎邦关', 'LBTH', 2300.63566, 2300.63566, 0.71008, 16336.35369, 7.10080, 1591320291, 0, 0, 46, 46);
INSERT INTO `bw_merchant` VALUES (4687, '黎家琬', 'LBTH', 1223.46535, 1223.46535, 6.39072, 8687.58275, 7.10080, 1591320291, 0, 0, 12, 17);
INSERT INTO `bw_merchant` VALUES (4688, '石时水', 'LBTH', 3505.34750, 3505.34750, 4.26048, 24890.77152, 7.10080, 1591320291, 0, 0, 32, 33);
INSERT INTO `bw_merchant` VALUES (4689, '洪顺', 'LBTH', 110.52908, 110.52908, 6.39072, 784.84489, 7.10080, 1591320292, 0, 0, 37, 42);
INSERT INTO `bw_merchant` VALUES (4690, '桑恒', 'LBTH', 3567.40769, 3567.40769, 2.84032, 25331.44852, 7.10080, 1591320292, 0, 0, 17, 17);
INSERT INTO `bw_merchant` VALUES (4691, '欧元', 'LBTH', 3448.25229, 3448.25229, 5.68064, 24485.34986, 7.10080, 1591320292, 0, 0, 34, 41);
INSERT INTO `bw_merchant` VALUES (4692, '胡堵', 'LBTH', 225.75796, 225.75796, 4.26048, 1603.06212, 7.10080, 1591320292, 0, 0, 40, 42);
INSERT INTO `bw_merchant` VALUES (4693, '师蔡', 'LBTH', 3599.45864, 3599.45864, 6.39072, 25559.03591, 7.10080, 1591320292, 0, 0, 23, 23);
INSERT INTO `bw_merchant` VALUES (4694, '胡琳', 'LBTH', 3045.86743, 3045.86743, 2.84032, 21628.09544, 7.10080, 1591320292, 0, 0, 17, 21);
INSERT INTO `bw_merchant` VALUES (4695, '郎禄', 'LBTH', 461.91943, 461.91943, 2.13024, 3279.99748, 7.10080, 1591320292, 0, 0, 43, 46);
INSERT INTO `bw_merchant` VALUES (4696, '费维', 'LBTH', 1466.91656, 1466.91656, 2.13024, 10416.28110, 7.10080, 1591320292, 0, 0, 27, 28);
INSERT INTO `bw_merchant` VALUES (4697, '都天', 'LBTH', 4548.99649, 4548.99649, 3.55040, 32301.51427, 7.10080, 1591320292, 0, 0, 34, 38);
INSERT INTO `bw_merchant` VALUES (4698, '章贵初', 'LBTH', 1644.39985, 1644.39985, 6.39072, 11676.55445, 7.10080, 1591320292, 0, 0, 12, 18);
INSERT INTO `bw_merchant` VALUES (4699, '阎桦洪', 'LBTH', 4205.65591, 4205.65591, 4.26048, 29863.52148, 7.10080, 1591320292, 0, 0, 45, 50);
INSERT INTO `bw_merchant` VALUES (4700, '陆倪', 'LBTH', 425.94817, 425.94817, 6.39072, 3024.57276, 7.10080, 1591320292, 0, 0, 12, 15);
INSERT INTO `bw_merchant` VALUES (4701, '轩辕谈颜', 'LBTH', 1555.90322, 1555.90322, 5.68064, 11048.15758, 7.10080, 1591320292, 0, 0, 31, 34);
INSERT INTO `bw_merchant` VALUES (4702, '元通', 'LBTH', 3205.32899, 3205.32899, 4.97056, 22760.40009, 7.10080, 1591320292, 0, 0, 12, 19);
INSERT INTO `bw_merchant` VALUES (4703, '花农', 'LBTH', 4895.56054, 4895.56054, 0.71008, 34762.39628, 7.10080, 1591320292, 0, 0, 31, 39);
INSERT INTO `bw_merchant` VALUES (4704, '颜喻', 'LBTH', 614.16960, 614.16960, 4.26048, 4361.09549, 7.10080, 1591320292, 0, 0, 36, 40);
INSERT INTO `bw_merchant` VALUES (4705, '水芬宰', 'LBTH', 3754.75055, 3754.75055, 2.84032, 26661.73270, 7.10080, 1591320292, 0, 0, 19, 22);
INSERT INTO `bw_merchant` VALUES (4706, '孙姜', 'LBTH', 4342.69764, 4342.69764, 4.97056, 30836.62740, 7.10080, 1591320292, 0, 0, 12, 17);
INSERT INTO `bw_merchant` VALUES (4707, '寿初', 'LBTH', 3320.18433, 3320.18433, 5.68064, 23575.96489, 7.10080, 1591320292, 0, 0, 43, 46);
INSERT INTO `bw_merchant` VALUES (4708, '郑羽', 'LBTH', 3934.25920, 3934.25920, 5.68064, 27936.38772, 7.10080, 1591320293, 0, 0, 44, 48);
INSERT INTO `bw_merchant` VALUES (4709, '别丹', 'LBTH', 2757.05161, 2757.05161, 4.26048, 19577.27207, 7.10080, 1591320293, 0, 0, 47, 51);
INSERT INTO `bw_merchant` VALUES (4710, '终宁', 'LBTH', 2674.31775, 2674.31775, 2.13024, 18989.79547, 7.10080, 1591320293, 0, 0, 15, 23);
INSERT INTO `bw_merchant` VALUES (4711, '慕容震', 'LBTH', 875.95115, 875.95115, 6.39072, 6219.95392, 7.10080, 1591320293, 0, 0, 12, 15);
INSERT INTO `bw_merchant` VALUES (4712, '连鸣弘', 'LBTH', 2221.08687, 2221.08687, 3.55040, 15771.49364, 7.10080, 1591320293, 0, 0, 35, 39);
INSERT INTO `bw_merchant` VALUES (4713, '李贵宽', 'LBTH', 3567.62108, 3567.62108, 2.84032, 25332.96376, 7.10080, 1591320293, 0, 0, 46, 48);
INSERT INTO `bw_merchant` VALUES (4714, '都胡', 'LBTH', 551.62264, 551.62264, 7.10080, 3916.96204, 7.10080, 1591320293, 0, 0, 28, 34);
INSERT INTO `bw_merchant` VALUES (4715, '景芝瑞', 'LBTH', 456.72389, 456.72389, 6.39072, 3243.10499, 7.10080, 1591320293, 0, 0, 29, 29);
INSERT INTO `bw_merchant` VALUES (4716, '颜奇贾', 'LBTH', 2640.11794, 2640.11794, 4.97056, 18746.94946, 7.10080, 1591320293, 0, 0, 46, 48);
INSERT INTO `bw_merchant` VALUES (4717, '乔爱成', 'LBTH', 1979.49556, 1979.49556, 2.84032, 14056.00207, 7.10080, 1591320293, 0, 0, 18, 23);
INSERT INTO `bw_merchant` VALUES (4718, '苗东', 'LBTH', 1435.37416, 1435.37416, 4.97056, 10192.30483, 7.10080, 1591320293, 0, 0, 20, 25);
INSERT INTO `bw_merchant` VALUES (4719, '封爽', 'LBTH', 3563.42043, 3563.42043, 3.55040, 25303.13578, 7.10080, 1591320293, 0, 0, 27, 30);
INSERT INTO `bw_merchant` VALUES (4720, '廖盛', 'LBTH', 512.05549, 512.05549, 3.55040, 3636.00362, 7.10080, 1591320293, 0, 0, 36, 44);
INSERT INTO `bw_merchant` VALUES (4721, '宗政熊', 'LBTH', 1126.20481, 1126.20481, 2.84032, 7996.95511, 7.10080, 1591320293, 0, 0, 22, 28);
INSERT INTO `bw_merchant` VALUES (4722, '匡力', 'LBTH', 1785.54927, 1785.54927, 4.97056, 12678.82825, 7.10080, 1591320293, 0, 0, 38, 41);
INSERT INTO `bw_merchant` VALUES (4723, '华穆', 'LBTH', 2284.01609, 2284.01609, 6.39072, 16218.34145, 7.10080, 1591320293, 0, 0, 46, 46);
INSERT INTO `bw_merchant` VALUES (4724, '夏忠董', 'LBTH', 3821.27642, 3821.27642, 5.68064, 27134.11960, 7.10080, 1591320293, 0, 0, 29, 31);
INSERT INTO `bw_merchant` VALUES (4725, '柏朱骆', 'LBTH', 2681.45355, 2681.45355, 1.42016, 19040.46536, 7.10080, 1591320293, 0, 0, 21, 26);
INSERT INTO `bw_merchant` VALUES (4726, '谢卿', 'LBTH', 4956.99848, 4956.99848, 3.55040, 35198.65480, 7.10080, 1591320293, 0, 0, 31, 33);
INSERT INTO `bw_merchant` VALUES (4727, '汪盛', 'LBTH', 2243.33016, 2243.33016, 6.39072, 15929.43880, 7.10080, 1591320294, 0, 0, 46, 51);
INSERT INTO `bw_merchant` VALUES (4728, '陆峰农', 'LBTH', 907.51808, 907.51808, 7.10080, 6444.10438, 7.10080, 1591320294, 0, 0, 11, 16);
INSERT INTO `bw_merchant` VALUES (4729, '乔茅邢', 'LBTH', 2397.51453, 2397.51453, 6.39072, 17024.27117, 7.10080, 1591320294, 0, 0, 19, 19);
INSERT INTO `bw_merchant` VALUES (4730, '史亨庞', 'LBTH', 1579.25866, 1579.25866, 3.55040, 11213.99989, 7.10080, 1591320294, 0, 0, 50, 51);
INSERT INTO `bw_merchant` VALUES (4731, '淳于钱伊', 'LBTH', 3946.43042, 3946.43042, 2.13024, 28022.81312, 7.10080, 1591320294, 0, 1, 46, 51);
INSERT INTO `bw_merchant` VALUES (4732, '甘夏凌', 'LBTH', 4743.73659, 4743.73659, 2.84032, 33684.32477, 7.10080, 1591320294, 0, 1, 28, 34);
INSERT INTO `bw_merchant` VALUES (4733, '苗徐', 'LBTH', 1227.92732, 1227.92732, 3.55040, 8719.26631, 7.10080, 1591320294, 0, 1, 14, 18);
INSERT INTO `bw_merchant` VALUES (4734, '姜苑卞', 'LBTH', 1793.69011, 1793.69011, 0.71008, 12736.63473, 7.10080, 1591320294, 0, 1, 39, 40);
INSERT INTO `bw_merchant` VALUES (4735, '戚楠', 'LBTH', 271.55311, 271.55311, 6.39072, 1928.24432, 7.10080, 1591320294, 0, 1, 41, 47);
INSERT INTO `bw_merchant` VALUES (4736, '纪巧仪', 'LBTH', 3897.62842, 3897.62842, 0.71008, 27676.27988, 7.10080, 1591320294, 0, 1, 37, 40);
INSERT INTO `bw_merchant` VALUES (4737, '堵璧堵', 'LBTH', 2904.96363, 2904.96363, 0.71008, 20627.56574, 7.10080, 1591320294, 0, 1, 14, 18);
INSERT INTO `bw_merchant` VALUES (4738, '东方梦', 'LBTH', 1779.78592, 1779.78592, 4.97056, 12637.90386, 7.10080, 1591320294, 0, 1, 23, 23);
INSERT INTO `bw_merchant` VALUES (4739, '东方姣', 'LBTH', 1062.60523, 1062.60523, 3.55040, 7545.34721, 7.10080, 1591320294, 0, 1, 47, 55);
INSERT INTO `bw_merchant` VALUES (4740, '周贵儿', 'LBTH', 3114.62508, 3114.62508, 2.84032, 22116.32976, 7.10080, 1591320294, 0, 1, 34, 37);
INSERT INTO `bw_merchant` VALUES (4741, '齐佳劳', 'LBTH', 3699.20285, 3699.20285, 2.13024, 26267.29959, 7.10080, 1591320294, 0, 1, 31, 32);
INSERT INTO `bw_merchant` VALUES (4742, '孟先瑗', 'LBTH', 2211.75543, 2211.75543, 1.42016, 15705.23295, 7.10080, 1591320294, 0, 1, 30, 37);
INSERT INTO `bw_merchant` VALUES (4743, '单于星', 'LBTH', 1388.23552, 1388.23552, 0.71008, 9857.58278, 7.10080, 1591320294, 0, 1, 34, 42);
INSERT INTO `bw_merchant` VALUES (4744, '令狐宏', 'LBTH', 2553.20533, 2553.20533, 4.26048, 18129.80040, 7.10080, 1591320294, 0, 1, 36, 39);
INSERT INTO `bw_merchant` VALUES (4745, '齐珠', 'LBTH', 1408.74613, 1408.74613, 7.10080, 10003.22451, 7.10080, 1591320294, 0, 1, 48, 56);
INSERT INTO `bw_merchant` VALUES (4746, '冉琦溥', 'LBTH', 42.21907, 42.21907, 4.26048, 299.78917, 7.10080, 1591320294, 0, 1, 41, 41);
INSERT INTO `bw_merchant` VALUES (4747, '司马云', 'LBTH', 2654.66128, 2654.66128, 0.71008, 18850.21881, 7.10080, 1591320295, 0, 1, 29, 32);
INSERT INTO `bw_merchant` VALUES (4748, '柯璐君', 'LBTH', 912.26451, 912.26451, 5.68064, 6477.80783, 7.10080, 1591320295, 0, 1, 23, 25);
INSERT INTO `bw_merchant` VALUES (4749, '苏顺', 'LBTH', 2098.02133, 2098.02133, 7.10080, 14897.62986, 7.10080, 1591320295, 0, 1, 27, 34);
INSERT INTO `bw_merchant` VALUES (4750, '钟龙沈', 'LBTH', 2538.00658, 2538.00658, 2.84032, 18021.87712, 7.10080, 1591320295, 0, 1, 18, 18);
INSERT INTO `bw_merchant` VALUES (4751, '金瑶', 'LBTH', 2732.25727, 2732.25727, 2.84032, 19401.21242, 7.10080, 1591320295, 0, 1, 22, 29);
INSERT INTO `bw_merchant` VALUES (4752, '司空淑', 'LBTH', 2608.93754, 2608.93754, 5.68064, 18525.54368, 7.10080, 1591320295, 0, 1, 39, 43);
INSERT INTO `bw_merchant` VALUES (4753, '杜园唯', 'LBTH', 2960.80831, 2960.80831, 1.42016, 21024.10764, 7.10080, 1591320295, 0, 1, 26, 27);
INSERT INTO `bw_merchant` VALUES (4754, '汤琼姜', 'LBTH', 1646.41770, 1646.41770, 4.97056, 11690.88280, 7.10080, 1591320295, 0, 1, 25, 25);
INSERT INTO `bw_merchant` VALUES (4755, '仲孙徐', 'LBTH', 1438.37561, 1438.37561, 2.84032, 10213.61753, 7.10080, 1591320295, 0, 1, 48, 53);
INSERT INTO `bw_merchant` VALUES (4756, '逄秦', 'LBTH', 3937.41208, 3937.41208, 4.26048, 27958.77569, 7.10080, 1591320295, 0, 1, 40, 47);
INSERT INTO `bw_merchant` VALUES (4757, '淳于致', 'LBTH', 111.65781, 111.65781, 5.68064, 792.85977, 7.10080, 1591320295, 0, 1, 42, 46);
INSERT INTO `bw_merchant` VALUES (4758, '弘戚', 'LBTH', 4528.62386, 4528.62386, 2.13024, 32156.85230, 7.10080, 1591320295, 0, 1, 22, 28);
INSERT INTO `bw_merchant` VALUES (4759, '江雍', 'LBTH', 216.11039, 216.11039, 3.55040, 1534.55665, 7.10080, 1591320295, 0, 1, 20, 27);
INSERT INTO `bw_merchant` VALUES (4760, '邹妍瞿', 'LBTH', 829.15610, 829.15610, 1.42016, 5887.67163, 7.10080, 1591320295, 0, 1, 41, 42);
INSERT INTO `bw_merchant` VALUES (4761, '从罡熊', 'LBTH', 3747.94563, 3747.94563, 4.97056, 26613.41232, 7.10080, 1591320295, 0, 1, 17, 20);
INSERT INTO `bw_merchant` VALUES (4762, '柯贵庆', 'LBTH', 108.60240, 108.60240, 0.71008, 771.16392, 7.10080, 1591320295, 0, 1, 44, 50);
INSERT INTO `bw_merchant` VALUES (4763, '吉榕昭', 'LBTH', 1829.21347, 1829.21347, 6.39072, 12988.87900, 7.10080, 1591320295, 0, 1, 42, 44);
INSERT INTO `bw_merchant` VALUES (4764, '龚冠路', 'LBTH', 699.63251, 699.63251, 0.71008, 4967.95052, 7.10080, 1591320296, 0, 1, 50, 54);
INSERT INTO `bw_merchant` VALUES (4765, '柏宰', 'LBTH', 2106.92223, 2106.92223, 6.39072, 14960.83337, 7.10080, 1591320296, 0, 1, 44, 51);
INSERT INTO `bw_merchant` VALUES (4766, '关莘', 'LBTH', 2490.72064, 2490.72064, 4.26048, 17686.10912, 7.10080, 1591320296, 0, 1, 15, 21);
INSERT INTO `bw_merchant` VALUES (4767, '窦沈', 'LBTH', 2181.41784, 2181.41784, 3.55040, 15489.81179, 7.10080, 1591320296, 0, 1, 14, 18);
INSERT INTO `bw_merchant` VALUES (4768, '温固岚', 'LBTH', 1372.89667, 1372.89667, 0.71008, 9748.66467, 7.10080, 1591320296, 0, 1, 22, 28);
INSERT INTO `bw_merchant` VALUES (4769, '郝瑾', 'LBTH', 2396.26076, 2396.26076, 7.10080, 17015.36840, 7.10080, 1591320296, 0, 1, 12, 17);
INSERT INTO `bw_merchant` VALUES (4770, '满儿', 'LBTH', 1574.22612, 1574.22612, 4.26048, 11178.26483, 7.10080, 1591320296, 0, 1, 29, 35);
INSERT INTO `bw_merchant` VALUES (4771, '赖融蒲', 'LBTH', 3704.64037, 3704.64037, 3.55040, 26305.91033, 7.10080, 1591320296, 0, 1, 31, 34);
INSERT INTO `bw_merchant` VALUES (4772, '叶鸿', 'LBTH', 953.11584, 953.11584, 4.26048, 6767.88495, 7.10080, 1591320296, 0, 1, 14, 17);
INSERT INTO `bw_merchant` VALUES (4773, '闵师', 'LBTH', 4696.08836, 4696.08836, 1.42016, 33345.98422, 7.10080, 1591320296, 0, 1, 33, 40);
INSERT INTO `bw_merchant` VALUES (4774, '熊厚庆', 'LBTH', 4415.43268, 4415.43268, 4.26048, 31353.10437, 7.10080, 1591320296, 0, 1, 10, 16);
INSERT INTO `bw_merchant` VALUES (4775, '米邵寿', 'LBTH', 628.94844, 628.94844, 2.13024, 4466.03708, 7.10080, 1591320296, 0, 1, 45, 48);
INSERT INTO `bw_merchant` VALUES (4776, '封初', 'LBTH', 800.94647, 800.94647, 2.13024, 5687.36069, 7.10080, 1591320296, 0, 1, 49, 50);
INSERT INTO `bw_merchant` VALUES (4777, '季戴', 'LBTH', 3371.35310, 3371.35310, 4.26048, 23939.30409, 7.10080, 1591320296, 0, 1, 16, 18);
INSERT INTO `bw_merchant` VALUES (4778, '胡俊才', 'LBTH', 980.57932, 980.57932, 2.84032, 6962.89763, 7.10080, 1591320296, 0, 1, 20, 28);
INSERT INTO `bw_merchant` VALUES (4779, '弘齐', 'LBTH', 3602.38635, 3602.38635, 4.26048, 25579.82499, 7.10080, 1591320296, 0, 1, 41, 49);
INSERT INTO `bw_merchant` VALUES (4780, '贺维', 'LBTH', 1622.57418, 1622.57418, 3.55040, 11521.57473, 7.10080, 1591320296, 0, 1, 22, 23);
INSERT INTO `bw_merchant` VALUES (4781, '尉迟林纪', 'LBTH', 2793.51899, 2793.51899, 2.84032, 19836.21964, 7.10080, 1591320296, 0, 1, 41, 47);
INSERT INTO `bw_merchant` VALUES (4782, '乔聪胥', 'LBTH', 1874.70257, 1874.70257, 0.71008, 13311.88800, 7.10080, 1591320296, 0, 1, 31, 36);
INSERT INTO `bw_merchant` VALUES (4783, '公孙琛', 'LBTH', 829.30620, 829.30620, 4.26048, 5888.73746, 7.10080, 1591320296, 0, 1, 36, 37);
INSERT INTO `bw_merchant` VALUES (4784, '解堂', 'LBTH', 1116.23476, 1116.23476, 6.39072, 7926.15978, 7.10080, 1591320297, 0, 1, 21, 24);
INSERT INTO `bw_merchant` VALUES (4785, '宁龙', 'LBTH', 1031.65000, 1031.65000, 4.97056, 7325.54032, 7.10080, 1591320297, 0, 1, 12, 17);
INSERT INTO `bw_merchant` VALUES (4786, '宇文纨', 'LBTH', 4990.50595, 4990.50595, 1.42016, 35436.58464, 7.10080, 1591320297, 0, 1, 19, 20);
INSERT INTO `bw_merchant` VALUES (4787, '屠政史', 'LBTH', 1186.04605, 1186.04605, 3.55040, 8421.87579, 7.10080, 1591320297, 0, 1, 20, 21);
INSERT INTO `bw_merchant` VALUES (4788, '邱磊梅', 'LBTH', 4731.46544, 4731.46544, 0.71008, 33597.18979, 7.10080, 1591320297, 0, 1, 17, 23);
INSERT INTO `bw_merchant` VALUES (4789, '欧琴宜', 'LBTH', 4568.02301, 4568.02301, 4.97056, 32436.61778, 7.10080, 1591320297, 0, 1, 33, 41);
INSERT INTO `bw_merchant` VALUES (4790, '葛媚', 'LBTH', 2483.68086, 2483.68086, 2.84032, 17636.12105, 7.10080, 1591320297, 0, 1, 45, 52);
INSERT INTO `bw_merchant` VALUES (4791, '贡固', 'LBTH', 2877.88162, 2877.88162, 4.97056, 20435.26180, 7.10080, 1591320297, 0, 1, 49, 56);
INSERT INTO `bw_merchant` VALUES (4792, '劳菡', 'LBTH', 2140.86983, 2140.86983, 4.26048, 15201.88848, 7.10080, 1591320297, 0, 1, 11, 13);
INSERT INTO `bw_merchant` VALUES (4793, '葛翰季', 'LBTH', 3897.46807, 3897.46807, 6.39072, 27675.14127, 7.10080, 1591320297, 0, 1, 10, 17);
INSERT INTO `bw_merchant` VALUES (4794, '屠羽吉', 'LBTH', 1798.95621, 1798.95621, 1.42016, 12774.02825, 7.10080, 1591320297, 0, 1, 46, 52);
INSERT INTO `bw_merchant` VALUES (4795, '潘茜汤', 'LBTH', 2276.59947, 2276.59947, 7.10080, 16165.67751, 7.10080, 1591320297, 0, 1, 14, 19);
INSERT INTO `bw_merchant` VALUES (4796, '申屠唯', 'LBTH', 4467.02037, 4467.02037, 2.13024, 31719.41824, 7.10080, 1591320297, 0, 1, 25, 25);
INSERT INTO `bw_merchant` VALUES (4797, '陈妍凤', 'LBTH', 2710.49057, 2710.49057, 0.71008, 19246.65143, 7.10080, 1591320297, 0, 1, 38, 40);
INSERT INTO `bw_merchant` VALUES (4798, '连章袁', 'LBTH', 792.02421, 792.02421, 4.26048, 5624.00551, 7.10080, 1591320297, 0, 1, 16, 18);
INSERT INTO `bw_merchant` VALUES (4799, '丁彬花', 'LBTH', 800.75977, 800.75977, 6.39072, 5686.03497, 7.10080, 1591320297, 0, 1, 50, 51);
INSERT INTO `bw_merchant` VALUES (4800, '霍翰尤', 'LBTH', 1870.08072, 1870.08072, 5.68064, 13279.06917, 7.10080, 1591320297, 0, 1, 30, 38);
INSERT INTO `bw_merchant` VALUES (4801, '胥许', 'LBTH', 4377.58944, 4377.58944, 2.84032, 31084.38709, 7.10080, 1591320297, 0, 1, 44, 52);
INSERT INTO `bw_merchant` VALUES (4802, '吴泽', 'LBTH', 4201.65744, 4201.65744, 7.10080, 29835.12914, 7.10080, 1591320297, 0, 1, 29, 29);
INSERT INTO `bw_merchant` VALUES (4803, '惠苇伏', 'LBTH', 2223.09344, 2223.09344, 0.71008, 15785.74189, 7.10080, 1591320297, 0, 1, 43, 46);
INSERT INTO `bw_merchant` VALUES (4804, '彭戚闵', 'LBTH', 3201.06737, 3201.06737, 0.71008, 22730.13918, 7.10080, 1591320298, 0, 1, 13, 15);
INSERT INTO `bw_merchant` VALUES (4805, '欧阳沈', 'LBTH', 2488.42802, 2488.42802, 3.55040, 17669.82968, 7.10080, 1591320298, 0, 1, 39, 46);
INSERT INTO `bw_merchant` VALUES (4806, '徐离悦颜', 'LBTH', 1379.87729, 1379.87729, 4.97056, 9798.23266, 7.10080, 1591320298, 0, 1, 24, 27);
INSERT INTO `bw_merchant` VALUES (4807, '屠明包', 'LBTH', 3567.13798, 3567.13798, 2.13024, 25329.53336, 7.10080, 1591320298, 0, 1, 45, 52);
INSERT INTO `bw_merchant` VALUES (4808, '卓希', 'LBTH', 2194.77929, 2194.77929, 3.55040, 15584.68878, 7.10080, 1591320298, 0, 1, 30, 38);
INSERT INTO `bw_merchant` VALUES (4809, '黎庆农', 'LBTH', 3256.23334, 3256.23334, 1.42016, 23121.86170, 7.10080, 1591320298, 0, 1, 46, 50);
INSERT INTO `bw_merchant` VALUES (4810, '邓亨', 'LBTH', 1776.79065, 1776.79065, 0.71008, 12616.63504, 7.10080, 1591320298, 0, 1, 30, 38);
INSERT INTO `bw_merchant` VALUES (4811, '施莫程', 'LBTH', 283.12314, 283.12314, 4.26048, 2010.40079, 7.10080, 1591320298, 0, 1, 36, 44);
INSERT INTO `bw_merchant` VALUES (4812, '蓝汤', 'LBTH', 2068.00262, 2068.00262, 1.42016, 14684.47300, 7.10080, 1591320298, 0, 1, 41, 45);
INSERT INTO `bw_merchant` VALUES (4813, '宗政飞', 'LBTH', 1957.99916, 1957.99916, 4.97056, 13903.36043, 7.10080, 1591320298, 0, 1, 18, 26);
INSERT INTO `bw_merchant` VALUES (4814, '戚瑞倪', 'LBTH', 3257.38692, 3257.38692, 4.97056, 23130.05304, 7.10080, 1591320298, 0, 1, 47, 54);
INSERT INTO `bw_merchant` VALUES (4815, '蓝香贡', 'LBTH', 4455.13410, 4455.13410, 7.10080, 31635.01621, 7.10080, 1591320298, 0, 1, 37, 37);
INSERT INTO `bw_merchant` VALUES (4816, '汪冰', 'LBTH', 2778.14726, 2778.14726, 5.68064, 19727.06806, 7.10080, 1591320298, 0, 1, 14, 14);
INSERT INTO `bw_merchant` VALUES (4817, '裘爱左', 'LBTH', 2604.51416, 2604.51416, 0.71008, 18494.13414, 7.10080, 1591320298, 0, 1, 38, 41);
INSERT INTO `bw_merchant` VALUES (4818, '寇蓝', 'LBTH', 4280.60189, 4280.60189, 0.71008, 30395.69790, 7.10080, 1591320298, 0, 1, 50, 52);
INSERT INTO `bw_merchant` VALUES (4819, '庄岚崔', 'LBTH', 3241.61703, 3241.61703, 4.97056, 23018.07420, 7.10080, 1591320298, 0, 1, 35, 38);
INSERT INTO `bw_merchant` VALUES (4820, '戴灵', 'LBTH', 3363.44145, 3363.44145, 4.26048, 23883.12504, 7.10080, 1591320298, 0, 1, 30, 32);
INSERT INTO `bw_merchant` VALUES (4821, '连凡古', 'LBTH', 698.62904, 698.62904, 6.39072, 4960.82508, 7.10080, 1591320298, 0, 1, 14, 18);
INSERT INTO `bw_merchant` VALUES (4822, '宗马林', 'LBTH', 4878.83829, 4878.83829, 3.55040, 34643.65492, 7.10080, 1591320298, 0, 1, 45, 46);
INSERT INTO `bw_merchant` VALUES (4823, '荆眉', 'LBTH', 4002.22799, 4002.22799, 4.26048, 28419.02051, 7.10080, 1591320298, 0, 1, 19, 26);
INSERT INTO `bw_merchant` VALUES (4824, '张鲁', 'LBTH', 4232.06893, 4232.06893, 4.97056, 30051.07505, 7.10080, 1591320298, 0, 1, 11, 19);
INSERT INTO `bw_merchant` VALUES (4825, '田周陈', 'LBTH', 3701.05496, 3701.05496, 2.84032, 26280.45105, 7.10080, 1591320299, 0, 1, 32, 36);
INSERT INTO `bw_merchant` VALUES (4826, '熊秋容', 'LBTH', 272.16284, 272.16284, 4.26048, 1932.57389, 7.10080, 1591320299, 0, 1, 16, 21);
INSERT INTO `bw_merchant` VALUES (4827, '房世琴', 'LBTH', 2707.44648, 2707.44648, 2.13024, 19225.03596, 7.10080, 1591320299, 0, 1, 10, 14);
INSERT INTO `bw_merchant` VALUES (4828, '宰美', 'LBTH', 3805.77995, 3805.77995, 0.71008, 27024.08226, 7.10080, 1591320299, 0, 1, 36, 42);
INSERT INTO `bw_merchant` VALUES (4829, '钟凝', 'LBTH', 805.88259, 805.88259, 2.84032, 5722.41109, 7.10080, 1591320299, 0, 1, 21, 23);
INSERT INTO `bw_merchant` VALUES (4830, '胥堂陶', 'LBTH', 2415.62196, 2415.62196, 2.13024, 17152.84841, 7.10080, 1591320299, 0, 1, 42, 45);

-- ----------------------------
-- Table structure for bw_merchant_order
-- ----------------------------
DROP TABLE IF EXISTS `bw_merchant_order`;
CREATE TABLE `bw_merchant_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `out_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '系统出售人id',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `designation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '购买/出售数量',
  `price` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '购买时价格',
  `amount` decimal(10, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '付款/收款金额',
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '类型：0购买，1出售',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '购买时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0未支付，1已支付，2已取消',
  `paytime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '支付时间',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝号码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝收款人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自选交易订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_merchant_order
-- ----------------------------
INSERT INTO `bw_merchant_order` VALUES (80, 3, 4230, '2020060551565357', 'BTC', 0.00494, 69684.70000, 344.00000, 0, 1591328131, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (81, 3, 4230, '2020060510048519', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591328429, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (82, 3, 4230, '2020060510248505', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591328463, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (83, 3, 4230, '2020060553485057', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591328933, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (84, 3, 4230, '2020060555485652', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591328951, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (85, 3, 4230, '2020060810010056', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597309, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (86, 3, 4230, '2020060856521029', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597336, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (87, 3, 4230, '2020060850485653', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597474, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (88, 3, 4230, '2020060855491004', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597687, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (89, 3, 4230, '2020060897571029', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597690, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (90, 3, 4230, '2020060854102501', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591597702, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (91, 3, 4230, '2020060899989750', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591597740, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (92, 3, 4230, '2020060848554955', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591597744, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (93, 3, 4230, '2020060810153565', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591598942, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (94, 3, 4230, '2020060850571005', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591598994, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (95, 3, 4230, '2020060899101101', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591599004, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (96, 3, 4230, '2020060897555410', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599018, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (97, 3, 4230, '2020060849555049', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599041, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (98, 3, 4230, '2020060810052571', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599053, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (99, 3, 4230, '2020060810055564', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599117, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (100, 3, 4230, '2020060810049100', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599133, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (101, 3, 4230, '2020060852535751', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599156, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (102, 3, 4230, '2020060899521005', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599372, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (103, 3, 4230, '2020060898541004', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599387, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (104, 3, 4230, '2020060898100525', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599403, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (105, 3, 4230, '2020060898541025', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599419, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (106, 3, 4230, '2020060899575499', 'BTC', 0.04783, 69684.70000, 3333.00000, 0, 1591599468, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (107, 3, 4230, '2020060810057975', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599501, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (108, 3, 4230, '2020060899544853', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599580, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (109, 3, 4230, '2020060852519710', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599588, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (110, 3, 4230, '2020060810099971', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599709, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (111, 3, 4230, '2020060850101499', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591599746, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (112, 3, 4230, '2020060850555010', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591599890, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (113, 3, 4230, '2020060810252102', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591599999, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (114, 3, 4230, '2020060853100485', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591600037, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (115, 3, 4230, '2020060810157525', 'BTC', 0.06377, 69684.70000, 4444.00000, 0, 1591600174, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (116, 3, 4230, '2020060810152565', 'BTC', 0.00478, 69684.70000, 333.00000, 0, 1591600798, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (117, 3, 4230, '2020060850535157', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591600818, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (118, 3, 4230, '2020060856535752', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591600888, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (119, 3, 4230, '2020060810055499', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591601197, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (120, 3, 4230, '2020060810057539', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591601213, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (121, 3, 4230, '2020060852515698', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1591601748, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (122, 7, 4230, '2020061910148485', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559758, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (123, 7, 4230, '2020061956575555', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559768, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (124, 7, 4230, '2020061910010049', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559789, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (125, 7, 4230, '2020061948975510', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559824, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (126, 7, 4230, '2020061999491005', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559852, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (127, 7, 4230, '2020061951534910', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592559859, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (128, 7, 4230, '2020061910110154', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592560014, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (129, 7, 4230, '2020061910054102', 'BTC', 0.00637, 69684.70000, 444.00000, 0, 1592560717, 0, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (130, 1, 4830, '2020070256544949', 'LBTH', 0.10000, 7.10080, 6968.47000, 0, 1593682344, 1, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (131, 1, 4830, '2020070299485699', 'LBTH', 1.00000, 7.10080, 7.10080, 0, 1593682364, 1, NULL, NULL, NULL);
INSERT INTO `bw_merchant_order` VALUES (132, 1, 4828, '2020070256545050', 'LBTH', 1.00000, 7.10080, 7.10080, 0, 1593682600, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bw_news
-- ----------------------------
DROP TABLE IF EXISTS `bw_news`;
CREATE TABLE `bw_news`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `type` enum('行业资讯','财经资讯','国际资讯','系统资讯') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '行业资讯' COMMENT '新闻分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_news
-- ----------------------------
INSERT INTO `bw_news` VALUES (7, '星展银行在区块链平台Contour上完成首个跨境人民币数字化贸易交易', '&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;2020年5月13日—— 区块链贸易融资平台Contour宣布，近日中国宝武旗下的宝钢股份与力拓集团运用区块链技术的首单全流程、点对点、无纸化的人民币结算铁矿交易在其平台顺利完成。由全球大宗商品和货运合同点对点管理的云平台Chinsay、新加坡星展银行、无纸化贸易解决方案开发公司essDOCS以及渣打银行在Contour平台上提供支持和服务的铁矿石交易，是全球最大钢企之一中国宝武与世界最大矿山公司之一的力拓集团的这项战略合作，总金额逾一亿元。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在新冠肺炎疫情对国际贸易造成严重冲击的背景下，纸质单据的流转有所变缓。这个由中国宝武与力拓携手实现的钢铁行业首个跨境人民币数字化贸易交易1是应对行业新情况的一种突破。这个交易方式除了有效地推进了人民币国际化，也通过数字化进程安全提高跨境贸易的效率，以及稳定了铁矿石的供应链运行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在纸质单据运输放缓，有可能制约贸易运行的环境下，数字化方案不仅加速了信息的流转，也缩短了贸易单据流转的时间。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;Contour首席执行官魏凯(Carl Wegner)表示： “两个行业领军企业能在Contour平台上2的本次合作，表明了贸易融资网络对钢铁行业发展的重要性。当下，信用证流程中达成无缝衔接、数字化签发的需求日益增加。客户对传统纸质交易的缓慢流程已经提出意见，并寻求能确保贸易的可持续性的有效方案。携手Chinsay、essDOCS解决方案合作方，以及新加入平台的星展银行完成此次交易，进一步实现了Contour支持信用证全流程数字化的目标。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;星展银行企业及机构银行部董事总经理蔡维扬说：“确保供应链的稳定和可持续发展在目前显得更加重要。企业正在加快数字化发展目标，以便在当前贸易环境中寻找新机遇并应对挑战。银行、企业和技术提供商之间共同努力进行创新和协作才能有效促进贸易数字化的网络效应。探索区块链等数字化创新技术不仅提供了一个改变与客户之间长期关系的机会，也提供了必要的手段，为各类型企业及其所组成的整个经济生态系统带来变革性和可持续的改变。作为加入Contour网络的最新成员，我们很荣幸在这一具有里程碑意义的交易中发挥不可或缺的作用，不仅促成第一个以跨境人民币结算的数字化贸易交易，也帮助客户有效管理与交易相关的外汇风险。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;[1]此交易是在区块链Contour平台上，中国宝武和力拓首先通过云平台Chinsay签署贸易合同，力拓再通过essDOCS提供的CargoDocs单证准备解决方案与船东和货代联合起草、审批、签发这项交易的电子提单及支持单据，并通过星展银行提交给到中国宝武。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;[2]作为力拓的通知行的星展银行，是Contour平台的最新会员，也是第一家加入这个平台的新加坡银行。&lt;/span&gt;&lt;/p&gt;', 1589362881, '行业资讯');
INSERT INTO `bw_news` VALUES (8, '星展银行在区块链平台Contour上完成首个跨境人民币数字化贸易交易', '&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;2020年5月13日—— 区块链贸易融资平台Contour宣布，近日中国宝武旗下的宝钢股份与力拓集团运用区块链技术的首单全流程、点对点、无纸化的人民币结算铁矿交易在其平台顺利完成。由全球大宗商品和货运合同点对点管理的云平台Chinsay、新加坡星展银行、无纸化贸易解决方案开发公司essDOCS以及渣打银行在Contour平台上提供支持和服务的铁矿石交易，是全球最大钢企之一中国宝武与世界最大矿山公司之一的力拓集团的这项战略合作，总金额逾一亿元。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在新冠肺炎疫情对国际贸易造成严重冲击的背景下，纸质单据的流转有所变缓。这个由中国宝武与力拓携手实现的钢铁行业首个跨境人民币数字化贸易交易1是应对行业新情况的一种突破。这个交易方式除了有效地推进了人民币国际化，也通过数字化进程安全提高跨境贸易的效率，以及稳定了铁矿石的供应链运行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在纸质单据运输放缓，有可能制约贸易运行的环境下，数字化方案不仅加速了信息的流转，也缩短了贸易单据流转的时间。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;Contour首席执行官魏凯(Carl Wegner)表示： “两个行业领军企业能在Contour平台上2的本次合作，表明了贸易融资网络对钢铁行业发展的重要性。当下，信用证流程中达成无缝衔接、数字化签发的需求日益增加。客户对传统纸质交易的缓慢流程已经提出意见，并寻求能确保贸易的可持续性的有效方案。携手Chinsay、essDOCS解决方案合作方，以及新加入平台的星展银行完成此次交易，进一步实现了Contour支持信用证全流程数字化的目标。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;星展银行企业及机构银行部董事总经理蔡维扬说：“确保供应链的稳定和可持续发展在目前显得更加重要。企业正在加快数字化发展目标，以便在当前贸易环境中寻找新机遇并应对挑战。银行、企业和技术提供商之间共同努力进行创新和协作才能有效促进贸易数字化的网络效应。探索区块链等数字化创新技术不仅提供了一个改变与客户之间长期关系的机会，也提供了必要的手段，为各类型企业及其所组成的整个经济生态系统带来变革性和可持续的改变。作为加入Contour网络的最新成员，我们很荣幸在这一具有里程碑意义的交易中发挥不可或缺的作用，不仅促成第一个以跨境人民币结算的数字化贸易交易，也帮助客户有效管理与交易相关的外汇风险。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;[1]此交易是在区块链Contour平台上，中国宝武和力拓首先通过云平台Chinsay签署贸易合同，力拓再通过essDOCS提供的CargoDocs单证准备解决方案与船东和货代联合起草、审批、签发这项交易的电子提单及支持单据，并通过星展银行提交给到中国宝武。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;[2]作为力拓的通知行的星展银行，是Contour平台的最新会员，也是第一家加入这个平台的新加坡银行。&lt;/span&gt;&lt;/p&gt;', 1589362957, '行业资讯');
INSERT INTO `bw_news` VALUES (9, '贵州：加快区块链技术应用，2022年打造2-3个区块链产业基地', '&lt;p class=&quot;ori_titlesource&quot;&gt;原标题：贵州：加快区块链技术应用，2022年打造2-3个区块链产业基地&lt;/p&gt;&lt;p cms-style=&quot;font-L&quot;&gt;C114讯 5月13日消息（九九）贵州省日前印发《关于加快区块链技术应用和产业发展的意见》(以下简称《意见》)，以加快推动区块链与经济社会各领域、各行业的深度融合。&lt;/p&gt;&lt;p cms-style=&quot;font-L&quot;&gt;《意见》提出，到2022年，贵州省要建设3至5个区块链开放创新平台及公共服务平台、打造2至3个区块链产业基地，引进培育100户以上成长型区块链企业，形成30个以上行业区块链应用解决方案，推广50个以上区块链典型应用示范。&lt;/p&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;text-align: center;&quot;&gt;&lt;img img-size=&quot;879,511&quot; id=&quot;0&quot; src=&quot;https://n.sinaimg.cn/spider2020513/590/w879h511/20200513/f5d7-itmiwrz6241268.png&quot;&gt;&lt;span class=&quot;img_descr&quot; style=&quot;text-align: left;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;p cms-style=&quot;font-L&quot;&gt;围绕提升区块链技术应用和产业发展水平，贵州省将加快推进区块链与实体经济、政府治理、民生服务及新型智慧城市四个方面的融合应用，推出区块链+智能制造、区块链+政务服务、区块链+医疗健康、区块链+智慧交通等23个“区块链+”项目。&lt;/p&gt;&lt;p cms-style=&quot;font-L&quot;&gt;《意见》同时提出，贵州省还将开展区块链产业强基、生态培育、安全防控等三项支撑保障行动。以贵阳贵安为重点，支持设立区块链创新发展联盟，围绕基础算法、系统平台、安全监管、行业应用等开展技术创新，提供共识算法、智能合约、隐私保护等区块链底层技术服务；依托贵州·中国南方数据中心示范基地，提供区块链数据存储、清洗加工、计算交易等业务，推动区块链与云计算、云存储、云安全相结合，探索云计算区块链模式。&lt;/p&gt;&lt;p cms-style=&quot;font-L&quot;&gt;此外，贵州省还将建立健全区块链技术和产业创新发展的财政投入保障机制，鼓励各级政府部门应用区块链技术产品，相关经费按规定列入同级财政预算。充分发挥财政资金的政策引导和杠杆作用，利用专项资金、基金，引导社会资本、技术和人才集聚，支持区块链产业发展。加快完善区块链产业配套政策措施，从政府采购、招商引资、科技支持、产业发展、人才培育、金融服务等多个方面加大区块链发展支持力度。鼓励贵阳贵安设立区块链产业基金，发放“创新券”支持企业上链。&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 1589364599, '财经资讯');
INSERT INTO `bw_news` VALUES (10, '建议打造发展区块链平台 助推新经济发展', '&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;5月13日报道&lt;/strong&gt;&amp;nbsp;省委常委、市委书记范锐平在成都市政协十五届三次会议开幕大会上讲话提到，唱好“双城记”、夺取“双胜利”，要牢牢把握培育创新新动能的战略机遇，厚植创新发展比较竞争优势。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;近年来，新经济发展也已经成为成都经济的新活力。市政协委员、成都新谷投资集团有限公司总经理高潮在听完书记讲话后，表示对未来信心十足。“成都，明天一定会更好。”&lt;/p&gt;&lt;div class=&quot;photo&quot; style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg&quot;&gt;&lt;img alt=&quot;&quot; data-src=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg&quot; src=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg?imageView&amp;amp;thumbnail=750x0&amp;amp;quality=85&amp;amp;type=jpg&amp;amp;interlace=1&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;市政协委员高潮&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;高潮接受成都全搜索记者采访时透露，今年他主要带来的是关于区块链平台打造的提案。“2017年以来，成都发展区块链的产业越来越多，希望在未来成都市新经济发展中，特别是区块链的平台建设、科技企业的扶持方面有更显著的提升。”前不久，成都发布的《供场景给机会加快新经济发展的若干政策措施》中指出，支持企业独立或牵头组建“创新应用实验室”，围绕人工智能、网络协同制造、云计算和大数据、生物技术、区块链等硬核技术和接口标准，开展市场化应用攻关，为场景突破提供技术支撑，这无疑是对新经济发展的有力助推。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;高潮就如何打造区块链平台给出了自己的建议。“将科技产业企业相对聚集，选择有条件有实力的产业园进行区块链平台打造。特别是在当前特殊时期，高新企业的聚集能够与互联网、人工智能、5G发展共生共荣，为成都新经济发展作出应有的贡献，助力夯实高质量发展的产业基础。”&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;特别声明：以上内容(如有图片或视频亦包括在内)为自媒体平台“网易号”用户上传并发布，本平台仅提供信息存储服务。&lt;/p&gt;', 1589364681, '国际资讯');
INSERT INTO `bw_news` VALUES (11, '建议打造发展区块链平台 助推新经济发展', '&lt;p style=&quot;text-align: justify;&quot;&gt;省委常委、市委书记范锐平在成都市政协十五届三次会议开幕大会上讲话提到，唱好“双城记”、夺取“双胜利”，要牢牢把握培育创新新动能的战略机遇，厚植创新发展比较竞争优势。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;img src=&quot;/public/upload/2020-05-13/1589365521168225.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;近年来，新经济发展也已经成为成都经济的新活力。市政协委员、成都新谷投资集团有限公司总经理高潮在听完书记讲话后，表示对未来信心十足。“成都，明天一定会更好。”&lt;/p&gt;&lt;div class=&quot;photo&quot; style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg&quot;&gt;&lt;img alt=&quot;&quot; data-src=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg&quot; src=&quot;http://crawl.ws.126.net/afb2ddc1128feb516781428717f4a98c.jpg?imageView&amp;amp;thumbnail=750x0&amp;amp;quality=85&amp;amp;type=jpg&amp;amp;interlace=1&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;市政协委员高潮&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;高潮接受成都全搜索记者采访时透露，今年他主要带来的是关于区块链平台打造的提案。“2017年以来，成都发展区块链的产业越来越多，希望在未来成都市新经济发展中，特别是区块链的平台建设、科技企业的扶持方面有更显著的提升。”前不久，成都发布的《供场景给机会加快新经济发展的若干政策措施》中指出，支持企业独立或牵头组建“创新应用实验室”，围绕人工智能、网络协同制造、云计算和大数据、生物技术、区块链等硬核技术和接口标准，开展市场化应用攻关，为场景突破提供技术支撑，这无疑是对新经济发展的有力助推。&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;高潮就如何打造区块链平台给出了自己的建议。“将科技产业企业相对聚集，选择有条件有实力的产业园进行区块链平台打造。特别是在当前特殊时期，高新企业的聚集能够与互联网、人工智能、5G发展共生共荣，为成都新经济发展作出应有的贡献，助力夯实高质量发展的产业基础。”&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;特别声明：以上内容(如有图片或视频亦包括在内)为自媒体平台“网易号”用户上传并发布，本平台仅提供信息存储服务。&lt;/p&gt;', 1589365524, '财经资讯');
INSERT INTO `bw_news` VALUES (14, '数据：WBTC总地址数量较年初翻倍', '&lt;p&gt;Glassnode数据显示，持有WBTC的新地址数量大幅上升，截至目前，WBTC总地址数量已增至2880个，较年初增加了100%。注：2019 年\n 1 月份，和比特币挂钩的 ERC20 代币 WBTC （Wrapped Bitcoin）已经正式上线。WBTC 由 BitGo、Kyber \nNetwork 和 Ren （之前名为 Republic Protocol ）等区块链项目联合推出，该代币在以太坊上发行，与比特币 1:1 \n挂钩。\n&lt;/p&gt;', 1592877084, '行业资讯');
INSERT INTO `bw_news` VALUES (15, 'TokenInsight：BTC链上活跃度快速反弹，现货交易量上升', '&lt;p&gt;据TokenInsight数据显示，反映区块链行业整体表现的TI指数北京时间06月23日8时报729.61点，较昨日同期上涨26.25点，涨幅为3.73%。此外，在TokenInsight密切关注的10大行业中，24小时内涨幅最高的为锚定与储备行业，涨幅为21.82%；24小时内跌幅最高的为电子商务行业，跌幅为14.06%。\n据监测显示，BTC \n24h成交额为$213亿，活跃地址数较前日上升15.07%，转账数较前日上升6.03%。Coinwalle分析师Jeffrey认为，BTC链上活跃度快速反弹，现货交易量上升，短期或将震荡上行。\n注：以上内容仅供参考，不构成投资建议。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877203351897.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877205, '行业资讯');
INSERT INTO `bw_news` VALUES (16, '浙江推出基于区块链的冷链食品追溯系统', '&lt;p&gt;浙江日报消息，6月22日，记者从省市场监管局获悉，基于区块链技术开发的浙江省冷链食品追溯系统（下称“浙冷链”）正式上线。“浙冷链”首批将对进口生食水产品进行赋码、扫码，后续实现全省重点冷链食品全覆盖。\n该系统以进口食品经营企业和农产品批发市场作为首站，利用“冷链食品溯源码”实现从供应链首站到消费环节产品最小包装的闭环追溯管理，全面掌握冷链食品供应链流向。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877267514178.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877269, '行业资讯');
INSERT INTO `bw_news` VALUES (17, '英国广告标准局新警报系统主要针对数字货币和外汇市场', '&lt;p&gt;据coingeek消息，英国广告标准局（ASA）宣布推出新警报系统，以应对不断上升的在线广告欺诈行为，特别是付费广告。当局表示，广告欺诈行为在数字货币和外汇市场最为严重，人们在不知情的情况下受骗，涉及金额高达1.97亿英镑(2.55亿美元)。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877353223506.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877355, '行业资讯');
INSERT INTO `bw_news` VALUES (18, '工商银行德州分行发放首笔数字供应链融资业务', '&lt;p&gt;齐鲁晚报消息，工行德州分行深入贯彻党中央、银保监会、总、省行疫情防控常态化和支持企业复工复产工作要求，充分发挥数字供应链融资的产品优势，日前通过工银e信供应链融资成功为辖内某核心企业发放首笔数字供应链融资业务，全程采用线上操作，有效降低了企业的融资难度。 \n据了解，“工银e信”是工商银行线上供应链产品，以核心企业为依托，应用区块链和大数据技术盘活核心企业空置授信，可实现全链条授信融资，通过数字信用凭据流转突破客户和业务受地域限制的传统弊端。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877519283045.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877520, '行业资讯');
INSERT INTO `bw_news` VALUES (19, '报告：澳大利亚2019年在加密货币骗局中损失近1500万美元', '&lt;p&gt;Cointelegraph消息，2019年，澳大利亚提交了1810份与加密货币相关的骗局报告，总价值超过2160万澳元（约1490万美元）。根据澳大利亚竞争与消费者委员会下属机构Scamwatch的研究，年龄在25至34岁之间的澳大利亚年轻人是受加密投资骗局影响最大的群体。报告指出，云加密挖矿成为常见的骗局，其中大多数是庞氏骗局，不涉及真正的加密货币。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877583625454.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877584, '行业资讯');
INSERT INTO `bw_news` VALUES (20, '报告：澳大利亚2019年在加密货币骗局中损失近1500万美元', '&lt;p&gt;Cointelegraph消息，2019年，澳大利亚提交了1810份与加密货币相关的骗局报告，总价值超过2160万澳元（约1490万美元）。根据澳大利亚竞争与消费者委员会下属机构Scamwatch的研究，年龄在25至34岁之间的澳大利亚年轻人是受加密投资骗局影响最大的群体。报告指出，云加密挖矿成为常见的骗局，其中大多数是庞氏骗局，不涉及真正的加密货币。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877583625454.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877587, '行业资讯');
INSERT INTO `bw_news` VALUES (21, '中信建投：A股仍有显著上行空间', '&lt;p&gt;中信建投指出，根据库存周期和康波周期的叠加，预计今年的三季度和四季度国内经济基本面将回到高位，对应指数回到2016年底附近的位置。从结构上看，当前低估值权重股票已极具配置价值，很难再次大幅下跌，从而限制了指数的下行空间。美股方面，短期疫情及政治局势存在不确定性，但流动性将提供支撑，预计美股短期震荡，随着复工带来的基本面修复，中期仍有向上空间。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877662631098.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877663, '行业资讯');
INSERT INTO `bw_news` VALUES (22, '韩国经济学家：征收加密货币税或阻碍数字货币市场工业增长', '&lt;p&gt;据econotimes消息，韩国延世大学经济学家宋泰允表示，在市场仍处于起步阶段时，政府征收加密货币税为时尚早，征收加密货币税可能会阻碍新兴数字货币市场的工业增长。此前消息，韩国财政部正在研究如何对加密货币交易征税，并可能对加密收入征收资本利得税。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592877828790466.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592877830, '行业资讯');
INSERT INTO `bw_news` VALUES (23, '意大利银行欲参与数字欧元试点，“货币稳定和遵循监管”被列为优先考虑事项', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;PANews 6&lt;/span&gt;月&lt;span lang=&quot;EN-US&quot;&gt;22&lt;/span&gt;日消息，据&lt;span lang=&quot;EN-US&quot;&gt;Condesk&lt;/span&gt;报道，由&lt;span lang=&quot;EN-US&quot;&gt; 700 &lt;/span&gt;多家意大利银行机构组成的意大利银行业协会（&lt;span lang=&quot;EN-US&quot;&gt;Italian Banking Association&lt;/span&gt;，&lt;span lang=&quot;EN-US&quot;&gt;ABI&lt;/span&gt;）于上周宣布，他们愿意参与数字欧元试点。其中，在&lt;span lang=&quot;EN-US&quot;&gt;ABI&lt;/span&gt;分享的关于数字欧元的十项考虑中，&lt;span lang=&quot;EN-US&quot;&gt;“&lt;/span&gt;必须优先考虑保持货币稳定和完全遵守欧洲监管框架&lt;span lang=&quot;EN-US&quot;&gt;”&lt;/span&gt;被列为优先事项。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;ABI&lt;/span&gt;透露，他们于去年就成立了一个探索数字货币和加密货币资产的专家组。目前，&lt;span lang=&quot;EN-US&quot;&gt;ABI&lt;/span&gt;已经通过基于区块链开发的项目&lt;span lang=&quot;EN-US&quot;&gt;Spunta&lt;/span&gt;，加快银行间结算的处理速度。此次，他们希望通过参与数字欧元的相关项目和实验，帮助加速欧洲央行支持的数字货币的实施。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;据了解，受冠状疫情毒的持续蔓延以及其带来的经济影响，欧洲央行开始探索未来发行数字欧元的可能性 。今年&lt;span lang=&quot;EN-US&quot;&gt;5&lt;/span&gt;月，法国中央银行法兰西银行宣布首次成功测试了基于区块链的数字欧元。法国央行行长&lt;span lang=&quot;EN-US&quot;&gt;François Villeroy de Galha&lt;/span&gt;表示，数字欧元将首先在银行之间使用，而不是用于消费者日常使用。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592878071380512.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;', 1592878075, '国际资讯');
INSERT INTO `bw_news` VALUES (24, '在美联储发表评论后，黄金支持者Schiff称比特币为法币', '&lt;div class=&quot;content-zy-bg&quot;&gt;\n                        &lt;div class=&quot;content-zy-txt&quot;&gt;黄金支持者Peter Schiff再次在推特上抨击比特币,他同意美联储的观点,即比特币应被归类为法币。&lt;/div&gt;\n                    &lt;/div&gt;\n\n                    \n\n                    &lt;div class=&quot;content-size16 content-h28&quot;&gt;\n                        &lt;img src=&quot;http://img.panewslab.com/upload/image/20200621/20062110310934639027.jpeg&quot;&gt;&lt;p&gt;导&lt;/p&gt;&lt;p&gt;黄金支持者Peter Schiff再次在推特上抨击比特币，他同意美联储的观点，即比特币应被归类为法币。今年3月，他还称比特币投资者是傻瓜。&lt;/p&gt;&lt;p&gt;文：Benjamin Pirus&lt;/p&gt;&lt;p&gt;编译：Zion &amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;责编：Rose&lt;/p&gt;&lt;p&gt;经济学家，金融评论员和黄金支持者Peter Schiff再次在推特上抨击比特币，实质上称比特币为法币——美元等地区货币的名称。&lt;/p&gt;&lt;p&gt;Schiff在6月20日的推文中说：“美联储对比特币的判断是正确的。”他补充说：与具有实际价值的黄金相比，它将比特币归类为法币。它认为比特币没什么新意，只是在它的交易方式上。随着人们对传统货币和加密货币失去信心，储户将回归黄金。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;美联储将比特币归类为法币&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;纽约联邦储备银行旗下的博客自由街经济（The Liberty Street Economics）在6月18日的一篇文章中指出，比特币和其他加密货币只不过是另一种形式的现金，而不是像加密货币行业所说的“新型货币”。&lt;/p&gt;&lt;p&gt;这篇文章指出了货币本身与人们进行交易或使用的方式之间的区别。“在没有可信任的一方的情况下进行电子交易的能力——这是比特币的特征——是一种全新的技术。”&lt;/p&gt;&lt;p&gt;比特币不是一种新型货币，它是一种新型的交易机制，这种交易机制可以支持多种形式的货币以及其他类型的资产。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Peter Schiff经常偏爱黄金&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;在对这个问题发表了许多评论之后，Peter\n \nSchiff在加密货币领域被认为是一个可以随时用黄金取代加密货币的人。Schiff在2020年2月25日推特上抨击比特币作为一种价值存储手段后，他说：比特币出现的时间还不够长，不足以证明P.tBarnum说的对。每分钟都有一个傻瓜诞生，其中许多人拥有比特币。&lt;/p&gt;&lt;p&gt;2020年4月，经济学家还预测未来几年黄金价格将会飙升，比特币价值将会暴跌。今年3月，他还称比特币投资者是傻瓜。&lt;/p&gt;\n                    &lt;/div&gt;', 1592878155, '国际资讯');
INSERT INTO `bw_news` VALUES (25, '报告：预计2025年全球加密资产管理市场规模将增长至11亿美元，亚太地区增长率最高', '&lt;div class=&quot;content-zy-bg&quot;&gt;\n                        &lt;div class=&quot;content-zy-txt&quot;&gt;市场研究公司Reportlinker.com最新报告指出，全球加密资产管理市场规模预计将从2020年的4亿美元增长到2025年的11亿美元。&lt;/div&gt;\n                    &lt;/div&gt;\n\n                    \n\n                    \n                        &lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;PANews 6&lt;/span&gt;月&lt;span lang=&quot;EN-US&quot;&gt;19&lt;/span&gt;日消息，市场研究公司&lt;span lang=&quot;EN-US&quot;&gt;Reportlinker.com&lt;/span&gt;最新报告指出，全球加密资产管理市场规模预计将从&lt;span lang=&quot;EN-US&quot;&gt;2020&lt;/span&gt;年的&lt;span lang=&quot;EN-US&quot;&gt;4&lt;/span&gt;亿美元增长到&lt;span lang=&quot;EN-US&quot;&gt;2025&lt;/span&gt;年的&lt;span lang=&quot;EN-US&quot;&gt;11&lt;/span&gt;亿美元，在预测期间年复合增长率（&lt;span lang=&quot;EN-US&quot;&gt;CAGR&lt;/span&gt;）为&lt;span lang=&quot;EN-US&quot;&gt;23.8%&lt;/span&gt;。越来越多的风险投资和对加密资产管理技术的投资将推动市场增长。其中，亚太地区的增长率最高。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;报告还指出，基于解决方案，钱包管理领域将在&lt;span lang=&quot;EN-US&quot;&gt;2020&lt;/span&gt;年占据更高的市场份额。钱包管理解决方案使企业能够保护其数字资产并优化业务操作。此外，资产管理公司和小型金融机构主要使用这种解决方案。无论是大型还是小型金融机构，都越来越多地采用加密货币。因此，钱包管理领域在预测期内的增长率最高。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592878685902251.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;', 1592878686, '国际资讯');
INSERT INTO `bw_news` VALUES (26, '新加坡金融管理局行长：正与中国央行探讨CBDC落地场景', '&lt;div class=&quot;content-zy-bg&quot;&gt;\n                        &lt;div class=&quot;content-zy-txt&quot;&gt;孟文能表示，CBDC（央行数字货币）是当前非常热的话题，中国央行在该领域的探索非常积极，新加坡与中国央行有非常多的交流，双方正在探讨CBDC相关落地场景。&lt;/div&gt;\n                    &lt;/div&gt;\n\n                    \n\n                    \n                        &lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;PANews 6&lt;/span&gt;月&lt;span lang=&quot;EN-US&quot;&gt;18&lt;/span&gt;日消息，据新浪财经报道，新加坡金融管理局行长孟文能在加强沪新金融合作的专场论坛中表示，&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;（央行数字货币）是当前非常热的话题，中国央行在该领域的探索非常积极，新加坡与中国央行有非常多的交流，双方正在探讨&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;相关落地场景。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;span&gt;同时，孟文能还表示，大家现在对&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;本身非常激动，但更应该关注的是其使用场景，每个国家研发&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;可能会有不同的动机，例如瑞典计划开始测试的电子克朗主要用于零售支付，而柬埔寨计划发行的&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;则是为了促进金融包容。另外，&lt;span lang=&quot;EN-US&quot;&gt;Libra&lt;/span&gt;对全球央行系统是一大挑战，不过&lt;span lang=&quot;EN-US&quot;&gt;Libra&lt;/span&gt;具有很大的灵活性，愿意倾听监管者的声音，我们不应拒绝&lt;span lang=&quot;EN-US&quot;&gt;Libra&lt;/span&gt;的价值，而应该与他们进行更多的讨论。&lt;/span&gt;', 1592878734, '行业资讯');
INSERT INTO `bw_news` VALUES (27, '美联储主席鲍威尔：各国央行都需了解数字货币，美联储发行数字货币还有很多问题待解', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;PANews 6&lt;/span&gt;月&lt;span lang=&quot;EN-US&quot;&gt;18&lt;/span&gt;日消息，据财联社报道，美联储主席鲍威尔表示，各国央行都需要了解数字货币。在美联储创造联储的数字货币之前，有许多严肃的问题需要获得解答。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;但是，在回答众议员Tom Emmer的问题时，鲍威尔表示，他认为私人实体在设计数字美元方面没有作用。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;去年&lt;span lang=&quot;EN-US&quot;&gt;12&lt;/span&gt;月美国财长姆努钦在众议院金融服务委员会听证会上也表示，他与鲍威尔都同意在未来五年中，美联储无需发行数字货币。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;span&gt;&lt;span&gt;不过，今年&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;5&lt;/span&gt;&lt;span&gt;月，一份&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;&lt;span&gt;由CFTC前主席Christopher Giancarlo、CFTC前金融科技办公室负责人Daniel Gorfine等联合发起的“&lt;/span&gt;&lt;/span&gt;&lt;span&gt;数字美元计划&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;”&lt;/span&gt;&lt;span&gt;受到了广泛关注。乔布斯法（&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;JOBS ACT&lt;/span&gt;&lt;span&gt;）之父的&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;David Weild IV&lt;/span&gt;&lt;span&gt;认为，数字美元的发行迫在眉睫，美国政府应该加快步伐。据了解，该白皮书介绍了央行美元数字货币&lt;/span&gt;&lt;span lang=&quot;EN-US&quot;&gt;CBDC&lt;/span&gt;&lt;span&gt;的潜在应用，以及新生智库推动数字美元发展的一些相关工作。同时，还对数字美元作出了定义，讲述了如何推动数字美元项目核心原则。&lt;/span&gt;&lt;/span&gt;', 1592878798, '国际资讯');
INSERT INTO `bw_news` VALUES (28, 'Maskbook与Gitcoin合作推出“小程序”，允许用户在社交网络中发起加密货币捐款', '&lt;div class=&quot;content-size16 content-h28&quot;&gt;\n                        &lt;p class=&quot;MsoNormal&quot;&gt;PANews 6&lt;span&gt;月17日 消息，近日，&lt;/span&gt;Maskbook宣布与Gitcoin进行合作，开发了一个全新小程序，该小程序允许开发者在社交网络中发起基于加密货币的捐款链接。用户只需点击“资助此捐款”按钮，就能直接向该项目发送加密货币。&amp;nbsp;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;同时，开发者在进行募捐的过程中，也会与由以太坊生态系统的捐助者赞助的Gitcoin QF基金进行匹配。例如，某项目如果收到的是50个单独的&lt;span&gt;1 DAI的捐款，那该项目能从匹配池中获得的拨款资金要远高于另一个收到单独1笔为100 DAI的捐款。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;据悉，在2020年初时，Maskbook曾推出了一项名为“红包”的特殊功能，它允许用户在Twitter上申领和分发加密货币。&amp;nbsp;&lt;span&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;img src=&quot;https://www.panewslab.com/upload/image/20200617/S259a991f30c74d04922ed4128d47ca7e.png&quot; alt=&quot;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n                    &lt;/div&gt;&lt;br&gt;', 1592878874, '国际资讯');
INSERT INTO `bw_news` VALUES (29, '日本加密货币持有者偏好XRP胜过ETH', '&lt;div class=&quot;content-size16 content-h28&quot;&gt;\n                        &lt;img src=&quot;http://img.panewslab.com/upload/image/20200617/20061716261137392893.jpeg&quot;&gt;&lt;p&gt;暴走时评：根据日本加密货币交易所BITMAX于6月12日在推特上发布的一项调查结果显示，比特币在日本的交易者中的受欢迎程度几乎和XRP代币差不多。ETH以9%的比例位居第三。&lt;/p&gt;&lt;p&gt;作者：TURNER WRIGHT &amp;nbsp;&amp;nbsp;|&amp;nbsp; &amp;nbsp;编译者：Maya&lt;/p&gt;&lt;p&gt;尽管以太坊目前是市值第二大的加密货币，但日本的加密货币持有者可能更愿意持有XRP。&lt;/p&gt;&lt;p&gt;根据日本加密货币交易所BITMAX于6月12日在推特上发布的一项调查结果显示，比特币在日本的交易者中的受欢迎程度几乎和XRP代币差不多。在接受调查的1498人中，有25%的人告诉BITMAX，XRP是他们最喜欢的加密货币，而26%的人更喜欢BTC。ETH以9%的比例位居第三。&lt;/p&gt;&lt;p&gt;需要注意的是，像上述调查中的小样本量，未必足够得出一个定论。&lt;/p&gt;&lt;p&gt;然而，日本虚拟货币交易协会（JVCEA）在2019年12月报告了类似的调查结果。在日元计价的数字资产持有数量中，XRP仅次于BTC，ETH则位居第三。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;XRP在日本以外地区失去支持？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;4月时有报道称，2020年第一季度推特上对XRP的在线参与度下降，而Ripple被迫清算其持有的许多股票以保持现金流为正。加密分析公司Messari发布数据显示，XRP是2019年表现最差的大盘代币。&lt;/p&gt;&lt;p&gt;XRP代币在2017年底的最高价为2.28美元，而其现价只有这个价格的很小一部分。虽然XRP整体规模可能缩水，但对于日本的代币爱好者来说，情况可能并非如此。&lt;/p&gt;\n                    &lt;/div&gt;', 1592878930, '国际资讯');
INSERT INTO `bw_news` VALUES (30, '韩国将于7月公布虚拟货币税法修正案', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;span lang=&quot;EN-US&quot;&gt;PANews 6&lt;/span&gt;月&lt;span lang=&quot;EN-US&quot;&gt;17&lt;/span&gt;日消息，据韩联社报道，韩国副总理兼财政部长洪南基透露称，政府将于&lt;span lang=&quot;EN-US&quot;&gt;7&lt;/span&gt;月公布虚拟货币税法修正案。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;洪南基表示，韩国一直在努力建立新的税制，以适应不断变化的环境，目前正在制定针对各种项目和税种的新税制。&lt;span lang=&quot;EN-US&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;span&gt;韩国是最活跃的加密货币市场之一。自去年以来，韩国政府一直在评估国际趋势和主要国家的加密货币征税方法，旨在修改现有的韩国本地税法来适应加密货币的发展。今年&lt;span lang=&quot;EN-US&quot;&gt;5&lt;/span&gt;月，韩国经济和财政部就曾表示，拟议的修正案将在&lt;span lang=&quot;EN-US&quot;&gt;7&lt;/span&gt;月前完成，并将于&lt;span lang=&quot;EN-US&quot;&gt;2020 &lt;/span&gt;年&lt;span lang=&quot;EN-US&quot;&gt;9&lt;/span&gt;月提交议会，内容涉及加密货币、加密矿业、以及&lt;span lang=&quot;EN-US&quot;&gt;ICO&lt;/span&gt;征税（韩国目前仍禁止发行&lt;span lang=&quot;EN-US&quot;&gt;ICO&lt;/span&gt;）。&lt;/span&gt;', 1592878963, '国际资讯');
INSERT INTO `bw_news` VALUES (31, '澳本聪称自己为可以根据需求自由做事的骗子', '&lt;p&gt;比特币早期开发者Gavin Andresen此前对澳本聪（CraigWright）是否是中本聪产生了怀疑。而在一封发送给Gavin \nAndresen邮件中，澳本聪显然承认自己是个骗子。他写道：“我是一个骗子，但我是一个可以根据自己的需要自由做事的骗子。”据称，澳本聪这一说法或许将会使其此后的诉讼面临更大的挑战。\n                    &lt;/p&gt;', 1592879055, '国际资讯');
INSERT INTO `bw_news` VALUES (32, '数据监测： 昨日交易所净流出 1.63 万 ETH', '&lt;p class=&quot;details-title mb-0&quot;&gt;据 MyToken 链上数据监控显示，昨日净流出交易所 1.63 万 ETH，约 398 万美元。\n流入交易所：70.21 万 ETH，其中 14.25 万个为大额转账。\n流出交易所：71.83 万 ETH，其中 16.74 万个为大额转账。\n\n链上资金流向与资金量可以体现市场内主力以及散户的不同交易意愿，ETH 的资金流向亦能一定程度表明大盘的趋势。 &lt;br&gt;&lt;/p&gt;&lt;p class=&quot;details-title mb-0&quot;&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879169432816.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879171, '财经资讯');
INSERT INTO `bw_news` VALUES (33, '3500枚BTC从币安交易所转出 价值3407.23万美元', '&lt;p&gt;Whale \nAlert数据显示，北京时间06月23日05:33，3500枚BTC从币安交易所转入未知地址，按当前价格计算，价值约3407.23万美元，交易哈希为：f0bdb771b18c4f652236caf3312609a2a1ec2b6fb6cc42499a4e124c4e8b0a2a。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879255130991.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879258, '财经资讯');
INSERT INTO `bw_news` VALUES (34, 'CME比特币期货6月合约收涨2.9%', '&lt;p&gt;报道，成交量最高的CME比特币期货2020年6月合约今日收涨270美元，收涨9585美元，涨幅达2.9%。2020年7月、8月和9月合约分别收报9660美元、9705美元和9745美元。\n                    &lt;/p&gt;', 1592879289, '财经资讯');
INSERT INTO `bw_news` VALUES (35, 'BTC短时突破9700 USDT后回落', '&lt;p&gt;波网Boboo.com行情显示，BTC短时快速拉升，突破9700 USDT后回落。现报9684.34 USDT，24H涨幅3.66%。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879345705095.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879346, '财经资讯');
INSERT INTO `bw_news` VALUES (36, '美股收盘：三大股指均收涨 美股区块链板块收涨0.47%', '&lt;p&gt;美股收盘：道指收涨0.59%，标普指数收涨0.66%。纳指收涨1.11%。美股区块链板块收涨0.47%。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879392340611.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879393, '财经资讯');
INSERT INTO `bw_news` VALUES (37, 'OKB短线拉升突破5.2 USDT 24H涨幅超9%', '&lt;p&gt;OKEx行情显示，晚间OKB短线拉升，最高涨至5.309 USDT后回落。刚刚OKB再度拉升后小幅回落，现报5.2 \nUSDT，24H涨幅9.65%。此外，HT晚间也有小幅拉升，最高涨至4.2718 USDT后回落。现报4.23 USDT，日内涨幅3.71%。 &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879600718158.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879601, '行业资讯');
INSERT INTO `bw_news` VALUES (38, '现货黄金上破1760美元/盎司，续创一个月新高', '&lt;p&gt;现货黄金上破1760美元/盎司，续创一个月新高，日涨幅超1%。现货白银站上18美元/盎司关口，刷新6月11日以来新高，日内涨幅2.55%。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592879688158439.jpg&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592879690, '财经资讯');
INSERT INTO `bw_news` VALUES (41, '公司简介', '&lt;div class=&quot;guanyu_b&quot; id=&quot;jianjie&quot;&gt;&lt;div class=&quot;guanyu_b_nr&quot;&gt;&lt;div class=&quot;guanyu_b_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_05.png&quot; width=&quot;798&quot; height=&quot;324&quot; alt=&quot;消费分期系统&quot;&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_b_zi&quot;&gt;&lt;p&gt;深圳龙霸网络集团有着10年软件系统开发和互联网经验，我们的使命是帮助企业在各个领域 取得更大的成功！为企业开发各种营销推广商城、会员结算系统，助企业腾飞的一臂之力，达到如虎添翼的 效果！在10年的建站服务中，我们总结出一套行之有效的售前、售中、售后服务管理经验，使客户在与我们 业务合作的过程中更我们通畅更为和谐。我们团队有着十年商城系统开发与互联网经验，我们的使命是 帮助企业在各个领域取得更大的成功，达到如虎添翼的效果！自成立以后，我们已经服务超过30000+客户， 服务好评率超过99%，客户的支持和新人是促使我们做的更好的源源不断的动力！这一切让微商宝团队走向下一个 更大的梦想：用最快的速度，帮助中国企业通过微商走向成功！&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_c&quot; id=&quot;wenhua&quot;&gt;&lt;div class=&quot;guanyu_title&quot;&gt;&lt;div class=&quot;guanyu_title1&quot;&gt;企业文化&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_c_nr&quot;&gt;&lt;div class=&quot;guanyu_c_zi&quot;&gt;&lt;p&gt;我们的使命：用最快的速度，帮助中国企业通过微商走向成功！&lt;/p&gt;&lt;p&gt;我们的价值观：您所关注的就是我们所专注的&lt;/p&gt;&lt;p&gt;我们的精神：历精更始 赤诚相待 智周万物 开创未来&lt;/p&gt;&lt;br&gt;&lt;p&gt;企业用户观：我们因用户的存在而存在，随用户发展而发展。用户是我们的衣食父母，是搀扶我们走向成功的合作伙伴。我们愿与用户建立一种诚信合作、互助共赢的长期合作伙伴关系。通过创新、服务为用户创造价值，是我们的使命，也是我们的价值。我们的所有工作都是为了服务用户，让用户满意我们是我们永远追求的目标。我们会忠实于我们的用户，忠实我们的承诺，做一个诚信的技术服务商。&lt;/p&gt;&lt;br&gt;&lt;p&gt;企业服务观：先卖诚信，后卖服务，再卖产品。创造用户的满意，永远是我们追求的目标。能服务好用户的员工，才是真正合格的员工。企业的本质是服务用户，员工的本质也是服务用户。&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_c_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_09.png&quot; width=&quot;404&quot; height=&quot;246&quot; alt=&quot;网贷系统开发&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sy_rongyu&quot; id=&quot;rongyu&quot;&gt;&lt;div class=&quot;rongyu&quot;&gt;&lt;div class=&quot;guanyu_title&quot;&gt;&lt;div class=&quot;guanyu_title1&quot;&gt;荣誉资质&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr&quot;&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy1.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy2.png&quot; width=&quot;869&quot; height=&quot;624&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy3.png&quot; width=&quot;869&quot; height=&quot;624&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy4.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy5.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy6.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy7.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;div class=&quot;rongyu_nr_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/qy8.png&quot; width=&quot;869&quot; height=&quot;623&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;canzhan_nr&quot;&gt;&lt;div class=&quot;canzhan&quot;&gt;&lt;div class=&quot;exhibition&quot;&gt;&lt;div class=&quot;exhibition_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/zh1.png&quot; width=&quot;279&quot; height=&quot;193&quot;&gt;&lt;div class=&quot;exhibition_text&quot; style=&quot;text-align: center;&quot;&gt;浙江国际会展中心&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;exhibition_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/zh2.png&quot; width=&quot;279&quot; height=&quot;193&quot;&gt;&lt;div class=&quot;exhibition_text&quot; style=&quot;text-align: center;&quot;&gt;广州邑州会展中心&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;exhibition_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/zh3.png&quot; width=&quot;279&quot; height=&quot;194&quot;&gt;&lt;div class=&quot;exhibition_text&quot; style=&quot;text-align: center;&quot;&gt;上海国际会展中心&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;exhibition_div&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/zh4.png&quot; width=&quot;279&quot; height=&quot;194&quot;&gt;&lt;div class=&quot;exhibition_text&quot; style=&quot;text-align: center;&quot;&gt;深圳市会展中心&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sylongba_a_nrc&quot;&gt;&lt;div class=&quot;sylongba_a_lic&quot;&gt;&lt;div class=&quot;sylongba_a_lictu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/bw_321.png&quot; width=&quot;216&quot; height=&quot;310&quot; alt=&quot;P2P系统开发&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sylongba_a_lic&quot;&gt;&lt;div class=&quot;sylongba_a_lictu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/bw_341.png&quot; width=&quot;216&quot; height=&quot;310&quot; alt=&quot;金融系统开发&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sylongba_a_lic&quot;&gt;&lt;div class=&quot;sylongba_a_lictu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/bw_361.png&quot; width=&quot;216&quot; height=&quot;310&quot; alt=&quot;众筹系统&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sylongba_a_lic&quot;&gt;&lt;div class=&quot;sylongba_a_lictu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/bw_381.png&quot; width=&quot;216&quot; height=&quot;310&quot; alt=&quot;信贷风控系统&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;sylongba_a_lic&quot;&gt;&lt;div class=&quot;sylongba_a_lictu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/bw_381.png&quot; width=&quot;216&quot; height=&quot;310&quot; alt=&quot;虚拟币金融系统&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_d&quot; id=&quot;yanfa&quot;&gt;&lt;div class=&quot;guanyu_title&quot;&gt;&lt;div class=&quot;guanyu_title1&quot;&gt;研发中心&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_d_nr&quot;&gt;&lt;div class=&quot;guanyu_d_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_13.png&quot; width=&quot;396&quot; height=&quot;231&quot;&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_d_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_15.png&quot; width=&quot;384&quot; height=&quot;231&quot;&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_d_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_17.png&quot; width=&quot;348&quot; height=&quot;231&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_e&quot; id=&quot;tuandui&quot;&gt;&lt;div class=&quot;guanyu_title&quot;&gt;&lt;div class=&quot;guanyu_title1&quot;&gt;团队介绍&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;guanyu_e_nr&quot;&gt;&lt;div class=&quot;guanyu_e_tu&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.longbasz.com/images/guanyu_23.png&quot; width=&quot;1214&quot; height=&quot;532&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 1592912948, '系统资讯');
INSERT INTO `bw_news` VALUES (42, '联系我们', '&lt;p&gt;&lt;img src=&quot;/public/upload/2020-06-23/1592913660105575.png&quot; alt=&quot;undefined&quot;&gt;&lt;br&gt;&lt;/p&gt;', 1592913662, '系统资讯');
INSERT INTO `bw_news` VALUES (43, '团队介绍', '&lt;div&gt;&lt;dl&gt;&lt;p style=&quot;text-align: center; &quot;&gt;&lt;b&gt;6大优势&lt;/b&gt;&lt;/p&gt;&lt;p&gt;丰富的从业经验&lt;/p&gt;&lt;dd&gt;我们团队的骨干成员均有超过10年以上的行业背景，良好的职业素养造就了职业化的团队，丰富的行业资源以及核心的技术实力保证了企业的持续发展。&lt;/dd&gt;&lt;/dl&gt;&lt;dl&gt;&lt;dt&gt;独到的创意设计&lt;/dt&gt;&lt;dd&gt;我们的设计师拥有多年的行业经验的任职经历。艺术的美学和商业价值的完美体现是我们创意团队追求的目标。&lt;/dd&gt;&lt;/dl&gt;&lt;dl&gt;&lt;dt&gt;领先业界的前言技术&lt;/dt&gt;&lt;dd&gt;我们针对企业用户，研发KuCoin独立网店系统，获得专项基金扶持。我们为客户实施基于互联网的3D虚拟演示技术，至今已为多家500强企业进行了技术应用。&lt;/dd&gt;&lt;/dl&gt;&lt;/div&gt;&lt;div&gt;&lt;dl&gt;&lt;dt&gt;专案项目管理&lt;/dt&gt;&lt;dd&gt;我们会为每个项目配备专案项目经理，为高端客户提供优质服务。项目经理会全程跟踪把控项目进度，保证项目的顺利实施。项目的进展过程中，客户可通过项目系统实时掌握项目进展情况。&lt;/dd&gt;&lt;/dl&gt;&lt;dl&gt;&lt;dt&gt;知名客户的服务经验&lt;/dt&gt;&lt;dd&gt;我们为中高端客户提供量身定制的方案，详实的数据分析、专业的项目提案、敬业的工作态度和及时的响应验证了我们服务体系的价值。&lt;/dd&gt;&lt;/dl&gt;&lt;dl&gt;&lt;dt&gt;跨行业的多元合作&lt;/dt&gt;&lt;dd&gt;我们致力于跨行业的协同合作与交流，为其提供大客户互联网应用解决方案和外包制作服务。同时，我们也努力拓展各行业的电子商务合作，侧重于行业型网站的运营。&lt;/dd&gt;&lt;/dl&gt;&lt;/div&gt;', 1592913909, '系统资讯');

-- ----------------------------
-- Table structure for bw_newscoin
-- ----------------------------
DROP TABLE IF EXISTS `bw_newscoin`;
CREATE TABLE `bw_newscoin`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `xbys_id` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '活动ID',
  `user_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `currency_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '认购币种',
  `x_currency_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付币种',
  `price` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '认购价格',
  `num` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '认购数量',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '认购时间',
  `unfreeze` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '解冻次数',
  `financial_cycle` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '解冻间隔',
  `freeze_status` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '已解冻状态（次数）',
  `freeze_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '上次解冻时间',
  `time_type` enum('分','时','日','月','年') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '分' COMMENT '解冻时间类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_newscoin
-- ----------------------------
INSERT INTO `bw_newscoin` VALUES (4, 1, 1, 'long ba token hot', 'LBTH', 'USDT', 0.500, 10, 1590040367, 5, 1, 0, NULL, '分');
INSERT INTO `bw_newscoin` VALUES (5, 1, 1, 'long ba token hot', 'LBTH', 'USDT', 0.500, 20, 1590040394, 5, 1, 0, NULL, '分');
INSERT INTO `bw_newscoin` VALUES (6, 2, 1, 'Ethereum', 'ETH', 'BTC', 50.000, 10, 1590042060, 10, 3, 0, NULL, '分');
INSERT INTO `bw_newscoin` VALUES (7, 3, 1, 'Bitcoin', 'BTC', 'USDT', 1.000, 10, 1592472450, 10, 1440, 0, NULL, '分');
INSERT INTO `bw_newscoin` VALUES (8, 1, 2, 'long ba token hot', 'LBTH', 'USDT', 0.500, 1, 1592480340, 5, 1, 0, NULL, '分');
INSERT INTO `bw_newscoin` VALUES (9, 1, 2, 'long ba token hot', 'LBTH', 'USDT', 0.500, 1, 1592480393, 5, 1, 0, NULL, '分');

-- ----------------------------
-- Table structure for bw_notice
-- ----------------------------
DROP TABLE IF EXISTS `bw_notice`;
CREATE TABLE `bw_notice`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` enum('收款设置','账户注册','资产管理','密码修改','出售USDT','购买USDT','身份认证','杠杆交易') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_notice
-- ----------------------------
INSERT INTO `bw_notice` VALUES (2, '收款设置', '&lt;p&gt;&lt;span&gt;&lt;span&gt;收款设置的信息必须填写正确，当向商家出售USDT时，商家是以用户填写的收款信息打款的，如未按要求填写或错漏，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;平台无法追回损失，用户需自行承担损失。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1:点击账号 → 收款设置。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：录入个人信息 → 点击确认 → 显示保存成功即设置完成。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (3, '账户注册', '&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：点击注册 → 录入手机号 → 发送验证码 → 录入手机接收的验证码 → 点击确认。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：设置密码 → 输入邀请码 → 点击确认。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (4, '资产管理', '&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;一：资产查询&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：杠杆账户可查询杠杆账户资产，法币账户可查询法币账户资产。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;二：资金划转&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：输入划转数量 → 点击确定划转。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (5, '密码修改', '&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;一：修改密码&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1:点击账号 → 账户设置 → 修改。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：输入账号 → 点击发送验证码 → 点击确定。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-3：输入新密码 → 点击确认。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;二：忘记密码重置&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-1：密码忘记重置，点击登录 → 忘记密码。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-2：输入账号 → 点击发送验证码 → 点击确定。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-3：输入新密码 → 点击确认。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (7, '出售USDT', '&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：点击法币交易 → 选择出售USDT入口 → 点击出售USDT。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：选择出售方式 → 输出出售金额或数量 → 点击下单。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-3：商家付款，交易完成。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (8, '购买USDT', '&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;一：如何购买USDT&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：点击法币交易 → 选择购买USDT → 点击向商家购买USDT&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：选择够买方式 → 输入买入金额或数量 → 点击下单&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-3：根据商家提供的付款信息，付款给商家并点击我已付款，点击确认&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;二：法币交易订单查询&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-1：点击订单记录可查询订单状态&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-2：可根据条件筛选状态类型&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (9, '身份认证', '&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;一：资产查询&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1：登录后点击账户 → 选择身份认证 → 录入身份信息 → 上传身份证照片 → 提交。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `bw_notice` VALUES (10, '杠杆交易', '&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;一：杠杆交易如何下单&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-1：点击杠杆交易&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-2：选择想要做的币种类型&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-3：市价交易，操作步骤（选择倍数 → 输入手数 → 点击买入做多/卖出做空）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;1-4：限价交易，操作步骤（输入挂单价格 → 选择倍数 → 输入手数 → 点击买入做多/卖出做空）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;strong&gt;&lt;span&gt;二：杠杆订单查询&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;2-1：点击币种入口 → 选择要查询的币种 → 点击杠杆持仓（可查询当前币种持仓）→ 点击交易记录（可查询当前币种的交易明细）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for bw_optional
-- ----------------------------
DROP TABLE IF EXISTS `bw_optional`;
CREATE TABLE `bw_optional`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `type_sale` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '挂卖类型( 0 卖 1买）',
  `coin` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '币种',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `y_num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '剩余数量',
  `price` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '价格',
  `payment` int(2) UNSIGNED NULL DEFAULT 1 COMMENT '支付方式（1支付宝）',
  `min` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最小价格',
  `max` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最高价格',
  `status` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '状态（0进行中 和 1收摊）',
  `transactions` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '交易次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自选交易挂单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_optional_order
-- ----------------------------
DROP TABLE IF EXISTS `bw_optional_order`;
CREATE TABLE `bw_optional_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `out_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '出售人id',
  `designation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `num` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '购买/出售数量',
  `price` decimal(10, 5) UNSIGNED NULL DEFAULT NULL COMMENT '当时行情价格',
  `amount` decimal(10, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '付款/收款金额',
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '类型：0购买，1出售',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '购买时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0未支付，1已支付',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝账户持有者姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自选交易订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_optional_order
-- ----------------------------
INSERT INTO `bw_optional_order` VALUES (2, 7, 4130, 'BTC', 0.00796, 69684.70000, 555.00000, 1, 1592568681, 0, '1454453', 'gfd');

-- ----------------------------
-- Table structure for bw_otc
-- ----------------------------
DROP TABLE IF EXISTS `bw_otc`;
CREATE TABLE `bw_otc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家名称',
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种名称',
  `number` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `y_number` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '剩余购买数量',
  `min_price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最低额',
  `max_price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '最高额',
  `price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '当时行情价',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '生成时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0出售中，1已收盘',
  `type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '0为购买，1为出售',
  `degree` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '成交次数',
  `transactions` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '交易次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自选商家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_pry_order
-- ----------------------------
DROP TABLE IF EXISTS `bw_pry_order`;
CREATE TABLE `bw_pry_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `price` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '当时行情价格',
  `number` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '买入数量',
  `amount` decimal(15, 5) UNSIGNED NULL DEFAULT NULL COMMENT '成交金额',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '购买时间',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '类型，买入，卖出',
  `cls` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买入/卖出币种类型',
  `buy_cls` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买币种类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '杠杆交易订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_pry_order
-- ----------------------------
INSERT INTO `bw_pry_order` VALUES (1, 7, '2020061099549754', 9790.63000, 10.00000, 97906.30000, 1591757260, '卖出', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (2, 7, '2020061097985748', 9790.63000, 10.00000, 97906.30000, 1591757466, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (9, 7, '2020061150575256', 9793.92000, 222.00000, 2174250.24000, 1591863346, '卖出', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (10, 7, '2020061156504849', 9792.71000, 1.00000, 9792.71000, 1591863384, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (11, 7, '2020061157565049', 9792.71000, 1.00000, 9792.71000, 1591863385, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (12, 7, '2020061110252102', 9792.71000, 1.00000, 9792.71000, 1591863391, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (13, 7, '2020061150575351', 9796.68000, 3.00000, 29390.04000, 1591863586, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (14, 7, '2020061156501025', 9796.68000, 3.00000, 29390.04000, 1591863624, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (15, 7, '2020061199544910', 9785.87000, 1.00000, 9785.87000, 1591868060, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (16, 7, '2020061197555557', 9785.87000, 1.00000, 9785.87000, 1591868090, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (17, 7, '2020061110110149', 9785.87000, 1.00000, 9785.87000, 1591868334, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (18, 7, '2020061149569710', 9781.43000, 1.00000, 9781.43000, 1591868417, '买入', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (19, 1, '2020070299515249', 9.12500, 1.00000, 9.12500, 1593682172, '卖出', 'BTC', 'USDT');
INSERT INTO `bw_pry_order` VALUES (20, 1, '2020070298575156', 9.12500, 1.00000, 9.12500, 1593682235, '卖出', 'BTC', 'USDT');

-- ----------------------------
-- Table structure for bw_setting
-- ----------------------------
DROP TABLE IF EXISTS `bw_setting`;
CREATE TABLE `bw_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '名称',
  `system` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '网站名称',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '域名',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'logo',
  `eamil` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电话号码',
  `icp` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'icp证书',
  `bottom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '底部信息',
  `sys_states` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '状态:1为开启，0为关闭',
  `cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '网站关闭原因',
  `qrcode` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '底部二维码',
  `qrcode1` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '底部二维码1',
  `friend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '友情链接名',
  `friend_url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '友情链接url',
  `banner_img` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'banner图片',
  `applogo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'applogo',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_setting
-- ----------------------------
INSERT INTO `bw_setting` VALUES (3, '龙 链', 'http://longlian.longbasz.cn', '/public/upload/2020-07-09/1594281868407479.png', '152121242@qq.com', '2145-0000-0142', '粤ICB130046002', 'Copyright 2020 龙霸大商城 All rights reserved', 1, '升级中......', '/public/upload/2020-05-11/1589197752831552.png', '/public/upload/2020-05-11/1589197755986349.png', '百度|京东|淘宝', 'https://www.baidu.com|https://www.jd.com|https://www.taobao.com', '/public/upload/2020-05-12/1589266987744595.jpg,/public/upload/2020-05-12/1589266987725561.jpg,/public/upload/2020-05-12/1589266988971792.jpg', '/public/upload/2020-07-09/1594282947448101.png');

-- ----------------------------
-- Table structure for bw_short_message
-- ----------------------------
DROP TABLE IF EXISTS `bw_short_message`;
CREATE TABLE `bw_short_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  `smsId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送短信唯一标识',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '记录时间',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态',
  `ratio` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '比率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_short_message
-- ----------------------------
INSERT INTO `bw_short_message` VALUES (73, '18318058460', '5620', 1589189978, NULL, 1589189978, 0, 0);
INSERT INTO `bw_short_message` VALUES (74, '18318058460', '3180', 1589199617, NULL, 1589199617, 0, 0);
INSERT INTO `bw_short_message` VALUES (75, '18318058460', '2790', 1589199744, NULL, 1589199744, 0, 0);
INSERT INTO `bw_short_message` VALUES (76, '18318058460', '7527', 1589199876, NULL, 1589199876, 0, 0);
INSERT INTO `bw_short_message` VALUES (77, '18318058460', '3688', 1589200032, NULL, 1589200032, 0, 0);
INSERT INTO `bw_short_message` VALUES (78, '13714213050', '9861', 1589506888, NULL, 1589506888, 0, 0);
INSERT INTO `bw_short_message` VALUES (79, '13714213050', '1516', 1589507558, NULL, 1589507558, 0, 0);
INSERT INTO `bw_short_message` VALUES (80, '18706210686', '5826', 1589508107, NULL, 1589508107, 0, 0);
INSERT INTO `bw_short_message` VALUES (81, '18706210686', '3610', 1591089598, NULL, 1591089598, 0, 0);
INSERT INTO `bw_short_message` VALUES (82, '18706210686', '5907', 1591690652, NULL, 1591690652, 0, 0);
INSERT INTO `bw_short_message` VALUES (83, '18706210686', '5994', 1591690782, NULL, 1591690782, 0, 0);
INSERT INTO `bw_short_message` VALUES (84, '18706210686', '1479', 1591690900, NULL, 1591690900, 0, 0);
INSERT INTO `bw_short_message` VALUES (85, '13632978801', '5146', 1592835774, NULL, 1592835774, 0, 0);
INSERT INTO `bw_short_message` VALUES (86, '15118092650', '9374', 1593152212, NULL, 1593152212, 0, 0);
INSERT INTO `bw_short_message` VALUES (87, '13632978801', '3680', 1593337142, NULL, 1593337142, 0, 0);
INSERT INTO `bw_short_message` VALUES (88, '15516006808', '6116', 1593337815, NULL, 1593337815, 0, 0);
INSERT INTO `bw_short_message` VALUES (89, '13632978801', '8170', 1593337900, NULL, 1593337900, 0, 0);

-- ----------------------------
-- Table structure for bw_system
-- ----------------------------
DROP TABLE IF EXISTS `bw_system`;
CREATE TABLE `bw_system`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `system` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `login_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `is_lock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否锁定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_system
-- ----------------------------
INSERT INTO `bw_system` VALUES (1, 'admin', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', '113.118.224.114', 1595829035, '1');

-- ----------------------------
-- Table structure for bw_token
-- ----------------------------
DROP TABLE IF EXISTS `bw_token`;
CREATE TABLE `bw_token`  (
  `token_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usdt_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'usdt',
  `usdt_public` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'usdt',
  `usdt_private` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'usdt',
  `token_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代币',
  `token_public` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代币',
  `token_private` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代币',
  `eth_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'eth',
  `eth_public` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'eth',
  `eth_private` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'eth',
  `btc_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BTC',
  `u_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用户ID',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户钱包地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_token
-- ----------------------------
INSERT INTO `bw_token` VALUES (1, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', NULL, NULL, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', NULL, NULL, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', NULL, NULL, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', 1);
INSERT INTO `bw_token` VALUES (2, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', NULL, NULL, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', NULL, NULL, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', NULL, NULL, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', 2);
INSERT INTO `bw_token` VALUES (4, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', NULL, NULL, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', NULL, NULL, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', NULL, NULL, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', 7);
INSERT INTO `bw_token` VALUES (5, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', NULL, NULL, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', NULL, NULL, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', NULL, NULL, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', 8);
INSERT INTO `bw_token` VALUES (6, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', NULL, NULL, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', NULL, NULL, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', NULL, NULL, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', 9);
INSERT INTO `bw_token` VALUES (7, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', NULL, NULL, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', NULL, NULL, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', NULL, NULL, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', 10);
INSERT INTO `bw_token` VALUES (8, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', NULL, NULL, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', NULL, NULL, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', NULL, NULL, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', 11);
INSERT INTO `bw_token` VALUES (9, '17AJG61jDcUoAtTVZvVhXpLnm1cDX3eqcE', NULL, NULL, '17AJG61jDcUoAtTVZvVhXpLnm1cDX3eqcE', NULL, NULL, '17AJG61jDcUoAtTVZvVhXpLnm1cDX3eqcE', NULL, NULL, '17AJG61jDcUoAtTVZvVhXpLnm1cDX3eqcE', 0);
INSERT INTO `bw_token` VALUES (10, '121vz29cyTCewPKx4DBEbTBDsBEUQ8vzwK', NULL, NULL, '121vz29cyTCewPKx4DBEbTBDsBEUQ8vzwK', NULL, NULL, '121vz29cyTCewPKx4DBEbTBDsBEUQ8vzwK', NULL, NULL, '121vz29cyTCewPKx4DBEbTBDsBEUQ8vzwK', 0);
INSERT INTO `bw_token` VALUES (11, '18mHichyu11Y61tnWNDATGQ6m7Kx4FQdcN', NULL, NULL, '18mHichyu11Y61tnWNDATGQ6m7Kx4FQdcN', NULL, NULL, '18mHichyu11Y61tnWNDATGQ6m7Kx4FQdcN', NULL, NULL, '18mHichyu11Y61tnWNDATGQ6m7Kx4FQdcN', 0);
INSERT INTO `bw_token` VALUES (12, '17tSWNGEifNeA8jEGU5tJ22uJWMAkhFnim', NULL, NULL, '17tSWNGEifNeA8jEGU5tJ22uJWMAkhFnim', NULL, NULL, '17tSWNGEifNeA8jEGU5tJ22uJWMAkhFnim', NULL, NULL, '17tSWNGEifNeA8jEGU5tJ22uJWMAkhFnim', 0);
INSERT INTO `bw_token` VALUES (13, '1GUqpaiNB6jdofCKy684g6bqyqJRhq58ry', NULL, NULL, '1GUqpaiNB6jdofCKy684g6bqyqJRhq58ry', NULL, NULL, '1GUqpaiNB6jdofCKy684g6bqyqJRhq58ry', NULL, NULL, '1GUqpaiNB6jdofCKy684g6bqyqJRhq58ry', 0);
INSERT INTO `bw_token` VALUES (14, '13qTNs7ZcVvp9MHNcE54cpGqmFtVKyYMGT', NULL, NULL, '13qTNs7ZcVvp9MHNcE54cpGqmFtVKyYMGT', NULL, NULL, '13qTNs7ZcVvp9MHNcE54cpGqmFtVKyYMGT', NULL, NULL, '13qTNs7ZcVvp9MHNcE54cpGqmFtVKyYMGT', 0);
INSERT INTO `bw_token` VALUES (15, '1BtX3NSUrMi9jwNEs1Bp5Ui4vA6ddsXeko', NULL, NULL, '1BtX3NSUrMi9jwNEs1Bp5Ui4vA6ddsXeko', NULL, NULL, '1BtX3NSUrMi9jwNEs1Bp5Ui4vA6ddsXeko', NULL, NULL, '1BtX3NSUrMi9jwNEs1Bp5Ui4vA6ddsXeko', 0);
INSERT INTO `bw_token` VALUES (16, '1MqtdGEfwxZWdB3rKUnU42SeJaxZNNNcbf', NULL, NULL, '1MqtdGEfwxZWdB3rKUnU42SeJaxZNNNcbf', NULL, NULL, '1MqtdGEfwxZWdB3rKUnU42SeJaxZNNNcbf', NULL, NULL, '1MqtdGEfwxZWdB3rKUnU42SeJaxZNNNcbf', 0);
INSERT INTO `bw_token` VALUES (17, '17kGXTfEnxWudX8ucM2jqK8CK9WYn7FvJ3', NULL, NULL, '17kGXTfEnxWudX8ucM2jqK8CK9WYn7FvJ3', NULL, NULL, '17kGXTfEnxWudX8ucM2jqK8CK9WYn7FvJ3', NULL, NULL, '17kGXTfEnxWudX8ucM2jqK8CK9WYn7FvJ3', 0);
INSERT INTO `bw_token` VALUES (18, '19myUDugFVVCYSGb32AEm7AkxsEEsBkFn5', NULL, NULL, '19myUDugFVVCYSGb32AEm7AkxsEEsBkFn5', NULL, NULL, '19myUDugFVVCYSGb32AEm7AkxsEEsBkFn5', NULL, NULL, '19myUDugFVVCYSGb32AEm7AkxsEEsBkFn5', 0);
INSERT INTO `bw_token` VALUES (19, '1PFRdrQ9U4vynDQXBQUkzKKzppaghLG4mE', NULL, NULL, '1PFRdrQ9U4vynDQXBQUkzKKzppaghLG4mE', NULL, NULL, '1PFRdrQ9U4vynDQXBQUkzKKzppaghLG4mE', NULL, NULL, '1PFRdrQ9U4vynDQXBQUkzKKzppaghLG4mE', 0);
INSERT INTO `bw_token` VALUES (20, '1BVoSGhKGSkR4d2in2s9VnYn74pAnhRdss', NULL, NULL, '1BVoSGhKGSkR4d2in2s9VnYn74pAnhRdss', NULL, NULL, '1BVoSGhKGSkR4d2in2s9VnYn74pAnhRdss', NULL, NULL, '1BVoSGhKGSkR4d2in2s9VnYn74pAnhRdss', 0);

-- ----------------------------
-- Table structure for bw_user
-- ----------------------------
DROP TABLE IF EXISTS `bw_user`;
CREATE TABLE `bw_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `userpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `tel` bigint(255) UNSIGNED NULL DEFAULT 0 COMMENT '电话',
  `lbth_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代币地址',
  `lbth_num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '代币总数量',
  `lbth_available_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '代币可用余额',
  `lbth_freeze_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '代币冻结余额',
  `usdt_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'USDT地址',
  `usdt_num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'USDT总数量',
  `usdt_available_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'USDT可用余额',
  `usdt_freeze_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'USDT冻结余额',
  `eth_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ETH地址',
  `eth_num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'ETH总数量',
  `eth_available_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'ETH可用余额',
  `eth_freeze_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'ETH冻结余额',
  `btc_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BTC地址',
  `btc_num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'BTC数量',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `floor_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '父级ID',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '团队',
  `code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `btc_available_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'BTC可用余额',
  `btc_freeze_balance` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT 'BTC冻结余额',
  `transaction_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '8位交易密码',
  `authenticate` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '身份认证（0未认证 1初级认证审核 2初级认证通过 3高级认证审核 4高级认证通过 5初级审核失败 6高级审核失败）',
  `reb_cash` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '人民币余额',
  `my_cash` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '美元余额',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_login` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '免登录',
  `is_otc` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否OTC商家',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_user
-- ----------------------------
INSERT INTO `bw_user` VALUES (1, '18318058460', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 18318058460, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', 10002.10000, 9952.10000, 50.00000, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', 6639.93210, 6639.93210, 0.00000, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', 0.00000, 0.00000, 0.00000, '1AzKYAXgHrdoLa2GYBUsPs7jQJSXDjWwAH', 9634.00700, 1589200545, 1595917263, 0, '0', 'B5EB946A14AF38W', '119.123.41.29', 9633.00700, 1.00000, 'rAujjQEuGHGAfI8pEOs9FQ==', 4, NULL, NULL, NULL, 1, 0);
INSERT INTO `bw_user` VALUES (2, '13714213050', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 13714213050, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', 10000.00000, 9986.00000, 14.00000, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', 9998.50000, 9998.50000, 0.00000, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', 9999.99000, 9999.99000, 0.00000, '177AkEKNZuD41TGnm71mKQCA1Fn2Bi9GCj', 10000.00000, 1589507598, 1595488617, 0, '0', 'B5EBDF60E92180W', '119.123.41.29', 10000.00000, 0.00000, 'rAujjQEuGHGAfI8pEOs9FQ==', 5, NULL, NULL, NULL, 1, 0);
INSERT INTO `bw_user` VALUES (7, '18706210686', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 18706210686, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', 10000.00000, 10000.00000, 0.00000, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', 7999700.00000, 7999700.00000, 0.00000, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', 9999.99000, 9999.99000, 0.00000, '14koHwzfTCEjzFqQ8TTEgZgmXxC7ZBXMrU', 9999.99204, 1591691048, 1595921114, 0, '0', 'B5EDF4728CF9D5W', '219.134.115.26', 0.00000, 0.00000, NULL, 0, NULL, NULL, NULL, 1, 0);
INSERT INTO `bw_user` VALUES (8, '15675179270', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 15675179270, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', 0.00000, 0.00000, 0.00000, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', 0.00000, 0.00000, 0.00000, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', 0.00000, 0.00000, 0.00000, '1MeZwFcmYBJMbxfphiXnuBvysJfgw2b8ub', 0.00000, 1592212938, 1592212938, 0, '0', 'B5EE73DCA3F3B8W', '192.168.1.160', 0.00000, 0.00000, NULL, 0, NULL, NULL, '', 0, 0);
INSERT INTO `bw_user` VALUES (9, '15949515331', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 15949515331, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', 0.00000, 0.00000, 0.00000, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', 0.00000, 0.00000, 0.00000, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', 0.00000, 0.00000, 0.00000, '18PShf4vi7UDBwNBiRssHY83evMJhrjXWR', 0.00000, 1592212976, 1595835279, 0, '0', 'B5EE73DF003E80W', '192.168.1.160', 0.00000, 0.00000, NULL, 0, NULL, NULL, '', 1, 0);
INSERT INTO `bw_user` VALUES (10, '13632978801', 'd4eba2dd968213e74e8c451a49771b6301144de56a36d3301035168d4919a78b', 13632978801, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', 0.00000, 0.00000, 0.00000, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', 0.00000, 0.00000, 0.00000, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', 0.00000, 0.00000, 0.00000, '15A3EYEiurDpwjYuEuYUacUL2LCwWDcRva', 0.00000, 1592835806, 1596781594, 0, '0', 'B5EF0BEDEBDAE4W', '219.134.115.144', 0.00000, 0.00000, NULL, 0, NULL, NULL, '', 1, 0);
INSERT INTO `bw_user` VALUES (11, '15118092650', 'be9cbe3179890f0c79090f2a64c834ebe2e1681ec3f214ed7b3819c3e66e2809', 15118092650, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', 0.00000, 0.00000, 0.00000, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', 0.00000, 0.00000, 0.00000, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', 0.00000, 0.00000, 0.00000, '1KXdviVdTBZHHx1Gig1PS2Xx2zbZrpdEJp', 0.00000, 1593152248, 1593152301, 0, '0', 'B5EF592F8C7DC3W', '119.123.34.79', 0.00000, 0.00000, NULL, 0, 0.00000, 0.00000, '', 0, 0);

-- ----------------------------
-- Table structure for bw_user_authentication
-- ----------------------------
DROP TABLE IF EXISTS `bw_user_authentication`;
CREATE TABLE `bw_user_authentication`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `country` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `ctype` enum('身份证','护照') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '身份证' COMMENT '证件',
  `cid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'CID',
  `front_photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正面照',
  `reverse_photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反面照',
  `handheld_photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手持照',
  `info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈建议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户认证' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_user_authentication
-- ----------------------------
INSERT INTO `bw_user_authentication` VALUES (1, 1, '中国', 'ice', '身份证', '5003821900456145454', 'http://www.openice.com/public/upload/2020-05-15/1589538083267623.png', 'http://www.openice.com/public/upload/2020-05-15/1589538091325576.png', 'http://www.openice.com/public/upload/2020-05-15/1589538096119088.jpg', '112121');
INSERT INTO `bw_user_authentication` VALUES (2, 2, '中国', '刘德华', '身份证', '362330199501540231', NULL, NULL, NULL, 'xxxxx');

-- ----------------------------
-- Table structure for bw_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `bw_user_feedback`;
CREATE TABLE `bw_user_feedback`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `leve` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '星星数量',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_user_feedback
-- ----------------------------
INSERT INTO `bw_user_feedback` VALUES (1, 9, 1, '接口', 1593667963);

-- ----------------------------
-- Table structure for bw_user_num_log
-- ----------------------------
DROP TABLE IF EXISTS `bw_user_num_log`;
CREATE TABLE `bw_user_num_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（充值、提现、投票上币、持币生息、拍卖、分红股、新币预售、等等）',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '时间',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `num` decimal(15, 5) UNSIGNED NULL DEFAULT 0.00000 COMMENT '金额',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_user_num_log
-- ----------------------------
INSERT INTO `bw_user_num_log` VALUES (1, '余额充值', 1589956188, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (2, '余额充值', 1589956194, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (3, '余额充值', 1589956209, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (5, '余额充值', 1589956324, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (6, '余额充值', 1589956809, '成功12.000USDT', 1, 12.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (7, '余额充值', 1590040009, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (8, '余额充值', 1590040168, '成功100.000BTC', 1, 100.00000, 'BTC');
INSERT INTO `bw_user_num_log` VALUES (9, '余额充值', 1590040216, '成功100.000BTC', 1, 100.00000, 'BTC');
INSERT INTO `bw_user_num_log` VALUES (10, '余额充值', 1590040283, '成功100.000USDT', 1, 100.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (11, '余额充值', 1591185481, '成功50000.000USDT', 3, 50000.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (12, '币币交易', 1591185502, '购买2btc', 3, 2.00000, 'btc');
INSERT INTO `bw_user_num_log` VALUES (13, '账户划转', 1591693646, '从币币账户划转到杠杆账户', 7, 300.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (14, '还币付息', 1591703794, '还币付息操作', 7, 300.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (21, '还币付息', 1591704028, '还币付息操作', 7, 300.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (27, '还币付息', 1591704554, '还币付息操作', 7, 302.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (28, '余额充值', 1592480328, '成功10000.000USDT', 2, 10000.00000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (29, '余额充值', 1592480330, '成功10000.000BTC', 2, 10000.00000, 'BTC');
INSERT INTO `bw_user_num_log` VALUES (30, '余额充值', 1592480332, '成功10000.000LBTH', 2, 10000.00000, 'LBTH');
INSERT INTO `bw_user_num_log` VALUES (31, '余额充值', 1592480334, '成功10000.000ETH', 2, 10000.00000, 'ETH');
INSERT INTO `bw_user_num_log` VALUES (32, '申请提现', 1592536921, '成功获得0.03个LBTH', 1, 0.03000, 'LBTH');
INSERT INTO `bw_user_num_log` VALUES (33, '账户划转', 1592538327, '从币币账户划转到杆杆账户,成功获得1个btc', 1, 1.00000, 'btc');
INSERT INTO `bw_user_num_log` VALUES (34, '账户划转', 1592538343, '从币币账户划转到合约账户,成功获得1个btc', 1, 1.00000, 'btc');
INSERT INTO `bw_user_num_log` VALUES (35, '币币交易', 1593411781, '购买0.01btc', 1, 0.01000, 'btc');
INSERT INTO `bw_user_num_log` VALUES (36, '币币交易', 1593411812, '卖出1btc', 1, 1.00000, 'btc');
INSERT INTO `bw_user_num_log` VALUES (37, '法币交易', 1593682344, '成功出售0.1个LBTH', 1, 6968.47000, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (38, '法币交易', 1593682364, '成功出售1个LBTH', 1, 7.10080, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (39, '法币交易', 1593682600, '成功购买1个LBTH', 1, 7.10080, 'USDT');
INSERT INTO `bw_user_num_log` VALUES (40, '账户划转', 1593683169, '从币币账户划转到合约账户,成功获得3000个usdt', 1, 3000.00000, 'usdt');

-- ----------------------------
-- Table structure for bw_user_payment
-- ----------------------------
DROP TABLE IF EXISTS `bw_user_payment`;
CREATE TABLE `bw_user_payment`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NOT NULL COMMENT '用户ID',
  `type` enum('微信','支付宝','银联卡') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '微信' COMMENT '支付类型',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cid` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号（微信号|支付宝账号）',
  `coin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `bankname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡名称',
  `bankinfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支行信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bw_vote
-- ----------------------------
DROP TABLE IF EXISTS `bw_vote`;
CREATE TABLE `bw_vote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '活动id',
  `user_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投币名称',
  `x_currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '燃烧币种名称',
  `number` decimal(10, 0) UNSIGNED NULL DEFAULT NULL COMMENT '投票数量',
  `expend_num` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '消耗币种数量',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '状态：1支持，2反对',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投票信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_vote
-- ----------------------------
INSERT INTO `bw_vote` VALUES (1, 4, 1, 'BTC', 'USDT', 5, 0.50, 1589370636, 1);
INSERT INTO `bw_vote` VALUES (2, 5, 2, 'BTC', 'LBTH', 10, 0.30, 1589370148, 2);
INSERT INTO `bw_vote` VALUES (7, 18, 1, 'LBTH', 'BTC', 10, 0.00, 1589770651, 1);
INSERT INTO `bw_vote` VALUES (8, 4, 2, 'BTC', 'USDT', 1, 0.10, 1592548144, 1);
INSERT INTO `bw_vote` VALUES (9, 17, 2, 'BTC', 'ETH', 1, 0.01, 1592548331, 1);
INSERT INTO `bw_vote` VALUES (10, 18, 1, 'LBTH', 'BTC', 10, 0.00, 1592550459, 2);
INSERT INTO `bw_vote` VALUES (11, 18, 1, 'LBTH', 'BTC', 10, 0.00, 1592550484, 1);
INSERT INTO `bw_vote` VALUES (12, 4, 2, 'BTC', 'USDT', 1, 0.10, 1592558990, 1);
INSERT INTO `bw_vote` VALUES (13, 4, 2, 'BTC', 'USDT', 1, 0.10, 1592559821, 1);
INSERT INTO `bw_vote` VALUES (14, 4, 2, 'BTC', 'USDT', 1, 0.10, 1592559963, 1);
INSERT INTO `bw_vote` VALUES (15, 4, 2, 'BTC', 'USDT', 1, 0.10, 1592559979, 1);
INSERT INTO `bw_vote` VALUES (16, 4, 10, 'BTC', 'USDT', 1, 0.10, 1593008357, 1);

-- ----------------------------
-- Table structure for bw_wap_banner
-- ----------------------------
DROP TABLE IF EXISTS `bw_wap_banner`;
CREATE TABLE `bw_wap_banner`  (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` int(2) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_wap_banner
-- ----------------------------
INSERT INTO `bw_wap_banner` VALUES (1, '/public/upload/2020-06-17/1592390298264465.jpg', 1);
INSERT INTO `bw_wap_banner` VALUES (2, '/public/upload/2020-06-17/1592390337825839.jpg', 1);
INSERT INTO `bw_wap_banner` VALUES (3, '/public/upload/2020-06-17/1592390350509130.jpg', 1);

-- ----------------------------
-- Table structure for bw_wap_clue
-- ----------------------------
DROP TABLE IF EXISTS `bw_wap_clue`;
CREATE TABLE `bw_wap_clue`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_wap_clue
-- ----------------------------
INSERT INTO `bw_wap_clue` VALUES (1, '这里是公告内容', '&lt;p&gt;&lt;span&gt;这里是公告内容&lt;/span&gt;&lt;span&gt;这里是公告内容&lt;/span&gt;&lt;span&gt;这里是公告内容&lt;/span&gt;&lt;span&gt;这里是公告内容&lt;/span&gt;&lt;span&gt;这里是公告内容&lt;/span&gt;&lt;/p&gt;', 1591784593);

-- ----------------------------
-- Table structure for bw_wap_icon
-- ----------------------------
DROP TABLE IF EXISTS `bw_wap_icon`;
CREATE TABLE `bw_wap_icon`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机端icon' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_wap_icon
-- ----------------------------
INSERT INTO `bw_wap_icon` VALUES (1, '法币', '/public/upload/2020-06-18/1592442777988793.png', '/currency');
INSERT INTO `bw_wap_icon` VALUES (2, '币币', '/public/upload/2020-06-18/1592442798290695.png', '/transaction');
INSERT INTO `bw_wap_icon` VALUES (3, '合约', '/public/upload/2020-06-18/1592442809318243.png', '/contract1');
INSERT INTO `bw_wap_icon` VALUES (4, '杠杆', '/public/upload/2020-06-18/1592442823310580.png', '/lever');
INSERT INTO `bw_wap_icon` VALUES (5, '新币', '/public/upload/2020-06-18/1592442836159436.png', '/presale');
INSERT INTO `bw_wap_icon` VALUES (6, '投币', '/public/upload/2020-06-18/1592442847339721.png', '/vote');
INSERT INTO `bw_wap_icon` VALUES (7, '矿池', '/public/upload/2020-06-18/1592442858997116.png', '/currencyInterest');
INSERT INTO `bw_wap_icon` VALUES (8, '拍卖', '/public/upload/2020-06-18/1592442867217443.png', '/auction');

-- ----------------------------
-- Table structure for bw_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `bw_withdraw`;
CREATE TABLE `bw_withdraw`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种（1btc 2eth 3usdt 4lbth）',
  `token_num` decimal(13, 3) UNSIGNED NULL DEFAULT NULL COMMENT '金额',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '提现时间',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '0未处理 1已处理  2已退款 3手动待处理',
  `build_status` int(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0申请失败 1申请成功',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提现地址',
  `auto_address` int(2) UNSIGNED NOT NULL COMMENT '0自动处理 1手动处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_withdraw
-- ----------------------------
INSERT INTO `bw_withdraw` VALUES (1, 1, 'btc', 1.000, 1589246349, 'as4d5as45d6as', 0, 1, 'xxxxx', 1);
INSERT INTO `bw_withdraw` VALUES (2, 1, 'LBTH', 10.000, 1592536921, 'tx2020061957555610', 0, 1, '0x61010e9524f84879ea210eafb97fe0a0acfc6b0f', 1);

-- ----------------------------
-- Table structure for bw_withdraw_address
-- ----------------------------
DROP TABLE IF EXISTS `bw_withdraw_address`;
CREATE TABLE `bw_withdraw_address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包地址',
  `remarks` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提币地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_withdraw_address
-- ----------------------------
INSERT INTO `bw_withdraw_address` VALUES (1, 1, 'BTC', 'asas', 'asa');
INSERT INTO `bw_withdraw_address` VALUES (2, 1, 'BTC', '0x61010e9524f84879ea210eafb97fe0a0acfc6b0f', 'asasa');
INSERT INTO `bw_withdraw_address` VALUES (3, 1, 'BTC', '0x61010e9524f84879ea210eafb97fe0a0acfc6b0f', '');
INSERT INTO `bw_withdraw_address` VALUES (4, 1, 'BTC', '0161010e9524f84879ea210eafb97fe0a0acfc6b0f', '');

-- ----------------------------
-- Table structure for bw_xbys
-- ----------------------------
DROP TABLE IF EXISTS `bw_xbys`;
CREATE TABLE `bw_xbys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `currency_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种名称',
  `x_currency_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付币种',
  `total_num` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '发行总量',
  `deal` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '已购数量',
  `price` decimal(10, 3) UNSIGNED NULL DEFAULT NULL COMMENT '认购价格',
  `start_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '开启时间',
  `end_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '结束时间',
  `unfreeze` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解冻周期',
  `min` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '最少购买数量',
  `max` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '最多购买数量',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情规则',
  `in_coin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐赠送币种',
  `ctime` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目图片',
  `status` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '状态：0禁用，1启用',
  `user_max_mun` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '认购限量',
  `cycle` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '认购周期 ',
  `financial_cycle` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '解冻间隔',
  `time_type` enum('分','时','日','月','年') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '分' COMMENT '解冻时间类型',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '币种预售表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bw_xbys
-- ----------------------------
INSERT INTO `bw_xbys` VALUES (1, 'long ba token hot', '4', '3', 10000, 566, 0.500, 1589904000, 1590768000, '5', 1.00, 100.00, '<p class=\"MsoNormal\">1993.MOBI致力于创建一个自治的、高效的、透明的数字资产交易平台，让交易员和投资者可以放心的进行任何规模的交易，而无需担忧平台的公正性和透明性、数据安全隐私保护的可靠性或其订单管理系统的完整性和稳健性。</p><p class=\"MsoNormal\">&nbsp;</p><p class=\"MsoNormal\">同时，1993.MOBI不是传统意义的公司，他迈出了数字资产交易平台向社区进化的关键一步。1993.MOBI社区是一个公开透明的、Token化的组织，1993.MOBI Token（RT）代表1993.MOBI交易平台的所有权益。</p><p class=\"MsoNormal\">&nbsp;</p><p class=\"MsoNormal\">另外，每个RT持有者都有权利参与社区的业务决策、团队选举等社区活动。1993.MOBI是一个所有RT持有者共有、共治、共享的社区型组织。</p>', '4', NULL, '/public/upload/2020-05-20/1589973565658874.jpg', 1, 100, 10, 1, '分', 1589973980);
INSERT INTO `bw_xbys` VALUES (2, 'Ethereum', '2', '1', 100000, 21510, 50.000, 1589904000, 1590768000, '10', 10.00, 1000.00, '<div class=\"para\" label-module=\"para\"><span>以太坊</span>（英文Ethereum）是一个<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BC%80%E6%BA%90/246339\" data-lemmaid=\"246339\">开源</a>的有<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/19770937\" data-lemmaid=\"19770937\">智能合约</a>功能的公共<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%BA%E5%9D%97%E9%93%BE/13465666\" data-lemmaid=\"13465666\">区块链</a>平台，通过其专用<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8A%A0%E5%AF%86%E8%B4%A7%E5%B8%81\">加密货币</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BB%A5%E5%A4%AA%E5%B8%81/20857686\" data-lemmaid=\"20857686\">以太币</a>（Ether，简称“ETH”）提供<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8E%BB%E4%B8%AD%E5%BF%83%E5%8C%96/8719532\" data-lemmaid=\"8719532\">去中心化</a>的以太<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%99%9A%E6%8B%9F%E6%9C%BA/104440\" data-lemmaid=\"104440\">虚拟机</a>（Ethereum Virtual Machine）来处理<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%82%B9%E5%AF%B9%E7%82%B9/7452984\" data-lemmaid=\"7452984\">点对点</a>合约。</div><div class=\"para\" label-module=\"para\">以太坊的概念首次在2013至2014年间由程序员Vitalik Buterin受比特币启发后提出，大意为“下一代加密货币与去中心化应用平台”，在2014年通过ICO众筹开始得以发展。</div><p>截至2018年2月，以太币是市值第二高的加密货币，仅次于比特币。</p><div class=\"para\" label-module=\"para\">以太坊是一个平台，它上面提供各种模块让用户来搭建应用，如果将搭建应用比作造房子，那么以太坊就提供了墙面、屋顶、地板等模块，用户只需像搭积木一样把房子搭起来，因此在以太坊上建立应用的成本和速度都大大改善。具体来说，以太坊通过一套图灵完备的脚本语言（Ethereum Virtual Machinecode，简称EVM语言）来建立应用，它类似于汇编语言。我们知道，直接用汇编语言编程是非常痛苦的，但以太坊里的编程并不需要直接使用EVM语言，而是类似<a target=\"_blank\" href=\"https://baike.baidu.com/item/C%E8%AF%AD%E8%A8%80\">C语言</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Python/407313\" data-lemmaid=\"407313\">Python</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Lisp/22083\" data-lemmaid=\"22083\">Lisp</a>等高级语言，再通过编译器转成<a target=\"_blank\" href=\"https://baike.baidu.com/item/EVM\">EVM</a>语言。</div><div class=\"para\" label-module=\"para\">上面所说的平台之上的应用，其实就是合约，这是以太坊的核心。合约是一个活在以太坊系统里的自动代理人，他有一个自己的以太币地址，当用户向合约的地址里发送一笔交易后，该合约就被激活，然后根据交易中的额外信息，合约会运行自身的代码，最后返回一个结果，这个结果可能是从合约的地址发出另外一笔交易。需要指出的是，以太坊中的交易，不单只是发送<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BB%A5%E5%A4%AA%E5%B8%81\">以太币</a>而已，它还可以嵌入相当多的额外信息。如果一笔交易是发送给合约的，那么这些信息就非常重要，因为合约将根据这些信息来完成自身的业务逻辑。</div><div class=\"para\" label-module=\"para\">合约所能提供的业务，几乎是无穷无尽的，它的边界就是你的想象力，因为图灵完备的语言提供了完整的自由度，让用户搭建各种应用。白皮书举了几个例子，如储蓄账户、用户自定义的子货币等。</div>', '3', NULL, '/public/upload/2020-05-21/1590025023790133.jpg', 1, 1000, 10, 3, '分', 1590025073);
INSERT INTO `bw_xbys` VALUES (3, 'Bitcoin', '1', '3', 10000, 20, 1.000, 1592236800, 1593100800, '10', 1.00, 97.00, '<div class=\"para\" label-module=\"para\">比特币（Bitcoin）的概念最初由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E6%9C%AC%E8%81%AA/5740822\" data-lemmaid=\"5740822\">中本聪</a>在2008年11月1日提出，并于2009年1月3日正式诞生。根据中本聪的思路设计发布的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BC%80%E6%BA%90%E8%BD%AF%E4%BB%B6/8105369\" data-lemmaid=\"8105369\">开源软件</a>以及建构其上的<a target=\"_blank\" href=\"https://baike.baidu.com/item/P2P\">P2P</a>网络。比特币是一种P2P形式的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%99%9A%E6%8B%9F/10866735\" data-lemmaid=\"10866735\">虚拟</a>的加密数字货币。点对点的传输意味着一个去中心化的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%94%AF%E4%BB%98%E7%B3%BB%E7%BB%9F/2429152\" data-lemmaid=\"2429152\">支付系统</a>。<span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\">&nbsp;[1]</span><a class=\"sup-anchor\" name=\"ref_[1]_12216829\">&nbsp;</a></div><div class=\"para\" label-module=\"para\">与所有的货币不同，比特币不依靠特定货币机构发行，它依据特定算法，通过大量的计算产生，比特币经济使用整个P2P网络中众多节点构成的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F%E6%95%B0%E6%8D%AE%E5%BA%93/1238109\" data-lemmaid=\"1238109\">分布式数据库</a>来确认并记录所有的交易行为，并使用密码学的设计来确保货币流通各个环节<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%89%E5%85%A8%E6%80%A7/7664678\" data-lemmaid=\"7664678\">安全性</a>。<span class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\">&nbsp;[2]</span><a class=\"sup-anchor\" name=\"ref_[2]_12216829\">&nbsp;</a>&nbsp;P2P的去中心化特性与算法本身可以确保无法通过大量制造比特币来人为操控币值。基于密码学的设计可以使比特币只能被真实的拥有者转移或支付。这同样确保了<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B4%A7%E5%B8%81/85299\" data-lemmaid=\"85299\">货币</a>所有权与流通交易的匿名性。比特币与其他<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%99%9A%E6%8B%9F%E8%B4%A7%E5%B8%81/322734\" data-lemmaid=\"322734\">虚拟货币</a>最大的不同，是其总数量非常有限，具有极强的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A8%80%E7%BC%BA%E6%80%A7/5410168\" data-lemmaid=\"5410168\">稀缺性</a>。<span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\">&nbsp;[1]</span><a class=\"sup-anchor\" name=\"ref_[1]_12216829\">&nbsp;</a></div><div class=\"para\" label-module=\"para\">2017年12月17日，比特币达到历史最高价19850美元。<span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\">&nbsp;[1]</span><a class=\"sup-anchor\" name=\"ref_[1]_12216829\">&nbsp;</a></div><div class=\"para\" label-module=\"para\">2020年5月8日，比特币价格突破10000美元。</div>', '3', NULL, '/public/upload/2020-06-17/1592397180548846.jpg', 1, 100, 10, 1440, '分', 1592397288);

SET FOREIGN_KEY_CHECKS = 1;
