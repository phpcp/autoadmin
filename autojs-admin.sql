/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:3306
 Source Schema         : autojs-admin

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 22/02/2022 09:17:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_to_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_to_groups`;
CREATE TABLE `account_to_groups`  (
  `id` int(11) NOT NULL COMMENT '账号id',
  `gid` int(11) NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`, `gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号对应分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_to_groups
-- ----------------------------
INSERT INTO `account_to_groups` VALUES (1, 1);
INSERT INTO `account_to_groups` VALUES (1, 2);
INSERT INTO `account_to_groups` VALUES (2, 1);

-- ----------------------------
-- Table structure for account_videos
-- ----------------------------
DROP TABLE IF EXISTS `account_videos`;
CREATE TABLE `account_videos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `account_id` int(11) NOT NULL COMMENT 'accounts表id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频url',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频标题',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '任务创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '任务更新时间',
  `send_time` int(11) NULL DEFAULT 0 COMMENT '任务发送时间',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '任务状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_videos
-- ----------------------------
INSERT INTO `account_videos` VALUES (1, 0, 0, 4, 'werwer', 'sdfsdf', NULL, NULL, 0, 0);
INSERT INTO `account_videos` VALUES (2, 1, 1, 3, 'media1/5LdcZsGv1B8CqJLVRBf26yEIt98KCXXBOYIEMj54.mp4', '111111111', '2022-01-27 16:46:56', '2022-01-27 16:46:56', 0, 0);

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备分组',
  `did` int(11) NOT NULL COMMENT '设备id',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uuid',
  `uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台用户id,唯一的',
  `sec_uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '很重要的id',
  `short_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短id',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique_id',
  `shareUrl` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享的链接地址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '签名',
  `follower_count` int(11) NULL DEFAULT 0 COMMENT '粉丝数',
  `aweme_count` int(11) NULL DEFAULT 0 COMMENT '作品数量',
  `total_favorited` int(11) NULL DEFAULT 0 COMMENT '获赞数',
  `following_count` int(11) NULL DEFAULT 0 COMMENT '关注数',
  `favoriting_count` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `region` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号所属区域',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `secret` tinyint(1) NULL DEFAULT 0 COMMENT '是否是私密账号',
  `create_time` int(11) NULL DEFAULT NULL COMMENT 'tiktol创建时间',
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 1, '1,2', 1, 'ykf66886688', '108724851792', 'MS4wLjABAAAAeK--ZQVLsqDIzwcPcj9G76eN-rYuta1C9KbPGK08cXI', '2231979783', 'ykf66886688', 'https://v.douyin.com/Rn1dJ6o/', 'https://p26.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-avt-0015_f28d4f0a49fe3d56b5dec240535430d4.jpeg?from=2956013662', '全村的希望撒', '秋风扫落叶，孔雀东南飞', 1044, 11, 359, 91, 2225, 'CN', '2022-01-04 11:42:06', '2021-12-05 18:48:41', 0, NULL, 1);
INSERT INTO `accounts` VALUES (2, 1, '1', 1, '98183224246', '2154644806304628', 'MS4wLjABAAAAqxUJLr0it2JvZHH2St6yRVoc_L0eJN3TJcWXWHSLdd5crGvB83RNadlsRk4HqeXn', '98183224246', '98183224246', 'https://v.douyin.com/RnqQsVX/', 'https://p29.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-i-0813_f6667567188f4a4e9791ee3198da2146.jpeg?from=2956013662', '新的名字', '新的名字', 24, 17, 9, 133, 92, 'CN', '2022-01-24 14:55:51', '2021-12-05 18:48:41', 0, NULL, 1);
INSERT INTO `accounts` VALUES (5, 1, NULL, 11, 'zhutoushini666', '7057391815713522734', 'MS4wLjABAAAA1d5ETnLjSEJmrasZRDagr99C_yIxYYokl4K0fDnq_H1WZ_mbKTcEYcnx_z2a2fkW', NULL, 'zhutoushini666', NULL, 'https://p16-sign-va.tiktokcdn.com/musically-maliva-obj/1594805258216454~c5_1080x1080.jpeg?x-expires=1643529600&x-signature=Ph0juFWAVv1qAP251iSnPyaEgBE%3D', 'zhutoushini666', NULL, 0, 0, 0, 0, 0, NULL, '2022-01-29 16:47:30', '2022-01-29 14:01:26', 0, 1643178996, 1);
INSERT INTO `accounts` VALUES (6, 1, NULL, 11, 'juddlynice99865', '7054360948496761861', 'MS4wLjABAAAAgRn4fBjP6E-jLZnf2bRzAHRK-b1eZGG5r1UBeL7br7lTokfkKo9UykuYvaz670oD', NULL, 'juddlynice99865', NULL, 'https://p16-sign-va.tiktokcdn.com/musically-maliva-obj/1594805258216454~c5_1080x1080.jpeg?x-expires=1643529600&x-signature=Ph0juFWAVv1qAP251iSnPyaEgBE%3D', 'juddlynice', NULL, 1, 1, 2, 0, 2, NULL, '2022-01-29 16:47:30', '2022-01-29 14:01:26', 0, 1642471568, 1);

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '控制台', 'fa-bar-chart', '/', NULL, NULL, '2021-12-03 10:06:25');
INSERT INTO `admin_menu` VALUES (2, 0, 10, '管理员', 'fa-users', NULL, NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (3, 2, 11, '管理员列表', 'fa-users', 'auth/users', NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (4, 2, 12, '角色列表', 'fa-user', 'auth/roles', NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (5, 2, 13, '权限列表', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (6, 2, 14, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (7, 2, 15, '日志', 'fa-history', 'auth/logs', NULL, NULL, '2021-12-16 14:34:08');
INSERT INTO `admin_menu` VALUES (8, 0, 2, '设备管理', 'fa-motorcycle', NULL, NULL, '2021-12-03 10:26:33', '2021-12-04 11:49:07');
INSERT INTO `admin_menu` VALUES (9, 8, 5, '手机管理', 'fa-mobile-phone', 'devices', NULL, '2021-12-03 10:30:58', '2021-12-16 14:21:46');
INSERT INTO `admin_menu` VALUES (10, 8, 6, '账号管理', 'fa-space-shuttle', 'accounts', NULL, '2021-12-03 10:32:28', '2021-12-16 14:21:46');
INSERT INTO `admin_menu` VALUES (11, 8, 4, '账号组管理', 'fa-object-group', 'group-accounts', NULL, '2021-12-03 11:01:18', '2021-12-16 14:21:46');
INSERT INTO `admin_menu` VALUES (12, 8, 3, '设备组管理', 'fa-resistance', 'group-devices', NULL, '2021-12-16 11:09:26', '2021-12-16 14:21:46');
INSERT INTO `admin_menu` VALUES (13, 0, 7, '任务管理', 'fa-tasks', 'task', NULL, '2021-12-16 14:21:31', '2021-12-16 14:21:46');
INSERT INTO `admin_menu` VALUES (14, 13, 9, '任务详情', 'fa-terminal', 'task-send', NULL, '2021-12-16 14:23:33', '2022-01-24 11:25:09');
INSERT INTO `admin_menu` VALUES (15, 13, 8, '任务清单', 'fa-list-ol', 'tasks', NULL, '2021-12-16 14:33:35', '2022-01-24 11:25:09');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3624 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:38:50', '2021-11-22 07:38:50');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:39:26', '2021-11-22 07:39:26');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:39:36', '2021-11-22 07:39:36');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:39:42', '2021-11-22 07:39:42');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:39:53', '2021-11-22 07:39:53');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:40:10', '2021-11-22 07:40:10');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 07:40:20', '2021-11-22 07:40:20');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-22 15:40:44', '2021-11-22 15:40:44');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-23 10:01:53', '2021-11-23 10:01:53');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-30 10:40:41', '2021-11-30 10:40:41');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-30 10:40:45', '2021-11-30 10:40:45');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-12-02 17:44:57', '2021-12-02 17:44:57');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:45:46', '2021-12-02 17:45:46');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/devices/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 17:49:16', '2021-12-02 17:49:16');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-02 17:49:27', '2021-12-02 17:49:27');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:50:04', '2021-12-02 17:50:04');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:50:34', '2021-12-02 17:50:34');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:53:57', '2021-12-02 17:53:57');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_method\":\"PUT\"}', '2021-12-02 17:53:58', '2021-12-02 17:53:58');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"lock\":\"0\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_method\":\"PUT\"}', '2021-12-02 17:54:05', '2021-12-02 17:54:05');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_method\":\"PUT\"}', '2021-12-02 17:54:08', '2021-12-02 17:54:08');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:54:35', '2021-12-02 17:54:35');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:54:38', '2021-12-02 17:54:38');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:54:52', '2021-12-02 17:54:52');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:00', '2021-12-02 17:55:00');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:34', '2021-12-02 17:55:34');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:35', '2021-12-02 17:55:35');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:35', '2021-12-02 17:55:35');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:35', '2021-12-02 17:55:35');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:55:51', '2021-12-02 17:55:51');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:57:47', '2021-12-02 17:57:47');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:58:33', '2021-12-02 17:58:33');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:58:36', '2021-12-02 17:58:36');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 17:59:16', '2021-12-02 17:59:16');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"remark\",\"value\":\"\\u5f88\\u597d\",\"pk\":\"10\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-02 17:59:21', '2021-12-02 17:59:21');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-02 18:09:11', '2021-12-02 18:09:11');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"1s\",\"pk\":\"10\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-02 18:09:15', '2021-12-02 18:09:15');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"12\",\"pk\":\"10\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-02 18:09:18', '2021-12-02 18:09:18');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"5\",\"pk\":\"10\",\"_token\":\"1rt5WJJbRqfDcUrqCYDXZLexER0Gri8kiL6Kc0Mf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-02 18:09:39', '2021-12-02 18:09:39');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin', 'GET', '61.154.153.161', '[]', '2021-12-03 10:01:45', '2021-12-03 10:01:45');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/devices', 'GET', '61.154.153.161', '[]', '2021-12-03 10:01:55', '2021-12-03 10:01:55');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:02:23', '2021-12-03 10:02:23');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu/1/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:06:20', '2021-12-03 10:06:20');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu/1', 'PUT', '61.154.153.161', '{\"parent_id\":\"0\",\"title\":\"\\u63a7\\u5236\\u53f0\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:06:25', '2021-12-03 10:06:25');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:06:26', '2021-12-03 10:06:26');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu/2/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:06:28', '2021-12-03 10:06:28');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu/2', 'PUT', '61.154.153.161', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:06:34', '2021-12-03 10:06:34');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:06:35', '2021-12-03 10:06:35');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu/3/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:06:36', '2021-12-03 10:06:36');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu/3', 'PUT', '61.154.153.161', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:06:52', '2021-12-03 10:06:52');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:06:52', '2021-12-03 10:06:52');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu/4/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:07:12', '2021-12-03 10:07:12');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu/4', 'PUT', '61.154.153.161', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u5217\\u8868\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:07:19', '2021-12-03 10:07:19');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:07:19', '2021-12-03 10:07:19');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu/5/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:07:25', '2021-12-03 10:07:25');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/menu/5', 'PUT', '61.154.153.161', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u5217\\u8868\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:08:02', '2021-12-03 10:08:02');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:08:03', '2021-12-03 10:08:03');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/menu/6/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:08:05', '2021-12-03 10:08:05');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/menu/6', 'PUT', '61.154.153.161', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:08:10', '2021-12-03 10:08:10');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:08:11', '2021-12-03 10:08:11');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/menu/7/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:08:13', '2021-12-03 10:08:13');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/auth/menu/7', 'PUT', '61.154.153.161', '{\"parent_id\":\"2\",\"title\":\"\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:08:22', '2021-12-03 10:08:22');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:08:22', '2021-12-03 10:08:22');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:08:24', '2021-12-03 10:08:24');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:20:03', '2021-12-03 10:20:03');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:23:47', '2021-12-03 10:23:47');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:23:50', '2021-12-03 10:23:50');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:26:02', '2021-12-03 10:26:02');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/menu', 'POST', '61.154.153.161', '{\"parent_id\":\"0\",\"title\":\"\\u8bbe\\u5907\",\"icon\":\"fa-home\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\"}', '2021-12-03 10:26:33', '2021-12-03 10:26:33');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:26:34', '2021-12-03 10:26:34');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu/8/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:26:37', '2021-12-03 10:26:37');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:29:55', '2021-12-03 10:29:55');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:29:56', '2021-12-03 10:29:56');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu/8/edit', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:30:04', '2021-12-03 10:30:04');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu/8', 'PUT', '61.154.153.161', '{\"parent_id\":\"0\",\"title\":\"\\u8bbe\\u5907\",\"icon\":\"fa-motorcycle\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_method\":\"PUT\",\"_previous_\":\"https:\\/\\/auto.mini.zhishukongjian.com\\/admin\\/auth\\/menu\"}', '2021-12-03 10:30:18', '2021-12-03 10:30:18');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:30:18', '2021-12-03 10:30:18');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/menu', 'POST', '61.154.153.161', '{\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-03 10:30:22', '2021-12-03 10:30:22');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:30:22', '2021-12-03 10:30:22');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu', 'POST', '61.154.153.161', '{\"parent_id\":\"8\",\"title\":\"\\u624b\\u673a\\u7ba1\\u7406\",\"icon\":\"fa-mobile-phone\",\"uri\":\"devices\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\"}', '2021-12-03 10:30:58', '2021-12-03 10:30:58');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:30:58', '2021-12-03 10:30:58');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin', 'GET', '45.79.104.158', '[]', '2021-12-03 10:32:25', '2021-12-03 10:32:25');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu', 'POST', '61.154.153.161', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u7ba1\\u7406\",\"icon\":\"fa-space-shuttle\",\"uri\":\"accounts\",\"roles\":[null],\"permission\":null,\"_token\":\"jrWepf2JcVXLAmfiV5G5zNYGKZk1KJ64WNMoHZVZ\"}', '2021-12-03 10:32:28', '2021-12-03 10:32:28');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:32:29', '2021-12-03 10:32:29');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/menu', 'GET', '61.154.153.161', '[]', '2021-12-03 10:32:31', '2021-12-03 10:32:31');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/devices', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:32:33', '2021-12-03 10:32:33');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/devices', 'GET', '61.154.153.161', '[]', '2021-12-03 10:32:40', '2021-12-03 10:32:40');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/devices', 'GET', '61.154.153.161', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:32:42', '2021-12-03 10:32:42');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:36:12', '2021-12-03 10:36:12');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:36:21', '2021-12-03 10:36:21');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:36:36', '2021-12-03 10:36:36');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:44:18', '2021-12-03 10:44:18');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:44:22', '2021-12-03 10:44:22');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 10:44:33', '2021-12-03 10:44:33');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 10:55:39', '2021-12-03 10:55:39');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:00:18', '2021-12-03 11:00:18');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:00:59', '2021-12-03 11:00:59');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5206\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-object-group\",\"uri\":\"groups\",\"roles\":[null],\"permission\":null,\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:01:18', '2021-12-03 11:01:18');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-03 11:01:18', '2021-12-03 11:01:18');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-03 11:01:23', '2021-12-03 11:01:23');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:01:24', '2021-12-03 11:01:24');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-03 11:02:37', '2021-12-03 11:02:37');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:02:38', '2021-12-03 11:02:38');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/groups/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:02:43', '2021-12-03 11:02:43');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:03:59', '2021-12-03 11:03:59');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:03:59', '2021-12-03 11:03:59');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:05:10', '2021-12-03 11:05:10');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:05:47', '2021-12-03 11:05:47');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:08:28', '2021-12-03 11:08:28');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:08:30', '2021-12-03 11:08:30');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:09:18', '2021-12-03 11:09:18');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:09:57', '2021-12-03 11:09:57');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/groups/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:10:09', '2021-12-03 11:10:09');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":\"0\",\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/groups\"}', '2021-12-03 11:10:14', '2021-12-03 11:10:14');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:10:14', '2021-12-03 11:10:14');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:11:27', '2021-12-03 11:11:27');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":null,\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/groups\"}', '2021-12-03 11:11:30', '2021-12-03 11:11:30');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:11:30', '2021-12-03 11:11:30');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:12:12', '2021-12-03 11:12:12');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":null,\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:12:14', '2021-12-03 11:12:14');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:12:14', '2021-12-03 11:12:14');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:14:49', '2021-12-03 11:14:49');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":null,\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:14:51', '2021-12-03 11:14:51');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:14:52', '2021-12-03 11:14:52');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:15:35', '2021-12-03 11:15:35');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":null,\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:15:38', '2021-12-03 11:15:38');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:15:38', '2021-12-03 11:15:38');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":\"0\",\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:25:08', '2021-12-03 11:25:08');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/groups/create', 'GET', '127.0.0.1', '[]', '2021-12-03 11:25:08', '2021-12-03 11:25:08');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":\"0\",\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:26:00', '2021-12-03 11:26:00');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/groups/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:26:02', '2021-12-03 11:26:02');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/groups', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"orderby\":\"0\",\"status\":\"on\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\"}', '2021-12-03 11:26:12', '2021-12-03 11:26:12');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:26:13', '2021-12-03 11:26:13');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:28:09', '2021-12-03 11:28:09');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:28:39', '2021-12-03 11:28:39');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:28:46', '2021-12-03 11:28:46');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:28:49', '2021-12-03 11:28:49');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:28:50', '2021-12-03 11:28:50');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:32:30', '2021-12-03 11:32:30');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:32:50', '2021-12-03 11:32:50');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:33:54', '2021-12-03 11:33:54');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:34:32', '2021-12-03 11:34:32');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:36:22', '2021-12-03 11:36:22');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:36:36', '2021-12-03 11:36:36');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:36:47', '2021-12-03 11:36:47');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:38:15', '2021-12-03 11:38:15');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:38:32', '2021-12-03 11:38:32');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:39:39', '2021-12-03 11:39:39');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:39:51', '2021-12-03 11:39:51');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:39:58', '2021-12-03 11:39:58');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"6\",\"pk\":\"10\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-03 11:40:33', '2021-12-03 11:40:33');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:44:38', '2021-12-03 11:44:38');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:44:40', '2021-12-03 11:44:40');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:53:55', '2021-12-03 11:53:55');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:53:56', '2021-12-03 11:53:56');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:53:58', '2021-12-03 11:53:58');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:54:06', '2021-12-03 11:54:06');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:54:07', '2021-12-03 11:54:07');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:54:21', '2021-12-03 11:54:21');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:54:40', '2021-12-03 11:54:40');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:54:50', '2021-12-03 11:54:50');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:54:54', '2021-12-03 11:54:54');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:55:40', '2021-12-03 11:55:40');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:55:43', '2021-12-03 11:55:43');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:55:54', '2021-12-03 11:55:54');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/groups/1', 'PUT', '127.0.0.1', '{\"status\":\"0\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_method\":\"PUT\"}', '2021-12-03 11:55:55', '2021-12-03 11:55:55');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:55:57', '2021-12-03 11:55:57');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:56:16', '2021-12-03 11:56:16');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:56:17', '2021-12-03 11:56:17');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/groups/1', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_method\":\"PUT\"}', '2021-12-03 11:56:18', '2021-12-03 11:56:18');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/groups/1', 'PUT', '127.0.0.1', '{\"name\":\"orderby\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-03 11:56:23', '2021-12-03 11:56:23');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/groups', 'GET', '127.0.0.1', '[]', '2021-12-03 11:57:52', '2021-12-03 11:57:52');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"accounts\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:57:53', '2021-12-03 11:57:53');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"accounts\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:57:54', '2021-12-03 11:57:54');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"accounts\",\"type\":\"asc\"}}', '2021-12-03 11:58:24', '2021-12-03 11:58:24');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/groups/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:58:37', '2021-12-03 11:58:37');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"accounts\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:58:40', '2021-12-03 11:58:40');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 11:58:46', '2021-12-03 11:58:46');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 11:59:48', '2021-12-03 11:59:48');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:00:11', '2021-12-03 12:00:11');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:00:21', '2021-12-03 12:00:21');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:00:29', '2021-12-03 12:00:29');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:01:00', '2021-12-03 12:01:00');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:01:08', '2021-12-03 12:01:08');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 12:03:11', '2021-12-03 12:03:11');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 13:42:59', '2021-12-03 13:42:59');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:39:40', '2021-12-03 14:39:40');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:41:36', '2021-12-03 14:41:36');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:42:05', '2021-12-03 14:42:05');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:44:03', '2021-12-03 14:44:03');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:44:12', '2021-12-03 14:44:12');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:48:38', '2021-12-03 14:48:38');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:48:59', '2021-12-03 14:48:59');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:49:04', '2021-12-03 14:49:04');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:49:38', '2021-12-03 14:49:38');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:17', '2021-12-03 14:51:17');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:25', '2021-12-03 14:51:25');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:31', '2021-12-03 14:51:31');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:45', '2021-12-03 14:51:45');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:51:55', '2021-12-03 14:51:55');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:52:15', '2021-12-03 14:52:15');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:53:25', '2021-12-03 14:53:25');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:56:03', '2021-12-03 14:56:03');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:56:08', '2021-12-03 14:56:08');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:56:58', '2021-12-03 14:56:58');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:57:16', '2021-12-03 14:57:16');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:57:59', '2021-12-03 14:57:59');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:58:16', '2021-12-03 14:58:16');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:58:48', '2021-12-03 14:58:48');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:59:26', '2021-12-03 14:59:26');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 14:59:38', '2021-12-03 14:59:38');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"10\",\"pk\":\"10\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-03 15:03:58', '2021-12-03 15:03:58');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:01:13', '2021-12-03 16:01:13');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:01:29', '2021-12-03 16:01:29');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:02:22', '2021-12-03 16:02:22');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:02:53', '2021-12-03 16:02:53');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:05:55', '2021-12-03 16:05:55');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:13', '2021-12-03 16:06:13');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:21', '2021-12-03 16:06:21');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:27', '2021-12-03 16:06:27');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:28', '2021-12-03 16:06:28');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:29', '2021-12-03 16:06:29');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:30', '2021-12-03 16:06:30');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:31', '2021-12-03 16:06:31');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:31', '2021-12-03 16:06:31');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:31', '2021-12-03 16:06:31');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:32', '2021-12-03 16:06:32');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:32', '2021-12-03 16:06:32');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:32', '2021-12-03 16:06:32');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:33', '2021-12-03 16:06:33');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:33', '2021-12-03 16:06:33');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:38', '2021-12-03 16:06:38');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:39', '2021-12-03 16:06:39');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:39', '2021-12-03 16:06:39');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:40', '2021-12-03 16:06:40');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:06:40', '2021-12-03 16:06:40');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:08:45', '2021-12-03 16:08:45');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:08:52', '2021-12-03 16:08:52');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:09:01', '2021-12-03 16:09:01');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:09:04', '2021-12-03 16:09:04');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:09:08', '2021-12-03 16:09:08');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:09:20', '2021-12-03 16:09:20');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:10:16', '2021-12-03 16:10:16');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:10:54', '2021-12-03 16:10:54');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:10:59', '2021-12-03 16:10:59');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:11:05', '2021-12-03 16:11:05');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:11:10', '2021-12-03 16:11:10');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:11:16', '2021-12-03 16:11:16');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:12:25', '2021-12-03 16:12:25');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/devices/10', 'PUT', '127.0.0.1', '{\"name\":\"remark\",\"value\":\"\\u5f88\\u597da\",\"pk\":\"10\",\"_token\":\"Oh1H54ZqYbJjcbxq1DCsASRavXxKSsrNENZrBEEc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-03 16:28:35', '2021-12-03 16:28:35');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:33:19', '2021-12-03 16:33:19');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:33:51', '2021-12-03 16:33:51');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:36:57', '2021-12-03 16:36:57');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:42:05', '2021-12-03 16:42:05');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:44:17', '2021-12-03 16:44:17');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:44:34', '2021-12-03 16:44:34');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:45:32', '2021-12-03 16:45:32');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:45:50', '2021-12-03 16:45:50');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:46:48', '2021-12-03 16:46:48');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:49:59', '2021-12-03 16:49:59');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:50:35', '2021-12-03 16:50:35');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:51:04', '2021-12-03 16:51:04');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:51:07', '2021-12-03 16:51:07');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:51:13', '2021-12-03 16:51:13');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:51:41', '2021-12-03 16:51:41');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-03 16:55:19', '2021-12-03 16:55:19');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-03 16:56:51', '2021-12-03 16:56:51');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-03 16:57:22', '2021-12-03 16:57:22');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-03 16:58:04', '2021-12-03 16:58:04');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:58:09', '2021-12-03 16:58:09');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 16:58:43', '2021-12-03 16:58:43');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:59:04', '2021-12-03 16:59:04');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 16:59:05', '2021-12-03 16:59:05');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:00:50', '2021-12-03 17:00:50');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:00:51', '2021-12-03 17:00:51');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:00:52', '2021-12-03 17:00:52');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:00:55', '2021-12-03 17:00:55');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:19', '2021-12-03 17:01:19');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:20', '2021-12-03 17:01:20');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:21', '2021-12-03 17:01:21');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:21', '2021-12-03 17:01:21');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:35', '2021-12-03 17:01:35');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:47', '2021-12-03 17:01:47');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:48', '2021-12-03 17:01:48');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:49', '2021-12-03 17:01:49');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:49', '2021-12-03 17:01:49');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:49', '2021-12-03 17:01:49');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:01:50', '2021-12-03 17:01:50');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:02:49', '2021-12-03 17:02:49');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:02:58', '2021-12-03 17:02:58');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:03:02', '2021-12-03 17:03:02');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:03:36', '2021-12-03 17:03:36');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-03 17:22:00', '2021-12-03 17:22:00');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:22:02', '2021-12-03 17:22:02');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:31:10', '2021-12-03 17:31:10');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:31:13', '2021-12-03 17:31:13');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:31:16', '2021-12-03 17:31:16');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:31:43', '2021-12-03 17:31:43');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:31:44', '2021-12-03 17:31:44');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-03 17:40:03', '2021-12-03 17:40:03');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-03 17:40:47', '2021-12-03 17:40:47');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 10:27:29', '2021-12-04 10:27:29');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 10:27:33', '2021-12-04 10:27:33');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 10:27:34', '2021-12-04 10:27:34');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 10:27:35', '2021-12-04 10:27:35');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-04 10:40:36', '2021-12-04 10:40:36');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:32:51', '2021-12-04 11:32:51');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:32:52', '2021-12-04 11:32:52');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:43:37', '2021-12-04 11:43:37');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:43:42', '2021-12-04 11:43:42');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:44:33', '2021-12-04 11:44:33');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:45:34', '2021-12-04 11:45:34');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:46:32', '2021-12-04 11:46:32');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:47:01', '2021-12-04 11:47:01');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:47:34', '2021-12-04 11:47:34');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:47:38', '2021-12-04 11:47:38');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:47:39', '2021-12-04 11:47:39');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:48:31', '2021-12-04 11:48:31');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:48:40', '2021-12-04 11:48:40');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:48:43', '2021-12-04 11:48:43');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u5206\\u7ec4\",\"icon\":\"fa-object-group\",\"uri\":\"groups\",\"roles\":[null],\"permission\":null,\"_token\":\"pVPfiVh4vGLYpcHuPJZDLC2CVfibkleiCoorCgGo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-04 11:48:49', '2021-12-04 11:48:49');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-04 11:48:49', '2021-12-04 11:48:49');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-04 11:48:51', '2021-12-04 11:48:51');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:48:53', '2021-12-04 11:48:53');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:49:00', '2021-12-04 11:49:00');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:49:02', '2021-12-04 11:49:02');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bbe\\u5907\\u7ba1\\u7406\",\"icon\":\"fa-motorcycle\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"pVPfiVh4vGLYpcHuPJZDLC2CVfibkleiCoorCgGo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-04 11:49:06', '2021-12-04 11:49:06');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-04 11:49:07', '2021-12-04 11:49:07');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-04 11:49:08', '2021-12-04 11:49:08');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:49:10', '2021-12-04 11:49:10');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/groups/1', 'PUT', '127.0.0.1', '{\"status\":\"0\",\"_token\":\"pVPfiVh4vGLYpcHuPJZDLC2CVfibkleiCoorCgGo\",\"_method\":\"PUT\"}', '2021-12-04 11:49:13', '2021-12-04 11:49:13');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/groups/1', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"pVPfiVh4vGLYpcHuPJZDLC2CVfibkleiCoorCgGo\",\"_method\":\"PUT\"}', '2021-12-04 11:49:14', '2021-12-04 11:49:14');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:49:16', '2021-12-04 11:49:16');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"brand\":\"Xiaomi\",\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:49:59', '2021-12-04 11:49:59');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:50:02', '2021-12-04 11:50:02');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-04 11:50:52', '2021-12-04 11:50:52');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:51:12', '2021-12-04 11:51:12');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:51:14', '2021-12-04 11:51:14');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:51:14', '2021-12-04 11:51:14');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:51:15', '2021-12-04 11:51:15');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:51:17', '2021-12-04 11:51:17');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-04 11:51:33', '2021-12-04 11:51:33');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-04 11:51:38', '2021-12-04 11:51:38');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:52:16', '2021-12-04 11:52:16');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:52:21', '2021-12-04 11:52:21');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:52:40', '2021-12-04 11:52:40');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:53:01', '2021-12-04 11:53:01');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:53:04', '2021-12-04 11:53:04');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:53:34', '2021-12-04 11:53:34');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:55:36', '2021-12-04 11:55:36');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:55:40', '2021-12-04 11:55:40');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:55:48', '2021-12-04 11:55:48');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 11:57:06', '2021-12-04 11:57:06');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:57:23', '2021-12-04 11:57:23');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:58:55', '2021-12-04 11:58:55');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:59:30', '2021-12-04 11:59:30');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 11:59:47', '2021-12-04 11:59:47');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 11:59:48', '2021-12-04 11:59:48');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 11:59:56', '2021-12-04 11:59:56');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-04 12:00:27', '2021-12-04 12:00:27');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 12:00:35', '2021-12-04 12:00:35');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 12:00:54', '2021-12-04 12:00:54');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 16:54:00', '2021-12-04 16:54:00');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 17:01:39', '2021-12-04 17:01:39');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 17:08:03', '2021-12-04 17:08:03');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-04 17:09:23', '2021-12-04 17:09:23');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:20:47', '2021-12-05 18:20:47');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:20:48', '2021-12-05 18:20:48');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:20:50', '2021-12-05 18:20:50');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:20:51', '2021-12-05 18:20:51');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:21:53', '2021-12-05 18:21:53');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:23:23', '2021-12-05 18:23:23');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:23:56', '2021-12-05 18:23:56');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:24:20', '2021-12-05 18:24:20');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:24:38', '2021-12-05 18:24:38');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:25:14', '2021-12-05 18:25:14');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:25:30', '2021-12-05 18:25:30');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:25:56', '2021-12-05 18:25:56');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:30:41', '2021-12-05 18:30:41');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:37:19', '2021-12-05 18:37:19');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:38:21', '2021-12-05 18:38:21');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:38:22', '2021-12-05 18:38:22');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:38:25', '2021-12-05 18:38:25');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:38:44', '2021-12-05 18:38:44');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:39:51', '2021-12-05 18:39:51');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:40:09', '2021-12-05 18:40:09');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:40:51', '2021-12-05 18:40:51');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:41:08', '2021-12-05 18:41:08');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:41:21', '2021-12-05 18:41:21');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"total_favorited\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:42:49', '2021-12-05 18:42:49');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"total_favorited\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:42:50', '2021-12-05 18:42:50');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:42:54', '2021-12-05 18:42:54');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:44:27', '2021-12-05 18:44:27');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:44:41', '2021-12-05 18:44:41');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:48:12', '2021-12-05 18:48:12');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:48:15', '2021-12-05 18:48:15');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:48:52', '2021-12-05 18:48:52');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:48:57', '2021-12-05 18:48:57');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-05 18:49:53', '2021-12-05 18:49:53');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-05 18:51:06', '2021-12-05 18:51:06');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:51:12', '2021-12-05 18:51:12');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\",\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:51:17', '2021-12-05 18:51:17');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:51:37', '2021-12-05 18:51:37');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:54:38', '2021-12-05 18:54:38');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:54:57', '2021-12-05 18:54:57');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:55:06', '2021-12-05 18:55:06');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:55:16', '2021-12-05 18:55:16');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:55:21', '2021-12-05 18:55:21');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:55:33', '2021-12-05 18:55:33');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:57:51', '2021-12-05 18:57:51');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:58:02', '2021-12-05 18:58:02');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\"}', '2021-12-05 18:58:23', '2021-12-05 18:58:23');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,total_favorited,uuid\",\"did\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:58:26', '2021-12-05 18:58:26');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 18:58:42', '2021-12-05 18:58:42');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 18:59:52', '2021-12-05 18:59:52');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:00:51', '2021-12-05 19:00:51');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/devices/1', 'PUT', '127.0.0.1', '{\"name\":\"remark\",\"value\":\"\\u6d4b\\u8bd5\\u624b\\u673a\",\"pk\":\"1\",\"_token\":\"91ZKdc62VfJeQKWIeyjeKURiSUrjFGiXFHTZzlS0\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-05 19:01:07', '2021-12-05 19:01:07');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:01:09', '2021-12-05 19:01:09');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:01:11', '2021-12-05 19:01:11');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:02:43', '2021-12-05 19:02:43');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:03:07', '2021-12-05 19:03:07');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-05 19:03:15', '2021-12-05 19:03:15');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-05 19:03:19', '2021-12-05 19:03:19');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:03:23', '2021-12-05 19:03:23');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:03:36', '2021-12-05 19:03:36');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:04:03', '2021-12-05 19:04:03');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:05:42', '2021-12-05 19:05:42');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:06:07', '2021-12-05 19:06:07');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:06:09', '2021-12-05 19:06:09');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:07:02', '2021-12-05 19:07:02');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:07:29', '2021-12-05 19:07:29');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:08:07', '2021-12-05 19:08:07');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:08:16', '2021-12-05 19:08:16');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:08:26', '2021-12-05 19:08:26');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:04', '2021-12-05 19:09:04');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:17', '2021-12-05 19:09:17');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:18', '2021-12-05 19:09:18');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:18', '2021-12-05 19:09:18');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:26', '2021-12-05 19:09:26');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:34', '2021-12-05 19:09:34');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:35', '2021-12-05 19:09:35');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:48', '2021-12-05 19:09:48');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:09:54', '2021-12-05 19:09:54');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:10:54', '2021-12-05 19:10:54');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"status\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:10:58', '2021-12-05 19:10:58');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"status\":[\"0\"],\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:11:01', '2021-12-05 19:11:01');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:11:03', '2021-12-05 19:11:03');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:11:26', '2021-12-05 19:11:26');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/accounts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:11:28', '2021-12-05 19:11:28');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"91ZKdc62VfJeQKWIeyjeKURiSUrjFGiXFHTZzlS0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/accounts\"}', '2021-12-05 19:11:31', '2021-12-05 19:11:31');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:11:31', '2021-12-05 19:11:31');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/accounts/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:11:36', '2021-12-05 19:11:36');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:11:43', '2021-12-05 19:11:43');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:16:59', '2021-12-05 19:16:59');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:17:02', '2021-12-05 19:17:02');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:17:04', '2021-12-05 19:17:04');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:17:06', '2021-12-05 19:17:06');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:17:06', '2021-12-05 19:17:06');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:17:08', '2021-12-05 19:17:08');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-05 19:51:52', '2021-12-05 19:51:52');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:51:54', '2021-12-05 19:51:54');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:51:57', '2021-12-05 19:51:57');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:51:58', '2021-12-05 19:51:58');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-05 19:51:59', '2021-12-05 19:51:59');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-06 10:37:42', '2021-12-06 10:37:42');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-06 10:37:43', '2021-12-06 10:37:43');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-06 10:37:48', '2021-12-06 10:37:48');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-06 10:38:01', '2021-12-06 10:38:01');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-06 10:38:11', '2021-12-06 10:38:11');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:25', '2021-12-07 15:03:25');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 15:03:29', '2021-12-07 15:03:29');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 15:03:30', '2021-12-07 15:03:30');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 15:03:35', '2021-12-07 15:03:35');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:37', '2021-12-07 15:03:37');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:38', '2021-12-07 15:03:38');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:39', '2021-12-07 15:03:39');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:39', '2021-12-07 15:03:39');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:40', '2021-12-07 15:03:40');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:40', '2021-12-07 15:03:40');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:40', '2021-12-07 15:03:40');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:40', '2021-12-07 15:03:40');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 15:03:41', '2021-12-07 15:03:41');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-07 18:09:14', '2021-12-07 18:09:14');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 18:09:15', '2021-12-07 18:09:15');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 18:09:16', '2021-12-07 18:09:16');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"accounts\",\"type\":\"desc\"}}', '2021-12-07 18:09:32', '2021-12-07 18:09:32');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"accounts\",\"type\":\"asc\"}}', '2021-12-07 18:09:32', '2021-12-07 18:09:32');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 18:09:43', '2021-12-07 18:09:43');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 18:09:51', '2021-12-07 18:09:51');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-07 18:09:52', '2021-12-07 18:09:52');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-10 08:45:36', '2021-12-10 08:45:36');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:39', '2021-12-10 08:45:39');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:40', '2021-12-10 08:45:40');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Device\",\"_token\":\"6oTnrW2caPfqbO119wqcAJ6b4JIRn6I3YUQIlgDw\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-12-10 08:45:50', '2021-12-10 08:45:50');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:51', '2021-12-10 08:45:51');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:53', '2021-12-10 08:45:53');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:56', '2021-12-10 08:45:56');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-10 08:45:57', '2021-12-10 08:45:57');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-14 09:28:30', '2021-12-14 09:28:30');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 09:28:34', '2021-12-14 09:28:34');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 09:28:35', '2021-12-14 09:28:35');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 09:28:37', '2021-12-14 09:28:37');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 09:28:39', '2021-12-14 09:28:39');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 09:28:43', '2021-12-14 09:28:43');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 10:22:35', '2021-12-14 10:22:35');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 10:23:06', '2021-12-14 10:23:06');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:23:42', '2021-12-14 10:23:42');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 10:23:44', '2021-12-14 10:23:44');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-14 10:23:46', '2021-12-14 10:23:46');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:24:37', '2021-12-14 10:24:37');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:26:05', '2021-12-14 10:26:05');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:26:15', '2021-12-14 10:26:15');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:27:52', '2021-12-14 10:27:52');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:28:04', '2021-12-14 10:28:04');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:28:14', '2021-12-14 10:28:14');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-14 10:28:41', '2021-12-14 10:28:41');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-15 15:45:28', '2021-12-15 15:45:28');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:45:31', '2021-12-15 15:45:31');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:45:33', '2021-12-15 15:45:33');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:45:50', '2021-12-15 15:45:50');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-15 15:45:53', '2021-12-15 15:45:53');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 15:46:20', '2021-12-15 15:46:20');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"TKDoMtccFtMV78KpJloxFDoM3lKiSq63aIf872JE\",\"_method\":\"PUT\"}', '2021-12-15 16:16:04', '2021-12-15 16:16:04');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 16:17:20', '2021-12-15 16:17:20');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 16:17:22', '2021-12-15 16:17:22');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-15 16:55:50', '2021-12-15 16:55:50');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:37:29', '2021-12-16 09:37:29');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 09:38:41', '2021-12-16 09:38:41');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 09:39:39', '2021-12-16 09:39:39');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:40:01', '2021-12-16 09:40:01');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:41:49', '2021-12-16 09:41:49');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:42:00', '2021-12-16 09:42:00');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:42:01', '2021-12-16 09:42:01');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:42:02', '2021-12-16 09:42:02');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 09:46:39', '2021-12-16 09:46:39');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:07:58', '2021-12-16 10:07:58');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:08:05', '2021-12-16 10:08:05');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:09:21', '2021-12-16 10:09:21');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:14:40', '2021-12-16 10:14:40');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:15:12', '2021-12-16 10:15:12');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:16:08', '2021-12-16 10:16:08');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:18:50', '2021-12-16 10:18:50');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:21:25', '2021-12-16 10:21:25');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"3\",\"pk\":\"5\",\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-16 10:21:34', '2021-12-16 10:21:34');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:22:18', '2021-12-16 10:22:18');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:23:14', '2021-12-16 10:23:14');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:23:29', '2021-12-16 10:23:29');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:23:43', '2021-12-16 10:23:43');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:23:50', '2021-12-16 10:23:50');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:23:54', '2021-12-16 10:23:54');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:24:29', '2021-12-16 10:24:29');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-16 10:24:32', '2021-12-16 10:24:32');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:24:41', '2021-12-16 10:24:41');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 10:24:45', '2021-12-16 10:24:45');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:25:52', '2021-12-16 10:25:52');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-16 10:25:55', '2021-12-16 10:25:55');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 10:26:01', '2021-12-16 10:26:01');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-16 10:27:51', '2021-12-16 10:27:51');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:29:11', '2021-12-16 10:29:11');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:29:14', '2021-12-16 10:29:14');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:30:31', '2021-12-16 10:30:31');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:30:34', '2021-12-16 10:30:34');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:31:01', '2021-12-16 10:31:01');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:31:04', '2021-12-16 10:31:04');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:31:15', '2021-12-16 10:31:15');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:31:17', '2021-12-16 10:31:17');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-16 10:31:31', '2021-12-16 10:31:31');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-16 10:31:53', '2021-12-16 10:31:53');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-16 10:32:09', '2021-12-16 10:32:09');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:34:46', '2021-12-16 10:34:46');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/devices/1', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-16 10:34:51', '2021-12-16 10:34:51');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 10:34:54', '2021-12-16 10:34:54');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-16 10:35:00', '2021-12-16 10:35:00');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:35:15', '2021-12-16 10:35:15');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:46:45', '2021-12-16 10:46:45');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 10:46:48', '2021-12-16 10:46:48');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-16 10:46:55', '2021-12-16 10:46:55');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/devices/1', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-16 10:47:05', '2021-12-16 10:47:05');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:48:07', '2021-12-16 10:48:07');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:49:01', '2021-12-16 10:49:01');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"groups\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:49:04', '2021-12-16 10:49:04');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"groups\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:49:07', '2021-12-16 10:49:07');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"groups\":[\"1\",\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:49:10', '2021-12-16 10:49:10');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:49:14', '2021-12-16 10:49:14');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\"}', '2021-12-16 10:52:24', '2021-12-16 10:52:24');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_sort\":{\"column\":\"user_num\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:52:50', '2021-12-16 10:52:50');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_sort\":{\"column\":\"user_num\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:52:51', '2021-12-16 10:52:51');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,user_num\",\"_sort\":{\"column\":\"user_num\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:52:56', '2021-12-16 10:52:56');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:53:20', '2021-12-16 10:53:20');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:53:22', '2021-12-16 10:53:22');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:53:23', '2021-12-16 10:53:23');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 10:53:23', '2021-12-16 10:53:23');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 10:53:24', '2021-12-16 10:53:24');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:01:15', '2021-12-16 11:01:15');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:08:27', '2021-12-16 11:08:27');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:08:30', '2021-12-16 11:08:30');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-object-group\",\"uri\":\"groups\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 11:08:39', '2021-12-16 11:08:39');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 11:08:39', '2021-12-16 11:08:39');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bbe\\u5907\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-resistance\",\"uri\":\"devicegroup\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\"}', '2021-12-16 11:09:25', '2021-12-16 11:09:25');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 11:09:26', '2021-12-16 11:09:26');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:09:29', '2021-12-16 11:09:29');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-object-group\",\"uri\":\"groupaccount\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 11:09:41', '2021-12-16 11:09:41');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 11:09:41', '2021-12-16 11:09:41');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:09:46', '2021-12-16 11:09:46');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-object-group\",\"uri\":\"accountgroup\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 11:09:51', '2021-12-16 11:09:51');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 11:09:51', '2021-12-16 11:09:51');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 11:09:56', '2021-12-16 11:09:56');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:10:00', '2021-12-16 11:10:00');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:10:02', '2021-12-16 11:10:02');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:10:02', '2021-12-16 11:10:02');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:10:09', '2021-12-16 11:10:09');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:16:09', '2021-12-16 11:16:09');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:16:09', '2021-12-16 11:16:09');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:16:36', '2021-12-16 11:16:36');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:18:17', '2021-12-16 11:18:17');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:18:37', '2021-12-16 11:18:37');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:23:07', '2021-12-16 11:23:07');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:23:13', '2021-12-16 11:23:13');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:23:30', '2021-12-16 11:23:30');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:37:51', '2021-12-16 11:37:51');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:38:21', '2021-12-16 11:38:21');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:38:54', '2021-12-16 11:38:54');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 11:38:54', '2021-12-16 11:38:54');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:39:10', '2021-12-16 11:39:10');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:40:53', '2021-12-16 11:40:53');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:41:00', '2021-12-16 11:41:00');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:41:43', '2021-12-16 11:41:43');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:42:42', '2021-12-16 11:42:42');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:43:19', '2021-12-16 11:43:19');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:44:01', '2021-12-16 11:44:01');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,nickname,region,shareUrl,status,total_favorited\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:44:04', '2021-12-16 11:44:04');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:44:08', '2021-12-16 11:44:08');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:44:19', '2021-12-16 11:44:19');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:50:39', '2021-12-16 11:50:39');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:50:40', '2021-12-16 11:50:40');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:50:41', '2021-12-16 11:50:41');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:51:23', '2021-12-16 11:51:23');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:51:38', '2021-12-16 11:51:38');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:53:56', '2021-12-16 11:53:56');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 11:53:58', '2021-12-16 11:53:58');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 11:54:00', '2021-12-16 11:54:00');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 11:59:55', '2021-12-16 11:59:55');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:00:04', '2021-12-16 12:00:04');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8d26\\u53f7\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-object-group\",\"uri\":\"group-accounts\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 12:00:07', '2021-12-16 12:00:07');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 12:00:07', '2021-12-16 12:00:07');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:00:41', '2021-12-16 12:00:41');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/auth/menu/12', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bbe\\u5907\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-resistance\",\"uri\":\"group-devices\",\"roles\":[null],\"permission\":null,\"_token\":\"fI9rHYHLCu0MyLDRJ4oQB4AgASEcghJHFiDUxezU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 12:00:44', '2021-12-16 12:00:44');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 12:00:44', '2021-12-16 12:00:44');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 12:00:45', '2021-12-16 12:00:45');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:00:47', '2021-12-16 12:00:47');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:00:49', '2021-12-16 12:00:49');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:00:50', '2021-12-16 12:00:50');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 12:01:02', '2021-12-16 12:01:02');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 12:01:11', '2021-12-16 12:01:11');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 12:01:27', '2021-12-16 12:01:27');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 12:01:48', '2021-12-16 12:01:48');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 12:02:20', '2021-12-16 12:02:20');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:02:22', '2021-12-16 12:02:22');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 12:02:25', '2021-12-16 12:02:25');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:13:42', '2021-12-16 14:13:42');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/group-devices/1', 'PUT', '127.0.0.1', '{\"admin_id\":\"1\",\"name\":\"\\u8bbe\\u5907\\u5206\\u7ec4\\u6d4b\\u8bd5\",\"devices\":\"0\",\"orderby\":\"0\",\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/group-devices\"}', '2021-12-16 14:13:49', '2021-12-16 14:13:49');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-16 14:13:49', '2021-12-16 14:13:49');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/group-devices/1', 'PUT', '127.0.0.1', '{\"admin_id\":\"1\",\"name\":\"\\u8bbe\\u5907\\u5206\\u7ec4\\u6d4b\\u8bd5\",\"devices\":\"0\",\"orderby\":\"0\",\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\"}', '2021-12-16 14:14:19', '2021-12-16 14:14:19');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 14:14:19', '2021-12-16 14:14:19');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:17:23', '2021-12-16 14:17:23');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/group-devices/1', 'PUT', '127.0.0.1', '{\"admin_id\":\"1\",\"name\":\"\\u8bbe\\u5907\\u5206\\u7ec4\\u6d4b\\u8bd5\",\"devices\":\"0\",\"orderby\":\"0\",\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/group-devices\"}', '2021-12-16 14:17:31', '2021-12-16 14:17:31');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 14:17:31', '2021-12-16 14:17:31');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 14:17:49', '2021-12-16 14:17:49');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:17:50', '2021-12-16 14:17:50');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-16 14:18:08', '2021-12-16 14:18:08');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-16 14:18:15', '2021-12-16 14:18:15');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/group-devices/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-16 14:18:20', '2021-12-16 14:18:20');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:18:21', '2021-12-16 14:18:21');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 14:18:33', '2021-12-16 14:18:33');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 14:18:40', '2021-12-16 14:18:40');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:18:44', '2021-12-16 14:18:44');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 14:19:03', '2021-12-16 14:19:03');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 14:19:30', '2021-12-16 14:19:30');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 14:19:51', '2021-12-16 14:19:51');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:08', '2021-12-16 14:20:08');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:12', '2021-12-16 14:20:12');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/group-accounts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:34', '2021-12-16 14:20:34');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:37', '2021-12-16 14:20:37');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:39', '2021-12-16 14:20:39');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:41', '2021-12-16 14:20:41');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:43', '2021-12-16 14:20:43');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:45', '2021-12-16 14:20:45');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:20:53', '2021-12-16 14:20:53');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:21:15', '2021-12-16 14:21:15');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":\"task\",\"roles\":[null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\"}', '2021-12-16 14:21:31', '2021-12-16 14:21:31');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:21:31', '2021-12-16 14:21:31');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:21:36', '2021-12-16 14:21:36');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":13},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-16 14:21:46', '2021-12-16 14:21:46');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:21:46', '2021-12-16 14:21:46');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:21:47', '2021-12-16 14:21:47');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:21:57', '2021-12-16 14:21:57');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/auth/menu/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 14:22:07', '2021-12-16 14:22:07');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:22:07', '2021-12-16 14:22:07');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:22:08', '2021-12-16 14:22:08');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:22:13', '2021-12-16 14:22:13');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-16 14:22:17', '2021-12-16 14:22:17');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:22:23', '2021-12-16 14:22:23');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"13\",\"title\":\"\\u4efb\\u52a1\\u53d1\\u5e03\",\"icon\":\"fa-send-o\",\"uri\":\"task-send\",\"roles\":[null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\"}', '2021-12-16 14:23:33', '2021-12-16 14:23:33');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:23:33', '2021-12-16 14:23:33');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\\u6e05\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"task-lists\",\"roles\":[null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\"}', '2021-12-16 14:33:35', '2021-12-16 14:33:35');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:33:35', '2021-12-16 14:33:35');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:33:42', '2021-12-16 14:33:42');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4efb\\u52a1\\u6e05\\u5355\",\"icon\":\"fa-list-ol\",\"uri\":\"task-lists\",\"roles\":[null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 14:33:52', '2021-12-16 14:33:52');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:33:52', '2021-12-16 14:33:52');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:33:58', '2021-12-16 14:33:58');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":13,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-12-16 14:34:08', '2021-12-16 14:34:08');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 14:34:08', '2021-12-16 14:34:08');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 14:34:08', '2021-12-16 14:34:08');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:26:59', '2021-12-16 15:26:59');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:27:00', '2021-12-16 15:27:00');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 15:27:05', '2021-12-16 15:27:05');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,groups,nickname,region,status,total_favorited,uuid\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:27:26', '2021-12-16 15:27:26');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,groups,nickname,region,shareUrl,status,total_favorited,uuid\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:27:37', '2021-12-16 15:27:37');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_columns_\":\"avatar,aweme_count,did,favoriting_count,follower_count,following_count,groups,nickname,region,status,total_favorited,uuid\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:27:41', '2021-12-16 15:27:41');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:29:32', '2021-12-16 15:29:32');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:29:34', '2021-12-16 15:29:34');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:29:35', '2021-12-16 15:29:35');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:31:03', '2021-12-16 15:31:03');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:31:44', '2021-12-16 15:31:44');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:31:46', '2021-12-16 15:31:46');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:31:54', '2021-12-16 15:31:54');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:32:54', '2021-12-16 15:32:54');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:33:10', '2021-12-16 15:33:10');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 15:33:14', '2021-12-16 15:33:14');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:33:29', '2021-12-16 15:33:29');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:33:36', '2021-12-16 15:33:36');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:35:00', '2021-12-16 15:35:00');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:37:04', '2021-12-16 15:37:04');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:38:23', '2021-12-16 15:38:23');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:39:05', '2021-12-16 15:39:05');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:39:21', '2021-12-16 15:39:21');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:39:34', '2021-12-16 15:39:34');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:41:33', '2021-12-16 15:41:33');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:41:50', '2021-12-16 15:41:50');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:43:14', '2021-12-16 15:43:14');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:43:31', '2021-12-16 15:43:31');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:49:00', '2021-12-16 15:49:00');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:51:41', '2021-12-16 15:51:41');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:53:40', '2021-12-16 15:53:40');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:53:46', '2021-12-16 15:53:46');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:54:39', '2021-12-16 15:54:39');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:55:01', '2021-12-16 15:55:01');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:55:11', '2021-12-16 15:55:11');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:55:41', '2021-12-16 15:55:41');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:55:56', '2021-12-16 15:55:56');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:56:24', '2021-12-16 15:56:24');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 15:56:33', '2021-12-16 15:56:33');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:01:46', '2021-12-16 16:01:46');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:01:54', '2021-12-16 16:01:54');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:03:03', '2021-12-16 16:03:03');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:03:04', '2021-12-16 16:03:04');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:03:56', '2021-12-16 16:03:56');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:04:08', '2021-12-16 16:04:08');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:04:09', '2021-12-16 16:04:09');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:04:32', '2021-12-16 16:04:32');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:04:33', '2021-12-16 16:04:33');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:10', '2021-12-16 16:05:10');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:11', '2021-12-16 16:05:11');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:22', '2021-12-16 16:05:22');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:23', '2021-12-16 16:05:23');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:41', '2021-12-16 16:05:41');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:42', '2021-12-16 16:05:42');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:49', '2021-12-16 16:05:49');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:50', '2021-12-16 16:05:50');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:54', '2021-12-16 16:05:54');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:05:55', '2021-12-16 16:05:55');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:03', '2021-12-16 16:06:03');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:04', '2021-12-16 16:06:04');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:07', '2021-12-16 16:06:07');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:08', '2021-12-16 16:06:08');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:16', '2021-12-16 16:06:16');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:17', '2021-12-16 16:06:17');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:22', '2021-12-16 16:06:22');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:23', '2021-12-16 16:06:23');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:29', '2021-12-16 16:06:29');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:06:30', '2021-12-16 16:06:30');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:07:35', '2021-12-16 16:07:35');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:07:35', '2021-12-16 16:07:35');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:07:48', '2021-12-16 16:07:48');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:07:49', '2021-12-16 16:07:49');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:08:19', '2021-12-16 16:08:19');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:09:32', '2021-12-16 16:09:32');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:09:35', '2021-12-16 16:09:35');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:09:38', '2021-12-16 16:09:38');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:10:46', '2021-12-16 16:10:46');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:10:47', '2021-12-16 16:10:47');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:12:30', '2021-12-16 16:12:30');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:19:14', '2021-12-16 16:19:14');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:21:06', '2021-12-16 16:21:06');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:21:40', '2021-12-16 16:21:40');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:21:44', '2021-12-16 16:21:44');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:21:51', '2021-12-16 16:21:51');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:21:52', '2021-12-16 16:21:52');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:22:26', '2021-12-16 16:22:26');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 16:22:28', '2021-12-16 16:22:28');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:25:02', '2021-12-16 16:25:02');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:38:59', '2021-12-16 16:38:59');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:39:02', '2021-12-16 16:39:02');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"13\",\"title\":\"\\u4efb\\u52a1\\u6e05\\u5355\",\"icon\":\"fa-list-ol\",\"uri\":\"tasks\",\"roles\":[null],\"permission\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2021-12-16 16:39:05', '2021-12-16 16:39:05');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 16:39:05', '2021-12-16 16:39:05');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-12-16 16:39:06', '2021-12-16 16:39:06');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 16:39:08', '2021-12-16 16:39:08');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:47:49', '2021-12-16 16:47:49');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:48:07', '2021-12-16 16:48:07');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:48:19', '2021-12-16 16:48:19');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:48:30', '2021-12-16 16:48:30');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:51:31', '2021-12-16 16:51:31');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:53:06', '2021-12-16 16:53:06');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:53:17', '2021-12-16 16:53:17');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:53:20', '2021-12-16 16:53:20');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:53:43', '2021-12-16 16:53:43');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:53:44', '2021-12-16 16:53:44');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:55:20', '2021-12-16 16:55:20');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:55:44', '2021-12-16 16:55:44');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 16:55:47', '2021-12-16 16:55:47');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:56:03', '2021-12-16 16:56:03');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:56:14', '2021-12-16 16:56:14');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:57:35', '2021-12-16 16:57:35');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:58:17', '2021-12-16 16:58:17');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:58:20', '2021-12-16 16:58:20');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 16:58:58', '2021-12-16 16:58:58');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-16 17:01:18', '2021-12-16 17:01:18');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-16 17:01:22', '2021-12-16 17:01:22');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:01:33', '2021-12-16 17:01:33');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:01:34', '2021-12-16 17:01:34');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:01:35', '2021-12-16 17:01:35');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:01:36', '2021-12-16 17:01:36');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/group-devices/1', 'PUT', '127.0.0.1', '{\"name\":\"name\",\"value\":\"\\u8bbe\\u5907\\u6d4b\\u8bd5\",\"pk\":\"1\",\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-16 17:01:41', '2021-12-16 17:01:41');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:01:43', '2021-12-16 17:01:43');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 17:17:26', '2021-12-16 17:17:26');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:17:28', '2021-12-16 17:17:28');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:17:33', '2021-12-16 17:17:33');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:17:37', '2021-12-16 17:17:37');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:42', '2021-12-16 17:19:42');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:44', '2021-12-16 17:19:44');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:46', '2021-12-16 17:19:46');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:51', '2021-12-16 17:19:51');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:53', '2021-12-16 17:19:53');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:55', '2021-12-16 17:19:55');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:19:57', '2021-12-16 17:19:57');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/group-accounts/1', 'PUT', '127.0.0.1', '{\"name\":\"name\",\"value\":\"\\u8d26\\u53f7\\u7ec41\",\"pk\":\"1\",\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-16 17:20:04', '2021-12-16 17:20:04');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:20:06', '2021-12-16 17:20:06');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 17:20:09', '2021-12-16 17:20:09');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:20:10', '2021-12-16 17:20:10');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 17:21:19', '2021-12-16 17:21:19');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:21:21', '2021-12-16 17:21:21');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 17:22:41', '2021-12-16 17:22:41');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:22:42', '2021-12-16 17:22:42');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/group-accounts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:22:43', '2021-12-16 17:22:43');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/group-accounts', 'POST', '127.0.0.1', '{\"name\":\"\\u8d26\\u53f7\\u7ec42\",\"orderby\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/group-accounts\"}', '2021-12-16 17:22:49', '2021-12-16 17:22:49');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/group-accounts/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:22:50', '2021-12-16 17:22:50');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/group-accounts', 'POST', '127.0.0.1', '{\"name\":\"\\u8d26\\u53f7\\u7ec42\",\"orderby\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\"}', '2021-12-16 17:23:44', '2021-12-16 17:23:44');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/group-accounts/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:23:46', '2021-12-16 17:23:46');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/group-accounts', 'POST', '127.0.0.1', '{\"name\":\"\\u8d26\\u53f7\\u7ec42\",\"orderby\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\"}', '2021-12-16 17:23:58', '2021-12-16 17:23:58');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 17:23:58', '2021-12-16 17:23:58');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:24:00', '2021-12-16 17:24:00');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/group-devices/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:24:01', '2021-12-16 17:24:01');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/group-devices', 'POST', '127.0.0.1', '{\"name\":\"\\u8bbe\\u5907\\u7ec43\",\"orderby\":null,\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/group-devices\"}', '2021-12-16 17:24:22', '2021-12-16 17:24:22');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/group-devices', 'GET', '127.0.0.1', '[]', '2021-12-16 17:24:22', '2021-12-16 17:24:22');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:24:24', '2021-12-16 17:24:24');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-16 17:24:27', '2021-12-16 17:24:27');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 17:24:28', '2021-12-16 17:24:28');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 17:27:43', '2021-12-16 17:27:43');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:27:44', '2021-12-16 17:27:44');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:27:45', '2021-12-16 17:27:45');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:27:46', '2021-12-16 17:27:46');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:27:48', '2021-12-16 17:27:48');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:27:55', '2021-12-16 17:27:55');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 17:27:59', '2021-12-16 17:27:59');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 17:28:01', '2021-12-16 17:28:01');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"3\"]}', '2021-12-16 17:28:03', '2021-12-16 17:28:03');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-16 17:28:04', '2021-12-16 17:28:04');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,task,user_num\",\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:28:20', '2021-12-16 17:28:20');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:28:25', '2021-12-16 17:28:25');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:28:27', '2021-12-16 17:28:27');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 17:29:13', '2021-12-16 17:29:13');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"L0jY6gBK0oq292pfdHqV43I4JsGDYu1crdr1qOkn\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-16 17:29:17', '2021-12-16 17:29:17');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:29:18', '2021-12-16 17:29:18');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-16 17:29:19', '2021-12-16 17:29:19');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:29:28', '2021-12-16 17:29:28');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:29:30', '2021-12-16 17:29:30');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:30:55', '2021-12-16 17:30:55');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-16 17:32:31', '2021-12-16 17:32:31');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:36:36', '2021-12-16 17:36:36');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:44:34', '2021-12-16 17:44:34');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:50:39', '2021-12-16 17:50:39');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:51:53', '2021-12-16 17:51:53');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-16 17:52:51', '2021-12-16 17:52:51');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:02:20', '2021-12-17 10:02:20');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:04:59', '2021-12-17 10:04:59');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:05:12', '2021-12-17 10:05:12');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:11:04', '2021-12-17 10:11:04');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-17 10:11:26', '2021-12-17 10:11:26');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-17 10:11:48', '2021-12-17 10:11:48');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:12:21', '2021-12-17 10:12:21');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 10:15:31', '2021-12-17 10:15:31');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 10:15:46', '2021-12-17 10:15:46');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 10:16:55', '2021-12-17 10:16:55');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 10:21:44', '2021-12-17 10:21:44');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:24:57', '2021-12-17 10:24:57');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:24:57', '2021-12-17 10:24:57');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:24:59', '2021-12-17 10:24:59');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:42:08', '2021-12-17 10:42:08');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:42:12', '2021-12-17 10:42:12');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:42:20', '2021-12-17 10:42:20');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:43:33', '2021-12-17 10:43:33');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:43:57', '2021-12-17 10:43:57');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin/devices/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:44:10', '2021-12-17 10:44:10');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:44:18', '2021-12-17 10:44:18');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 10:45:25', '2021-12-17 10:45:25');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:45:36', '2021-12-17 10:45:36');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-17 10:46:22', '2021-12-17 10:46:22');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-17 10:46:29', '2021-12-17 10:46:29');
INSERT INTO `admin_operation_log` VALUES (918, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\",\"3\"]}', '2021-12-17 10:46:35', '2021-12-17 10:46:35');
INSERT INTO `admin_operation_log` VALUES (919, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:46:41', '2021-12-17 10:46:41');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:46:45', '2021-12-17 10:46:45');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:48:23', '2021-12-17 10:48:23');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:48:29', '2021-12-17 10:48:29');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:48:56', '2021-12-17 10:48:56');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 10:49:04', '2021-12-17 10:49:04');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/accounts/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 10:49:07', '2021-12-17 10:49:07');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin/accounts/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 10:49:12', '2021-12-17 10:49:12');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:49:16', '2021-12-17 10:49:16');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin/accounts/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:49:18', '2021-12-17 10:49:18');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:49:34', '2021-12-17 10:49:34');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:49:36', '2021-12-17 10:49:36');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:49:37', '2021-12-17 10:49:37');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:50:06', '2021-12-17 10:50:06');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:50:17', '2021-12-17 10:50:17');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:50:19', '2021-12-17 10:50:19');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:50:20', '2021-12-17 10:50:20');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 10:50:47', '2021-12-17 10:50:47');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:50:52', '2021-12-17 10:50:52');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:50:59', '2021-12-17 10:50:59');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:51:01', '2021-12-17 10:51:01');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:51:08', '2021-12-17 10:51:08');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:51:10', '2021-12-17 10:51:10');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:51:12', '2021-12-17 10:51:12');
INSERT INTO `admin_operation_log` VALUES (943, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:51:15', '2021-12-17 10:51:15');
INSERT INTO `admin_operation_log` VALUES (944, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:51:16', '2021-12-17 10:51:16');
INSERT INTO `admin_operation_log` VALUES (945, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:52:11', '2021-12-17 10:52:11');
INSERT INTO `admin_operation_log` VALUES (946, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:52:55', '2021-12-17 10:52:55');
INSERT INTO `admin_operation_log` VALUES (947, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:52:58', '2021-12-17 10:52:58');
INSERT INTO `admin_operation_log` VALUES (948, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:53:00', '2021-12-17 10:53:00');
INSERT INTO `admin_operation_log` VALUES (949, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:53:26', '2021-12-17 10:53:26');
INSERT INTO `admin_operation_log` VALUES (950, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:53:28', '2021-12-17 10:53:28');
INSERT INTO `admin_operation_log` VALUES (951, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:53:29', '2021-12-17 10:53:29');
INSERT INTO `admin_operation_log` VALUES (952, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:53:30', '2021-12-17 10:53:30');
INSERT INTO `admin_operation_log` VALUES (953, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:54:09', '2021-12-17 10:54:09');
INSERT INTO `admin_operation_log` VALUES (954, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:54:11', '2021-12-17 10:54:11');
INSERT INTO `admin_operation_log` VALUES (955, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:54:21', '2021-12-17 10:54:21');
INSERT INTO `admin_operation_log` VALUES (956, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:54:26', '2021-12-17 10:54:26');
INSERT INTO `admin_operation_log` VALUES (957, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:55:25', '2021-12-17 10:55:25');
INSERT INTO `admin_operation_log` VALUES (958, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:56:08', '2021-12-17 10:56:08');
INSERT INTO `admin_operation_log` VALUES (959, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:56:12', '2021-12-17 10:56:12');
INSERT INTO `admin_operation_log` VALUES (960, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:13', '2021-12-17 10:56:13');
INSERT INTO `admin_operation_log` VALUES (961, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:56:27', '2021-12-17 10:56:27');
INSERT INTO `admin_operation_log` VALUES (962, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:56:31', '2021-12-17 10:56:31');
INSERT INTO `admin_operation_log` VALUES (963, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:31', '2021-12-17 10:56:31');
INSERT INTO `admin_operation_log` VALUES (964, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:32', '2021-12-17 10:56:32');
INSERT INTO `admin_operation_log` VALUES (965, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:38', '2021-12-17 10:56:38');
INSERT INTO `admin_operation_log` VALUES (966, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:56:41', '2021-12-17 10:56:41');
INSERT INTO `admin_operation_log` VALUES (967, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:41', '2021-12-17 10:56:41');
INSERT INTO `admin_operation_log` VALUES (968, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:56:42', '2021-12-17 10:56:42');
INSERT INTO `admin_operation_log` VALUES (969, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:57:04', '2021-12-17 10:57:04');
INSERT INTO `admin_operation_log` VALUES (970, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:57:06', '2021-12-17 10:57:06');
INSERT INTO `admin_operation_log` VALUES (971, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:57:06', '2021-12-17 10:57:06');
INSERT INTO `admin_operation_log` VALUES (972, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:57:14', '2021-12-17 10:57:14');
INSERT INTO `admin_operation_log` VALUES (973, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 10:57:31', '2021-12-17 10:57:31');
INSERT INTO `admin_operation_log` VALUES (974, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:12', '2021-12-17 10:58:12');
INSERT INTO `admin_operation_log` VALUES (975, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:58:15', '2021-12-17 10:58:15');
INSERT INTO `admin_operation_log` VALUES (976, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:16', '2021-12-17 10:58:16');
INSERT INTO `admin_operation_log` VALUES (977, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\"}', '2021-12-17 10:58:18', '2021-12-17 10:58:18');
INSERT INTO `admin_operation_log` VALUES (978, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:19', '2021-12-17 10:58:19');
INSERT INTO `admin_operation_log` VALUES (979, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:19', '2021-12-17 10:58:19');
INSERT INTO `admin_operation_log` VALUES (980, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"0\",\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\"}', '2021-12-17 10:58:20', '2021-12-17 10:58:20');
INSERT INTO `admin_operation_log` VALUES (981, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"8\",\"pk\":\"4\",\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-17 10:58:29', '2021-12-17 10:58:29');
INSERT INTO `admin_operation_log` VALUES (982, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:30', '2021-12-17 10:58:30');
INSERT INTO `admin_operation_log` VALUES (983, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:31', '2021-12-17 10:58:31');
INSERT INTO `admin_operation_log` VALUES (984, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\",\"3\"]}', '2021-12-17 10:58:35', '2021-12-17 10:58:35');
INSERT INTO `admin_operation_log` VALUES (985, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:36', '2021-12-17 10:58:36');
INSERT INTO `admin_operation_log` VALUES (986, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:37', '2021-12-17 10:58:37');
INSERT INTO `admin_operation_log` VALUES (987, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:58:39', '2021-12-17 10:58:39');
INSERT INTO `admin_operation_log` VALUES (988, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:40', '2021-12-17 10:58:40');
INSERT INTO `admin_operation_log` VALUES (989, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\",\"3\"]}', '2021-12-17 10:58:44', '2021-12-17 10:58:44');
INSERT INTO `admin_operation_log` VALUES (990, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:45', '2021-12-17 10:58:45');
INSERT INTO `admin_operation_log` VALUES (991, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:46', '2021-12-17 10:58:46');
INSERT INTO `admin_operation_log` VALUES (992, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-17 10:58:48', '2021-12-17 10:58:48');
INSERT INTO `admin_operation_log` VALUES (993, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:49', '2021-12-17 10:58:49');
INSERT INTO `admin_operation_log` VALUES (994, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:58:49', '2021-12-17 10:58:49');
INSERT INTO `admin_operation_log` VALUES (995, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 10:59:05', '2021-12-17 10:59:05');
INSERT INTO `admin_operation_log` VALUES (996, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:59:07', '2021-12-17 10:59:07');
INSERT INTO `admin_operation_log` VALUES (997, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"3\"]}', '2021-12-17 10:59:15', '2021-12-17 10:59:15');
INSERT INTO `admin_operation_log` VALUES (998, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 10:59:17', '2021-12-17 10:59:17');
INSERT INTO `admin_operation_log` VALUES (999, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-17 10:59:26', '2021-12-17 10:59:26');
INSERT INTO `admin_operation_log` VALUES (1000, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:00:14', '2021-12-17 11:00:14');
INSERT INTO `admin_operation_log` VALUES (1001, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 11:00:17', '2021-12-17 11:00:17');
INSERT INTO `admin_operation_log` VALUES (1002, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 11:00:21', '2021-12-17 11:00:21');
INSERT INTO `admin_operation_log` VALUES (1003, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-17 11:00:27', '2021-12-17 11:00:27');
INSERT INTO `admin_operation_log` VALUES (1004, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-17 11:00:32', '2021-12-17 11:00:32');
INSERT INTO `admin_operation_log` VALUES (1005, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-17 11:00:35', '2021-12-17 11:00:35');
INSERT INTO `admin_operation_log` VALUES (1006, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:00:43', '2021-12-17 11:00:43');
INSERT INTO `admin_operation_log` VALUES (1007, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:00:45', '2021-12-17 11:00:45');
INSERT INTO `admin_operation_log` VALUES (1008, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:01:28', '2021-12-17 11:01:28');
INSERT INTO `admin_operation_log` VALUES (1009, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:01:31', '2021-12-17 11:01:31');
INSERT INTO `admin_operation_log` VALUES (1010, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:01:32', '2021-12-17 11:01:32');
INSERT INTO `admin_operation_log` VALUES (1011, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:01:33', '2021-12-17 11:01:33');
INSERT INTO `admin_operation_log` VALUES (1012, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:04:56', '2021-12-17 11:04:56');
INSERT INTO `admin_operation_log` VALUES (1013, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:06:31', '2021-12-17 11:06:31');
INSERT INTO `admin_operation_log` VALUES (1014, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:06:34', '2021-12-17 11:06:34');
INSERT INTO `admin_operation_log` VALUES (1015, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:15:45', '2021-12-17 11:15:45');
INSERT INTO `admin_operation_log` VALUES (1016, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:15:53', '2021-12-17 11:15:53');
INSERT INTO `admin_operation_log` VALUES (1017, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:17:14', '2021-12-17 11:17:14');
INSERT INTO `admin_operation_log` VALUES (1018, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:17:16', '2021-12-17 11:17:16');
INSERT INTO `admin_operation_log` VALUES (1019, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:17:18', '2021-12-17 11:17:18');
INSERT INTO `admin_operation_log` VALUES (1020, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\"}', '2021-12-17 11:17:45', '2021-12-17 11:17:45');
INSERT INTO `admin_operation_log` VALUES (1021, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:17:47', '2021-12-17 11:17:47');
INSERT INTO `admin_operation_log` VALUES (1022, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 11:18:16', '2021-12-17 11:18:16');
INSERT INTO `admin_operation_log` VALUES (1023, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:18:17', '2021-12-17 11:18:17');
INSERT INTO `admin_operation_log` VALUES (1024, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:18:26', '2021-12-17 11:18:26');
INSERT INTO `admin_operation_log` VALUES (1025, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:18:27', '2021-12-17 11:18:27');
INSERT INTO `admin_operation_log` VALUES (1026, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:19:29', '2021-12-17 11:19:29');
INSERT INTO `admin_operation_log` VALUES (1027, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:19:39', '2021-12-17 11:19:39');
INSERT INTO `admin_operation_log` VALUES (1028, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\",\"3\"]}', '2021-12-17 11:19:42', '2021-12-17 11:19:42');
INSERT INTO `admin_operation_log` VALUES (1029, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:21:07', '2021-12-17 11:21:07');
INSERT INTO `admin_operation_log` VALUES (1030, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 11:23:11', '2021-12-17 11:23:11');
INSERT INTO `admin_operation_log` VALUES (1031, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:24:40', '2021-12-17 11:24:40');
INSERT INTO `admin_operation_log` VALUES (1032, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:24:45', '2021-12-17 11:24:45');
INSERT INTO `admin_operation_log` VALUES (1033, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:24:46', '2021-12-17 11:24:46');
INSERT INTO `admin_operation_log` VALUES (1034, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-17 11:24:48', '2021-12-17 11:24:48');
INSERT INTO `admin_operation_log` VALUES (1035, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:24:49', '2021-12-17 11:24:49');
INSERT INTO `admin_operation_log` VALUES (1036, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:24:51', '2021-12-17 11:24:51');
INSERT INTO `admin_operation_log` VALUES (1037, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-17 11:24:52', '2021-12-17 11:24:52');
INSERT INTO `admin_operation_log` VALUES (1038, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:25:06', '2021-12-17 11:25:06');
INSERT INTO `admin_operation_log` VALUES (1039, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:25:44', '2021-12-17 11:25:44');
INSERT INTO `admin_operation_log` VALUES (1040, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 11:25:46', '2021-12-17 11:25:46');
INSERT INTO `admin_operation_log` VALUES (1041, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-17 11:25:47', '2021-12-17 11:25:47');
INSERT INTO `admin_operation_log` VALUES (1042, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 11:25:50', '2021-12-17 11:25:50');
INSERT INTO `admin_operation_log` VALUES (1043, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-17 11:25:52', '2021-12-17 11:25:52');
INSERT INTO `admin_operation_log` VALUES (1044, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 11:25:54', '2021-12-17 11:25:54');
INSERT INTO `admin_operation_log` VALUES (1045, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-17 11:25:55', '2021-12-17 11:25:55');
INSERT INTO `admin_operation_log` VALUES (1046, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:19', '2021-12-17 11:28:19');
INSERT INTO `admin_operation_log` VALUES (1047, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:20', '2021-12-17 11:28:20');
INSERT INTO `admin_operation_log` VALUES (1048, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:36', '2021-12-17 11:28:36');
INSERT INTO `admin_operation_log` VALUES (1049, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 11:28:39', '2021-12-17 11:28:39');
INSERT INTO `admin_operation_log` VALUES (1050, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:44', '2021-12-17 11:28:44');
INSERT INTO `admin_operation_log` VALUES (1051, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:45', '2021-12-17 11:28:45');
INSERT INTO `admin_operation_log` VALUES (1052, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:46', '2021-12-17 11:28:46');
INSERT INTO `admin_operation_log` VALUES (1053, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:56', '2021-12-17 11:28:56');
INSERT INTO `admin_operation_log` VALUES (1054, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:28:57', '2021-12-17 11:28:57');
INSERT INTO `admin_operation_log` VALUES (1055, 1, 'admin/devices/5', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"2\"]}', '2021-12-17 11:28:59', '2021-12-17 11:28:59');
INSERT INTO `admin_operation_log` VALUES (1056, 1, 'admin/devices/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-17 11:29:07', '2021-12-17 11:29:07');
INSERT INTO `admin_operation_log` VALUES (1057, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:29:09', '2021-12-17 11:29:09');
INSERT INTO `admin_operation_log` VALUES (1058, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:29:10', '2021-12-17 11:29:10');
INSERT INTO `admin_operation_log` VALUES (1059, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:34:33', '2021-12-17 11:34:33');
INSERT INTO `admin_operation_log` VALUES (1060, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:34:53', '2021-12-17 11:34:53');
INSERT INTO `admin_operation_log` VALUES (1061, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:35:03', '2021-12-17 11:35:03');
INSERT INTO `admin_operation_log` VALUES (1062, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:35:05', '2021-12-17 11:35:05');
INSERT INTO `admin_operation_log` VALUES (1063, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2021-12-17 11:35:06', '2021-12-17 11:35:06');
INSERT INTO `admin_operation_log` VALUES (1064, 1, 'admin/accounts/2', 'PUT', '127.0.0.1', '{\"_token\":\"5OnovgMkrsuzAoYeyuq8UeM2CqqwuFiJGSjCGTa4\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2021-12-17 11:35:08', '2021-12-17 11:35:08');
INSERT INTO `admin_operation_log` VALUES (1065, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:35:10', '2021-12-17 11:35:10');
INSERT INTO `admin_operation_log` VALUES (1066, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 11:35:11', '2021-12-17 11:35:11');
INSERT INTO `admin_operation_log` VALUES (1067, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:37:17', '2021-12-17 11:37:17');
INSERT INTO `admin_operation_log` VALUES (1068, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:37:29', '2021-12-17 11:37:29');
INSERT INTO `admin_operation_log` VALUES (1069, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:38:05', '2021-12-17 11:38:05');
INSERT INTO `admin_operation_log` VALUES (1070, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:38:34', '2021-12-17 11:38:34');
INSERT INTO `admin_operation_log` VALUES (1071, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:38:46', '2021-12-17 11:38:46');
INSERT INTO `admin_operation_log` VALUES (1072, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:40:53', '2021-12-17 11:40:53');
INSERT INTO `admin_operation_log` VALUES (1073, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:41:43', '2021-12-17 11:41:43');
INSERT INTO `admin_operation_log` VALUES (1074, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:41:58', '2021-12-17 11:41:58');
INSERT INTO `admin_operation_log` VALUES (1075, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:43:42', '2021-12-17 11:43:42');
INSERT INTO `admin_operation_log` VALUES (1076, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:43:59', '2021-12-17 11:43:59');
INSERT INTO `admin_operation_log` VALUES (1077, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:44:12', '2021-12-17 11:44:12');
INSERT INTO `admin_operation_log` VALUES (1078, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:46:00', '2021-12-17 11:46:00');
INSERT INTO `admin_operation_log` VALUES (1079, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:52:39', '2021-12-17 11:52:39');
INSERT INTO `admin_operation_log` VALUES (1080, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:58:25', '2021-12-17 11:58:25');
INSERT INTO `admin_operation_log` VALUES (1081, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 11:59:43', '2021-12-17 11:59:43');
INSERT INTO `admin_operation_log` VALUES (1082, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-17 11:59:51', '2021-12-17 11:59:51');
INSERT INTO `admin_operation_log` VALUES (1083, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:00:30', '2021-12-17 12:00:30');
INSERT INTO `admin_operation_log` VALUES (1084, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:01:13', '2021-12-17 12:01:13');
INSERT INTO `admin_operation_log` VALUES (1085, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:01:32', '2021-12-17 12:01:32');
INSERT INTO `admin_operation_log` VALUES (1086, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:02:50', '2021-12-17 12:02:50');
INSERT INTO `admin_operation_log` VALUES (1087, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:02:57', '2021-12-17 12:02:57');
INSERT INTO `admin_operation_log` VALUES (1088, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:03:11', '2021-12-17 12:03:11');
INSERT INTO `admin_operation_log` VALUES (1089, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:03:15', '2021-12-17 12:03:15');
INSERT INTO `admin_operation_log` VALUES (1090, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:03:24', '2021-12-17 12:03:24');
INSERT INTO `admin_operation_log` VALUES (1091, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 12:03:27', '2021-12-17 12:03:27');
INSERT INTO `admin_operation_log` VALUES (1092, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:38:42', '2021-12-17 13:38:42');
INSERT INTO `admin_operation_log` VALUES (1093, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:56:20', '2021-12-17 13:56:20');
INSERT INTO `admin_operation_log` VALUES (1094, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:57:03', '2021-12-17 13:57:03');
INSERT INTO `admin_operation_log` VALUES (1095, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:57:10', '2021-12-17 13:57:10');
INSERT INTO `admin_operation_log` VALUES (1096, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:57:31', '2021-12-17 13:57:31');
INSERT INTO `admin_operation_log` VALUES (1097, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:57:51', '2021-12-17 13:57:51');
INSERT INTO `admin_operation_log` VALUES (1098, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:01', '2021-12-17 13:58:01');
INSERT INTO `admin_operation_log` VALUES (1099, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:10', '2021-12-17 13:58:10');
INSERT INTO `admin_operation_log` VALUES (1100, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:30', '2021-12-17 13:58:30');
INSERT INTO `admin_operation_log` VALUES (1101, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:35', '2021-12-17 13:58:35');
INSERT INTO `admin_operation_log` VALUES (1102, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:40', '2021-12-17 13:58:40');
INSERT INTO `admin_operation_log` VALUES (1103, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:44', '2021-12-17 13:58:44');
INSERT INTO `admin_operation_log` VALUES (1104, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:58:54', '2021-12-17 13:58:54');
INSERT INTO `admin_operation_log` VALUES (1105, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:59:00', '2021-12-17 13:59:00');
INSERT INTO `admin_operation_log` VALUES (1106, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:59:10', '2021-12-17 13:59:10');
INSERT INTO `admin_operation_log` VALUES (1107, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 13:59:25', '2021-12-17 13:59:25');
INSERT INTO `admin_operation_log` VALUES (1108, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 14:00:04', '2021-12-17 14:00:04');
INSERT INTO `admin_operation_log` VALUES (1109, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:33:24', '2021-12-17 17:33:24');
INSERT INTO `admin_operation_log` VALUES (1110, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:34:29', '2021-12-17 17:34:29');
INSERT INTO `admin_operation_log` VALUES (1111, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:35:08', '2021-12-17 17:35:08');
INSERT INTO `admin_operation_log` VALUES (1112, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:36:02', '2021-12-17 17:36:02');
INSERT INTO `admin_operation_log` VALUES (1113, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:36:26', '2021-12-17 17:36:26');
INSERT INTO `admin_operation_log` VALUES (1114, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:36:54', '2021-12-17 17:36:54');
INSERT INTO `admin_operation_log` VALUES (1115, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:37:27', '2021-12-17 17:37:27');
INSERT INTO `admin_operation_log` VALUES (1116, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:37:49', '2021-12-17 17:37:49');
INSERT INTO `admin_operation_log` VALUES (1117, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:37:58', '2021-12-17 17:37:58');
INSERT INTO `admin_operation_log` VALUES (1118, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:38:56', '2021-12-17 17:38:56');
INSERT INTO `admin_operation_log` VALUES (1119, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:39:08', '2021-12-17 17:39:08');
INSERT INTO `admin_operation_log` VALUES (1120, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:39:41', '2021-12-17 17:39:41');
INSERT INTO `admin_operation_log` VALUES (1121, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:39:48', '2021-12-17 17:39:48');
INSERT INTO `admin_operation_log` VALUES (1122, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:39:53', '2021-12-17 17:39:53');
INSERT INTO `admin_operation_log` VALUES (1123, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:40:44', '2021-12-17 17:40:44');
INSERT INTO `admin_operation_log` VALUES (1124, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:41:44', '2021-12-17 17:41:44');
INSERT INTO `admin_operation_log` VALUES (1125, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"ewrwer\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 17:41:54', '2021-12-17 17:41:54');
INSERT INTO `admin_operation_log` VALUES (1126, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:41:54', '2021-12-17 17:41:54');
INSERT INTO `admin_operation_log` VALUES (1127, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:41:56', '2021-12-17 17:41:56');
INSERT INTO `admin_operation_log` VALUES (1128, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:42:34', '2021-12-17 17:42:34');
INSERT INTO `admin_operation_log` VALUES (1129, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 17:43:25', '2021-12-17 17:43:25');
INSERT INTO `admin_operation_log` VALUES (1130, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:43:25', '2021-12-17 17:43:25');
INSERT INTO `admin_operation_log` VALUES (1131, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 17:45:51', '2021-12-17 17:45:51');
INSERT INTO `admin_operation_log` VALUES (1132, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 17:46:41', '2021-12-17 17:46:41');
INSERT INTO `admin_operation_log` VALUES (1133, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:46:57', '2021-12-17 17:46:57');
INSERT INTO `admin_operation_log` VALUES (1134, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:46:58', '2021-12-17 17:46:58');
INSERT INTO `admin_operation_log` VALUES (1135, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u591a\\u7c73\\u5546\\u57ce\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:47:05', '2021-12-17 17:47:05');
INSERT INTO `admin_operation_log` VALUES (1136, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:49:06', '2021-12-17 17:49:06');
INSERT INTO `admin_operation_log` VALUES (1137, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:49:07', '2021-12-17 17:49:07');
INSERT INTO `admin_operation_log` VALUES (1138, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:49:23', '2021-12-17 17:49:23');
INSERT INTO `admin_operation_log` VALUES (1139, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:49:23', '2021-12-17 17:49:23');
INSERT INTO `admin_operation_log` VALUES (1140, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 17:49:49', '2021-12-17 17:49:49');
INSERT INTO `admin_operation_log` VALUES (1141, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:50:42', '2021-12-17 17:50:42');
INSERT INTO `admin_operation_log` VALUES (1142, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:50:43', '2021-12-17 17:50:43');
INSERT INTO `admin_operation_log` VALUES (1143, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:50:50', '2021-12-17 17:50:50');
INSERT INTO `admin_operation_log` VALUES (1144, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:52:21', '2021-12-17 17:52:21');
INSERT INTO `admin_operation_log` VALUES (1145, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:52:22', '2021-12-17 17:52:22');
INSERT INTO `admin_operation_log` VALUES (1146, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:52:28', '2021-12-17 17:52:28');
INSERT INTO `admin_operation_log` VALUES (1147, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:53:36', '2021-12-17 17:53:36');
INSERT INTO `admin_operation_log` VALUES (1148, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:53:38', '2021-12-17 17:53:38');
INSERT INTO `admin_operation_log` VALUES (1149, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:53:44', '2021-12-17 17:53:44');
INSERT INTO `admin_operation_log` VALUES (1150, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:54:26', '2021-12-17 17:54:26');
INSERT INTO `admin_operation_log` VALUES (1151, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:54:26', '2021-12-17 17:54:26');
INSERT INTO `admin_operation_log` VALUES (1152, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:54:39', '2021-12-17 17:54:39');
INSERT INTO `admin_operation_log` VALUES (1153, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:55:00', '2021-12-17 17:55:00');
INSERT INTO `admin_operation_log` VALUES (1154, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:55:00', '2021-12-17 17:55:00');
INSERT INTO `admin_operation_log` VALUES (1155, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:55:20', '2021-12-17 17:55:20');
INSERT INTO `admin_operation_log` VALUES (1156, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:57:06', '2021-12-17 17:57:06');
INSERT INTO `admin_operation_log` VALUES (1157, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:57:07', '2021-12-17 17:57:07');
INSERT INTO `admin_operation_log` VALUES (1158, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:57:24', '2021-12-17 17:57:24');
INSERT INTO `admin_operation_log` VALUES (1159, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 17:57:52', '2021-12-17 17:57:52');
INSERT INTO `admin_operation_log` VALUES (1160, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 17:57:54', '2021-12-17 17:57:54');
INSERT INTO `admin_operation_log` VALUES (1161, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 17:58:13', '2021-12-17 17:58:13');
INSERT INTO `admin_operation_log` VALUES (1162, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 17:58:13', '2021-12-17 17:58:13');
INSERT INTO `admin_operation_log` VALUES (1163, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 18:00:34', '2021-12-17 18:00:34');
INSERT INTO `admin_operation_log` VALUES (1164, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 18:00:43', '2021-12-17 18:00:43');
INSERT INTO `admin_operation_log` VALUES (1165, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 18:01:07', '2021-12-17 18:01:07');
INSERT INTO `admin_operation_log` VALUES (1166, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 18:01:08', '2021-12-17 18:01:08');
INSERT INTO `admin_operation_log` VALUES (1167, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 18:01:16', '2021-12-17 18:01:16');
INSERT INTO `admin_operation_log` VALUES (1168, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 18:01:17', '2021-12-17 18:01:17');
INSERT INTO `admin_operation_log` VALUES (1169, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",\"3\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 18:01:30', '2021-12-17 18:01:30');
INSERT INTO `admin_operation_log` VALUES (1170, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:24:50', '2021-12-17 19:24:50');
INSERT INTO `admin_operation_log` VALUES (1171, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:24:51', '2021-12-17 19:24:51');
INSERT INTO `admin_operation_log` VALUES (1172, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:24:57', '2021-12-17 19:24:57');
INSERT INTO `admin_operation_log` VALUES (1173, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:25:11', '2021-12-17 19:25:11');
INSERT INTO `admin_operation_log` VALUES (1174, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:25:12', '2021-12-17 19:25:12');
INSERT INTO `admin_operation_log` VALUES (1175, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"4\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:25:18', '2021-12-17 19:25:18');
INSERT INTO `admin_operation_log` VALUES (1176, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:26:18', '2021-12-17 19:26:18');
INSERT INTO `admin_operation_log` VALUES (1177, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:26:20', '2021-12-17 19:26:20');
INSERT INTO `admin_operation_log` VALUES (1178, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:26:27', '2021-12-17 19:26:27');
INSERT INTO `admin_operation_log` VALUES (1179, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:29:20', '2021-12-17 19:29:20');
INSERT INTO `admin_operation_log` VALUES (1180, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:29:21', '2021-12-17 19:29:21');
INSERT INTO `admin_operation_log` VALUES (1181, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:29:28', '2021-12-17 19:29:28');
INSERT INTO `admin_operation_log` VALUES (1182, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:29:28', '2021-12-17 19:29:28');
INSERT INTO `admin_operation_log` VALUES (1183, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:29:58', '2021-12-17 19:29:58');
INSERT INTO `admin_operation_log` VALUES (1184, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:30:07', '2021-12-17 19:30:07');
INSERT INTO `admin_operation_log` VALUES (1185, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:30:07', '2021-12-17 19:30:07');
INSERT INTO `admin_operation_log` VALUES (1186, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 19:31:39', '2021-12-17 19:31:39');
INSERT INTO `admin_operation_log` VALUES (1187, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:32:12', '2021-12-17 19:32:12');
INSERT INTO `admin_operation_log` VALUES (1188, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:32:13', '2021-12-17 19:32:13');
INSERT INTO `admin_operation_log` VALUES (1189, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:32:18', '2021-12-17 19:32:18');
INSERT INTO `admin_operation_log` VALUES (1190, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:32:18', '2021-12-17 19:32:18');
INSERT INTO `admin_operation_log` VALUES (1191, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:32:54', '2021-12-17 19:32:54');
INSERT INTO `admin_operation_log` VALUES (1192, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:33:00', '2021-12-17 19:33:00');
INSERT INTO `admin_operation_log` VALUES (1193, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:33:00', '2021-12-17 19:33:00');
INSERT INTO `admin_operation_log` VALUES (1194, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 19:34:23', '2021-12-17 19:34:23');
INSERT INTO `admin_operation_log` VALUES (1195, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:34:36', '2021-12-17 19:34:36');
INSERT INTO `admin_operation_log` VALUES (1196, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 19:34:43', '2021-12-17 19:34:43');
INSERT INTO `admin_operation_log` VALUES (1197, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:35:03', '2021-12-17 19:35:03');
INSERT INTO `admin_operation_log` VALUES (1198, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:35:04', '2021-12-17 19:35:04');
INSERT INTO `admin_operation_log` VALUES (1199, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:35:09', '2021-12-17 19:35:09');
INSERT INTO `admin_operation_log` VALUES (1200, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:36:55', '2021-12-17 19:36:55');
INSERT INTO `admin_operation_log` VALUES (1201, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:36:57', '2021-12-17 19:36:57');
INSERT INTO `admin_operation_log` VALUES (1202, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"0\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"2\",null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:37:04', '2021-12-17 19:37:04');
INSERT INTO `admin_operation_log` VALUES (1203, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:37:04', '2021-12-17 19:37:04');
INSERT INTO `admin_operation_log` VALUES (1204, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:37:20', '2021-12-17 19:37:20');
INSERT INTO `admin_operation_log` VALUES (1205, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:37:24', '2021-12-17 19:37:24');
INSERT INTO `admin_operation_log` VALUES (1206, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-17 19:37:24', '2021-12-17 19:37:24');
INSERT INTO `admin_operation_log` VALUES (1207, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\"}', '2021-12-17 19:37:55', '2021-12-17 19:37:55');
INSERT INTO `admin_operation_log` VALUES (1208, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:37:55', '2021-12-17 19:37:55');
INSERT INTO `admin_operation_log` VALUES (1209, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:38:39', '2021-12-17 19:38:39');
INSERT INTO `admin_operation_log` VALUES (1210, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:38:40', '2021-12-17 19:38:40');
INSERT INTO `admin_operation_log` VALUES (1211, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:38:41', '2021-12-17 19:38:41');
INSERT INTO `admin_operation_log` VALUES (1212, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"device_id\":[\"1\",null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:38:46', '2021-12-17 19:38:46');
INSERT INTO `admin_operation_log` VALUES (1213, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:38:46', '2021-12-17 19:38:46');
INSERT INTO `admin_operation_log` VALUES (1214, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:38:49', '2021-12-17 19:38:49');
INSERT INTO `admin_operation_log` VALUES (1215, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:38:59', '2021-12-17 19:38:59');
INSERT INTO `admin_operation_log` VALUES (1216, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[\"1\",null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:39:01', '2021-12-17 19:39:01');
INSERT INTO `admin_operation_log` VALUES (1217, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:39:01', '2021-12-17 19:39:01');
INSERT INTO `admin_operation_log` VALUES (1218, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:40:45', '2021-12-17 19:40:45');
INSERT INTO `admin_operation_log` VALUES (1219, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"1\",null],\"ag\":[\"1\",null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:40:51', '2021-12-17 19:40:51');
INSERT INTO `admin_operation_log` VALUES (1220, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:40:51', '2021-12-17 19:40:51');
INSERT INTO `admin_operation_log` VALUES (1221, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:42:02', '2021-12-17 19:42:02');
INSERT INTO `admin_operation_log` VALUES (1222, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:42:19', '2021-12-17 19:42:19');
INSERT INTO `admin_operation_log` VALUES (1223, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:42:24', '2021-12-17 19:42:24');
INSERT INTO `admin_operation_log` VALUES (1224, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":null,\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"1\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:42:30', '2021-12-17 19:42:30');
INSERT INTO `admin_operation_log` VALUES (1225, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:42:30', '2021-12-17 19:42:30');
INSERT INTO `admin_operation_log` VALUES (1226, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"account_id\":[\"1\",\"2\"]}', '2021-12-17 19:42:35', '2021-12-17 19:42:35');
INSERT INTO `admin_operation_log` VALUES (1227, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"account_id\":[\"1\"]}', '2021-12-17 19:42:37', '2021-12-17 19:42:37');
INSERT INTO `admin_operation_log` VALUES (1228, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:43:04', '2021-12-17 19:43:04');
INSERT INTO `admin_operation_log` VALUES (1229, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:43:05', '2021-12-17 19:43:05');
INSERT INTO `admin_operation_log` VALUES (1230, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:43:26', '2021-12-17 19:43:26');
INSERT INTO `admin_operation_log` VALUES (1231, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:44:11', '2021-12-17 19:44:11');
INSERT INTO `admin_operation_log` VALUES (1232, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:46:06', '2021-12-17 19:46:06');
INSERT INTO `admin_operation_log` VALUES (1233, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:46:21', '2021-12-17 19:46:21');
INSERT INTO `admin_operation_log` VALUES (1234, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:46:23', '2021-12-17 19:46:23');
INSERT INTO `admin_operation_log` VALUES (1235, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:46:38', '2021-12-17 19:46:38');
INSERT INTO `admin_operation_log` VALUES (1236, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:46:59', '2021-12-17 19:46:59');
INSERT INTO `admin_operation_log` VALUES (1237, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[\"1\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:47:04', '2021-12-17 19:47:04');
INSERT INTO `admin_operation_log` VALUES (1238, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:47:04', '2021-12-17 19:47:04');
INSERT INTO `admin_operation_log` VALUES (1239, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:47:25', '2021-12-17 19:47:25');
INSERT INTO `admin_operation_log` VALUES (1240, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:47:42', '2021-12-17 19:47:42');
INSERT INTO `admin_operation_log` VALUES (1241, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:48:17', '2021-12-17 19:48:17');
INSERT INTO `admin_operation_log` VALUES (1242, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"starttime\",\"value\":\"2021-12-17 00:00:05\",\"pk\":\"1\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-12-17 19:48:26', '2021-12-17 19:48:26');
INSERT INTO `admin_operation_log` VALUES (1243, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:48:27', '2021-12-17 19:48:27');
INSERT INTO `admin_operation_log` VALUES (1244, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:49:29', '2021-12-17 19:49:29');
INSERT INTO `admin_operation_log` VALUES (1245, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:49:32', '2021-12-17 19:49:32');
INSERT INTO `admin_operation_log` VALUES (1246, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:49:33', '2021-12-17 19:49:33');
INSERT INTO `admin_operation_log` VALUES (1247, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"asc\"}}', '2021-12-17 19:50:46', '2021-12-17 19:50:46');
INSERT INTO `admin_operation_log` VALUES (1248, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"0\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:50:47', '2021-12-17 19:50:47');
INSERT INTO `admin_operation_log` VALUES (1249, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"asc\"}}', '2021-12-17 19:50:48', '2021-12-17 19:50:48');
INSERT INTO `admin_operation_log` VALUES (1250, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"asc\"}}', '2021-12-17 19:50:49', '2021-12-17 19:50:49');
INSERT INTO `admin_operation_log` VALUES (1251, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"1\",\"2\",\"4\",\"5\"]}', '2021-12-17 19:51:14', '2021-12-17 19:51:14');
INSERT INTO `admin_operation_log` VALUES (1252, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"starttime\",\"type\":\"asc\"}}', '2021-12-17 19:51:15', '2021-12-17 19:51:15');
INSERT INTO `admin_operation_log` VALUES (1253, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"account_id\":[\"1\",\"2\"]}', '2021-12-17 19:51:34', '2021-12-17 19:51:34');
INSERT INTO `admin_operation_log` VALUES (1254, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:51:37', '2021-12-17 19:51:37');
INSERT INTO `admin_operation_log` VALUES (1255, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:51:59', '2021-12-17 19:51:59');
INSERT INTO `admin_operation_log` VALUES (1256, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:00', '2021-12-17 19:52:00');
INSERT INTO `admin_operation_log` VALUES (1257, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"off\",\"dg\":[\"1\",null],\"device_id\":[\"1\",\"2\",\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:52:05', '2021-12-17 19:52:05');
INSERT INTO `admin_operation_log` VALUES (1258, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:05', '2021-12-17 19:52:05');
INSERT INTO `admin_operation_log` VALUES (1259, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 19:52:11', '2021-12-17 19:52:11');
INSERT INTO `admin_operation_log` VALUES (1260, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 19:52:12', '2021-12-17 19:52:12');
INSERT INTO `admin_operation_log` VALUES (1261, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:12', '2021-12-17 19:52:12');
INSERT INTO `admin_operation_log` VALUES (1262, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:13', '2021-12-17 19:52:13');
INSERT INTO `admin_operation_log` VALUES (1263, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:48', '2021-12-17 19:52:48');
INSERT INTO `admin_operation_log` VALUES (1264, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\"}', '2021-12-17 19:52:52', '2021-12-17 19:52:52');
INSERT INTO `admin_operation_log` VALUES (1265, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:53', '2021-12-17 19:52:53');
INSERT INTO `admin_operation_log` VALUES (1266, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"5\"]}', '2021-12-17 19:52:57', '2021-12-17 19:52:57');
INSERT INTO `admin_operation_log` VALUES (1267, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:58', '2021-12-17 19:52:58');
INSERT INTO `admin_operation_log` VALUES (1268, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:52:59', '2021-12-17 19:52:59');
INSERT INTO `admin_operation_log` VALUES (1269, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"account_id\":[\"2\"]}', '2021-12-17 19:53:01', '2021-12-17 19:53:01');
INSERT INTO `admin_operation_log` VALUES (1270, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:02', '2021-12-17 19:53:02');
INSERT INTO `admin_operation_log` VALUES (1271, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:03', '2021-12-17 19:53:03');
INSERT INTO `admin_operation_log` VALUES (1272, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:53:04', '2021-12-17 19:53:04');
INSERT INTO `admin_operation_log` VALUES (1273, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[null],\"ag\":[\"1\",null],\"account_id\":[\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:53:15', '2021-12-17 19:53:15');
INSERT INTO `admin_operation_log` VALUES (1274, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:15', '2021-12-17 19:53:15');
INSERT INTO `admin_operation_log` VALUES (1275, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:16', '2021-12-17 19:53:16');
INSERT INTO `admin_operation_log` VALUES (1276, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:53:23', '2021-12-17 19:53:23');
INSERT INTO `admin_operation_log` VALUES (1277, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"off\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:53:32', '2021-12-17 19:53:32');
INSERT INTO `admin_operation_log` VALUES (1278, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:32', '2021-12-17 19:53:32');
INSERT INTO `admin_operation_log` VALUES (1279, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:53:35', '2021-12-17 19:53:35');
INSERT INTO `admin_operation_log` VALUES (1280, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:35', '2021-12-17 19:53:35');
INSERT INTO `admin_operation_log` VALUES (1281, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:36', '2021-12-17 19:53:36');
INSERT INTO `admin_operation_log` VALUES (1282, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:53:39', '2021-12-17 19:53:39');
INSERT INTO `admin_operation_log` VALUES (1283, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:53:46', '2021-12-17 19:53:46');
INSERT INTO `admin_operation_log` VALUES (1284, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:47', '2021-12-17 19:53:47');
INSERT INTO `admin_operation_log` VALUES (1285, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:48', '2021-12-17 19:53:48');
INSERT INTO `admin_operation_log` VALUES (1286, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:53:52', '2021-12-17 19:53:52');
INSERT INTO `admin_operation_log` VALUES (1287, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":null,\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 19:53:58', '2021-12-17 19:53:58');
INSERT INTO `admin_operation_log` VALUES (1288, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:53:59', '2021-12-17 19:53:59');
INSERT INTO `admin_operation_log` VALUES (1289, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:54:00', '2021-12-17 19:54:00');
INSERT INTO `admin_operation_log` VALUES (1290, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"1\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 19:54:02', '2021-12-17 19:54:02');
INSERT INTO `admin_operation_log` VALUES (1291, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 19:54:03', '2021-12-17 19:54:03');
INSERT INTO `admin_operation_log` VALUES (1292, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-12-17 19:54:41', '2021-12-17 19:54:41');
INSERT INTO `admin_operation_log` VALUES (1293, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:58:18', '2021-12-17 19:58:18');
INSERT INTO `admin_operation_log` VALUES (1294, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:58:28', '2021-12-17 19:58:28');
INSERT INTO `admin_operation_log` VALUES (1295, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:58:42', '2021-12-17 19:58:42');
INSERT INTO `admin_operation_log` VALUES (1296, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:58:59', '2021-12-17 19:58:59');
INSERT INTO `admin_operation_log` VALUES (1297, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:04', '2021-12-17 19:59:04');
INSERT INTO `admin_operation_log` VALUES (1298, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:07', '2021-12-17 19:59:07');
INSERT INTO `admin_operation_log` VALUES (1299, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:10', '2021-12-17 19:59:10');
INSERT INTO `admin_operation_log` VALUES (1300, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:14', '2021-12-17 19:59:14');
INSERT INTO `admin_operation_log` VALUES (1301, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:18', '2021-12-17 19:59:18');
INSERT INTO `admin_operation_log` VALUES (1302, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 19:59:23', '2021-12-17 19:59:23');
INSERT INTO `admin_operation_log` VALUES (1303, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:01:45', '2021-12-17 20:01:45');
INSERT INTO `admin_operation_log` VALUES (1304, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:09', '2021-12-17 20:02:09');
INSERT INTO `admin_operation_log` VALUES (1305, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:14', '2021-12-17 20:02:14');
INSERT INTO `admin_operation_log` VALUES (1306, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:19', '2021-12-17 20:02:19');
INSERT INTO `admin_operation_log` VALUES (1307, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:30', '2021-12-17 20:02:30');
INSERT INTO `admin_operation_log` VALUES (1308, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:33', '2021-12-17 20:02:33');
INSERT INTO `admin_operation_log` VALUES (1309, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:36', '2021-12-17 20:02:36');
INSERT INTO `admin_operation_log` VALUES (1310, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:02:40', '2021-12-17 20:02:40');
INSERT INTO `admin_operation_log` VALUES (1311, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:03:37', '2021-12-17 20:03:37');
INSERT INTO `admin_operation_log` VALUES (1312, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:03:37', '2021-12-17 20:03:37');
INSERT INTO `admin_operation_log` VALUES (1313, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:04:12', '2021-12-17 20:04:12');
INSERT INTO `admin_operation_log` VALUES (1314, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:05:10', '2021-12-17 20:05:10');
INSERT INTO `admin_operation_log` VALUES (1315, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"0\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:05:11', '2021-12-17 20:05:11');
INSERT INTO `admin_operation_log` VALUES (1316, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"quality\",\"type\":\"desc\"}}', '2021-12-17 20:11:02', '2021-12-17 20:11:02');
INSERT INTO `admin_operation_log` VALUES (1317, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:14:29', '2021-12-17 20:14:29');
INSERT INTO `admin_operation_log` VALUES (1318, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:14:34', '2021-12-17 20:14:34');
INSERT INTO `admin_operation_log` VALUES (1319, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:14:55', '2021-12-17 20:14:55');
INSERT INTO `admin_operation_log` VALUES (1320, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:15:01', '2021-12-17 20:15:01');
INSERT INTO `admin_operation_log` VALUES (1321, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:15:06', '2021-12-17 20:15:06');
INSERT INTO `admin_operation_log` VALUES (1322, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:16:39', '2021-12-17 20:16:39');
INSERT INTO `admin_operation_log` VALUES (1323, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:16:42', '2021-12-17 20:16:42');
INSERT INTO `admin_operation_log` VALUES (1324, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:16:42', '2021-12-17 20:16:42');
INSERT INTO `admin_operation_log` VALUES (1325, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:16:45', '2021-12-17 20:16:45');
INSERT INTO `admin_operation_log` VALUES (1326, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:16:50', '2021-12-17 20:16:50');
INSERT INTO `admin_operation_log` VALUES (1327, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:16:56', '2021-12-17 20:16:56');
INSERT INTO `admin_operation_log` VALUES (1328, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:17:04', '2021-12-17 20:17:04');
INSERT INTO `admin_operation_log` VALUES (1329, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:17:07', '2021-12-17 20:17:07');
INSERT INTO `admin_operation_log` VALUES (1330, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:17:28', '2021-12-17 20:17:28');
INSERT INTO `admin_operation_log` VALUES (1331, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:17:59', '2021-12-17 20:17:59');
INSERT INTO `admin_operation_log` VALUES (1332, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:18:47', '2021-12-17 20:18:47');
INSERT INTO `admin_operation_log` VALUES (1333, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:19:11', '2021-12-17 20:19:11');
INSERT INTO `admin_operation_log` VALUES (1334, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:19:18', '2021-12-17 20:19:18');
INSERT INTO `admin_operation_log` VALUES (1335, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:19:20', '2021-12-17 20:19:20');
INSERT INTO `admin_operation_log` VALUES (1336, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:19:22', '2021-12-17 20:19:22');
INSERT INTO `admin_operation_log` VALUES (1337, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:19:23', '2021-12-17 20:19:23');
INSERT INTO `admin_operation_log` VALUES (1338, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:21:42', '2021-12-17 20:21:42');
INSERT INTO `admin_operation_log` VALUES (1339, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:21:44', '2021-12-17 20:21:44');
INSERT INTO `admin_operation_log` VALUES (1340, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:21:57', '2021-12-17 20:21:57');
INSERT INTO `admin_operation_log` VALUES (1341, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:22:01', '2021-12-17 20:22:01');
INSERT INTO `admin_operation_log` VALUES (1342, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:22:01', '2021-12-17 20:22:01');
INSERT INTO `admin_operation_log` VALUES (1343, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:22:07', '2021-12-17 20:22:07');
INSERT INTO `admin_operation_log` VALUES (1344, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:29:04', '2021-12-17 20:29:04');
INSERT INTO `admin_operation_log` VALUES (1345, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:29:15', '2021-12-17 20:29:15');
INSERT INTO `admin_operation_log` VALUES (1346, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:29:30', '2021-12-17 20:29:30');
INSERT INTO `admin_operation_log` VALUES (1347, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:29:41', '2021-12-17 20:29:41');
INSERT INTO `admin_operation_log` VALUES (1348, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:31:57', '2021-12-17 20:31:57');
INSERT INTO `admin_operation_log` VALUES (1349, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:32:36', '2021-12-17 20:32:36');
INSERT INTO `admin_operation_log` VALUES (1350, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:33:17', '2021-12-17 20:33:17');
INSERT INTO `admin_operation_log` VALUES (1351, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:33:20', '2021-12-17 20:33:20');
INSERT INTO `admin_operation_log` VALUES (1352, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:33:20', '2021-12-17 20:33:20');
INSERT INTO `admin_operation_log` VALUES (1353, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:33:22', '2021-12-17 20:33:22');
INSERT INTO `admin_operation_log` VALUES (1354, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:33:44', '2021-12-17 20:33:44');
INSERT INTO `admin_operation_log` VALUES (1355, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:34:24', '2021-12-17 20:34:24');
INSERT INTO `admin_operation_log` VALUES (1356, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:34:29', '2021-12-17 20:34:29');
INSERT INTO `admin_operation_log` VALUES (1357, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:34:38', '2021-12-17 20:34:38');
INSERT INTO `admin_operation_log` VALUES (1358, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:34:45', '2021-12-17 20:34:45');
INSERT INTO `admin_operation_log` VALUES (1359, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:35:04', '2021-12-17 20:35:04');
INSERT INTO `admin_operation_log` VALUES (1360, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:36:37', '2021-12-17 20:36:37');
INSERT INTO `admin_operation_log` VALUES (1361, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:36:47', '2021-12-17 20:36:47');
INSERT INTO `admin_operation_log` VALUES (1362, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:04', '2021-12-17 20:37:04');
INSERT INTO `admin_operation_log` VALUES (1363, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:12', '2021-12-17 20:37:12');
INSERT INTO `admin_operation_log` VALUES (1364, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:23', '2021-12-17 20:37:23');
INSERT INTO `admin_operation_log` VALUES (1365, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:27', '2021-12-17 20:37:27');
INSERT INTO `admin_operation_log` VALUES (1366, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:29', '2021-12-17 20:37:29');
INSERT INTO `admin_operation_log` VALUES (1367, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:38', '2021-12-17 20:37:38');
INSERT INTO `admin_operation_log` VALUES (1368, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:41', '2021-12-17 20:37:41');
INSERT INTO `admin_operation_log` VALUES (1369, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:45', '2021-12-17 20:37:45');
INSERT INTO `admin_operation_log` VALUES (1370, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:37:47', '2021-12-17 20:37:47');
INSERT INTO `admin_operation_log` VALUES (1371, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:37:49', '2021-12-17 20:37:49');
INSERT INTO `admin_operation_log` VALUES (1372, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:37:57', '2021-12-17 20:37:57');
INSERT INTO `admin_operation_log` VALUES (1373, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:37:57', '2021-12-17 20:37:57');
INSERT INTO `admin_operation_log` VALUES (1374, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:37:59', '2021-12-17 20:37:59');
INSERT INTO `admin_operation_log` VALUES (1375, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:38:14', '2021-12-17 20:38:14');
INSERT INTO `admin_operation_log` VALUES (1376, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:38:17', '2021-12-17 20:38:17');
INSERT INTO `admin_operation_log` VALUES (1377, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:38:17', '2021-12-17 20:38:17');
INSERT INTO `admin_operation_log` VALUES (1378, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:38:19', '2021-12-17 20:38:19');
INSERT INTO `admin_operation_log` VALUES (1379, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:38:32', '2021-12-17 20:38:32');
INSERT INTO `admin_operation_log` VALUES (1380, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111212\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:38:38', '2021-12-17 20:38:38');
INSERT INTO `admin_operation_log` VALUES (1381, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:38:38', '2021-12-17 20:38:38');
INSERT INTO `admin_operation_log` VALUES (1382, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:38:42', '2021-12-17 20:38:42');
INSERT INTO `admin_operation_log` VALUES (1383, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111222\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:39:35', '2021-12-17 20:39:35');
INSERT INTO `admin_operation_log` VALUES (1384, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:01', '2021-12-17 20:40:01');
INSERT INTO `admin_operation_log` VALUES (1385, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:06', '2021-12-17 20:40:06');
INSERT INTO `admin_operation_log` VALUES (1386, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:40:07', '2021-12-17 20:40:07');
INSERT INTO `admin_operation_log` VALUES (1387, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111222\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:40:10', '2021-12-17 20:40:10');
INSERT INTO `admin_operation_log` VALUES (1388, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:40:18', '2021-12-17 20:40:18');
INSERT INTO `admin_operation_log` VALUES (1389, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:19', '2021-12-17 20:40:19');
INSERT INTO `admin_operation_log` VALUES (1390, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111222\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:40:21', '2021-12-17 20:40:21');
INSERT INTO `admin_operation_log` VALUES (1391, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:21', '2021-12-17 20:40:21');
INSERT INTO `admin_operation_log` VALUES (1392, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:47', '2021-12-17 20:40:47');
INSERT INTO `admin_operation_log` VALUES (1393, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:40:48', '2021-12-17 20:40:48');
INSERT INTO `admin_operation_log` VALUES (1394, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:40:51', '2021-12-17 20:40:51');
INSERT INTO `admin_operation_log` VALUES (1395, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:51', '2021-12-17 20:40:51');
INSERT INTO `admin_operation_log` VALUES (1396, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:40:53', '2021-12-17 20:40:53');
INSERT INTO `admin_operation_log` VALUES (1397, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:40:55', '2021-12-17 20:40:55');
INSERT INTO `admin_operation_log` VALUES (1398, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:40:56', '2021-12-17 20:40:56');
INSERT INTO `admin_operation_log` VALUES (1399, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:40:57', '2021-12-17 20:40:57');
INSERT INTO `admin_operation_log` VALUES (1400, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"1111212\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:41:01', '2021-12-17 20:41:01');
INSERT INTO `admin_operation_log` VALUES (1401, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:41:01', '2021-12-17 20:41:01');
INSERT INTO `admin_operation_log` VALUES (1402, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:41:03', '2021-12-17 20:41:03');
INSERT INTO `admin_operation_log` VALUES (1403, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:46:46', '2021-12-17 20:46:46');
INSERT INTO `admin_operation_log` VALUES (1404, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:48:10', '2021-12-17 20:48:10');
INSERT INTO `admin_operation_log` VALUES (1405, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:49:05', '2021-12-17 20:49:05');
INSERT INTO `admin_operation_log` VALUES (1406, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:49:07', '2021-12-17 20:49:07');
INSERT INTO `admin_operation_log` VALUES (1407, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 20:50:18', '2021-12-17 20:50:18');
INSERT INTO `admin_operation_log` VALUES (1408, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:52:05', '2021-12-17 20:52:05');
INSERT INTO `admin_operation_log` VALUES (1409, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:52:05', '2021-12-17 20:52:05');
INSERT INTO `admin_operation_log` VALUES (1410, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:52:08', '2021-12-17 20:52:08');
INSERT INTO `admin_operation_log` VALUES (1411, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"starttime\":\"2021-12-17 00:00:00\",\"endtime\":null,\"status\":\"10\",\"active\":\"off\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"title\":\"111\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 20:54:00', '2021-12-17 20:54:00');
INSERT INTO `admin_operation_log` VALUES (1412, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:54:00', '2021-12-17 20:54:00');
INSERT INTO `admin_operation_log` VALUES (1413, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"1\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:54:23', '2021-12-17 20:54:23');
INSERT INTO `admin_operation_log` VALUES (1414, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"0\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:54:25', '2021-12-17 20:54:25');
INSERT INTO `admin_operation_log` VALUES (1415, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"1\",\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 20:54:26', '2021-12-17 20:54:26');
INSERT INTO `admin_operation_log` VALUES (1416, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:54:27', '2021-12-17 20:54:27');
INSERT INTO `admin_operation_log` VALUES (1417, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:54:58', '2021-12-17 20:54:58');
INSERT INTO `admin_operation_log` VALUES (1418, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"account_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:09', '2021-12-17 20:55:09');
INSERT INTO `admin_operation_log` VALUES (1419, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:11', '2021-12-17 20:55:11');
INSERT INTO `admin_operation_log` VALUES (1420, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"account_id\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:14', '2021-12-17 20:55:14');
INSERT INTO `admin_operation_log` VALUES (1421, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:15', '2021-12-17 20:55:15');
INSERT INTO `admin_operation_log` VALUES (1422, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:19', '2021-12-17 20:55:19');
INSERT INTO `admin_operation_log` VALUES (1423, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:20', '2021-12-17 20:55:20');
INSERT INTO `admin_operation_log` VALUES (1424, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:55:28', '2021-12-17 20:55:28');
INSERT INTO `admin_operation_log` VALUES (1425, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"1\",\"4\",\"5\"]}', '2021-12-17 20:55:33', '2021-12-17 20:55:33');
INSERT INTO `admin_operation_log` VALUES (1426, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"account_id\":[\"2\"]}', '2021-12-17 20:55:36', '2021-12-17 20:55:36');
INSERT INTO `admin_operation_log` VALUES (1427, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"5\"]}', '2021-12-17 20:55:40', '2021-12-17 20:55:40');
INSERT INTO `admin_operation_log` VALUES (1428, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"5\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:46', '2021-12-17 20:55:46');
INSERT INTO `admin_operation_log` VALUES (1429, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:50', '2021-12-17 20:55:50');
INSERT INTO `admin_operation_log` VALUES (1430, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"1\",\"2\",\"4\",\"5\"]}', '2021-12-17 20:55:53', '2021-12-17 20:55:53');
INSERT INTO `admin_operation_log` VALUES (1431, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:56', '2021-12-17 20:55:56');
INSERT INTO `admin_operation_log` VALUES (1432, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:55:58', '2021-12-17 20:55:58');
INSERT INTO `admin_operation_log` VALUES (1433, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:56:01', '2021-12-17 20:56:01');
INSERT INTO `admin_operation_log` VALUES (1434, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:56:02', '2021-12-17 20:56:02');
INSERT INTO `admin_operation_log` VALUES (1435, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:04', '2021-12-17 20:56:04');
INSERT INTO `admin_operation_log` VALUES (1436, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:05', '2021-12-17 20:56:05');
INSERT INTO `admin_operation_log` VALUES (1437, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:12', '2021-12-17 20:56:12');
INSERT INTO `admin_operation_log` VALUES (1438, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:13', '2021-12-17 20:56:13');
INSERT INTO `admin_operation_log` VALUES (1439, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 20:56:17', '2021-12-17 20:56:17');
INSERT INTO `admin_operation_log` VALUES (1440, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:21', '2021-12-17 20:56:21');
INSERT INTO `admin_operation_log` VALUES (1441, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:25', '2021-12-17 20:56:25');
INSERT INTO `admin_operation_log` VALUES (1442, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"device_id\":[\"4\",\"5\"]}', '2021-12-17 20:56:29', '2021-12-17 20:56:29');
INSERT INTO `admin_operation_log` VALUES (1443, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"5\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:32', '2021-12-17 20:56:32');
INSERT INTO `admin_operation_log` VALUES (1444, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:34', '2021-12-17 20:56:34');
INSERT INTO `admin_operation_log` VALUES (1445, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:56:43', '2021-12-17 20:56:43');
INSERT INTO `admin_operation_log` VALUES (1446, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\",\"2\",\"4\",\"5\"],\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:58:07', '2021-12-17 20:58:07');
INSERT INTO `admin_operation_log` VALUES (1447, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:58:10', '2021-12-17 20:58:10');
INSERT INTO `admin_operation_log` VALUES (1448, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 20:58:18', '2021-12-17 20:58:18');
INSERT INTO `admin_operation_log` VALUES (1449, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:00:38', '2021-12-17 21:00:38');
INSERT INTO `admin_operation_log` VALUES (1450, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:01:08', '2021-12-17 21:01:08');
INSERT INTO `admin_operation_log` VALUES (1451, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:02:46', '2021-12-17 21:02:46');
INSERT INTO `admin_operation_log` VALUES (1452, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:03:51', '2021-12-17 21:03:51');
INSERT INTO `admin_operation_log` VALUES (1453, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:04:43', '2021-12-17 21:04:43');
INSERT INTO `admin_operation_log` VALUES (1454, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:06:52', '2021-12-17 21:06:52');
INSERT INTO `admin_operation_log` VALUES (1455, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:07:22', '2021-12-17 21:07:22');
INSERT INTO `admin_operation_log` VALUES (1456, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:08:19', '2021-12-17 21:08:19');
INSERT INTO `admin_operation_log` VALUES (1457, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:13:26', '2021-12-17 21:13:26');
INSERT INTO `admin_operation_log` VALUES (1458, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:13:33', '2021-12-17 21:13:33');
INSERT INTO `admin_operation_log` VALUES (1459, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:13:42', '2021-12-17 21:13:42');
INSERT INTO `admin_operation_log` VALUES (1460, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:14:23', '2021-12-17 21:14:23');
INSERT INTO `admin_operation_log` VALUES (1461, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:16:16', '2021-12-17 21:16:16');
INSERT INTO `admin_operation_log` VALUES (1462, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:16:25', '2021-12-17 21:16:25');
INSERT INTO `admin_operation_log` VALUES (1463, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:16:30', '2021-12-17 21:16:30');
INSERT INTO `admin_operation_log` VALUES (1464, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:19:05', '2021-12-17 21:19:05');
INSERT INTO `admin_operation_log` VALUES (1465, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:19:45', '2021-12-17 21:19:45');
INSERT INTO `admin_operation_log` VALUES (1466, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:19:59', '2021-12-17 21:19:59');
INSERT INTO `admin_operation_log` VALUES (1467, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:20:11', '2021-12-17 21:20:11');
INSERT INTO `admin_operation_log` VALUES (1468, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:21:26', '2021-12-17 21:21:26');
INSERT INTO `admin_operation_log` VALUES (1469, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:21:38', '2021-12-17 21:21:38');
INSERT INTO `admin_operation_log` VALUES (1470, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:21:57', '2021-12-17 21:21:57');
INSERT INTO `admin_operation_log` VALUES (1471, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:24:00', '2021-12-17 21:24:00');
INSERT INTO `admin_operation_log` VALUES (1472, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:24:07', '2021-12-17 21:24:07');
INSERT INTO `admin_operation_log` VALUES (1473, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:25:13', '2021-12-17 21:25:13');
INSERT INTO `admin_operation_log` VALUES (1474, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:25:45', '2021-12-17 21:25:45');
INSERT INTO `admin_operation_log` VALUES (1475, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:27:56', '2021-12-17 21:27:56');
INSERT INTO `admin_operation_log` VALUES (1476, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:35:00', '2021-12-17 21:35:00');
INSERT INTO `admin_operation_log` VALUES (1477, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:36:48', '2021-12-17 21:36:48');
INSERT INTO `admin_operation_log` VALUES (1478, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:37:49', '2021-12-17 21:37:49');
INSERT INTO `admin_operation_log` VALUES (1479, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:39:02', '2021-12-17 21:39:02');
INSERT INTO `admin_operation_log` VALUES (1480, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:39:46', '2021-12-17 21:39:46');
INSERT INTO `admin_operation_log` VALUES (1481, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:40:16', '2021-12-17 21:40:16');
INSERT INTO `admin_operation_log` VALUES (1482, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:40:51', '2021-12-17 21:40:51');
INSERT INTO `admin_operation_log` VALUES (1483, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:44:58', '2021-12-17 21:44:58');
INSERT INTO `admin_operation_log` VALUES (1484, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:46:02', '2021-12-17 21:46:02');
INSERT INTO `admin_operation_log` VALUES (1485, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:47:13', '2021-12-17 21:47:13');
INSERT INTO `admin_operation_log` VALUES (1486, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:48:42', '2021-12-17 21:48:42');
INSERT INTO `admin_operation_log` VALUES (1487, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:50:11', '2021-12-17 21:50:11');
INSERT INTO `admin_operation_log` VALUES (1488, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:51:41', '2021-12-17 21:51:41');
INSERT INTO `admin_operation_log` VALUES (1489, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:51:47', '2021-12-17 21:51:47');
INSERT INTO `admin_operation_log` VALUES (1490, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:52:10', '2021-12-17 21:52:10');
INSERT INTO `admin_operation_log` VALUES (1491, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:52:14', '2021-12-17 21:52:14');
INSERT INTO `admin_operation_log` VALUES (1492, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:52:20', '2021-12-17 21:52:20');
INSERT INTO `admin_operation_log` VALUES (1493, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:55:45', '2021-12-17 21:55:45');
INSERT INTO `admin_operation_log` VALUES (1494, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:01', '2021-12-17 21:56:01');
INSERT INTO `admin_operation_log` VALUES (1495, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:05', '2021-12-17 21:56:05');
INSERT INTO `admin_operation_log` VALUES (1496, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"10\",\"seetime\":\"20\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 21:56:23', '2021-12-17 21:56:23');
INSERT INTO `admin_operation_log` VALUES (1497, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:30', '2021-12-17 21:56:30');
INSERT INTO `admin_operation_log` VALUES (1498, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:32', '2021-12-17 21:56:32');
INSERT INTO `admin_operation_log` VALUES (1499, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"10\",\"seetime\":\"20\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-17 21:56:38', '2021-12-17 21:56:38');
INSERT INTO `admin_operation_log` VALUES (1500, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:38', '2021-12-17 21:56:38');
INSERT INTO `admin_operation_log` VALUES (1501, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 21:56:38', '2021-12-17 21:56:38');
INSERT INTO `admin_operation_log` VALUES (1502, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"10\",\"seetime\":\"20\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 21:59:02', '2021-12-17 21:59:02');
INSERT INTO `admin_operation_log` VALUES (1503, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 21:59:02', '2021-12-17 21:59:02');
INSERT INTO `admin_operation_log` VALUES (1504, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 21:59:04', '2021-12-17 21:59:04');
INSERT INTO `admin_operation_log` VALUES (1505, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"10\",\"seetime\":\"20\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":\"1\",\"frequency\":{\"daily\":\"5\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-17 21:59:29', '2021-12-17 21:59:29');
INSERT INTO `admin_operation_log` VALUES (1506, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 21:59:29', '2021-12-17 21:59:29');
INSERT INTO `admin_operation_log` VALUES (1507, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 21:59:37', '2021-12-17 21:59:37');
INSERT INTO `admin_operation_log` VALUES (1508, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 22:00:17', '2021-12-17 22:00:17');
INSERT INTO `admin_operation_log` VALUES (1509, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"10\",\"seetime\":\"20\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":\"1\",\"frequency\":{\"hours\":\"5\"},\"_token\":\"ZGj9gz5g950DjxmlWg7oF5PvRLAefap8Oz0wSHm3\",\"_method\":\"PUT\"}', '2021-12-17 22:00:20', '2021-12-17 22:00:20');
INSERT INTO `admin_operation_log` VALUES (1510, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-17 22:00:21', '2021-12-17 22:00:21');
INSERT INTO `admin_operation_log` VALUES (1511, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-17 22:00:23', '2021-12-17 22:00:23');
INSERT INTO `admin_operation_log` VALUES (1512, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-17 22:01:01', '2021-12-17 22:01:01');
INSERT INTO `admin_operation_log` VALUES (1513, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:39:49', '2021-12-18 10:39:49');
INSERT INTO `admin_operation_log` VALUES (1514, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:41:51', '2021-12-18 10:41:51');
INSERT INTO `admin_operation_log` VALUES (1515, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:44:19', '2021-12-18 10:44:19');
INSERT INTO `admin_operation_log` VALUES (1516, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:44:30', '2021-12-18 10:44:30');
INSERT INTO `admin_operation_log` VALUES (1517, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:45:57', '2021-12-18 10:45:57');
INSERT INTO `admin_operation_log` VALUES (1518, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:54:05', '2021-12-18 10:54:05');
INSERT INTO `admin_operation_log` VALUES (1519, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:56:12', '2021-12-18 10:56:12');
INSERT INTO `admin_operation_log` VALUES (1520, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:56:24', '2021-12-18 10:56:24');
INSERT INTO `admin_operation_log` VALUES (1521, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 10:56:31', '2021-12-18 10:56:31');
INSERT INTO `admin_operation_log` VALUES (1522, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"content\":\"#\\u5f00\\u5fc3 \\u4f60\\u597d\\u554a\",\"address\":null,\"richang\":\"off\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":\"1\",\"frequency\":{\"hours\":\"5\"},\"_token\":\"7mqMjFsgHXYzClARxhyLZbwZisvIaxD32nh4Iiig\",\"_method\":\"PUT\"}', '2021-12-18 11:05:20', '2021-12-18 11:05:20');
INSERT INTO `admin_operation_log` VALUES (1523, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 11:05:21', '2021-12-18 11:05:21');
INSERT INTO `admin_operation_log` VALUES (1524, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:05:23', '2021-12-18 11:05:23');
INSERT INTO `admin_operation_log` VALUES (1525, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 11:06:12', '2021-12-18 11:06:12');
INSERT INTO `admin_operation_log` VALUES (1526, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":\"1\",\"frequency\":{\"hours\":\"5\"},\"_token\":\"7mqMjFsgHXYzClARxhyLZbwZisvIaxD32nh4Iiig\",\"_method\":\"PUT\"}', '2021-12-18 11:08:05', '2021-12-18 11:08:05');
INSERT INTO `admin_operation_log` VALUES (1527, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 11:08:06', '2021-12-18 11:08:06');
INSERT INTO `admin_operation_log` VALUES (1528, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:08:08', '2021-12-18 11:08:08');
INSERT INTO `admin_operation_log` VALUES (1529, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:08:32', '2021-12-18 11:08:32');
INSERT INTO `admin_operation_log` VALUES (1530, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:08:34', '2021-12-18 11:08:34');
INSERT INTO `admin_operation_log` VALUES (1531, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:08:36', '2021-12-18 11:08:36');
INSERT INTO `admin_operation_log` VALUES (1532, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:08:37', '2021-12-18 11:08:37');
INSERT INTO `admin_operation_log` VALUES (1533, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:08:50', '2021-12-18 11:08:50');
INSERT INTO `admin_operation_log` VALUES (1534, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:11:02', '2021-12-18 11:11:02');
INSERT INTO `admin_operation_log` VALUES (1535, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:12:14', '2021-12-18 11:12:14');
INSERT INTO `admin_operation_log` VALUES (1536, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:12:39', '2021-12-18 11:12:39');
INSERT INTO `admin_operation_log` VALUES (1537, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:13:12', '2021-12-18 11:13:12');
INSERT INTO `admin_operation_log` VALUES (1538, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:13:44', '2021-12-18 11:13:44');
INSERT INTO `admin_operation_log` VALUES (1539, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:13:52', '2021-12-18 11:13:52');
INSERT INTO `admin_operation_log` VALUES (1540, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:14:03', '2021-12-18 11:14:03');
INSERT INTO `admin_operation_log` VALUES (1541, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:14:08', '2021-12-18 11:14:08');
INSERT INTO `admin_operation_log` VALUES (1542, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:14:12', '2021-12-18 11:14:12');
INSERT INTO `admin_operation_log` VALUES (1543, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:14:35', '2021-12-18 11:14:35');
INSERT INTO `admin_operation_log` VALUES (1544, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:14:44', '2021-12-18 11:14:44');
INSERT INTO `admin_operation_log` VALUES (1545, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:15:44', '2021-12-18 11:15:44');
INSERT INTO `admin_operation_log` VALUES (1546, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 11:15:50', '2021-12-18 11:15:50');
INSERT INTO `admin_operation_log` VALUES (1547, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 11:35:44', '2021-12-18 11:35:44');
INSERT INTO `admin_operation_log` VALUES (1548, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 11:51:12', '2021-12-18 11:51:12');
INSERT INTO `admin_operation_log` VALUES (1549, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 16:27:34', '2021-12-18 16:27:34');
INSERT INTO `admin_operation_log` VALUES (1550, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"BKq2e21KBqahIfS1xogCefgD0W84cEW0cvA0z9vz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-18 16:28:50', '2021-12-18 16:28:50');
INSERT INTO `admin_operation_log` VALUES (1551, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:28:50', '2021-12-18 16:28:50');
INSERT INTO `admin_operation_log` VALUES (1552, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:28:55', '2021-12-18 16:28:55');
INSERT INTO `admin_operation_log` VALUES (1553, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:28:58', '2021-12-18 16:28:58');
INSERT INTO `admin_operation_log` VALUES (1554, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:30:33', '2021-12-18 16:30:33');
INSERT INTO `admin_operation_log` VALUES (1555, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:30:42', '2021-12-18 16:30:42');
INSERT INTO `admin_operation_log` VALUES (1556, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:30:47', '2021-12-18 16:30:47');
INSERT INTO `admin_operation_log` VALUES (1557, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:30:59', '2021-12-18 16:30:59');
INSERT INTO `admin_operation_log` VALUES (1558, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"task_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:31:18', '2021-12-18 16:31:18');
INSERT INTO `admin_operation_log` VALUES (1559, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"task_id\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:31:23', '2021-12-18 16:31:23');
INSERT INTO `admin_operation_log` VALUES (1560, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:31:26', '2021-12-18 16:31:26');
INSERT INTO `admin_operation_log` VALUES (1561, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:41:55', '2021-12-18 16:41:55');
INSERT INTO `admin_operation_log` VALUES (1562, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 16:41:59', '2021-12-18 16:41:59');
INSERT INTO `admin_operation_log` VALUES (1563, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:42:01', '2021-12-18 16:42:01');
INSERT INTO `admin_operation_log` VALUES (1564, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:42:34', '2021-12-18 16:42:34');
INSERT INTO `admin_operation_log` VALUES (1565, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:42:46', '2021-12-18 16:42:46');
INSERT INTO `admin_operation_log` VALUES (1566, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:42:47', '2021-12-18 16:42:47');
INSERT INTO `admin_operation_log` VALUES (1567, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:42:56', '2021-12-18 16:42:56');
INSERT INTO `admin_operation_log` VALUES (1568, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:43:07', '2021-12-18 16:43:07');
INSERT INTO `admin_operation_log` VALUES (1569, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:50:47', '2021-12-18 16:50:47');
INSERT INTO `admin_operation_log` VALUES (1570, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:53:14', '2021-12-18 16:53:14');
INSERT INTO `admin_operation_log` VALUES (1571, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:53:53', '2021-12-18 16:53:53');
INSERT INTO `admin_operation_log` VALUES (1572, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:53:54', '2021-12-18 16:53:54');
INSERT INTO `admin_operation_log` VALUES (1573, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 16:53:55', '2021-12-18 16:53:55');
INSERT INTO `admin_operation_log` VALUES (1574, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 17:01:25', '2021-12-18 17:01:25');
INSERT INTO `admin_operation_log` VALUES (1575, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 17:01:43', '2021-12-18 17:01:43');
INSERT INTO `admin_operation_log` VALUES (1576, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 17:01:50', '2021-12-18 17:01:50');
INSERT INTO `admin_operation_log` VALUES (1577, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:01:56', '2021-12-18 17:01:56');
INSERT INTO `admin_operation_log` VALUES (1578, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 17:02:02', '2021-12-18 17:02:02');
INSERT INTO `admin_operation_log` VALUES (1579, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:11:28', '2021-12-18 17:11:28');
INSERT INTO `admin_operation_log` VALUES (1580, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:11:30', '2021-12-18 17:11:30');
INSERT INTO `admin_operation_log` VALUES (1581, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:11:51', '2021-12-18 17:11:51');
INSERT INTO `admin_operation_log` VALUES (1582, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-18 17:12:22', '2021-12-18 17:12:22');
INSERT INTO `admin_operation_log` VALUES (1583, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:19:42', '2021-12-18 17:19:42');
INSERT INTO `admin_operation_log` VALUES (1584, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:27:44', '2021-12-18 17:27:44');
INSERT INTO `admin_operation_log` VALUES (1585, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:27:56', '2021-12-18 17:27:56');
INSERT INTO `admin_operation_log` VALUES (1586, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 17:43:39', '2021-12-18 17:43:39');
INSERT INTO `admin_operation_log` VALUES (1587, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 17:43:41', '2021-12-18 17:43:41');
INSERT INTO `admin_operation_log` VALUES (1588, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:44:22', '2021-12-18 17:44:22');
INSERT INTO `admin_operation_log` VALUES (1589, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:44:53', '2021-12-18 17:44:53');
INSERT INTO `admin_operation_log` VALUES (1590, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:45:04', '2021-12-18 17:45:04');
INSERT INTO `admin_operation_log` VALUES (1591, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:55:15', '2021-12-18 17:55:15');
INSERT INTO `admin_operation_log` VALUES (1592, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:56:09', '2021-12-18 17:56:09');
INSERT INTO `admin_operation_log` VALUES (1593, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:57:07', '2021-12-18 17:57:07');
INSERT INTO `admin_operation_log` VALUES (1594, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 17:57:56', '2021-12-18 17:57:56');
INSERT INTO `admin_operation_log` VALUES (1595, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:44:39', '2021-12-18 19:44:39');
INSERT INTO `admin_operation_log` VALUES (1596, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:44:54', '2021-12-18 19:44:54');
INSERT INTO `admin_operation_log` VALUES (1597, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:45:18', '2021-12-18 19:45:18');
INSERT INTO `admin_operation_log` VALUES (1598, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:50:54', '2021-12-18 19:50:54');
INSERT INTO `admin_operation_log` VALUES (1599, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:51:51', '2021-12-18 19:51:51');
INSERT INTO `admin_operation_log` VALUES (1600, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"fans\":null,\"videos\":null,\"_token\":\"BKq2e21KBqahIfS1xogCefgD0W84cEW0cvA0z9vz\",\"_method\":\"PUT\"}', '2021-12-18 19:52:01', '2021-12-18 19:52:01');
INSERT INTO `admin_operation_log` VALUES (1601, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:52:01', '2021-12-18 19:52:01');
INSERT INTO `admin_operation_log` VALUES (1602, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:52:50', '2021-12-18 19:52:50');
INSERT INTO `admin_operation_log` VALUES (1603, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-18 19:53:22', '2021-12-18 19:53:22');
INSERT INTO `admin_operation_log` VALUES (1604, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 19:54:06', '2021-12-18 19:54:06');
INSERT INTO `admin_operation_log` VALUES (1605, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 19:54:07', '2021-12-18 19:54:07');
INSERT INTO `admin_operation_log` VALUES (1606, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:02:34', '2021-12-18 20:02:34');
INSERT INTO `admin_operation_log` VALUES (1607, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:02:37', '2021-12-18 20:02:37');
INSERT INTO `admin_operation_log` VALUES (1608, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:02:40', '2021-12-18 20:02:40');
INSERT INTO `admin_operation_log` VALUES (1609, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:02:53', '2021-12-18 20:02:53');
INSERT INTO `admin_operation_log` VALUES (1610, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-18 20:02:54', '2021-12-18 20:02:54');
INSERT INTO `admin_operation_log` VALUES (1611, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:10', '2021-12-18 20:03:10');
INSERT INTO `admin_operation_log` VALUES (1612, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:11', '2021-12-18 20:03:11');
INSERT INTO `admin_operation_log` VALUES (1613, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"device_id\":[\"4\"],\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:15', '2021-12-18 20:03:15');
INSERT INTO `admin_operation_log` VALUES (1614, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:16', '2021-12-18 20:03:16');
INSERT INTO `admin_operation_log` VALUES (1615, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"account_id\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:19', '2021-12-18 20:03:19');
INSERT INTO `admin_operation_log` VALUES (1616, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:03:22', '2021-12-18 20:03:22');
INSERT INTO `admin_operation_log` VALUES (1617, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:08:52', '2021-12-18 20:08:52');
INSERT INTO `admin_operation_log` VALUES (1618, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:08:57', '2021-12-18 20:08:57');
INSERT INTO `admin_operation_log` VALUES (1619, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:08:59', '2021-12-18 20:08:59');
INSERT INTO `admin_operation_log` VALUES (1620, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:04', '2021-12-18 20:09:04');
INSERT INTO `admin_operation_log` VALUES (1621, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:09', '2021-12-18 20:09:09');
INSERT INTO `admin_operation_log` VALUES (1622, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:11', '2021-12-18 20:09:11');
INSERT INTO `admin_operation_log` VALUES (1623, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:14', '2021-12-18 20:09:14');
INSERT INTO `admin_operation_log` VALUES (1624, 1, 'admin/auth/permissions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:23', '2021-12-18 20:09:23');
INSERT INTO `admin_operation_log` VALUES (1625, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-18 20:09:49', '2021-12-18 20:09:49');
INSERT INTO `admin_operation_log` VALUES (1626, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-18 20:48:36', '2021-12-18 20:48:36');
INSERT INTO `admin_operation_log` VALUES (1627, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-18 20:51:42', '2021-12-18 20:51:42');
INSERT INTO `admin_operation_log` VALUES (1628, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-18 20:52:03', '2021-12-18 20:52:03');
INSERT INTO `admin_operation_log` VALUES (1629, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-19 10:59:26', '2021-12-19 10:59:26');
INSERT INTO `admin_operation_log` VALUES (1630, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-19 11:05:55', '2021-12-19 11:05:55');
INSERT INTO `admin_operation_log` VALUES (1631, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-19 11:07:20', '2021-12-19 11:07:20');
INSERT INTO `admin_operation_log` VALUES (1632, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-19 11:19:18', '2021-12-19 11:19:18');
INSERT INTO `admin_operation_log` VALUES (1633, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 11:53:47', '2021-12-19 11:53:47');
INSERT INTO `admin_operation_log` VALUES (1634, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 13:57:49', '2021-12-19 13:57:49');
INSERT INTO `admin_operation_log` VALUES (1635, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:51:56', '2021-12-19 19:51:56');
INSERT INTO `admin_operation_log` VALUES (1636, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:52:13', '2021-12-19 19:52:13');
INSERT INTO `admin_operation_log` VALUES (1637, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:53:08', '2021-12-19 19:53:08');
INSERT INTO `admin_operation_log` VALUES (1638, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:55:50', '2021-12-19 19:55:50');
INSERT INTO `admin_operation_log` VALUES (1639, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:56:23', '2021-12-19 19:56:23');
INSERT INTO `admin_operation_log` VALUES (1640, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-19 19:59:22', '2021-12-19 19:59:22');
INSERT INTO `admin_operation_log` VALUES (1641, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:59:24', '2021-12-19 19:59:24');
INSERT INTO `admin_operation_log` VALUES (1642, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-19 19:59:42', '2021-12-19 19:59:42');
INSERT INTO `admin_operation_log` VALUES (1643, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 19:59:43', '2021-12-19 19:59:43');
INSERT INTO `admin_operation_log` VALUES (1644, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:00:45', '2021-12-19 20:00:45');
INSERT INTO `admin_operation_log` VALUES (1645, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:01:31', '2021-12-19 20:01:31');
INSERT INTO `admin_operation_log` VALUES (1646, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:07', '2021-12-19 20:02:07');
INSERT INTO `admin_operation_log` VALUES (1647, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:09', '2021-12-19 20:02:09');
INSERT INTO `admin_operation_log` VALUES (1648, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:19', '2021-12-19 20:02:19');
INSERT INTO `admin_operation_log` VALUES (1649, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:21', '2021-12-19 20:02:21');
INSERT INTO `admin_operation_log` VALUES (1650, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:23', '2021-12-19 20:02:23');
INSERT INTO `admin_operation_log` VALUES (1651, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:48', '2021-12-19 20:02:48');
INSERT INTO `admin_operation_log` VALUES (1652, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-19 20:02:50', '2021-12-19 20:02:50');
INSERT INTO `admin_operation_log` VALUES (1653, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:03:26', '2021-12-19 20:03:26');
INSERT INTO `admin_operation_log` VALUES (1654, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:03:32', '2021-12-19 20:03:32');
INSERT INTO `admin_operation_log` VALUES (1655, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:07:53', '2021-12-19 20:07:53');
INSERT INTO `admin_operation_log` VALUES (1656, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:29:44', '2021-12-19 20:29:44');
INSERT INTO `admin_operation_log` VALUES (1657, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:33:01', '2021-12-19 20:33:01');
INSERT INTO `admin_operation_log` VALUES (1658, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:36:34', '2021-12-19 20:36:34');
INSERT INTO `admin_operation_log` VALUES (1659, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:47:26', '2021-12-19 20:47:26');
INSERT INTO `admin_operation_log` VALUES (1660, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:49:45', '2021-12-19 20:49:45');
INSERT INTO `admin_operation_log` VALUES (1661, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 20:55:37', '2021-12-19 20:55:37');
INSERT INTO `admin_operation_log` VALUES (1662, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:07:12', '2021-12-19 21:07:12');
INSERT INTO `admin_operation_log` VALUES (1663, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:10:49', '2021-12-19 21:10:49');
INSERT INTO `admin_operation_log` VALUES (1664, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:15:54', '2021-12-19 21:15:54');
INSERT INTO `admin_operation_log` VALUES (1665, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:21:59', '2021-12-19 21:21:59');
INSERT INTO `admin_operation_log` VALUES (1666, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:28:14', '2021-12-19 21:28:14');
INSERT INTO `admin_operation_log` VALUES (1667, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:32:32', '2021-12-19 21:32:32');
INSERT INTO `admin_operation_log` VALUES (1668, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:35:37', '2021-12-19 21:35:37');
INSERT INTO `admin_operation_log` VALUES (1669, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:39:17', '2021-12-19 21:39:17');
INSERT INTO `admin_operation_log` VALUES (1670, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-19 21:59:55', '2021-12-19 21:59:55');
INSERT INTO `admin_operation_log` VALUES (1671, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:03:21', '2021-12-20 10:03:21');
INSERT INTO `admin_operation_log` VALUES (1672, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:03:31', '2021-12-20 10:03:31');
INSERT INTO `admin_operation_log` VALUES (1673, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:03:31', '2021-12-20 10:03:31');
INSERT INTO `admin_operation_log` VALUES (1674, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:03:33', '2021-12-20 10:03:33');
INSERT INTO `admin_operation_log` VALUES (1675, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"test\",\"name\":\"\\u6d4b\\u8bd5\\u8d26\\u53f7\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"roles\":[null],\"permissions\":[null],\"_token\":\"hH72fDmi0DgMXhN7daVoDeEFLFqqUntJPC16W3rg\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/users\"}', '2021-12-20 10:03:52', '2021-12-20 10:03:52');
INSERT INTO `admin_operation_log` VALUES (1676, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-12-20 10:03:53', '2021-12-20 10:03:53');
INSERT INTO `admin_operation_log` VALUES (1677, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:03:58', '2021-12-20 10:03:58');
INSERT INTO `admin_operation_log` VALUES (1678, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:04', '2021-12-20 10:04:04');
INSERT INTO `admin_operation_log` VALUES (1679, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:05', '2021-12-20 10:04:05');
INSERT INTO `admin_operation_log` VALUES (1680, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-20 10:04:23', '2021-12-20 10:04:23');
INSERT INTO `admin_operation_log` VALUES (1681, 2, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:26', '2021-12-20 10:04:26');
INSERT INTO `admin_operation_log` VALUES (1682, 2, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:27', '2021-12-20 10:04:27');
INSERT INTO `admin_operation_log` VALUES (1683, 2, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:28', '2021-12-20 10:04:28');
INSERT INTO `admin_operation_log` VALUES (1684, 2, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:28', '2021-12-20 10:04:28');
INSERT INTO `admin_operation_log` VALUES (1685, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2021-12-20 10:04:31', '2021-12-20 10:04:31');
INSERT INTO `admin_operation_log` VALUES (1686, 2, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:33', '2021-12-20 10:04:33');
INSERT INTO `admin_operation_log` VALUES (1687, 2, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-20 10:04:38', '2021-12-20 10:04:38');
INSERT INTO `admin_operation_log` VALUES (1688, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:04:57', '2021-12-20 10:04:57');
INSERT INTO `admin_operation_log` VALUES (1689, 2, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-20 10:05:13', '2021-12-20 10:05:13');
INSERT INTO `admin_operation_log` VALUES (1690, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:07:22', '2021-12-20 10:07:22');
INSERT INTO `admin_operation_log` VALUES (1691, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 10:50:27', '2021-12-20 10:50:27');
INSERT INTO `admin_operation_log` VALUES (1692, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 11:15:46', '2021-12-20 11:15:46');
INSERT INTO `admin_operation_log` VALUES (1693, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-20 11:17:07', '2021-12-20 11:17:07');
INSERT INTO `admin_operation_log` VALUES (1694, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-20 11:18:46', '2021-12-20 11:18:46');
INSERT INTO `admin_operation_log` VALUES (1695, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-20 11:29:25', '2021-12-20 11:29:25');
INSERT INTO `admin_operation_log` VALUES (1696, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-20 11:29:46', '2021-12-20 11:29:46');
INSERT INTO `admin_operation_log` VALUES (1697, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":null,\"quality\":\"0\",\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":null,\"starttime\":null,\"endtime\":null,\"units\":null,\"_token\":\"hH72fDmi0DgMXhN7daVoDeEFLFqqUntJPC16W3rg\"}', '2021-12-20 11:29:51', '2021-12-20 11:29:51');
INSERT INTO `admin_operation_log` VALUES (1698, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-20 11:29:52', '2021-12-20 11:29:52');
INSERT INTO `admin_operation_log` VALUES (1699, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-20 11:30:07', '2021-12-20 11:30:07');
INSERT INTO `admin_operation_log` VALUES (1700, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":null,\"quality\":\"0\",\"status\":null,\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":null,\"starttime\":null,\"endtime\":null,\"units\":null,\"_token\":\"hH72fDmi0DgMXhN7daVoDeEFLFqqUntJPC16W3rg\"}', '2021-12-20 11:30:10', '2021-12-20 11:30:10');
INSERT INTO `admin_operation_log` VALUES (1701, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-20 11:30:10', '2021-12-20 11:30:10');
INSERT INTO `admin_operation_log` VALUES (1702, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-20 11:30:13', '2021-12-20 11:30:13');
INSERT INTO `admin_operation_log` VALUES (1703, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-22 13:57:39', '2021-12-22 13:57:39');
INSERT INTO `admin_operation_log` VALUES (1704, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 13:57:45', '2021-12-22 13:57:45');
INSERT INTO `admin_operation_log` VALUES (1705, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:00:06', '2021-12-22 14:00:06');
INSERT INTO `admin_operation_log` VALUES (1706, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:00:07', '2021-12-22 14:00:07');
INSERT INTO `admin_operation_log` VALUES (1707, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:00:47', '2021-12-22 14:00:47');
INSERT INTO `admin_operation_log` VALUES (1708, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:29:13', '2021-12-22 14:29:13');
INSERT INTO `admin_operation_log` VALUES (1709, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2021-12-22 14:36:29', '2021-12-22 14:36:29');
INSERT INTO `admin_operation_log` VALUES (1710, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:36:32', '2021-12-22 14:36:32');
INSERT INTO `admin_operation_log` VALUES (1711, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:36:35', '2021-12-22 14:36:35');
INSERT INTO `admin_operation_log` VALUES (1712, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:36:41', '2021-12-22 14:36:41');
INSERT INTO `admin_operation_log` VALUES (1713, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 14:37:16', '2021-12-22 14:37:16');
INSERT INTO `admin_operation_log` VALUES (1714, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 14:37:19', '2021-12-22 14:37:19');
INSERT INTO `admin_operation_log` VALUES (1715, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 14:37:23', '2021-12-22 14:37:23');
INSERT INTO `admin_operation_log` VALUES (1716, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 14:37:24', '2021-12-22 14:37:24');
INSERT INTO `admin_operation_log` VALUES (1717, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 14:37:24', '2021-12-22 14:37:24');
INSERT INTO `admin_operation_log` VALUES (1718, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 14:38:12', '2021-12-22 14:38:12');
INSERT INTO `admin_operation_log` VALUES (1719, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:38:33', '2021-12-22 14:38:33');
INSERT INTO `admin_operation_log` VALUES (1720, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 14:38:34', '2021-12-22 14:38:34');
INSERT INTO `admin_operation_log` VALUES (1721, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 14:38:43', '2021-12-22 14:38:43');
INSERT INTO `admin_operation_log` VALUES (1722, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:38:43', '2021-12-22 14:38:43');
INSERT INTO `admin_operation_log` VALUES (1723, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:38:55', '2021-12-22 14:38:55');
INSERT INTO `admin_operation_log` VALUES (1724, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:39:55', '2021-12-22 14:39:55');
INSERT INTO `admin_operation_log` VALUES (1725, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:40:22', '2021-12-22 14:40:22');
INSERT INTO `admin_operation_log` VALUES (1726, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 14:40:27', '2021-12-22 14:40:27');
INSERT INTO `admin_operation_log` VALUES (1727, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:40:34', '2021-12-22 14:40:34');
INSERT INTO `admin_operation_log` VALUES (1728, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",\"2\",null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 14:40:41', '2021-12-22 14:40:41');
INSERT INTO `admin_operation_log` VALUES (1729, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:40:55', '2021-12-22 14:40:55');
INSERT INTO `admin_operation_log` VALUES (1730, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 14:40:55', '2021-12-22 14:40:55');
INSERT INTO `admin_operation_log` VALUES (1731, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 14:41:05', '2021-12-22 14:41:05');
INSERT INTO `admin_operation_log` VALUES (1732, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:41:06', '2021-12-22 14:41:06');
INSERT INTO `admin_operation_log` VALUES (1733, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:41:10', '2021-12-22 14:41:10');
INSERT INTO `admin_operation_log` VALUES (1734, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"1\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:41:18', '2021-12-22 14:41:18');
INSERT INTO `admin_operation_log` VALUES (1735, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:41:18', '2021-12-22 14:41:18');
INSERT INTO `admin_operation_log` VALUES (1736, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:41:21', '2021-12-22 14:41:21');
INSERT INTO `admin_operation_log` VALUES (1737, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:41:38', '2021-12-22 14:41:38');
INSERT INTO `admin_operation_log` VALUES (1738, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:41:38', '2021-12-22 14:41:38');
INSERT INTO `admin_operation_log` VALUES (1739, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:41:42', '2021-12-22 14:41:42');
INSERT INTO `admin_operation_log` VALUES (1740, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"1\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:41:58', '2021-12-22 14:41:58');
INSERT INTO `admin_operation_log` VALUES (1741, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:41:58', '2021-12-22 14:41:58');
INSERT INTO `admin_operation_log` VALUES (1742, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:01', '2021-12-22 14:42:01');
INSERT INTO `admin_operation_log` VALUES (1743, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:42:08', '2021-12-22 14:42:08');
INSERT INTO `admin_operation_log` VALUES (1744, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:42:08', '2021-12-22 14:42:08');
INSERT INTO `admin_operation_log` VALUES (1745, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:15', '2021-12-22 14:42:15');
INSERT INTO `admin_operation_log` VALUES (1746, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:18', '2021-12-22 14:42:18');
INSERT INTO `admin_operation_log` VALUES (1747, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:21', '2021-12-22 14:42:21');
INSERT INTO `admin_operation_log` VALUES (1748, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:32', '2021-12-22 14:42:32');
INSERT INTO `admin_operation_log` VALUES (1749, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:34', '2021-12-22 14:42:34');
INSERT INTO `admin_operation_log` VALUES (1750, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:36', '2021-12-22 14:42:36');
INSERT INTO `admin_operation_log` VALUES (1751, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:40', '2021-12-22 14:42:40');
INSERT INTO `admin_operation_log` VALUES (1752, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:42:43', '2021-12-22 14:42:43');
INSERT INTO `admin_operation_log` VALUES (1753, 1, 'admin/devices/1', 'PUT', '127.0.0.1', '{\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"3\"]}', '2021-12-22 14:42:59', '2021-12-22 14:42:59');
INSERT INTO `admin_operation_log` VALUES (1754, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:43:14', '2021-12-22 14:43:14');
INSERT INTO `admin_operation_log` VALUES (1755, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:43:16', '2021-12-22 14:43:16');
INSERT INTO `admin_operation_log` VALUES (1756, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 14:43:20', '2021-12-22 14:43:20');
INSERT INTO `admin_operation_log` VALUES (1757, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-22 14:43:20', '2021-12-22 14:43:20');
INSERT INTO `admin_operation_log` VALUES (1758, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 14:59:13', '2021-12-22 14:59:13');
INSERT INTO `admin_operation_log` VALUES (1759, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 16:30:44', '2021-12-22 16:30:44');
INSERT INTO `admin_operation_log` VALUES (1760, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:39:18', '2021-12-22 17:39:18');
INSERT INTO `admin_operation_log` VALUES (1761, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-22 17:39:20', '2021-12-22 17:39:20');
INSERT INTO `admin_operation_log` VALUES (1762, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:42:40', '2021-12-22 17:42:40');
INSERT INTO `admin_operation_log` VALUES (1763, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:42:43', '2021-12-22 17:42:43');
INSERT INTO `admin_operation_log` VALUES (1764, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 17:42:46', '2021-12-22 17:42:46');
INSERT INTO `admin_operation_log` VALUES (1765, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:43:07', '2021-12-22 17:43:07');
INSERT INTO `admin_operation_log` VALUES (1766, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:43:07', '2021-12-22 17:43:07');
INSERT INTO `admin_operation_log` VALUES (1767, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:43:11', '2021-12-22 17:43:11');
INSERT INTO `admin_operation_log` VALUES (1768, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:43:19', '2021-12-22 17:43:19');
INSERT INTO `admin_operation_log` VALUES (1769, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:43:22', '2021-12-22 17:43:22');
INSERT INTO `admin_operation_log` VALUES (1770, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:43:37', '2021-12-22 17:43:37');
INSERT INTO `admin_operation_log` VALUES (1771, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:43:38', '2021-12-22 17:43:38');
INSERT INTO `admin_operation_log` VALUES (1772, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:43:40', '2021-12-22 17:43:40');
INSERT INTO `admin_operation_log` VALUES (1773, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:44:24', '2021-12-22 17:44:24');
INSERT INTO `admin_operation_log` VALUES (1774, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:44:27', '2021-12-22 17:44:27');
INSERT INTO `admin_operation_log` VALUES (1775, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:44:29', '2021-12-22 17:44:29');
INSERT INTO `admin_operation_log` VALUES (1776, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 17:44:32', '2021-12-22 17:44:32');
INSERT INTO `admin_operation_log` VALUES (1777, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:45:00', '2021-12-22 17:45:00');
INSERT INTO `admin_operation_log` VALUES (1778, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:45:04', '2021-12-22 17:45:04');
INSERT INTO `admin_operation_log` VALUES (1779, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":null,\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 17:45:06', '2021-12-22 17:45:06');
INSERT INTO `admin_operation_log` VALUES (1780, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:46:39', '2021-12-22 17:46:39');
INSERT INTO `admin_operation_log` VALUES (1781, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:46:39', '2021-12-22 17:46:39');
INSERT INTO `admin_operation_log` VALUES (1782, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:46:43', '2021-12-22 17:46:43');
INSERT INTO `admin_operation_log` VALUES (1783, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:46:54', '2021-12-22 17:46:54');
INSERT INTO `admin_operation_log` VALUES (1784, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:46:54', '2021-12-22 17:46:54');
INSERT INTO `admin_operation_log` VALUES (1785, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:46:57', '2021-12-22 17:46:57');
INSERT INTO `admin_operation_log` VALUES (1786, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:47:26', '2021-12-22 17:47:26');
INSERT INTO `admin_operation_log` VALUES (1787, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:47:27', '2021-12-22 17:47:27');
INSERT INTO `admin_operation_log` VALUES (1788, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 17:47:30', '2021-12-22 17:47:30');
INSERT INTO `admin_operation_log` VALUES (1789, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:47:42', '2021-12-22 17:47:42');
INSERT INTO `admin_operation_log` VALUES (1790, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:47:43', '2021-12-22 17:47:43');
INSERT INTO `admin_operation_log` VALUES (1791, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":\"1\",\"frequency\":{\"hours\":\"5\"},\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:48:14', '2021-12-22 17:48:14');
INSERT INTO `admin_operation_log` VALUES (1792, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:48:26', '2021-12-22 17:48:26');
INSERT INTO `admin_operation_log` VALUES (1793, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:48:30', '2021-12-22 17:48:30');
INSERT INTO `admin_operation_log` VALUES (1794, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:49:46', '2021-12-22 17:49:46');
INSERT INTO `admin_operation_log` VALUES (1795, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:49:47', '2021-12-22 17:49:47');
INSERT INTO `admin_operation_log` VALUES (1796, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:49:49', '2021-12-22 17:49:49');
INSERT INTO `admin_operation_log` VALUES (1797, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:50:49', '2021-12-22 17:50:49');
INSERT INTO `admin_operation_log` VALUES (1798, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:50:51', '2021-12-22 17:50:51');
INSERT INTO `admin_operation_log` VALUES (1799, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:52:16', '2021-12-22 17:52:16');
INSERT INTO `admin_operation_log` VALUES (1800, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:52:19', '2021-12-22 17:52:19');
INSERT INTO `admin_operation_log` VALUES (1801, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:57:47', '2021-12-22 17:57:47');
INSERT INTO `admin_operation_log` VALUES (1802, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:57:48', '2021-12-22 17:57:48');
INSERT INTO `admin_operation_log` VALUES (1803, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":null,\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:57:52', '2021-12-22 17:57:52');
INSERT INTO `admin_operation_log` VALUES (1804, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:57:52', '2021-12-22 17:57:52');
INSERT INTO `admin_operation_log` VALUES (1805, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":null,\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:58:31', '2021-12-22 17:58:31');
INSERT INTO `admin_operation_log` VALUES (1806, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-22 17:58:33', '2021-12-22 17:58:33');
INSERT INTO `admin_operation_log` VALUES (1807, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":null,\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 17:59:34', '2021-12-22 17:59:34');
INSERT INTO `admin_operation_log` VALUES (1808, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-22 17:59:53', '2021-12-22 17:59:53');
INSERT INTO `admin_operation_log` VALUES (1809, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 17:59:56', '2021-12-22 17:59:56');
INSERT INTO `admin_operation_log` VALUES (1810, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":null,\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-22 18:00:00', '2021-12-22 18:00:00');
INSERT INTO `admin_operation_log` VALUES (1811, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 18:00:20', '2021-12-22 18:00:20');
INSERT INTO `admin_operation_log` VALUES (1812, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 18:00:39', '2021-12-22 18:00:39');
INSERT INTO `admin_operation_log` VALUES (1813, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 18:00:42', '2021-12-22 18:00:42');
INSERT INTO `admin_operation_log` VALUES (1814, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":null,\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 18:00:47', '2021-12-22 18:00:47');
INSERT INTO `admin_operation_log` VALUES (1815, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-22 18:00:47', '2021-12-22 18:00:47');
INSERT INTO `admin_operation_log` VALUES (1816, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"lCxGZd56Tpjr6w6GiGnELxhqVFJ6ujhjIqzCyZjp\",\"_method\":\"PUT\"}', '2021-12-22 18:01:21', '2021-12-22 18:01:21');
INSERT INTO `admin_operation_log` VALUES (1817, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:51:34', '2021-12-23 09:51:34');
INSERT INTO `admin_operation_log` VALUES (1818, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 09:51:35', '2021-12-23 09:51:35');
INSERT INTO `admin_operation_log` VALUES (1819, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:51:38', '2021-12-23 09:51:38');
INSERT INTO `admin_operation_log` VALUES (1820, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:52:57', '2021-12-23 09:52:57');
INSERT INTO `admin_operation_log` VALUES (1821, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 09:52:58', '2021-12-23 09:52:58');
INSERT INTO `admin_operation_log` VALUES (1822, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:53:01', '2021-12-23 09:53:01');
INSERT INTO `admin_operation_log` VALUES (1823, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:53:23', '2021-12-23 09:53:23');
INSERT INTO `admin_operation_log` VALUES (1824, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-23\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:53:27', '2021-12-23 09:53:27');
INSERT INTO `admin_operation_log` VALUES (1825, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:54:32', '2021-12-23 09:54:32');
INSERT INTO `admin_operation_log` VALUES (1826, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-17\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:54:41', '2021-12-23 09:54:41');
INSERT INTO `admin_operation_log` VALUES (1827, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:56:36', '2021-12-23 09:56:36');
INSERT INTO `admin_operation_log` VALUES (1828, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-16\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:56:42', '2021-12-23 09:56:42');
INSERT INTO `admin_operation_log` VALUES (1829, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 09:56:42', '2021-12-23 09:56:42');
INSERT INTO `admin_operation_log` VALUES (1830, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:56:44', '2021-12-23 09:56:44');
INSERT INTO `admin_operation_log` VALUES (1831, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 09:59:06', '2021-12-23 09:59:06');
INSERT INTO `admin_operation_log` VALUES (1832, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 09:59:06', '2021-12-23 09:59:06');
INSERT INTO `admin_operation_log` VALUES (1833, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:59:08', '2021-12-23 09:59:08');
INSERT INTO `admin_operation_log` VALUES (1834, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 09:59:36', '2021-12-23 09:59:36');
INSERT INTO `admin_operation_log` VALUES (1835, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 09:59:40', '2021-12-23 09:59:40');
INSERT INTO `admin_operation_log` VALUES (1836, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 09:59:40', '2021-12-23 09:59:40');
INSERT INTO `admin_operation_log` VALUES (1837, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 09:59:42', '2021-12-23 09:59:42');
INSERT INTO `admin_operation_log` VALUES (1838, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 10:01:09', '2021-12-23 10:01:09');
INSERT INTO `admin_operation_log` VALUES (1839, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 10:01:09', '2021-12-23 10:01:09');
INSERT INTO `admin_operation_log` VALUES (1840, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:01:20', '2021-12-23 10:01:20');
INSERT INTO `admin_operation_log` VALUES (1841, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 10:01:24', '2021-12-23 10:01:24');
INSERT INTO `admin_operation_log` VALUES (1842, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:01:36', '2021-12-23 10:01:36');
INSERT INTO `admin_operation_log` VALUES (1843, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 10:01:42', '2021-12-23 10:01:42');
INSERT INTO `admin_operation_log` VALUES (1844, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:01:55', '2021-12-23 10:01:55');
INSERT INTO `admin_operation_log` VALUES (1845, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:01:56', '2021-12-23 10:01:56');
INSERT INTO `admin_operation_log` VALUES (1846, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 10:02:01', '2021-12-23 10:02:01');
INSERT INTO `admin_operation_log` VALUES (1847, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:02:37', '2021-12-23 10:02:37');
INSERT INTO `admin_operation_log` VALUES (1848, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:02:38', '2021-12-23 10:02:38');
INSERT INTO `admin_operation_log` VALUES (1849, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 10:02:43', '2021-12-23 10:02:43');
INSERT INTO `admin_operation_log` VALUES (1850, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:03:41', '2021-12-23 10:03:41');
INSERT INTO `admin_operation_log` VALUES (1851, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:03:42', '2021-12-23 10:03:42');
INSERT INTO `admin_operation_log` VALUES (1852, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:03:43', '2021-12-23 10:03:43');
INSERT INTO `admin_operation_log` VALUES (1853, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":null,\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 10:03:47', '2021-12-23 10:03:47');
INSERT INTO `admin_operation_log` VALUES (1854, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:04:38', '2021-12-23 10:04:38');
INSERT INTO `admin_operation_log` VALUES (1855, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:04:39', '2021-12-23 10:04:39');
INSERT INTO `admin_operation_log` VALUES (1856, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:06:38', '2021-12-23 10:06:38');
INSERT INTO `admin_operation_log` VALUES (1857, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-23 10:06:48', '2021-12-23 10:06:48');
INSERT INTO `admin_operation_log` VALUES (1858, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\"}', '2021-12-23 10:07:17', '2021-12-23 10:07:17');
INSERT INTO `admin_operation_log` VALUES (1859, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 10:07:18', '2021-12-23 10:07:18');
INSERT INTO `admin_operation_log` VALUES (1860, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 10:16:10', '2021-12-23 10:16:10');
INSERT INTO `admin_operation_log` VALUES (1861, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 11:24:49', '2021-12-23 11:24:49');
INSERT INTO `admin_operation_log` VALUES (1862, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 11:24:49', '2021-12-23 11:24:49');
INSERT INTO `admin_operation_log` VALUES (1863, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 11:24:52', '2021-12-23 11:24:52');
INSERT INTO `admin_operation_log` VALUES (1864, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 11:24:57', '2021-12-23 11:24:57');
INSERT INTO `admin_operation_log` VALUES (1865, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 11:24:57', '2021-12-23 11:24:57');
INSERT INTO `admin_operation_log` VALUES (1866, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 11:25:29', '2021-12-23 11:25:29');
INSERT INTO `admin_operation_log` VALUES (1867, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 11:25:57', '2021-12-23 11:25:57');
INSERT INTO `admin_operation_log` VALUES (1868, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 11:25:58', '2021-12-23 11:25:58');
INSERT INTO `admin_operation_log` VALUES (1869, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 11:26:00', '2021-12-23 11:26:00');
INSERT INTO `admin_operation_log` VALUES (1870, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7VVSDx8wnfEQJIuJ48epHwKVbA3bNox01D1OoDoS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-23 11:26:07', '2021-12-23 11:26:07');
INSERT INTO `admin_operation_log` VALUES (1871, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-23 11:26:07', '2021-12-23 11:26:07');
INSERT INTO `admin_operation_log` VALUES (1872, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-23 11:26:10', '2021-12-23 11:26:10');
INSERT INTO `admin_operation_log` VALUES (1873, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-24 13:51:59', '2021-12-24 13:51:59');
INSERT INTO `admin_operation_log` VALUES (1874, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-24 13:52:39', '2021-12-24 13:52:39');
INSERT INTO `admin_operation_log` VALUES (1875, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-24 13:52:42', '2021-12-24 13:52:42');
INSERT INTO `admin_operation_log` VALUES (1876, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"Q1JXODOTgnRqVIscZ6xSPQgG6jRgMCEipWWFKzDr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2021-12-24 13:52:45', '2021-12-24 13:52:45');
INSERT INTO `admin_operation_log` VALUES (1877, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-24 13:52:45', '2021-12-24 13:52:45');
INSERT INTO `admin_operation_log` VALUES (1878, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-24 13:52:46', '2021-12-24 13:52:46');
INSERT INTO `admin_operation_log` VALUES (1879, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 13:53:02', '2021-12-24 13:53:02');
INSERT INTO `admin_operation_log` VALUES (1880, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 13:53:04', '2021-12-24 13:53:04');
INSERT INTO `admin_operation_log` VALUES (1881, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"Q1JXODOTgnRqVIscZ6xSPQgG6jRgMCEipWWFKzDr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-24 13:53:05', '2021-12-24 13:53:05');
INSERT INTO `admin_operation_log` VALUES (1882, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-24 13:53:05', '2021-12-24 13:53:05');
INSERT INTO `admin_operation_log` VALUES (1883, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-24 17:31:25', '2021-12-24 17:31:25');
INSERT INTO `admin_operation_log` VALUES (1884, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 17:31:27', '2021-12-24 17:31:27');
INSERT INTO `admin_operation_log` VALUES (1885, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7i3JzkH9gdwBnzeDuNaKf1RDDRZXQvISBc0BaxKm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-24 17:31:29', '2021-12-24 17:31:29');
INSERT INTO `admin_operation_log` VALUES (1886, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 17:31:43', '2021-12-24 17:31:43');
INSERT INTO `admin_operation_log` VALUES (1887, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-24 17:31:45', '2021-12-24 17:31:45');
INSERT INTO `admin_operation_log` VALUES (1888, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"7i3JzkH9gdwBnzeDuNaKf1RDDRZXQvISBc0BaxKm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-24 17:31:46', '2021-12-24 17:31:46');
INSERT INTO `admin_operation_log` VALUES (1889, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 17:32:46', '2021-12-24 17:32:46');
INSERT INTO `admin_operation_log` VALUES (1890, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-24 20:30:20', '2021-12-24 20:30:20');
INSERT INTO `admin_operation_log` VALUES (1891, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":null,\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:30:22', '2021-12-24 20:30:22');
INSERT INTO `admin_operation_log` VALUES (1892, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:32:50', '2021-12-24 20:32:50');
INSERT INTO `admin_operation_log` VALUES (1893, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"10:00:00\",\"end\":\"17:00:00\"},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:33:06', '2021-12-24 20:33:06');
INSERT INTO `admin_operation_log` VALUES (1894, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:33:48', '2021-12-24 20:33:48');
INSERT INTO `admin_operation_log` VALUES (1895, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"10:00:00\",\"end\":\"17:00:00\"},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:33:49', '2021-12-24 20:33:49');
INSERT INTO `admin_operation_log` VALUES (1896, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:36:05', '2021-12-24 20:36:05');
INSERT INTO `admin_operation_log` VALUES (1897, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"1\",\"frequency\":{\"hours\":\"1\"},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:36:12', '2021-12-24 20:36:12');
INSERT INTO `admin_operation_log` VALUES (1898, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:37:52', '2021-12-24 20:37:52');
INSERT INTO `admin_operation_log` VALUES (1899, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:37:59', '2021-12-24 20:37:59');
INSERT INTO `admin_operation_log` VALUES (1900, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:38:16', '2021-12-24 20:38:16');
INSERT INTO `admin_operation_log` VALUES (1901, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"3\",null],\"device_id\":[\"1\",\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:38:22', '2021-12-24 20:38:22');
INSERT INTO `admin_operation_log` VALUES (1902, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:39:05', '2021-12-24 20:39:05');
INSERT INTO `admin_operation_log` VALUES (1903, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:39:28', '2021-12-24 20:39:28');
INSERT INTO `admin_operation_log` VALUES (1904, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:39:53', '2021-12-24 20:39:53');
INSERT INTO `admin_operation_log` VALUES (1905, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:39:54', '2021-12-24 20:39:54');
INSERT INTO `admin_operation_log` VALUES (1906, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:40:20', '2021-12-24 20:40:20');
INSERT INTO `admin_operation_log` VALUES (1907, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-16\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:40:26', '2021-12-24 20:40:26');
INSERT INTO `admin_operation_log` VALUES (1908, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:40:28', '2021-12-24 20:40:28');
INSERT INTO `admin_operation_log` VALUES (1909, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-25\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:42:40', '2021-12-24 20:42:40');
INSERT INTO `admin_operation_log` VALUES (1910, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:42:57', '2021-12-24 20:42:57');
INSERT INTO `admin_operation_log` VALUES (1911, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-25\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:44:20', '2021-12-24 20:44:20');
INSERT INTO `admin_operation_log` VALUES (1912, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-24 20:44:31', '2021-12-24 20:44:31');
INSERT INTO `admin_operation_log` VALUES (1913, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"0\",\"start\":null,\"end\":null},\"_token\":\"xlz9JypjlfDugnTpAQR4pvlczL14RGgF3SMhV9GM\",\"_method\":\"PUT\"}', '2021-12-24 20:44:34', '2021-12-24 20:44:34');
INSERT INTO `admin_operation_log` VALUES (1914, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-25 13:47:37', '2021-12-25 13:47:37');
INSERT INTO `admin_operation_log` VALUES (1915, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-25 13:47:39', '2021-12-25 13:47:39');
INSERT INTO `admin_operation_log` VALUES (1916, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-26 15:48:10', '2021-12-26 15:48:10');
INSERT INTO `admin_operation_log` VALUES (1917, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-26 15:48:12', '2021-12-26 15:48:12');
INSERT INTO `admin_operation_log` VALUES (1918, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-26 15:54:59', '2021-12-26 15:54:59');
INSERT INTO `admin_operation_log` VALUES (1919, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-26 16:25:10', '2021-12-26 16:25:10');
INSERT INTO `admin_operation_log` VALUES (1920, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-26 16:25:13', '2021-12-26 16:25:13');
INSERT INTO `admin_operation_log` VALUES (1921, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-26 16:28:47', '2021-12-26 16:28:47');
INSERT INTO `admin_operation_log` VALUES (1922, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-26 16:29:36', '2021-12-26 16:29:36');
INSERT INTO `admin_operation_log` VALUES (1923, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-26 17:15:32', '2021-12-26 17:15:32');
INSERT INTO `admin_operation_log` VALUES (1924, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-26 17:53:58', '2021-12-26 17:53:58');
INSERT INTO `admin_operation_log` VALUES (1925, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-27 10:13:57', '2021-12-27 10:13:57');
INSERT INTO `admin_operation_log` VALUES (1926, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 10:14:01', '2021-12-27 10:14:01');
INSERT INTO `admin_operation_log` VALUES (1927, 1, 'admin', 'GET', '192.168.110.243', '[]', '2021-12-27 10:17:19', '2021-12-27 10:17:19');
INSERT INTO `admin_operation_log` VALUES (1928, 1, 'admin', 'GET', '192.168.110.243', '[]', '2021-12-27 10:21:44', '2021-12-27 10:21:44');
INSERT INTO `admin_operation_log` VALUES (1929, 1, 'admin/qrcode', 'GET', '192.168.110.243', '[]', '2021-12-27 10:22:31', '2021-12-27 10:22:31');
INSERT INTO `admin_operation_log` VALUES (1930, 1, 'admin/qrcode', 'GET', '192.168.110.243', '[]', '2021-12-27 10:23:02', '2021-12-27 10:23:02');
INSERT INTO `admin_operation_log` VALUES (1931, 1, 'admin/qrcode', 'GET', '192.168.110.243', '[]', '2021-12-27 10:23:23', '2021-12-27 10:23:23');
INSERT INTO `admin_operation_log` VALUES (1932, 1, 'admin', 'GET', '192.168.110.243', '[]', '2021-12-27 10:23:26', '2021-12-27 10:23:26');
INSERT INTO `admin_operation_log` VALUES (1933, 1, 'admin/qrcode', 'GET', '192.168.110.243', '[]', '2021-12-27 10:23:28', '2021-12-27 10:23:28');
INSERT INTO `admin_operation_log` VALUES (1934, 1, 'admin/qrcode', 'GET', '192.168.110.243', '[]', '2021-12-27 10:24:08', '2021-12-27 10:24:08');
INSERT INTO `admin_operation_log` VALUES (1935, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 16:58:04', '2021-12-27 16:58:04');
INSERT INTO `admin_operation_log` VALUES (1936, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"1\",\"frequency\":{\"hours\":\"5\"},\"_token\":\"8Meq8fXpf7CmfNkAm1aZYpjrztBs58nMbqhTpwvZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-27 16:58:14', '2021-12-27 16:58:14');
INSERT INTO `admin_operation_log` VALUES (1937, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 16:58:39', '2021-12-27 16:58:39');
INSERT INTO `admin_operation_log` VALUES (1938, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"00:00:00\",\"end\":\"08:00:00\"},\"_token\":\"8Meq8fXpf7CmfNkAm1aZYpjrztBs58nMbqhTpwvZ\",\"_method\":\"PUT\"}', '2021-12-27 16:58:48', '2021-12-27 16:58:48');
INSERT INTO `admin_operation_log` VALUES (1939, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-27 18:18:57', '2021-12-27 18:18:57');
INSERT INTO `admin_operation_log` VALUES (1940, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:18:59', '2021-12-27 18:18:59');
INSERT INTO `admin_operation_log` VALUES (1941, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:20:11', '2021-12-27 18:20:11');
INSERT INTO `admin_operation_log` VALUES (1942, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:23:30', '2021-12-27 18:23:30');
INSERT INTO `admin_operation_log` VALUES (1943, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:25:06', '2021-12-27 18:25:06');
INSERT INTO `admin_operation_log` VALUES (1944, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:31:13', '2021-12-27 18:31:13');
INSERT INTO `admin_operation_log` VALUES (1945, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:33:29', '2021-12-27 18:33:29');
INSERT INTO `admin_operation_log` VALUES (1946, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:49:15', '2021-12-27 18:49:15');
INSERT INTO `admin_operation_log` VALUES (1947, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 18:54:58', '2021-12-27 18:54:58');
INSERT INTO `admin_operation_log` VALUES (1948, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 19:17:02', '2021-12-27 19:17:02');
INSERT INTO `admin_operation_log` VALUES (1949, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 19:18:48', '2021-12-27 19:18:48');
INSERT INTO `admin_operation_log` VALUES (1950, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-27 19:19:04', '2021-12-27 19:19:04');
INSERT INTO `admin_operation_log` VALUES (1951, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-28 14:37:57', '2021-12-28 14:37:57');
INSERT INTO `admin_operation_log` VALUES (1952, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 17:27:55', '2021-12-28 17:27:55');
INSERT INTO `admin_operation_log` VALUES (1953, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 17:28:18', '2021-12-28 17:28:18');
INSERT INTO `admin_operation_log` VALUES (1954, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 17:40:43', '2021-12-28 17:40:43');
INSERT INTO `admin_operation_log` VALUES (1955, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 17:40:45', '2021-12-28 17:40:45');
INSERT INTO `admin_operation_log` VALUES (1956, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-28 20:27:19', '2021-12-28 20:27:19');
INSERT INTO `admin_operation_log` VALUES (1957, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2021-12-28 20:27:24', '2021-12-28 20:27:24');
INSERT INTO `admin_operation_log` VALUES (1958, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-28 20:27:29', '2021-12-28 20:27:29');
INSERT INTO `admin_operation_log` VALUES (1959, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 20:27:31', '2021-12-28 20:27:31');
INSERT INTO `admin_operation_log` VALUES (1960, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 20:27:34', '2021-12-28 20:27:34');
INSERT INTO `admin_operation_log` VALUES (1961, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"2SEFSxaPIvVmK6KnPCmihVO0wQKKk961NWfj50y4\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-28 20:27:41', '2021-12-28 20:27:41');
INSERT INTO `admin_operation_log` VALUES (1962, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 20:31:02', '2021-12-28 20:31:02');
INSERT INTO `admin_operation_log` VALUES (1963, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23 00:00:00\",\"endtime\":\"2021-12-31 00:00:00\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"2SEFSxaPIvVmK6KnPCmihVO0wQKKk961NWfj50y4\",\"_method\":\"PUT\"}', '2021-12-28 20:32:31', '2021-12-28 20:32:31');
INSERT INTO `admin_operation_log` VALUES (1964, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-28 20:32:42', '2021-12-28 20:32:42');
INSERT INTO `admin_operation_log` VALUES (1965, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-28 20:32:43', '2021-12-28 20:32:43');
INSERT INTO `admin_operation_log` VALUES (1966, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"2SEFSxaPIvVmK6KnPCmihVO0wQKKk961NWfj50y4\",\"_method\":\"PUT\"}', '2021-12-28 20:32:47', '2021-12-28 20:32:47');
INSERT INTO `admin_operation_log` VALUES (1967, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 09:26:41', '2021-12-29 09:26:41');
INSERT INTO `admin_operation_log` VALUES (1968, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 09:26:42', '2021-12-29 09:26:42');
INSERT INTO `admin_operation_log` VALUES (1969, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 10:15:39', '2021-12-29 10:15:39');
INSERT INTO `admin_operation_log` VALUES (1970, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-29 10:15:41', '2021-12-29 10:15:41');
INSERT INTO `admin_operation_log` VALUES (1971, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 11:52:16', '2021-12-29 11:52:16');
INSERT INTO `admin_operation_log` VALUES (1972, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 11:52:16', '2021-12-29 11:52:16');
INSERT INTO `admin_operation_log` VALUES (1973, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\"}', '2021-12-29 11:52:18', '2021-12-29 11:52:18');
INSERT INTO `admin_operation_log` VALUES (1974, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 11:58:48', '2021-12-29 11:58:48');
INSERT INTO `admin_operation_log` VALUES (1975, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 11:58:49', '2021-12-29 11:58:49');
INSERT INTO `admin_operation_log` VALUES (1976, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 11:58:51', '2021-12-29 11:58:51');
INSERT INTO `admin_operation_log` VALUES (1977, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"endtime\",\"type\":\"desc\"}}', '2021-12-29 11:58:56', '2021-12-29 11:58:56');
INSERT INTO `admin_operation_log` VALUES (1978, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"endtime\",\"type\":\"asc\"}}', '2021-12-29 11:58:57', '2021-12-29 11:58:57');
INSERT INTO `admin_operation_log` VALUES (1979, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 11:59:03', '2021-12-29 11:59:03');
INSERT INTO `admin_operation_log` VALUES (1980, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 11:59:05', '2021-12-29 11:59:05');
INSERT INTO `admin_operation_log` VALUES (1981, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-29 12:00:11', '2021-12-29 12:00:11');
INSERT INTO `admin_operation_log` VALUES (1982, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"0\",\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\"}', '2021-12-29 12:00:18', '2021-12-29 12:00:18');
INSERT INTO `admin_operation_log` VALUES (1983, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-29 12:00:21', '2021-12-29 12:00:21');
INSERT INTO `admin_operation_log` VALUES (1984, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"0\",\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\"}', '2021-12-29 12:00:38', '2021-12-29 12:00:38');
INSERT INTO `admin_operation_log` VALUES (1985, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-29 12:00:39', '2021-12-29 12:00:39');
INSERT INTO `admin_operation_log` VALUES (1986, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2021-12-29 12:01:16', '2021-12-29 12:01:16');
INSERT INTO `admin_operation_log` VALUES (1987, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"lock\":\"1\",\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\"}', '2021-12-29 12:01:20', '2021-12-29 12:01:20');
INSERT INTO `admin_operation_log` VALUES (1988, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:01:51', '2021-12-29 12:01:51');
INSERT INTO `admin_operation_log` VALUES (1989, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:01:54', '2021-12-29 12:01:54');
INSERT INTO `admin_operation_log` VALUES (1990, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 12:02:26', '2021-12-29 12:02:26');
INSERT INTO `admin_operation_log` VALUES (1991, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 12:03:17', '2021-12-29 12:03:17');
INSERT INTO `admin_operation_log` VALUES (1992, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-29 12:03:23', '2021-12-29 12:03:23');
INSERT INTO `admin_operation_log` VALUES (1993, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:03:26', '2021-12-29 12:03:26');
INSERT INTO `admin_operation_log` VALUES (1994, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-29 12:03:26', '2021-12-29 12:03:26');
INSERT INTO `admin_operation_log` VALUES (1995, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-29 12:03:34', '2021-12-29 12:03:34');
INSERT INTO `admin_operation_log` VALUES (1996, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"active\":\"0\",\"_token\":\"os7L7e4chy7e4M7FbBpb9JY69c9aFRnOoA2yqYJF\",\"_method\":\"PUT\"}', '2021-12-29 12:03:38', '2021-12-29 12:03:38');
INSERT INTO `admin_operation_log` VALUES (1997, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:03:40', '2021-12-29 12:03:40');
INSERT INTO `admin_operation_log` VALUES (1998, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 12:03:55', '2021-12-29 12:03:55');
INSERT INTO `admin_operation_log` VALUES (1999, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-29 12:04:03', '2021-12-29 12:04:03');
INSERT INTO `admin_operation_log` VALUES (2000, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:04:06', '2021-12-29 12:04:06');
INSERT INTO `admin_operation_log` VALUES (2001, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2021-12-29 12:04:06', '2021-12-29 12:04:06');
INSERT INTO `admin_operation_log` VALUES (2002, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:04:31', '2021-12-29 12:04:31');
INSERT INTO `admin_operation_log` VALUES (2003, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:04:57', '2021-12-29 12:04:57');
INSERT INTO `admin_operation_log` VALUES (2004, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:32', '2021-12-29 12:06:32');
INSERT INTO `admin_operation_log` VALUES (2005, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:34', '2021-12-29 12:06:34');
INSERT INTO `admin_operation_log` VALUES (2006, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_columns_\":\"account_id,active,configs,created_at,device_id,endtime,errmsg,id,name,quality,starttime,status,task_id\",\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:38', '2021-12-29 12:06:38');
INSERT INTO `admin_operation_log` VALUES (2007, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_columns_\":\"account_id,active,configs,created_at,device_id,endtime,errmsg,id,name,quality,starttime,status,task_id\",\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:38', '2021-12-29 12:06:38');
INSERT INTO `admin_operation_log` VALUES (2008, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:42', '2021-12-29 12:06:42');
INSERT INTO `admin_operation_log` VALUES (2009, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_columns_\":\"account_id,active,configs,created_at,device_id,endtime,name,quality,starttime,status,task_id\",\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:06:47', '2021-12-29 12:06:47');
INSERT INTO `admin_operation_log` VALUES (2010, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:07:01', '2021-12-29 12:07:01');
INSERT INTO `admin_operation_log` VALUES (2011, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 12:07:03', '2021-12-29 12:07:03');
INSERT INTO `admin_operation_log` VALUES (2012, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-12-29 21:08:22', '2021-12-29 21:08:22');
INSERT INTO `admin_operation_log` VALUES (2013, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 21:08:29', '2021-12-29 21:08:29');
INSERT INTO `admin_operation_log` VALUES (2014, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 21:08:32', '2021-12-29 21:08:32');
INSERT INTO `admin_operation_log` VALUES (2015, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"jlBhr0BJpiYEIDWsJMsOzzJ8CxIiSy74TraymWlA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2021-12-29 21:08:34', '2021-12-29 21:08:34');
INSERT INTO `admin_operation_log` VALUES (2016, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 22:04:41', '2021-12-29 22:04:41');
INSERT INTO `admin_operation_log` VALUES (2017, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2021-12-29 22:04:42', '2021-12-29 22:04:42');
INSERT INTO `admin_operation_log` VALUES (2018, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"jlBhr0BJpiYEIDWsJMsOzzJ8CxIiSy74TraymWlA\",\"_method\":\"PUT\"}', '2021-12-29 22:04:43', '2021-12-29 22:04:43');
INSERT INTO `admin_operation_log` VALUES (2019, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 22:06:03', '2021-12-29 22:06:03');
INSERT INTO `admin_operation_log` VALUES (2020, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"jlBhr0BJpiYEIDWsJMsOzzJ8CxIiSy74TraymWlA\",\"_method\":\"PUT\"}', '2021-12-29 22:06:04', '2021-12-29 22:06:04');
INSERT INTO `admin_operation_log` VALUES (2021, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-29 22:08:52', '2021-12-29 22:08:52');
INSERT INTO `admin_operation_log` VALUES (2022, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"jlBhr0BJpiYEIDWsJMsOzzJ8CxIiSy74TraymWlA\",\"_method\":\"PUT\"}', '2021-12-29 22:08:54', '2021-12-29 22:08:54');
INSERT INTO `admin_operation_log` VALUES (2023, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-30 09:18:15', '2021-12-30 09:18:15');
INSERT INTO `admin_operation_log` VALUES (2024, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-30 09:20:22', '2021-12-30 09:20:22');
INSERT INTO `admin_operation_log` VALUES (2025, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-30 09:23:13', '2021-12-30 09:23:13');
INSERT INTO `admin_operation_log` VALUES (2026, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-30 14:04:44', '2021-12-30 14:04:44');
INSERT INTO `admin_operation_log` VALUES (2027, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"JyIHamgqwwd19F8VNV75PVA13RNWGvjHj1KyMupu\",\"_method\":\"PUT\"}', '2021-12-30 14:04:47', '2021-12-30 14:04:47');
INSERT INTO `admin_operation_log` VALUES (2028, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-30 14:05:55', '2021-12-30 14:05:55');
INSERT INTO `admin_operation_log` VALUES (2029, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2021-12-30 14:12:38', '2021-12-30 14:12:38');
INSERT INTO `admin_operation_log` VALUES (2030, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-12-30 14:36:42', '2021-12-30 14:36:42');
INSERT INTO `admin_operation_log` VALUES (2031, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2021-12-31\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"JyIHamgqwwd19F8VNV75PVA13RNWGvjHj1KyMupu\",\"_method\":\"PUT\"}', '2021-12-30 14:36:44', '2021-12-30 14:36:44');
INSERT INTO `admin_operation_log` VALUES (2032, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-04 11:00:10', '2022-01-04 11:00:10');
INSERT INTO `admin_operation_log` VALUES (2033, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:00:17', '2022-01-04 11:00:17');
INSERT INTO `admin_operation_log` VALUES (2034, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:03:03', '2022-01-04 11:03:03');
INSERT INTO `admin_operation_log` VALUES (2035, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:03:12', '2022-01-04 11:03:12');
INSERT INTO `admin_operation_log` VALUES (2036, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:03:36', '2022-01-04 11:03:36');
INSERT INTO `admin_operation_log` VALUES (2037, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:03:48', '2022-01-04 11:03:48');
INSERT INTO `admin_operation_log` VALUES (2038, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,task,user_num\",\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:03:56', '2022-01-04 11:03:56');
INSERT INTO `admin_operation_log` VALUES (2039, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,task,user_num\"}', '2022-01-04 11:06:45', '2022-01-04 11:06:45');
INSERT INTO `admin_operation_log` VALUES (2040, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,task,user_num\"}', '2022-01-04 11:07:04', '2022-01-04 11:07:04');
INSERT INTO `admin_operation_log` VALUES (2041, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:07:46', '2022-01-04 11:07:46');
INSERT INTO `admin_operation_log` VALUES (2042, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:10:32', '2022-01-04 11:10:32');
INSERT INTO `admin_operation_log` VALUES (2043, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:10:57', '2022-01-04 11:10:57');
INSERT INTO `admin_operation_log` VALUES (2044, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:11:18', '2022-01-04 11:11:18');
INSERT INTO `admin_operation_log` VALUES (2045, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:11:27', '2022-01-04 11:11:27');
INSERT INTO `admin_operation_log` VALUES (2046, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-04 11:28:29', '2022-01-04 11:28:29');
INSERT INTO `admin_operation_log` VALUES (2047, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:28:32', '2022-01-04 11:28:32');
INSERT INTO `admin_operation_log` VALUES (2048, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:28:42', '2022-01-04 11:28:42');
INSERT INTO `admin_operation_log` VALUES (2049, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:28:54', '2022-01-04 11:28:54');
INSERT INTO `admin_operation_log` VALUES (2050, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:29:07', '2022-01-04 11:29:07');
INSERT INTO `admin_operation_log` VALUES (2051, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:29:09', '2022-01-04 11:29:09');
INSERT INTO `admin_operation_log` VALUES (2052, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 11:29:10', '2022-01-04 11:29:10');
INSERT INTO `admin_operation_log` VALUES (2053, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:34:04', '2022-01-04 11:34:04');
INSERT INTO `admin_operation_log` VALUES (2054, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:34:29', '2022-01-04 11:34:29');
INSERT INTO `admin_operation_log` VALUES (2055, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:35:04', '2022-01-04 11:35:04');
INSERT INTO `admin_operation_log` VALUES (2056, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:35:55', '2022-01-04 11:35:55');
INSERT INTO `admin_operation_log` VALUES (2057, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:37:07', '2022-01-04 11:37:07');
INSERT INTO `admin_operation_log` VALUES (2058, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:37:12', '2022-01-04 11:37:12');
INSERT INTO `admin_operation_log` VALUES (2059, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:37:32', '2022-01-04 11:37:32');
INSERT INTO `admin_operation_log` VALUES (2060, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:37:56', '2022-01-04 11:37:56');
INSERT INTO `admin_operation_log` VALUES (2061, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:37:58', '2022-01-04 11:37:58');
INSERT INTO `admin_operation_log` VALUES (2062, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:38:02', '2022-01-04 11:38:02');
INSERT INTO `admin_operation_log` VALUES (2063, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 11:41:57', '2022-01-04 11:41:57');
INSERT INTO `admin_operation_log` VALUES (2064, 1, 'admin/accounts/1', 'PUT', '127.0.0.1', '{\"_token\":\"D3SWohiNBh9JLurA9NDYtBr7Jv2qpW9wh7vtf0nQ\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\",\"2\"]}', '2022-01-04 11:42:06', '2022-01-04 11:42:06');
INSERT INTO `admin_operation_log` VALUES (2065, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 19:31:09', '2022-01-04 19:31:09');
INSERT INTO `admin_operation_log` VALUES (2066, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 19:31:11', '2022-01-04 19:31:11');
INSERT INTO `admin_operation_log` VALUES (2067, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 19:31:12', '2022-01-04 19:31:12');
INSERT INTO `admin_operation_log` VALUES (2068, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-04 19:31:38', '2022-01-04 19:31:38');
INSERT INTO `admin_operation_log` VALUES (2069, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,id,jiaoben,lang,lock,model,rado,remark,status,system,task,user_num\",\"_pjax\":\"#pjax-container\"}', '2022-01-04 19:31:51', '2022-01-04 19:31:51');
INSERT INTO `admin_operation_log` VALUES (2070, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-04 19:31:58', '2022-01-04 19:31:58');
INSERT INTO `admin_operation_log` VALUES (2071, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-04 22:34:11', '2022-01-04 22:34:11');
INSERT INTO `admin_operation_log` VALUES (2072, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:20:53', '2022-01-05 11:20:53');
INSERT INTO `admin_operation_log` VALUES (2073, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:20:55', '2022-01-05 11:20:55');
INSERT INTO `admin_operation_log` VALUES (2074, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:23:43', '2022-01-05 11:23:43');
INSERT INTO `admin_operation_log` VALUES (2075, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:23:45', '2022-01-05 11:23:45');
INSERT INTO `admin_operation_log` VALUES (2076, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:24:29', '2022-01-05 11:24:29');
INSERT INTO `admin_operation_log` VALUES (2077, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 11:24:38', '2022-01-05 11:24:38');
INSERT INTO `admin_operation_log` VALUES (2078, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 16:27:16', '2022-01-05 16:27:16');
INSERT INTO `admin_operation_log` VALUES (2079, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:30:24', '2022-01-05 16:30:24');
INSERT INTO `admin_operation_log` VALUES (2080, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:30:50', '2022-01-05 16:30:50');
INSERT INTO `admin_operation_log` VALUES (2081, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:31:06', '2022-01-05 16:31:06');
INSERT INTO `admin_operation_log` VALUES (2082, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:31:16', '2022-01-05 16:31:16');
INSERT INTO `admin_operation_log` VALUES (2083, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 16:31:44', '2022-01-05 16:31:44');
INSERT INTO `admin_operation_log` VALUES (2084, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 16:32:19', '2022-01-05 16:32:19');
INSERT INTO `admin_operation_log` VALUES (2085, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:33:34', '2022-01-05 16:33:34');
INSERT INTO `admin_operation_log` VALUES (2086, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:34:15', '2022-01-05 16:34:15');
INSERT INTO `admin_operation_log` VALUES (2087, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:40:13', '2022-01-05 16:40:13');
INSERT INTO `admin_operation_log` VALUES (2088, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:41:56', '2022-01-05 16:41:56');
INSERT INTO `admin_operation_log` VALUES (2089, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:42:33', '2022-01-05 16:42:33');
INSERT INTO `admin_operation_log` VALUES (2090, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:42:41', '2022-01-05 16:42:41');
INSERT INTO `admin_operation_log` VALUES (2091, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:44:07', '2022-01-05 16:44:07');
INSERT INTO `admin_operation_log` VALUES (2092, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:44:16', '2022-01-05 16:44:16');
INSERT INTO `admin_operation_log` VALUES (2093, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:45:05', '2022-01-05 16:45:05');
INSERT INTO `admin_operation_log` VALUES (2094, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:45:20', '2022-01-05 16:45:20');
INSERT INTO `admin_operation_log` VALUES (2095, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:45:53', '2022-01-05 16:45:53');
INSERT INTO `admin_operation_log` VALUES (2096, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:46:19', '2022-01-05 16:46:19');
INSERT INTO `admin_operation_log` VALUES (2097, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:46:44', '2022-01-05 16:46:44');
INSERT INTO `admin_operation_log` VALUES (2098, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:47:30', '2022-01-05 16:47:30');
INSERT INTO `admin_operation_log` VALUES (2099, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:47:44', '2022-01-05 16:47:44');
INSERT INTO `admin_operation_log` VALUES (2100, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:48:18', '2022-01-05 16:48:18');
INSERT INTO `admin_operation_log` VALUES (2101, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:49:01', '2022-01-05 16:49:01');
INSERT INTO `admin_operation_log` VALUES (2102, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:49:34', '2022-01-05 16:49:34');
INSERT INTO `admin_operation_log` VALUES (2103, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:49:41', '2022-01-05 16:49:41');
INSERT INTO `admin_operation_log` VALUES (2104, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:49:53', '2022-01-05 16:49:53');
INSERT INTO `admin_operation_log` VALUES (2105, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-05 16:52:36', '2022-01-05 16:52:36');
INSERT INTO `admin_operation_log` VALUES (2106, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 16:53:04', '2022-01-05 16:53:04');
INSERT INTO `admin_operation_log` VALUES (2107, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 16:54:08', '2022-01-05 16:54:08');
INSERT INTO `admin_operation_log` VALUES (2108, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:54:08', '2022-01-05 16:54:08');
INSERT INTO `admin_operation_log` VALUES (2109, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:54:13', '2022-01-05 16:54:13');
INSERT INTO `admin_operation_log` VALUES (2110, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:56:39', '2022-01-05 16:56:39');
INSERT INTO `admin_operation_log` VALUES (2111, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:56:52', '2022-01-05 16:56:52');
INSERT INTO `admin_operation_log` VALUES (2112, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-05 16:58:31', '2022-01-05 16:58:31');
INSERT INTO `admin_operation_log` VALUES (2113, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:49:17', '2022-01-05 17:49:17');
INSERT INTO `admin_operation_log` VALUES (2114, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:49:22', '2022-01-05 17:49:22');
INSERT INTO `admin_operation_log` VALUES (2115, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:51:25', '2022-01-05 17:51:25');
INSERT INTO `admin_operation_log` VALUES (2116, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:51:33', '2022-01-05 17:51:33');
INSERT INTO `admin_operation_log` VALUES (2117, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-05 17:51:35', '2022-01-05 17:51:35');
INSERT INTO `admin_operation_log` VALUES (2118, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 11:59:52', '2022-01-06 11:59:52');
INSERT INTO `admin_operation_log` VALUES (2119, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 12:03:02', '2022-01-06 12:03:02');
INSERT INTO `admin_operation_log` VALUES (2120, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 12:03:15', '2022-01-06 12:03:15');
INSERT INTO `admin_operation_log` VALUES (2121, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 12:03:26', '2022-01-06 12:03:26');
INSERT INTO `admin_operation_log` VALUES (2122, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 13:40:32', '2022-01-06 13:40:32');
INSERT INTO `admin_operation_log` VALUES (2123, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-06 13:43:32', '2022-01-06 13:43:32');
INSERT INTO `admin_operation_log` VALUES (2124, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-07 09:36:11', '2022-01-07 09:36:11');
INSERT INTO `admin_operation_log` VALUES (2125, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 09:36:18', '2022-01-07 09:36:18');
INSERT INTO `admin_operation_log` VALUES (2126, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 09:36:20', '2022-01-07 09:36:20');
INSERT INTO `admin_operation_log` VALUES (2127, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-07 11:50:15', '2022-01-07 11:50:15');
INSERT INTO `admin_operation_log` VALUES (2128, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 11:50:17', '2022-01-07 11:50:17');
INSERT INTO `admin_operation_log` VALUES (2129, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-07 14:30:38', '2022-01-07 14:30:38');
INSERT INTO `admin_operation_log` VALUES (2130, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-07 15:02:13', '2022-01-07 15:02:13');
INSERT INTO `admin_operation_log` VALUES (2131, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 15:02:26', '2022-01-07 15:02:26');
INSERT INTO `admin_operation_log` VALUES (2132, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 18:03:30', '2022-01-07 18:03:30');
INSERT INTO `admin_operation_log` VALUES (2133, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-07 18:03:33', '2022-01-07 18:03:33');
INSERT INTO `admin_operation_log` VALUES (2134, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-09 14:35:50', '2022-01-09 14:35:50');
INSERT INTO `admin_operation_log` VALUES (2135, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-09 14:35:57', '2022-01-09 14:35:57');
INSERT INTO `admin_operation_log` VALUES (2136, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-09 14:36:02', '2022-01-09 14:36:02');
INSERT INTO `admin_operation_log` VALUES (2137, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"t5qTrEgQ1r9mAcROkbcMJEudBHE4cZiKH7qr8cDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-09 14:39:03', '2022-01-09 14:39:03');
INSERT INTO `admin_operation_log` VALUES (2138, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-09 14:39:19', '2022-01-09 14:39:19');
INSERT INTO `admin_operation_log` VALUES (2139, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-10 10:19:39', '2022-01-10 10:19:39');
INSERT INTO `admin_operation_log` VALUES (2140, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-10 10:27:27', '2022-01-10 10:27:27');
INSERT INTO `admin_operation_log` VALUES (2141, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-10 10:27:31', '2022-01-10 10:27:31');
INSERT INTO `admin_operation_log` VALUES (2142, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 10:43:53', '2022-01-10 10:43:53');
INSERT INTO `admin_operation_log` VALUES (2143, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 10:43:56', '2022-01-10 10:43:56');
INSERT INTO `admin_operation_log` VALUES (2144, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:07', '2022-01-10 14:36:07');
INSERT INTO `admin_operation_log` VALUES (2145, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:16', '2022-01-10 14:36:16');
INSERT INTO `admin_operation_log` VALUES (2146, 1, 'admin/group-accounts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:19', '2022-01-10 14:36:19');
INSERT INTO `admin_operation_log` VALUES (2147, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:25', '2022-01-10 14:36:25');
INSERT INTO `admin_operation_log` VALUES (2148, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:40', '2022-01-10 14:36:40');
INSERT INTO `admin_operation_log` VALUES (2149, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:36:54', '2022-01-10 14:36:54');
INSERT INTO `admin_operation_log` VALUES (2150, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"test\",\"name\":\"\\u6d4b\\u8bd5\\u8d26\\u53f7\",\"password\":\"111111\",\"password_confirmation\":\"111111\",\"roles\":[null],\"permissions\":[null],\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/users\"}', '2022-01-10 14:37:00', '2022-01-10 14:37:00');
INSERT INTO `admin_operation_log` VALUES (2151, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2022-01-10 14:37:01', '2022-01-10 14:37:01');
INSERT INTO `admin_operation_log` VALUES (2152, 2, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-10 14:37:02', '2022-01-10 14:37:02');
INSERT INTO `admin_operation_log` VALUES (2153, 2, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:07', '2022-01-10 14:37:07');
INSERT INTO `admin_operation_log` VALUES (2154, 2, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:08', '2022-01-10 14:37:08');
INSERT INTO `admin_operation_log` VALUES (2155, 2, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:09', '2022-01-10 14:37:09');
INSERT INTO `admin_operation_log` VALUES (2156, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:13', '2022-01-10 14:37:13');
INSERT INTO `admin_operation_log` VALUES (2157, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:15', '2022-01-10 14:37:15');
INSERT INTO `admin_operation_log` VALUES (2158, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:21', '2022-01-10 14:37:21');
INSERT INTO `admin_operation_log` VALUES (2159, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:26', '2022-01-10 14:37:26');
INSERT INTO `admin_operation_log` VALUES (2160, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:29', '2022-01-10 14:37:29');
INSERT INTO `admin_operation_log` VALUES (2161, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:37:31', '2022-01-10 14:37:31');
INSERT INTO `admin_operation_log` VALUES (2162, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"devicegroup\",\"name\":\"\\u8bbe\\u5907\\u7ec4\\u7ba1\\u7406\",\"http_method\":[\"GET\",\"PUT\",null],\"http_path\":\"\\/group-devices\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/permissions\"}', '2022-01-10 14:38:07', '2022-01-10 14:38:07');
INSERT INTO `admin_operation_log` VALUES (2163, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2022-01-10 14:38:08', '2022-01-10 14:38:08');
INSERT INTO `admin_operation_log` VALUES (2164, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:14', '2022-01-10 14:38:14');
INSERT INTO `admin_operation_log` VALUES (2165, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:17', '2022-01-10 14:38:17');
INSERT INTO `admin_operation_log` VALUES (2166, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"test\",\"name\":\"\\u6d4b\\u8bd5\\u8d26\\u53f7\",\"password\":\"$2y$10$Wr05gZbHgBZyux4u5nIzMuMOCY1WZOmXCaOvslHX58nb2JvevHXXm\",\"password_confirmation\":\"$2y$10$Wr05gZbHgBZyux4u5nIzMuMOCY1WZOmXCaOvslHX58nb2JvevHXXm\",\"roles\":[null],\"permissions\":[\"6\",null],\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/users\"}', '2022-01-10 14:38:22', '2022-01-10 14:38:22');
INSERT INTO `admin_operation_log` VALUES (2167, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2022-01-10 14:38:22', '2022-01-10 14:38:22');
INSERT INTO `admin_operation_log` VALUES (2168, 2, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 14:38:23', '2022-01-10 14:38:23');
INSERT INTO `admin_operation_log` VALUES (2169, 2, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:25', '2022-01-10 14:38:25');
INSERT INTO `admin_operation_log` VALUES (2170, 2, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:27', '2022-01-10 14:38:27');
INSERT INTO `admin_operation_log` VALUES (2171, 2, 'admin/group-devices/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:30', '2022-01-10 14:38:30');
INSERT INTO `admin_operation_log` VALUES (2172, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:37', '2022-01-10 14:38:37');
INSERT INTO `admin_operation_log` VALUES (2173, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:38:39', '2022-01-10 14:38:39');
INSERT INTO `admin_operation_log` VALUES (2174, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"devicegroup\",\"name\":\"\\u8bbe\\u5907\\u7ec4\\u7ba1\\u7406\",\"http_method\":[\"GET\",\"POST\",null],\"http_path\":\"\\/group-devices\\r\\n\\/group-devices\\/create\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/permissions\"}', '2022-01-10 14:38:54', '2022-01-10 14:38:54');
INSERT INTO `admin_operation_log` VALUES (2175, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2022-01-10 14:38:54', '2022-01-10 14:38:54');
INSERT INTO `admin_operation_log` VALUES (2176, 2, 'admin/group-devices/create', 'GET', '127.0.0.1', '[]', '2022-01-10 14:38:58', '2022-01-10 14:38:58');
INSERT INTO `admin_operation_log` VALUES (2177, 2, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 14:39:04', '2022-01-10 14:39:04');
INSERT INTO `admin_operation_log` VALUES (2178, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 16:19:32', '2022-01-10 16:19:32');
INSERT INTO `admin_operation_log` VALUES (2179, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 16:20:21', '2022-01-10 16:20:21');
INSERT INTO `admin_operation_log` VALUES (2180, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 16:20:37', '2022-01-10 16:20:37');
INSERT INTO `admin_operation_log` VALUES (2181, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 16:20:38', '2022-01-10 16:20:38');
INSERT INTO `admin_operation_log` VALUES (2182, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 16:20:39', '2022-01-10 16:20:39');
INSERT INTO `admin_operation_log` VALUES (2183, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-10 16:22:04', '2022-01-10 16:22:04');
INSERT INTO `admin_operation_log` VALUES (2184, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-10 17:17:48', '2022-01-10 17:17:48');
INSERT INTO `admin_operation_log` VALUES (2185, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-10 17:44:28', '2022-01-10 17:44:28');
INSERT INTO `admin_operation_log` VALUES (2186, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-10 17:44:41', '2022-01-10 17:44:41');
INSERT INTO `admin_operation_log` VALUES (2187, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-10 17:45:00', '2022-01-10 17:45:00');
INSERT INTO `admin_operation_log` VALUES (2188, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:47:17', '2022-01-10 17:47:17');
INSERT INTO `admin_operation_log` VALUES (2189, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:55:15', '2022-01-10 17:55:15');
INSERT INTO `admin_operation_log` VALUES (2190, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 17:58:34', '2022-01-10 17:58:34');
INSERT INTO `admin_operation_log` VALUES (2191, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 17:58:44', '2022-01-10 17:58:44');
INSERT INTO `admin_operation_log` VALUES (2192, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:58:47', '2022-01-10 17:58:47');
INSERT INTO `admin_operation_log` VALUES (2193, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:58:48', '2022-01-10 17:58:48');
INSERT INTO `admin_operation_log` VALUES (2194, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:58:51', '2022-01-10 17:58:51');
INSERT INTO `admin_operation_log` VALUES (2195, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$nIu6ZCw.PX\\/S9bzqH9UQ2.cdWCHvvLa\\/\\/VGQh\\/1DcXbU4VP1KpIQG\",\"password_confirmation\":\"$2y$10$nIu6ZCw.PX\\/S9bzqH9UQ2.cdWCHvvLa\\/\\/VGQh\\/1DcXbU4VP1KpIQG\",\"roles\":[\"1\",null],\"permissions\":[\"6\",null],\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/users\"}', '2022-01-10 17:58:59', '2022-01-10 17:58:59');
INSERT INTO `admin_operation_log` VALUES (2196, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2022-01-10 17:58:59', '2022-01-10 17:58:59');
INSERT INTO `admin_operation_log` VALUES (2197, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:01', '2022-01-10 17:59:01');
INSERT INTO `admin_operation_log` VALUES (2198, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:02', '2022-01-10 17:59:02');
INSERT INTO `admin_operation_log` VALUES (2199, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 17:59:06', '2022-01-10 17:59:06');
INSERT INTO `admin_operation_log` VALUES (2200, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 17:59:19', '2022-01-10 17:59:19');
INSERT INTO `admin_operation_log` VALUES (2201, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:21', '2022-01-10 17:59:21');
INSERT INTO `admin_operation_log` VALUES (2202, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:24', '2022-01-10 17:59:24');
INSERT INTO `admin_operation_log` VALUES (2203, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:26', '2022-01-10 17:59:26');
INSERT INTO `admin_operation_log` VALUES (2204, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$nIu6ZCw.PX\\/S9bzqH9UQ2.cdWCHvvLa\\/\\/VGQh\\/1DcXbU4VP1KpIQG\",\"password_confirmation\":\"$2y$10$nIu6ZCw.PX\\/S9bzqH9UQ2.cdWCHvvLa\\/\\/VGQh\\/1DcXbU4VP1KpIQG\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/users\"}', '2022-01-10 17:59:30', '2022-01-10 17:59:30');
INSERT INTO `admin_operation_log` VALUES (2205, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2022-01-10 17:59:30', '2022-01-10 17:59:30');
INSERT INTO `admin_operation_log` VALUES (2206, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:31', '2022-01-10 17:59:31');
INSERT INTO `admin_operation_log` VALUES (2207, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:34', '2022-01-10 17:59:34');
INSERT INTO `admin_operation_log` VALUES (2208, 1, 'admin/auth/roles/1', 'PUT', '127.0.0.1', '{\"slug\":\"administrator\",\"name\":\"Administrator\",\"permissions\":[\"1\",\"6\",null],\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/roles\"}', '2022-01-10 17:59:37', '2022-01-10 17:59:37');
INSERT INTO `admin_operation_log` VALUES (2209, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2022-01-10 17:59:37', '2022-01-10 17:59:37');
INSERT INTO `admin_operation_log` VALUES (2210, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 17:59:42', '2022-01-10 17:59:42');
INSERT INTO `admin_operation_log` VALUES (2211, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:00:48', '2022-01-10 18:00:48');
INSERT INTO `admin_operation_log` VALUES (2212, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2022-01-10 18:00:54', '2022-01-10 18:00:54');
INSERT INTO `admin_operation_log` VALUES (2213, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:00:57', '2022-01-10 18:00:57');
INSERT INTO `admin_operation_log` VALUES (2214, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:03', '2022-01-10 18:01:03');
INSERT INTO `admin_operation_log` VALUES (2215, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:26', '2022-01-10 18:01:26');
INSERT INTO `admin_operation_log` VALUES (2216, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:32', '2022-01-10 18:01:32');
INSERT INTO `admin_operation_log` VALUES (2217, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:33', '2022-01-10 18:01:33');
INSERT INTO `admin_operation_log` VALUES (2218, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:36', '2022-01-10 18:01:36');
INSERT INTO `admin_operation_log` VALUES (2219, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:40', '2022-01-10 18:01:40');
INSERT INTO `admin_operation_log` VALUES (2220, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:47', '2022-01-10 18:01:47');
INSERT INTO `admin_operation_log` VALUES (2221, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:57', '2022-01-10 18:01:57');
INSERT INTO `admin_operation_log` VALUES (2222, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:01:59', '2022-01-10 18:01:59');
INSERT INTO `admin_operation_log` VALUES (2223, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:02:04', '2022-01-10 18:02:04');
INSERT INTO `admin_operation_log` VALUES (2224, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:02:09', '2022-01-10 18:02:09');
INSERT INTO `admin_operation_log` VALUES (2225, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:02:11', '2022-01-10 18:02:11');
INSERT INTO `admin_operation_log` VALUES (2226, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:02:45', '2022-01-10 18:02:45');
INSERT INTO `admin_operation_log` VALUES (2227, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:02:48', '2022-01-10 18:02:48');
INSERT INTO `admin_operation_log` VALUES (2228, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:04:13', '2022-01-10 18:04:13');
INSERT INTO `admin_operation_log` VALUES (2229, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:04:17', '2022-01-10 18:04:17');
INSERT INTO `admin_operation_log` VALUES (2230, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:04:27', '2022-01-10 18:04:27');
INSERT INTO `admin_operation_log` VALUES (2231, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:06:25', '2022-01-10 18:06:25');
INSERT INTO `admin_operation_log` VALUES (2232, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2022-01-10 18:06:25', '2022-01-10 18:06:25');
INSERT INTO `admin_operation_log` VALUES (2233, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:07:07', '2022-01-10 18:07:07');
INSERT INTO `admin_operation_log` VALUES (2234, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2022-01-10 18:07:07', '2022-01-10 18:07:07');
INSERT INTO `admin_operation_log` VALUES (2235, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:07:15', '2022-01-10 18:07:15');
INSERT INTO `admin_operation_log` VALUES (2236, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:07:32', '2022-01-10 18:07:32');
INSERT INTO `admin_operation_log` VALUES (2237, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:08:29', '2022-01-10 18:08:29');
INSERT INTO `admin_operation_log` VALUES (2238, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:09:06', '2022-01-10 18:09:06');
INSERT INTO `admin_operation_log` VALUES (2239, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:09:40', '2022-01-10 18:09:40');
INSERT INTO `admin_operation_log` VALUES (2240, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:09:54', '2022-01-10 18:09:54');
INSERT INTO `admin_operation_log` VALUES (2241, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 18:11:44', '2022-01-10 18:11:44');
INSERT INTO `admin_operation_log` VALUES (2242, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:45', '2022-01-10 18:11:45');
INSERT INTO `admin_operation_log` VALUES (2243, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:45', '2022-01-10 18:11:45');
INSERT INTO `admin_operation_log` VALUES (2244, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:45', '2022-01-10 18:11:45');
INSERT INTO `admin_operation_log` VALUES (2245, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:46', '2022-01-10 18:11:46');
INSERT INTO `admin_operation_log` VALUES (2246, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:46', '2022-01-10 18:11:46');
INSERT INTO `admin_operation_log` VALUES (2247, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:46', '2022-01-10 18:11:46');
INSERT INTO `admin_operation_log` VALUES (2248, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:47', '2022-01-10 18:11:47');
INSERT INTO `admin_operation_log` VALUES (2249, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:47', '2022-01-10 18:11:47');
INSERT INTO `admin_operation_log` VALUES (2250, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:47', '2022-01-10 18:11:47');
INSERT INTO `admin_operation_log` VALUES (2251, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:48', '2022-01-10 18:11:48');
INSERT INTO `admin_operation_log` VALUES (2252, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:48', '2022-01-10 18:11:48');
INSERT INTO `admin_operation_log` VALUES (2253, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:48', '2022-01-10 18:11:48');
INSERT INTO `admin_operation_log` VALUES (2254, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:49', '2022-01-10 18:11:49');
INSERT INTO `admin_operation_log` VALUES (2255, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:49', '2022-01-10 18:11:49');
INSERT INTO `admin_operation_log` VALUES (2256, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:49', '2022-01-10 18:11:49');
INSERT INTO `admin_operation_log` VALUES (2257, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:49', '2022-01-10 18:11:49');
INSERT INTO `admin_operation_log` VALUES (2258, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:50', '2022-01-10 18:11:50');
INSERT INTO `admin_operation_log` VALUES (2259, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:50', '2022-01-10 18:11:50');
INSERT INTO `admin_operation_log` VALUES (2260, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:50', '2022-01-10 18:11:50');
INSERT INTO `admin_operation_log` VALUES (2261, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:51', '2022-01-10 18:11:51');
INSERT INTO `admin_operation_log` VALUES (2262, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:11:51', '2022-01-10 18:11:51');
INSERT INTO `admin_operation_log` VALUES (2263, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:12:08', '2022-01-10 18:12:08');
INSERT INTO `admin_operation_log` VALUES (2264, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:12:42', '2022-01-10 18:12:42');
INSERT INTO `admin_operation_log` VALUES (2265, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:13:20', '2022-01-10 18:13:20');
INSERT INTO `admin_operation_log` VALUES (2266, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:13:24', '2022-01-10 18:13:24');
INSERT INTO `admin_operation_log` VALUES (2267, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:13:27', '2022-01-10 18:13:27');
INSERT INTO `admin_operation_log` VALUES (2268, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:13:41', '2022-01-10 18:13:41');
INSERT INTO `admin_operation_log` VALUES (2269, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:14:19', '2022-01-10 18:14:19');
INSERT INTO `admin_operation_log` VALUES (2270, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:14:25', '2022-01-10 18:14:25');
INSERT INTO `admin_operation_log` VALUES (2271, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:14:38', '2022-01-10 18:14:38');
INSERT INTO `admin_operation_log` VALUES (2272, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 18:16:20', '2022-01-10 18:16:20');
INSERT INTO `admin_operation_log` VALUES (2273, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:22:41', '2022-01-10 19:22:41');
INSERT INTO `admin_operation_log` VALUES (2274, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:25:05', '2022-01-10 19:25:05');
INSERT INTO `admin_operation_log` VALUES (2275, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:25:14', '2022-01-10 19:25:14');
INSERT INTO `admin_operation_log` VALUES (2276, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:25:44', '2022-01-10 19:25:44');
INSERT INTO `admin_operation_log` VALUES (2277, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"4\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 19:25:51', '2022-01-10 19:25:51');
INSERT INTO `admin_operation_log` VALUES (2278, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:25:52', '2022-01-10 19:25:52');
INSERT INTO `admin_operation_log` VALUES (2279, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:26:41', '2022-01-10 19:26:41');
INSERT INTO `admin_operation_log` VALUES (2280, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"4\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 19:26:44', '2022-01-10 19:26:44');
INSERT INTO `admin_operation_log` VALUES (2281, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"4\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 19:26:57', '2022-01-10 19:26:57');
INSERT INTO `admin_operation_log` VALUES (2282, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:26:59', '2022-01-10 19:26:59');
INSERT INTO `admin_operation_log` VALUES (2283, 1, 'admin/devices/4', 'PUT', '127.0.0.1', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"4\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 19:27:04', '2022-01-10 19:27:04');
INSERT INTO `admin_operation_log` VALUES (2284, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 19:27:05', '2022-01-10 19:27:05');
INSERT INTO `admin_operation_log` VALUES (2285, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"soft_lang\":[\"english\"],\"_pjax\":\"#pjax-container\"}', '2022-01-10 19:27:30', '2022-01-10 19:27:30');
INSERT INTO `admin_operation_log` VALUES (2286, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-10 19:27:34', '2022-01-10 19:27:34');
INSERT INTO `admin_operation_log` VALUES (2287, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:07:02', '2022-01-10 20:07:02');
INSERT INTO `admin_operation_log` VALUES (2288, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:07:23', '2022-01-10 20:07:23');
INSERT INTO `admin_operation_log` VALUES (2289, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:07:29', '2022-01-10 20:07:29');
INSERT INTO `admin_operation_log` VALUES (2290, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:07:54', '2022-01-10 20:07:54');
INSERT INTO `admin_operation_log` VALUES (2291, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:08:01', '2022-01-10 20:08:01');
INSERT INTO `admin_operation_log` VALUES (2292, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:09:11', '2022-01-10 20:09:11');
INSERT INTO `admin_operation_log` VALUES (2293, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:09:18', '2022-01-10 20:09:18');
INSERT INTO `admin_operation_log` VALUES (2294, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:10:15', '2022-01-10 20:10:15');
INSERT INTO `admin_operation_log` VALUES (2295, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:10:17', '2022-01-10 20:10:17');
INSERT INTO `admin_operation_log` VALUES (2296, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 20:23:42', '2022-01-10 20:23:42');
INSERT INTO `admin_operation_log` VALUES (2297, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:17:50', '2022-01-10 21:17:50');
INSERT INTO `admin_operation_log` VALUES (2298, 1, 'admin/devices/7', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"7\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 21:17:54', '2022-01-10 21:17:54');
INSERT INTO `admin_operation_log` VALUES (2299, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:17:55', '2022-01-10 21:17:55');
INSERT INTO `admin_operation_log` VALUES (2300, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:18:45', '2022-01-10 21:18:45');
INSERT INTO `admin_operation_log` VALUES (2301, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:19:34', '2022-01-10 21:19:34');
INSERT INTO `admin_operation_log` VALUES (2302, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:23:02', '2022-01-10 21:23:02');
INSERT INTO `admin_operation_log` VALUES (2303, 1, 'admin/devices/7', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"7\",\"_token\":\"R8gLtHwJ370H2GMYS3YIAAwWY2eZKxnv12oMwSI3\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-10 21:23:06', '2022-01-10 21:23:06');
INSERT INTO `admin_operation_log` VALUES (2304, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-10 21:23:14', '2022-01-10 21:23:14');
INSERT INTO `admin_operation_log` VALUES (2305, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-11 10:55:44', '2022-01-11 10:55:44');
INSERT INTO `admin_operation_log` VALUES (2306, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 10:55:52', '2022-01-11 10:55:52');
INSERT INTO `admin_operation_log` VALUES (2307, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 10:55:53', '2022-01-11 10:55:53');
INSERT INTO `admin_operation_log` VALUES (2308, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 10:55:55', '2022-01-11 10:55:55');
INSERT INTO `admin_operation_log` VALUES (2309, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 10:56:03', '2022-01-11 10:56:03');
INSERT INTO `admin_operation_log` VALUES (2310, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 10:56:11', '2022-01-11 10:56:11');
INSERT INTO `admin_operation_log` VALUES (2311, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 11:00:28', '2022-01-11 11:00:28');
INSERT INTO `admin_operation_log` VALUES (2312, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 11:01:35', '2022-01-11 11:01:35');
INSERT INTO `admin_operation_log` VALUES (2313, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_columns_\":\"accounts,brand,created_at,groups,lang,lock,model,rado,remark,soft_lang,soft_version,status,task,user_num\",\"_pjax\":\"#pjax-container\"}', '2022-01-11 14:08:03', '2022-01-11 14:08:03');
INSERT INTO `admin_operation_log` VALUES (2314, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 15:30:46', '2022-01-11 15:30:46');
INSERT INTO `admin_operation_log` VALUES (2315, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-11 16:05:41', '2022-01-11 16:05:41');
INSERT INTO `admin_operation_log` VALUES (2316, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-11 16:47:32', '2022-01-11 16:47:32');
INSERT INTO `admin_operation_log` VALUES (2317, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-11 17:14:17', '2022-01-11 17:14:17');
INSERT INTO `admin_operation_log` VALUES (2318, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 17:39:43', '2022-01-11 17:39:43');
INSERT INTO `admin_operation_log` VALUES (2319, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 17:39:46', '2022-01-11 17:39:46');
INSERT INTO `admin_operation_log` VALUES (2320, 1, 'admin', 'GET', '192.168.31.172', '[]', '2022-01-11 17:50:12', '2022-01-11 17:50:12');
INSERT INTO `admin_operation_log` VALUES (2321, 1, 'admin', 'GET', '192.168.31.172', '[]', '2022-01-11 17:51:29', '2022-01-11 17:51:29');
INSERT INTO `admin_operation_log` VALUES (2322, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:01', '2022-01-11 18:10:01');
INSERT INTO `admin_operation_log` VALUES (2323, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:04', '2022-01-11 18:10:04');
INSERT INTO `admin_operation_log` VALUES (2324, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:05', '2022-01-11 18:10:05');
INSERT INTO `admin_operation_log` VALUES (2325, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:07', '2022-01-11 18:10:07');
INSERT INTO `admin_operation_log` VALUES (2326, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:08', '2022-01-11 18:10:08');
INSERT INTO `admin_operation_log` VALUES (2327, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:14', '2022-01-11 18:10:14');
INSERT INTO `admin_operation_log` VALUES (2328, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 18:10:15', '2022-01-11 18:10:15');
INSERT INTO `admin_operation_log` VALUES (2329, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-11 21:35:29', '2022-01-11 21:35:29');
INSERT INTO `admin_operation_log` VALUES (2330, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 10:09:28', '2022-01-12 10:09:28');
INSERT INTO `admin_operation_log` VALUES (2331, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 10:11:32', '2022-01-12 10:11:32');
INSERT INTO `admin_operation_log` VALUES (2332, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 10:22:42', '2022-01-12 10:22:42');
INSERT INTO `admin_operation_log` VALUES (2333, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 10:31:04', '2022-01-12 10:31:04');
INSERT INTO `admin_operation_log` VALUES (2334, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 10:59:22', '2022-01-12 10:59:22');
INSERT INTO `admin_operation_log` VALUES (2335, 1, 'admin/devices/7', 'PUT', '127.0.0.1', '{\"name\":\"user_num\",\"value\":\"12\",\"pk\":\"7\",\"_token\":\"PzuVT1YV6DqfhUFlJ4QxW75dxlb0AkwhdHoH3hRM\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-12 10:59:26', '2022-01-12 10:59:26');
INSERT INTO `admin_operation_log` VALUES (2336, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 11:11:52', '2022-01-12 11:11:52');
INSERT INTO `admin_operation_log` VALUES (2337, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 11:43:08', '2022-01-12 11:43:08');
INSERT INTO `admin_operation_log` VALUES (2338, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:43:09', '2022-01-12 11:43:09');
INSERT INTO `admin_operation_log` VALUES (2339, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:45:49', '2022-01-12 11:45:49');
INSERT INTO `admin_operation_log` VALUES (2340, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 11:49:09', '2022-01-12 11:49:09');
INSERT INTO `admin_operation_log` VALUES (2341, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:49:14', '2022-01-12 11:49:14');
INSERT INTO `admin_operation_log` VALUES (2342, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 11:51:04', '2022-01-12 11:51:04');
INSERT INTO `admin_operation_log` VALUES (2343, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:51:05', '2022-01-12 11:51:05');
INSERT INTO `admin_operation_log` VALUES (2344, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:54:50', '2022-01-12 11:54:50');
INSERT INTO `admin_operation_log` VALUES (2345, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 11:59:17', '2022-01-12 11:59:17');
INSERT INTO `admin_operation_log` VALUES (2346, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 11:59:18', '2022-01-12 11:59:18');
INSERT INTO `admin_operation_log` VALUES (2347, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:32:37', '2022-01-12 13:32:37');
INSERT INTO `admin_operation_log` VALUES (2348, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:35:24', '2022-01-12 13:35:24');
INSERT INTO `admin_operation_log` VALUES (2349, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 13:40:01', '2022-01-12 13:40:01');
INSERT INTO `admin_operation_log` VALUES (2350, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:40:02', '2022-01-12 13:40:02');
INSERT INTO `admin_operation_log` VALUES (2351, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 13:40:35', '2022-01-12 13:40:35');
INSERT INTO `admin_operation_log` VALUES (2352, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:40:37', '2022-01-12 13:40:37');
INSERT INTO `admin_operation_log` VALUES (2353, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:41:22', '2022-01-12 13:41:22');
INSERT INTO `admin_operation_log` VALUES (2354, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:42:42', '2022-01-12 13:42:42');
INSERT INTO `admin_operation_log` VALUES (2355, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:42:58', '2022-01-12 13:42:58');
INSERT INTO `admin_operation_log` VALUES (2356, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-12 13:44:20', '2022-01-12 13:44:20');
INSERT INTO `admin_operation_log` VALUES (2357, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:44:21', '2022-01-12 13:44:21');
INSERT INTO `admin_operation_log` VALUES (2358, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:44:51', '2022-01-12 13:44:51');
INSERT INTO `admin_operation_log` VALUES (2359, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:48:45', '2022-01-12 13:48:45');
INSERT INTO `admin_operation_log` VALUES (2360, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:48:55', '2022-01-12 13:48:55');
INSERT INTO `admin_operation_log` VALUES (2361, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:52:46', '2022-01-12 13:52:46');
INSERT INTO `admin_operation_log` VALUES (2362, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:52:56', '2022-01-12 13:52:56');
INSERT INTO `admin_operation_log` VALUES (2363, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:53:11', '2022-01-12 13:53:11');
INSERT INTO `admin_operation_log` VALUES (2364, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:53:56', '2022-01-12 13:53:56');
INSERT INTO `admin_operation_log` VALUES (2365, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:54:04', '2022-01-12 13:54:04');
INSERT INTO `admin_operation_log` VALUES (2366, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:54:15', '2022-01-12 13:54:15');
INSERT INTO `admin_operation_log` VALUES (2367, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:54:22', '2022-01-12 13:54:22');
INSERT INTO `admin_operation_log` VALUES (2368, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-12 13:55:32', '2022-01-12 13:55:32');
INSERT INTO `admin_operation_log` VALUES (2369, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-12 13:56:11', '2022-01-12 13:56:11');
INSERT INTO `admin_operation_log` VALUES (2370, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-12 13:56:16', '2022-01-12 13:56:16');
INSERT INTO `admin_operation_log` VALUES (2371, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-12 13:56:18', '2022-01-12 13:56:18');
INSERT INTO `admin_operation_log` VALUES (2372, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-12 13:57:18', '2022-01-12 13:57:18');
INSERT INTO `admin_operation_log` VALUES (2373, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-12 13:57:23', '2022-01-12 13:57:23');
INSERT INTO `admin_operation_log` VALUES (2374, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-12 14:28:33', '2022-01-12 14:28:33');
INSERT INTO `admin_operation_log` VALUES (2375, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-12 17:09:26', '2022-01-12 17:09:26');
INSERT INTO `admin_operation_log` VALUES (2376, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-13 10:53:44', '2022-01-13 10:53:44');
INSERT INTO `admin_operation_log` VALUES (2377, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-13 13:46:52', '2022-01-13 13:46:52');
INSERT INTO `admin_operation_log` VALUES (2378, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-13 13:50:22', '2022-01-13 13:50:22');
INSERT INTO `admin_operation_log` VALUES (2379, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:00:53', '2022-01-14 10:00:53');
INSERT INTO `admin_operation_log` VALUES (2380, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:01:05', '2022-01-14 10:01:05');
INSERT INTO `admin_operation_log` VALUES (2381, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:16:00', '2022-01-14 10:16:00');
INSERT INTO `admin_operation_log` VALUES (2382, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:16:11', '2022-01-14 10:16:11');
INSERT INTO `admin_operation_log` VALUES (2383, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:17:39', '2022-01-14 10:17:39');
INSERT INTO `admin_operation_log` VALUES (2384, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:18:47', '2022-01-14 10:18:47');
INSERT INTO `admin_operation_log` VALUES (2385, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:18:59', '2022-01-14 10:18:59');
INSERT INTO `admin_operation_log` VALUES (2386, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:19:07', '2022-01-14 10:19:07');
INSERT INTO `admin_operation_log` VALUES (2387, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:24:32', '2022-01-14 10:24:32');
INSERT INTO `admin_operation_log` VALUES (2388, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:25:21', '2022-01-14 10:25:21');
INSERT INTO `admin_operation_log` VALUES (2389, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:27:39', '2022-01-14 10:27:39');
INSERT INTO `admin_operation_log` VALUES (2390, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:30:26', '2022-01-14 10:30:26');
INSERT INTO `admin_operation_log` VALUES (2391, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:33:10', '2022-01-14 10:33:10');
INSERT INTO `admin_operation_log` VALUES (2392, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:33:37', '2022-01-14 10:33:37');
INSERT INTO `admin_operation_log` VALUES (2393, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:36:01', '2022-01-14 10:36:01');
INSERT INTO `admin_operation_log` VALUES (2394, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:38:04', '2022-01-14 10:38:04');
INSERT INTO `admin_operation_log` VALUES (2395, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:45:57', '2022-01-14 10:45:57');
INSERT INTO `admin_operation_log` VALUES (2396, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:46:26', '2022-01-14 10:46:26');
INSERT INTO `admin_operation_log` VALUES (2397, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:46:38', '2022-01-14 10:46:38');
INSERT INTO `admin_operation_log` VALUES (2398, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:47:08', '2022-01-14 10:47:08');
INSERT INTO `admin_operation_log` VALUES (2399, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:47:34', '2022-01-14 10:47:34');
INSERT INTO `admin_operation_log` VALUES (2400, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:47:45', '2022-01-14 10:47:45');
INSERT INTO `admin_operation_log` VALUES (2401, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:48:00', '2022-01-14 10:48:00');
INSERT INTO `admin_operation_log` VALUES (2402, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:48:26', '2022-01-14 10:48:26');
INSERT INTO `admin_operation_log` VALUES (2403, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:50:32', '2022-01-14 10:50:32');
INSERT INTO `admin_operation_log` VALUES (2404, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:52:40', '2022-01-14 10:52:40');
INSERT INTO `admin_operation_log` VALUES (2405, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:52:53', '2022-01-14 10:52:53');
INSERT INTO `admin_operation_log` VALUES (2406, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:53:01', '2022-01-14 10:53:01');
INSERT INTO `admin_operation_log` VALUES (2407, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 10:53:23', '2022-01-14 10:53:23');
INSERT INTO `admin_operation_log` VALUES (2408, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 11:04:55', '2022-01-14 11:04:55');
INSERT INTO `admin_operation_log` VALUES (2409, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 11:09:10', '2022-01-14 11:09:10');
INSERT INTO `admin_operation_log` VALUES (2410, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 11:17:41', '2022-01-14 11:17:41');
INSERT INTO `admin_operation_log` VALUES (2411, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 11:17:50', '2022-01-14 11:17:50');
INSERT INTO `admin_operation_log` VALUES (2412, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 11:19:57', '2022-01-14 11:19:57');
INSERT INTO `admin_operation_log` VALUES (2413, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 13:45:13', '2022-01-14 13:45:13');
INSERT INTO `admin_operation_log` VALUES (2414, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 14:22:21', '2022-01-14 14:22:21');
INSERT INTO `admin_operation_log` VALUES (2415, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 14:27:33', '2022-01-14 14:27:33');
INSERT INTO `admin_operation_log` VALUES (2416, 1, 'admin/group-devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-14 14:50:08', '2022-01-14 14:50:08');
INSERT INTO `admin_operation_log` VALUES (2417, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-14 14:50:10', '2022-01-14 14:50:10');
INSERT INTO `admin_operation_log` VALUES (2418, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 14:50:50', '2022-01-14 14:50:50');
INSERT INTO `admin_operation_log` VALUES (2419, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 14:51:04', '2022-01-14 14:51:04');
INSERT INTO `admin_operation_log` VALUES (2420, 1, 'admin/devices/8', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"8\",\"_token\":\"klvQF6A8g9iOtStQpKYkd90v1XmbjtNEqGNammPQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-14 14:51:08', '2022-01-14 14:51:08');
INSERT INTO `admin_operation_log` VALUES (2421, 1, 'admin/devices/8', 'PUT', '192.168.31.172', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"8\",\"_token\":\"klvQF6A8g9iOtStQpKYkd90v1XmbjtNEqGNammPQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-14 14:51:12', '2022-01-14 14:51:12');
INSERT INTO `admin_operation_log` VALUES (2422, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 14:51:30', '2022-01-14 14:51:30');
INSERT INTO `admin_operation_log` VALUES (2423, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 14:57:53', '2022-01-14 14:57:53');
INSERT INTO `admin_operation_log` VALUES (2424, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 14:58:50', '2022-01-14 14:58:50');
INSERT INTO `admin_operation_log` VALUES (2425, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 15:09:40', '2022-01-14 15:09:40');
INSERT INTO `admin_operation_log` VALUES (2426, 1, 'admin/devices/9', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"9\",\"_token\":\"klvQF6A8g9iOtStQpKYkd90v1XmbjtNEqGNammPQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-14 15:10:50', '2022-01-14 15:10:50');
INSERT INTO `admin_operation_log` VALUES (2427, 1, 'admin/devices/9', 'PUT', '192.168.31.172', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"9\",\"_token\":\"klvQF6A8g9iOtStQpKYkd90v1XmbjtNEqGNammPQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-14 15:10:52', '2022-01-14 15:10:52');
INSERT INTO `admin_operation_log` VALUES (2428, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-14 15:35:33', '2022-01-14 15:35:33');
INSERT INTO `admin_operation_log` VALUES (2429, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 15:52:21', '2022-01-14 15:52:21');
INSERT INTO `admin_operation_log` VALUES (2430, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-14 18:24:46', '2022-01-14 18:24:46');
INSERT INTO `admin_operation_log` VALUES (2431, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-15 19:09:11', '2022-01-15 19:09:11');
INSERT INTO `admin_operation_log` VALUES (2432, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-15 19:09:29', '2022-01-15 19:09:29');
INSERT INTO `admin_operation_log` VALUES (2433, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-15 19:09:35', '2022-01-15 19:09:35');
INSERT INTO `admin_operation_log` VALUES (2434, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-15 19:09:41', '2022-01-15 19:09:41');
INSERT INTO `admin_operation_log` VALUES (2435, 1, 'admin/devices/10', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"10\",\"_token\":\"JRrUhr8mVKld4uPa15bYAVTAM7tezpJqj57EFoEQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-15 19:09:48', '2022-01-15 19:09:48');
INSERT INTO `admin_operation_log` VALUES (2436, 1, 'admin/devices/10', 'PUT', '192.168.31.172', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"10\",\"_token\":\"JRrUhr8mVKld4uPa15bYAVTAM7tezpJqj57EFoEQ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-15 19:09:51', '2022-01-15 19:09:51');
INSERT INTO `admin_operation_log` VALUES (2437, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-15 19:49:00', '2022-01-15 19:49:00');
INSERT INTO `admin_operation_log` VALUES (2438, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-15 19:49:04', '2022-01-15 19:49:04');
INSERT INTO `admin_operation_log` VALUES (2439, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-15 19:52:04', '2022-01-15 19:52:04');
INSERT INTO `admin_operation_log` VALUES (2440, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-15 19:57:44', '2022-01-15 19:57:44');
INSERT INTO `admin_operation_log` VALUES (2441, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-17 15:45:34', '2022-01-17 15:45:34');
INSERT INTO `admin_operation_log` VALUES (2442, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 15:45:39', '2022-01-17 15:45:39');
INSERT INTO `admin_operation_log` VALUES (2443, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 15:45:46', '2022-01-17 15:45:46');
INSERT INTO `admin_operation_log` VALUES (2444, 1, 'admin/devices/9', 'PUT', '127.0.0.1', '{\"name\":\"soft_version\",\"value\":\"22.9.2\",\"pk\":\"9\",\"_token\":\"p495UPw9lG44iFjofBPuawFgURYZVr5RbkJFC6hU\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-17 15:45:51', '2022-01-17 15:45:51');
INSERT INTO `admin_operation_log` VALUES (2445, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 17:09:19', '2022-01-17 17:09:19');
INSERT INTO `admin_operation_log` VALUES (2446, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2022-01-17 17:09:21', '2022-01-17 17:09:21');
INSERT INTO `admin_operation_log` VALUES (2447, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-17 17:43:49', '2022-01-17 17:43:49');
INSERT INTO `admin_operation_log` VALUES (2448, 1, 'admin', 'GET', '192.168.31.172', '[]', '2022-01-17 17:48:13', '2022-01-17 17:48:13');
INSERT INTO `admin_operation_log` VALUES (2449, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-17 17:48:14', '2022-01-17 17:48:14');
INSERT INTO `admin_operation_log` VALUES (2450, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-17 17:48:56', '2022-01-17 17:48:56');
INSERT INTO `admin_operation_log` VALUES (2451, 1, 'admin/devices/1', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"1\",\"_token\":\"nlP9iK6ztT8phUwaumx0wV2yVCVLyMTjoevbFvvA\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-17 17:49:07', '2022-01-17 17:49:07');
INSERT INTO `admin_operation_log` VALUES (2452, 1, 'admin/devices/1', 'PUT', '192.168.31.172', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"1\",\"_token\":\"nlP9iK6ztT8phUwaumx0wV2yVCVLyMTjoevbFvvA\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-17 17:49:09', '2022-01-17 17:49:09');
INSERT INTO `admin_operation_log` VALUES (2453, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-18 11:13:07', '2022-01-18 11:13:07');
INSERT INTO `admin_operation_log` VALUES (2454, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-18 11:13:13', '2022-01-18 11:13:13');
INSERT INTO `admin_operation_log` VALUES (2455, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-18 11:14:28', '2022-01-18 11:14:28');
INSERT INTO `admin_operation_log` VALUES (2456, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-18 11:14:31', '2022-01-18 11:14:31');
INSERT INTO `admin_operation_log` VALUES (2457, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-18 11:14:41', '2022-01-18 11:14:41');
INSERT INTO `admin_operation_log` VALUES (2458, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-01-18 11:14:46', '2022-01-18 11:14:46');
INSERT INTO `admin_operation_log` VALUES (2459, 1, 'admin/devices/11', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"22.6.4\",\"pk\":\"11\",\"_token\":\"yLtXlRHkLxaANC7Ra8QAKXZsUSWCfsgrNOopu2Fn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-18 11:14:51', '2022-01-18 11:14:51');
INSERT INTO `admin_operation_log` VALUES (2460, 1, 'admin/devices/11', 'PUT', '192.168.31.172', '{\"name\":\"soft_lang\",\"value\":\"english\",\"pk\":\"11\",\"_token\":\"yLtXlRHkLxaANC7Ra8QAKXZsUSWCfsgrNOopu2Fn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-18 11:14:54', '2022-01-18 11:14:54');
INSERT INTO `admin_operation_log` VALUES (2461, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-18 11:35:31', '2022-01-18 11:35:31');
INSERT INTO `admin_operation_log` VALUES (2462, 1, 'admin/devices/7', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"20.4.3\",\"pk\":\"7\",\"_token\":\"yLtXlRHkLxaANC7Ra8QAKXZsUSWCfsgrNOopu2Fn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-18 11:35:35', '2022-01-18 11:35:35');
INSERT INTO `admin_operation_log` VALUES (2463, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-18 11:41:51', '2022-01-18 11:41:51');
INSERT INTO `admin_operation_log` VALUES (2464, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-18 11:41:55', '2022-01-18 11:41:55');
INSERT INTO `admin_operation_log` VALUES (2465, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_columns_\":\"accounts,brand,created_at,groups,id,lang,lock,model,remark,soft_lang,soft_version,status,task,user_num\",\"_pjax\":\"#pjax-container\"}', '2022-01-18 11:42:34', '2022-01-18 11:42:34');
INSERT INTO `admin_operation_log` VALUES (2466, 1, 'admin/devices/11', 'PUT', '192.168.31.172', '{\"name\":\"soft_version\",\"value\":\"20.4.3\",\"pk\":\"11\",\"_token\":\"yLtXlRHkLxaANC7Ra8QAKXZsUSWCfsgrNOopu2Fn\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2022-01-18 11:42:38', '2022-01-18 11:42:38');
INSERT INTO `admin_operation_log` VALUES (2467, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_columns_\":\"accounts,brand,created_at,groups,id,lang,lock,model,remark,soft_lang,soft_version,status,task,user_num\"}', '2022-01-18 11:42:40', '2022-01-18 11:42:40');
INSERT INTO `admin_operation_log` VALUES (2468, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_columns_\":\"accounts,brand,created_at,groups,id,lang,lock,model,remark,soft_lang,soft_version,status,task,user_num\"}', '2022-01-18 15:56:36', '2022-01-18 15:56:36');
INSERT INTO `admin_operation_log` VALUES (2469, 1, 'admin/tasks', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 10:40:32', '2022-01-19 10:40:32');
INSERT INTO `admin_operation_log` VALUES (2470, 1, 'admin/qrcode', 'GET', '192.168.31.172', '[]', '2022-01-19 10:41:43', '2022-01-19 10:41:43');
INSERT INTO `admin_operation_log` VALUES (2471, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 11:48:29', '2022-01-19 11:48:29');
INSERT INTO `admin_operation_log` VALUES (2472, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 11:53:07', '2022-01-19 11:53:07');
INSERT INTO `admin_operation_log` VALUES (2473, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-19 13:56:08', '2022-01-19 13:56:08');
INSERT INTO `admin_operation_log` VALUES (2474, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 14:04:29', '2022-01-19 14:04:29');
INSERT INTO `admin_operation_log` VALUES (2475, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:06:16', '2022-01-19 15:06:16');
INSERT INTO `admin_operation_log` VALUES (2476, 1, 'admin/devices', 'GET', '192.168.31.172', '[]', '2022-01-19 15:06:20', '2022-01-19 15:06:20');
INSERT INTO `admin_operation_log` VALUES (2477, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:25:48', '2022-01-19 15:25:48');
INSERT INTO `admin_operation_log` VALUES (2478, 1, 'admin/accounts', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:25:54', '2022-01-19 15:25:54');
INSERT INTO `admin_operation_log` VALUES (2479, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:26:07', '2022-01-19 15:26:07');
INSERT INTO `admin_operation_log` VALUES (2480, 1, 'admin/accounts', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:26:14', '2022-01-19 15:26:14');
INSERT INTO `admin_operation_log` VALUES (2481, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:26:38', '2022-01-19 15:26:38');
INSERT INTO `admin_operation_log` VALUES (2482, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:28:34', '2022-01-19 15:28:34');
INSERT INTO `admin_operation_log` VALUES (2483, 1, 'admin/accounts', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-19 15:28:37', '2022-01-19 15:28:37');
INSERT INTO `admin_operation_log` VALUES (2484, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:52:15', '2022-01-20 09:52:15');
INSERT INTO `admin_operation_log` VALUES (2485, 1, 'admin/accounts', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:53:36', '2022-01-20 09:53:36');
INSERT INTO `admin_operation_log` VALUES (2486, 1, 'admin/devices', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:53:40', '2022-01-20 09:53:40');
INSERT INTO `admin_operation_log` VALUES (2487, 1, 'admin/tasks', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:53:50', '2022-01-20 09:53:50');
INSERT INTO `admin_operation_log` VALUES (2488, 1, 'admin/tasks/create', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:54:36', '2022-01-20 09:54:36');
INSERT INTO `admin_operation_log` VALUES (2489, 1, 'admin/tasks', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:54:39', '2022-01-20 09:54:39');
INSERT INTO `admin_operation_log` VALUES (2490, 1, 'admin/tasks/1/edit', 'GET', '192.168.31.172', '{\"_pjax\":\"#pjax-container\"}', '2022-01-20 09:58:38', '2022-01-20 09:58:38');
INSERT INTO `admin_operation_log` VALUES (2491, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-24 11:23:37', '2022-01-24 11:23:37');
INSERT INTO `admin_operation_log` VALUES (2492, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-24 11:23:55', '2022-01-24 11:23:55');
INSERT INTO `admin_operation_log` VALUES (2493, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-24 11:23:56', '2022-01-24 11:23:56');
INSERT INTO `admin_operation_log` VALUES (2494, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-24 11:24:07', '2022-01-24 11:24:07');
INSERT INTO `admin_operation_log` VALUES (2495, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:24:13', '2022-01-24 11:24:13');
INSERT INTO `admin_operation_log` VALUES (2496, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:24:37', '2022-01-24 11:24:37');
INSERT INTO `admin_operation_log` VALUES (2497, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:24:41', '2022-01-24 11:24:41');
INSERT INTO `admin_operation_log` VALUES (2498, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"13\",\"title\":\"\\u4efb\\u52a1\\u8be6\\u60c5\",\"icon\":\"fa-terminal\",\"uri\":\"task-send\",\"roles\":[null],\"permission\":null,\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/auth\\/menu\"}', '2022-01-24 11:25:04', '2022-01-24 11:25:04');
INSERT INTO `admin_operation_log` VALUES (2499, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-01-24 11:25:04', '2022-01-24 11:25:04');
INSERT INTO `admin_operation_log` VALUES (2500, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":13,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":14}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2022-01-24 11:25:09', '2022-01-24 11:25:09');
INSERT INTO `admin_operation_log` VALUES (2501, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:25:09', '2022-01-24 11:25:09');
INSERT INTO `admin_operation_log` VALUES (2502, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-01-24 11:25:10', '2022-01-24 11:25:10');
INSERT INTO `admin_operation_log` VALUES (2503, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:25:14', '2022-01-24 11:25:14');
INSERT INTO `admin_operation_log` VALUES (2504, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:25:30', '2022-01-24 11:25:30');
INSERT INTO `admin_operation_log` VALUES (2505, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:25:32', '2022-01-24 11:25:32');
INSERT INTO `admin_operation_log` VALUES (2506, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:25:37', '2022-01-24 11:25:37');
INSERT INTO `admin_operation_log` VALUES (2507, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:27:40', '2022-01-24 11:27:40');
INSERT INTO `admin_operation_log` VALUES (2508, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:28:14', '2022-01-24 11:28:14');
INSERT INTO `admin_operation_log` VALUES (2509, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:28:15', '2022-01-24 11:28:15');
INSERT INTO `admin_operation_log` VALUES (2510, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:28:19', '2022-01-24 11:28:19');
INSERT INTO `admin_operation_log` VALUES (2511, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:28:24', '2022-01-24 11:28:24');
INSERT INTO `admin_operation_log` VALUES (2512, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:29:15', '2022-01-24 11:29:15');
INSERT INTO `admin_operation_log` VALUES (2513, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:29:38', '2022-01-24 11:29:38');
INSERT INTO `admin_operation_log` VALUES (2514, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:29:53', '2022-01-24 11:29:53');
INSERT INTO `admin_operation_log` VALUES (2515, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:32:06', '2022-01-24 11:32:06');
INSERT INTO `admin_operation_log` VALUES (2516, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:32:18', '2022-01-24 11:32:18');
INSERT INTO `admin_operation_log` VALUES (2517, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:32:28', '2022-01-24 11:32:28');
INSERT INTO `admin_operation_log` VALUES (2518, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:32:31', '2022-01-24 11:32:31');
INSERT INTO `admin_operation_log` VALUES (2519, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:32:58', '2022-01-24 11:32:58');
INSERT INTO `admin_operation_log` VALUES (2520, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:33:15', '2022-01-24 11:33:15');
INSERT INTO `admin_operation_log` VALUES (2521, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:33:23', '2022-01-24 11:33:23');
INSERT INTO `admin_operation_log` VALUES (2522, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:33:26', '2022-01-24 11:33:26');
INSERT INTO `admin_operation_log` VALUES (2523, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:33:28', '2022-01-24 11:33:28');
INSERT INTO `admin_operation_log` VALUES (2524, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 11:34:19', '2022-01-24 11:34:19');
INSERT INTO `admin_operation_log` VALUES (2525, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 11:52:37', '2022-01-24 11:52:37');
INSERT INTO `admin_operation_log` VALUES (2526, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 13:44:29', '2022-01-24 13:44:29');
INSERT INTO `admin_operation_log` VALUES (2527, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 13:44:30', '2022-01-24 13:44:30');
INSERT INTO `admin_operation_log` VALUES (2528, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 13:46:40', '2022-01-24 13:46:40');
INSERT INTO `admin_operation_log` VALUES (2529, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 13:47:08', '2022-01-24 13:47:08');
INSERT INTO `admin_operation_log` VALUES (2530, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 13:47:15', '2022-01-24 13:47:15');
INSERT INTO `admin_operation_log` VALUES (2531, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 13:48:01', '2022-01-24 13:48:01');
INSERT INTO `admin_operation_log` VALUES (2532, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:08:23', '2022-01-24 14:08:23');
INSERT INTO `admin_operation_log` VALUES (2533, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:08:29', '2022-01-24 14:08:29');
INSERT INTO `admin_operation_log` VALUES (2534, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:08:32', '2022-01-24 14:08:32');
INSERT INTO `admin_operation_log` VALUES (2535, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 14:08:43', '2022-01-24 14:08:43');
INSERT INTO `admin_operation_log` VALUES (2536, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 14:08:43', '2022-01-24 14:08:43');
INSERT INTO `admin_operation_log` VALUES (2537, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:09:14', '2022-01-24 14:09:14');
INSERT INTO `admin_operation_log` VALUES (2538, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 14:09:17', '2022-01-24 14:09:17');
INSERT INTO `admin_operation_log` VALUES (2539, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:09:57', '2022-01-24 14:09:57');
INSERT INTO `admin_operation_log` VALUES (2540, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\"}', '2022-01-24 14:10:00', '2022-01-24 14:10:00');
INSERT INTO `admin_operation_log` VALUES (2541, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:11:27', '2022-01-24 14:11:27');
INSERT INTO `admin_operation_log` VALUES (2542, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 14:11:27', '2022-01-24 14:11:27');
INSERT INTO `admin_operation_log` VALUES (2543, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\"}', '2022-01-24 14:11:30', '2022-01-24 14:11:30');
INSERT INTO `admin_operation_log` VALUES (2544, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:12:10', '2022-01-24 14:12:10');
INSERT INTO `admin_operation_log` VALUES (2545, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 14:12:11', '2022-01-24 14:12:11');
INSERT INTO `admin_operation_log` VALUES (2546, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\"}', '2022-01-24 14:12:12', '2022-01-24 14:12:12');
INSERT INTO `admin_operation_log` VALUES (2547, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:12:51', '2022-01-24 14:12:51');
INSERT INTO `admin_operation_log` VALUES (2548, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:12:56', '2022-01-24 14:12:56');
INSERT INTO `admin_operation_log` VALUES (2549, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:12:59', '2022-01-24 14:12:59');
INSERT INTO `admin_operation_log` VALUES (2550, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:13:44', '2022-01-24 14:13:44');
INSERT INTO `admin_operation_log` VALUES (2551, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:36:16', '2022-01-24 14:36:16');
INSERT INTO `admin_operation_log` VALUES (2552, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:36:18', '2022-01-24 14:36:18');
INSERT INTO `admin_operation_log` VALUES (2553, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:43:11', '2022-01-24 14:43:11');
INSERT INTO `admin_operation_log` VALUES (2554, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:43:12', '2022-01-24 14:43:12');
INSERT INTO `admin_operation_log` VALUES (2555, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:47:31', '2022-01-24 14:47:31');
INSERT INTO `admin_operation_log` VALUES (2556, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:47:33', '2022-01-24 14:47:33');
INSERT INTO `admin_operation_log` VALUES (2557, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:49:56', '2022-01-24 14:49:56');
INSERT INTO `admin_operation_log` VALUES (2558, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:50:21', '2022-01-24 14:50:21');
INSERT INTO `admin_operation_log` VALUES (2559, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:50:23', '2022-01-24 14:50:23');
INSERT INTO `admin_operation_log` VALUES (2560, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:53:43', '2022-01-24 14:53:43');
INSERT INTO `admin_operation_log` VALUES (2561, 1, 'admin/accounts/2', 'PUT', '127.0.0.1', '{\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_edit_inline\":\"true\",\"groups\":[\"1\"]}', '2022-01-24 14:55:51', '2022-01-24 14:55:51');
INSERT INTO `admin_operation_log` VALUES (2562, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-24 14:55:53', '2022-01-24 14:55:53');
INSERT INTO `admin_operation_log` VALUES (2563, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"groups\":[\"2\"],\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:55:57', '2022-01-24 14:55:57');
INSERT INTO `admin_operation_log` VALUES (2564, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:55:59', '2022-01-24 14:55:59');
INSERT INTO `admin_operation_log` VALUES (2565, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"groups\":[\"1\"],\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:56:07', '2022-01-24 14:56:07');
INSERT INTO `admin_operation_log` VALUES (2566, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 14:56:10', '2022-01-24 14:56:10');
INSERT INTO `admin_operation_log` VALUES (2567, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:04:38', '2022-01-24 15:04:38');
INSERT INTO `admin_operation_log` VALUES (2568, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:04:41', '2022-01-24 15:04:41');
INSERT INTO `admin_operation_log` VALUES (2569, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"2\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 15:04:47', '2022-01-24 15:04:47');
INSERT INTO `admin_operation_log` VALUES (2570, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:05:25', '2022-01-24 15:05:25');
INSERT INTO `admin_operation_log` VALUES (2571, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\"}', '2022-01-24 15:05:55', '2022-01-24 15:05:55');
INSERT INTO `admin_operation_log` VALUES (2572, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 15:05:55', '2022-01-24 15:05:55');
INSERT INTO `admin_operation_log` VALUES (2573, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:05:58', '2022-01-24 15:05:58');
INSERT INTO `admin_operation_log` VALUES (2574, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:18', '2022-01-24 15:15:18');
INSERT INTO `admin_operation_log` VALUES (2575, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:23', '2022-01-24 15:15:23');
INSERT INTO `admin_operation_log` VALUES (2576, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:25', '2022-01-24 15:15:25');
INSERT INTO `admin_operation_log` VALUES (2577, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:36', '2022-01-24 15:15:36');
INSERT INTO `admin_operation_log` VALUES (2578, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:45', '2022-01-24 15:15:45');
INSERT INTO `admin_operation_log` VALUES (2579, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:15:47', '2022-01-24 15:15:47');
INSERT INTO `admin_operation_log` VALUES (2580, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"15\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 15:29:54', '2022-01-24 15:29:54');
INSERT INTO `admin_operation_log` VALUES (2581, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 15:29:54', '2022-01-24 15:29:54');
INSERT INTO `admin_operation_log` VALUES (2582, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:32:32', '2022-01-24 15:32:32');
INSERT INTO `admin_operation_log` VALUES (2583, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-24 15:34:12', '2022-01-24 15:34:12');
INSERT INTO `admin_operation_log` VALUES (2584, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"30\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2021-12-23\",\"endtime\":\"2022-04-30\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\"}', '2022-01-24 15:35:02', '2022-01-24 15:35:02');
INSERT INTO `admin_operation_log` VALUES (2585, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 15:35:02', '2022-01-24 15:35:02');
INSERT INTO `admin_operation_log` VALUES (2586, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:43:17', '2022-01-24 15:43:17');
INSERT INTO `admin_operation_log` VALUES (2587, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"30\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-24\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 15:46:34', '2022-01-24 15:46:34');
INSERT INTO `admin_operation_log` VALUES (2588, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 15:46:34', '2022-01-24 15:46:34');
INSERT INTO `admin_operation_log` VALUES (2589, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:46:55', '2022-01-24 15:46:55');
INSERT INTO `admin_operation_log` VALUES (2590, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[\"2\",null],\"device_id\":[\"4\",\"5\",\"11\",null],\"ag\":[\"1\",\"2\",null],\"account_id\":[\"1\",\"2\",\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"30\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-24\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"bcn93CyLava5WpYFrKCObvdCKkZrPsdxayZCipf2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-24 15:46:56', '2022-01-24 15:46:56');
INSERT INTO `admin_operation_log` VALUES (2591, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-24 15:46:57', '2022-01-24 15:46:57');
INSERT INTO `admin_operation_log` VALUES (2592, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:49:42', '2022-01-24 15:49:42');
INSERT INTO `admin_operation_log` VALUES (2593, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-24 15:50:00', '2022-01-24 15:50:00');
INSERT INTO `admin_operation_log` VALUES (2594, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-26 10:11:02', '2022-01-26 10:11:02');
INSERT INTO `admin_operation_log` VALUES (2595, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:11:05', '2022-01-26 10:11:05');
INSERT INTO `admin_operation_log` VALUES (2596, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:11:08', '2022-01-26 10:11:08');
INSERT INTO `admin_operation_log` VALUES (2597, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-26 10:12:43', '2022-01-26 10:12:43');
INSERT INTO `admin_operation_log` VALUES (2598, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:25:23', '2022-01-26 10:25:23');
INSERT INTO `admin_operation_log` VALUES (2599, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:25:25', '2022-01-26 10:25:25');
INSERT INTO `admin_operation_log` VALUES (2600, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:26:39', '2022-01-26 10:26:39');
INSERT INTO `admin_operation_log` VALUES (2601, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:26:52', '2022-01-26 10:26:52');
INSERT INTO `admin_operation_log` VALUES (2602, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:27:06', '2022-01-26 10:27:06');
INSERT INTO `admin_operation_log` VALUES (2603, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:27:58', '2022-01-26 10:27:58');
INSERT INTO `admin_operation_log` VALUES (2604, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:29:33', '2022-01-26 10:29:33');
INSERT INTO `admin_operation_log` VALUES (2605, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:30:12', '2022-01-26 10:30:12');
INSERT INTO `admin_operation_log` VALUES (2606, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:30:15', '2022-01-26 10:30:15');
INSERT INTO `admin_operation_log` VALUES (2607, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\"},\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-24\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 10:31:04', '2022-01-26 10:31:04');
INSERT INTO `admin_operation_log` VALUES (2608, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 10:31:05', '2022-01-26 10:31:05');
INSERT INTO `admin_operation_log` VALUES (2609, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:31:13', '2022-01-26 10:31:13');
INSERT INTO `admin_operation_log` VALUES (2610, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"0\"},\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-24\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 10:31:31', '2022-01-26 10:31:31');
INSERT INTO `admin_operation_log` VALUES (2611, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 10:31:32', '2022-01-26 10:31:32');
INSERT INTO `admin_operation_log` VALUES (2612, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:31:57', '2022-01-26 10:31:57');
INSERT INTO `admin_operation_log` VALUES (2613, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"task_id\":\"2\",\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"0\"},\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 10:32:01', '2022-01-26 10:32:01');
INSERT INTO `admin_operation_log` VALUES (2614, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 10:32:02', '2022-01-26 10:32:02');
INSERT INTO `admin_operation_log` VALUES (2615, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:32:52', '2022-01-26 10:32:52');
INSERT INTO `admin_operation_log` VALUES (2616, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"task_id\":\"1\",\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 10:32:59', '2022-01-26 10:32:59');
INSERT INTO `admin_operation_log` VALUES (2617, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 10:32:59', '2022-01-26 10:32:59');
INSERT INTO `admin_operation_log` VALUES (2618, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:34:24', '2022-01-26 10:34:24');
INSERT INTO `admin_operation_log` VALUES (2619, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 10:36:29', '2022-01-26 10:36:29');
INSERT INTO `admin_operation_log` VALUES (2620, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:14:46', '2022-01-26 11:14:46');
INSERT INTO `admin_operation_log` VALUES (2621, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:14:48', '2022-01-26 11:14:48');
INSERT INTO `admin_operation_log` VALUES (2622, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:15:22', '2022-01-26 11:15:22');
INSERT INTO `admin_operation_log` VALUES (2623, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:15:24', '2022-01-26 11:15:24');
INSERT INTO `admin_operation_log` VALUES (2624, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"task_id\":\"1\",\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 11:15:28', '2022-01-26 11:15:28');
INSERT INTO `admin_operation_log` VALUES (2625, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 11:15:28', '2022-01-26 11:15:28');
INSERT INTO `admin_operation_log` VALUES (2626, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:15:31', '2022-01-26 11:15:31');
INSERT INTO `admin_operation_log` VALUES (2627, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"task_id\":\"1\",\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"_token\":\"6QgvHixk3sgkwU4Vb0PQZxpS4xvviFYikAt2Y7Ht\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-26 11:16:15', '2022-01-26 11:16:15');
INSERT INTO `admin_operation_log` VALUES (2628, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-26 11:16:15', '2022-01-26 11:16:15');
INSERT INTO `admin_operation_log` VALUES (2629, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 11:16:18', '2022-01-26 11:16:18');
INSERT INTO `admin_operation_log` VALUES (2630, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:38:18', '2022-01-26 14:38:18');
INSERT INTO `admin_operation_log` VALUES (2631, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:38:24', '2022-01-26 14:38:24');
INSERT INTO `admin_operation_log` VALUES (2632, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:38:25', '2022-01-26 14:38:25');
INSERT INTO `admin_operation_log` VALUES (2633, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:38:27', '2022-01-26 14:38:27');
INSERT INTO `admin_operation_log` VALUES (2634, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:55:22', '2022-01-26 14:55:22');
INSERT INTO `admin_operation_log` VALUES (2635, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:55:24', '2022-01-26 14:55:24');
INSERT INTO `admin_operation_log` VALUES (2636, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 14:55:28', '2022-01-26 14:55:28');
INSERT INTO `admin_operation_log` VALUES (2637, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 15:42:48', '2022-01-26 15:42:48');
INSERT INTO `admin_operation_log` VALUES (2638, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 15:42:50', '2022-01-26 15:42:50');
INSERT INTO `admin_operation_log` VALUES (2639, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-26 15:44:21', '2022-01-26 15:44:21');
INSERT INTO `admin_operation_log` VALUES (2640, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-26 15:44:34', '2022-01-26 15:44:34');
INSERT INTO `admin_operation_log` VALUES (2641, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 16:46:58', '2022-01-26 16:46:58');
INSERT INTO `admin_operation_log` VALUES (2642, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:05:48', '2022-01-26 18:05:48');
INSERT INTO `admin_operation_log` VALUES (2643, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 18:05:51', '2022-01-26 18:05:51');
INSERT INTO `admin_operation_log` VALUES (2644, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:05:58', '2022-01-26 18:05:58');
INSERT INTO `admin_operation_log` VALUES (2645, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:06:04', '2022-01-26 18:06:04');
INSERT INTO `admin_operation_log` VALUES (2646, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:06:12', '2022-01-26 18:06:12');
INSERT INTO `admin_operation_log` VALUES (2647, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:08:36', '2022-01-26 18:08:36');
INSERT INTO `admin_operation_log` VALUES (2648, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:12:25', '2022-01-26 18:12:25');
INSERT INTO `admin_operation_log` VALUES (2649, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:16:16', '2022-01-26 18:16:16');
INSERT INTO `admin_operation_log` VALUES (2650, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:17:10', '2022-01-26 18:17:10');
INSERT INTO `admin_operation_log` VALUES (2651, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:18:44', '2022-01-26 18:18:44');
INSERT INTO `admin_operation_log` VALUES (2652, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:19:14', '2022-01-26 18:19:14');
INSERT INTO `admin_operation_log` VALUES (2653, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:19:48', '2022-01-26 18:19:48');
INSERT INTO `admin_operation_log` VALUES (2654, 1, 'admin/accounts/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 18:19:50', '2022-01-26 18:19:50');
INSERT INTO `admin_operation_log` VALUES (2655, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 18:19:54', '2022-01-26 18:19:54');
INSERT INTO `admin_operation_log` VALUES (2656, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:22:20', '2022-01-26 18:22:20');
INSERT INTO `admin_operation_log` VALUES (2657, 1, 'admin/accounts/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 18:22:22', '2022-01-26 18:22:22');
INSERT INTO `admin_operation_log` VALUES (2658, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-26 18:22:23', '2022-01-26 18:22:23');
INSERT INTO `admin_operation_log` VALUES (2659, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"gn9ke6onD69GdKFaHN2iRJEUP1Pd2mZUAhmKvTls\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-26 18:22:38', '2022-01-26 18:22:38');
INSERT INTO `admin_operation_log` VALUES (2660, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:22:43', '2022-01-26 18:22:43');
INSERT INTO `admin_operation_log` VALUES (2661, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"gn9ke6onD69GdKFaHN2iRJEUP1Pd2mZUAhmKvTls\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-26 18:22:45', '2022-01-26 18:22:45');
INSERT INTO `admin_operation_log` VALUES (2662, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:23:40', '2022-01-26 18:23:40');
INSERT INTO `admin_operation_log` VALUES (2663, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:24:34', '2022-01-26 18:24:34');
INSERT INTO `admin_operation_log` VALUES (2664, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:27:31', '2022-01-26 18:27:31');
INSERT INTO `admin_operation_log` VALUES (2665, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"gn9ke6onD69GdKFaHN2iRJEUP1Pd2mZUAhmKvTls\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-26 18:27:34', '2022-01-26 18:27:34');
INSERT INTO `admin_operation_log` VALUES (2666, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"gn9ke6onD69GdKFaHN2iRJEUP1Pd2mZUAhmKvTls\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-26 18:27:59', '2022-01-26 18:27:59');
INSERT INTO `admin_operation_log` VALUES (2667, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-26 18:28:11', '2022-01-26 18:28:11');
INSERT INTO `admin_operation_log` VALUES (2668, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"gn9ke6onD69GdKFaHN2iRJEUP1Pd2mZUAhmKvTls\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-26 18:28:12', '2022-01-26 18:28:12');
INSERT INTO `admin_operation_log` VALUES (2669, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 09:51:54', '2022-01-27 09:51:54');
INSERT INTO `admin_operation_log` VALUES (2670, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 09:51:56', '2022-01-27 09:51:56');
INSERT INTO `admin_operation_log` VALUES (2671, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:05:58', '2022-01-27 10:05:58');
INSERT INTO `admin_operation_log` VALUES (2672, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:06:00', '2022-01-27 10:06:00');
INSERT INTO `admin_operation_log` VALUES (2673, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:06:07', '2022-01-27 10:06:07');
INSERT INTO `admin_operation_log` VALUES (2674, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:12:21', '2022-01-27 10:12:21');
INSERT INTO `admin_operation_log` VALUES (2675, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:12:51', '2022-01-27 10:12:51');
INSERT INTO `admin_operation_log` VALUES (2676, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:12:51', '2022-01-27 10:12:51');
INSERT INTO `admin_operation_log` VALUES (2677, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:13:16', '2022-01-27 10:13:16');
INSERT INTO `admin_operation_log` VALUES (2678, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:15:10', '2022-01-27 10:15:10');
INSERT INTO `admin_operation_log` VALUES (2679, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:15:12', '2022-01-27 10:15:12');
INSERT INTO `admin_operation_log` VALUES (2680, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:15:21', '2022-01-27 10:15:21');
INSERT INTO `admin_operation_log` VALUES (2681, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:16:17', '2022-01-27 10:16:17');
INSERT INTO `admin_operation_log` VALUES (2682, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:16:39', '2022-01-27 10:16:39');
INSERT INTO `admin_operation_log` VALUES (2683, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:16:50', '2022-01-27 10:16:50');
INSERT INTO `admin_operation_log` VALUES (2684, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:17:01', '2022-01-27 10:17:01');
INSERT INTO `admin_operation_log` VALUES (2685, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:17:10', '2022-01-27 10:17:10');
INSERT INTO `admin_operation_log` VALUES (2686, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:18:17', '2022-01-27 10:18:17');
INSERT INTO `admin_operation_log` VALUES (2687, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:18:31', '2022-01-27 10:18:31');
INSERT INTO `admin_operation_log` VALUES (2688, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:18:33', '2022-01-27 10:18:33');
INSERT INTO `admin_operation_log` VALUES (2689, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:18:42', '2022-01-27 10:18:42');
INSERT INTO `admin_operation_log` VALUES (2690, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:18:45', '2022-01-27 10:18:45');
INSERT INTO `admin_operation_log` VALUES (2691, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:19:44', '2022-01-27 10:19:44');
INSERT INTO `admin_operation_log` VALUES (2692, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:19:55', '2022-01-27 10:19:55');
INSERT INTO `admin_operation_log` VALUES (2693, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:19:56', '2022-01-27 10:19:56');
INSERT INTO `admin_operation_log` VALUES (2694, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Account\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_action\":\"App_Admin_Actions_Account_Task\"}', '2022-01-27 10:20:36', '2022-01-27 10:20:36');
INSERT INTO `admin_operation_log` VALUES (2695, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:21:35', '2022-01-27 10:21:35');
INSERT INTO `admin_operation_log` VALUES (2696, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:22:42', '2022-01-27 10:22:42');
INSERT INTO `admin_operation_log` VALUES (2697, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:23:33', '2022-01-27 10:23:33');
INSERT INTO `admin_operation_log` VALUES (2698, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:23:40', '2022-01-27 10:23:40');
INSERT INTO `admin_operation_log` VALUES (2699, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:23:46', '2022-01-27 10:23:46');
INSERT INTO `admin_operation_log` VALUES (2700, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:23:53', '2022-01-27 10:23:53');
INSERT INTO `admin_operation_log` VALUES (2701, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:24:05', '2022-01-27 10:24:05');
INSERT INTO `admin_operation_log` VALUES (2702, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:24:58', '2022-01-27 10:24:58');
INSERT INTO `admin_operation_log` VALUES (2703, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:25:23', '2022-01-27 10:25:23');
INSERT INTO `admin_operation_log` VALUES (2704, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:26:46', '2022-01-27 10:26:46');
INSERT INTO `admin_operation_log` VALUES (2705, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:27:10', '2022-01-27 10:27:10');
INSERT INTO `admin_operation_log` VALUES (2706, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:27:17', '2022-01-27 10:27:17');
INSERT INTO `admin_operation_log` VALUES (2707, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:27:22', '2022-01-27 10:27:22');
INSERT INTO `admin_operation_log` VALUES (2708, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:27:42', '2022-01-27 10:27:42');
INSERT INTO `admin_operation_log` VALUES (2709, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:29:32', '2022-01-27 10:29:32');
INSERT INTO `admin_operation_log` VALUES (2710, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:30:49', '2022-01-27 10:30:49');
INSERT INTO `admin_operation_log` VALUES (2711, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:30:57', '2022-01-27 10:30:57');
INSERT INTO `admin_operation_log` VALUES (2712, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:31:10', '2022-01-27 10:31:10');
INSERT INTO `admin_operation_log` VALUES (2713, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:31:42', '2022-01-27 10:31:42');
INSERT INTO `admin_operation_log` VALUES (2714, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:32:54', '2022-01-27 10:32:54');
INSERT INTO `admin_operation_log` VALUES (2715, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:32:56', '2022-01-27 10:32:56');
INSERT INTO `admin_operation_log` VALUES (2716, 1, 'admin/tasks/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:32:59', '2022-01-27 10:32:59');
INSERT INTO `admin_operation_log` VALUES (2717, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:33:00', '2022-01-27 10:33:00');
INSERT INTO `admin_operation_log` VALUES (2718, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:38:25', '2022-01-27 10:38:25');
INSERT INTO `admin_operation_log` VALUES (2719, 1, 'admin/tasks/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:38:27', '2022-01-27 10:38:27');
INSERT INTO `admin_operation_log` VALUES (2720, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 10:38:28', '2022-01-27 10:38:28');
INSERT INTO `admin_operation_log` VALUES (2721, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:38:58', '2022-01-27 10:38:58');
INSERT INTO `admin_operation_log` VALUES (2722, 1, 'admin/tasks/2', 'GET', '127.0.0.1', '[]', '2022-01-27 10:39:03', '2022-01-27 10:39:03');
INSERT INTO `admin_operation_log` VALUES (2723, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 10:39:07', '2022-01-27 10:39:07');
INSERT INTO `admin_operation_log` VALUES (2724, 1, 'admin/tasks/2', 'GET', '127.0.0.1', '[]', '2022-01-27 10:39:18', '2022-01-27 10:39:18');
INSERT INTO `admin_operation_log` VALUES (2725, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 10:39:37', '2022-01-27 10:39:37');
INSERT INTO `admin_operation_log` VALUES (2726, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:39:41', '2022-01-27 10:39:41');
INSERT INTO `admin_operation_log` VALUES (2727, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:39:43', '2022-01-27 10:39:43');
INSERT INTO `admin_operation_log` VALUES (2728, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 10:40:06', '2022-01-27 10:40:06');
INSERT INTO `admin_operation_log` VALUES (2729, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 10:40:15', '2022-01-27 10:40:15');
INSERT INTO `admin_operation_log` VALUES (2730, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:40:18', '2022-01-27 10:40:18');
INSERT INTO `admin_operation_log` VALUES (2731, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:40:20', '2022-01-27 10:40:20');
INSERT INTO `admin_operation_log` VALUES (2732, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:40:28', '2022-01-27 10:40:28');
INSERT INTO `admin_operation_log` VALUES (2733, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:40:30', '2022-01-27 10:40:30');
INSERT INTO `admin_operation_log` VALUES (2734, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 10:56:13', '2022-01-27 10:56:13');
INSERT INTO `admin_operation_log` VALUES (2735, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 10:56:18', '2022-01-27 10:56:18');
INSERT INTO `admin_operation_log` VALUES (2736, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-27 10:56:21', '2022-01-27 10:56:21');
INSERT INTO `admin_operation_log` VALUES (2737, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:56:25', '2022-01-27 10:56:25');
INSERT INTO `admin_operation_log` VALUES (2738, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:56:27', '2022-01-27 10:56:27');
INSERT INTO `admin_operation_log` VALUES (2739, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:14', '2022-01-27 10:59:14');
INSERT INTO `admin_operation_log` VALUES (2740, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:16', '2022-01-27 10:59:16');
INSERT INTO `admin_operation_log` VALUES (2741, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:27', '2022-01-27 10:59:27');
INSERT INTO `admin_operation_log` VALUES (2742, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:30', '2022-01-27 10:59:30');
INSERT INTO `admin_operation_log` VALUES (2743, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:49', '2022-01-27 10:59:49');
INSERT INTO `admin_operation_log` VALUES (2744, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 10:59:51', '2022-01-27 10:59:51');
INSERT INTO `admin_operation_log` VALUES (2745, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 11:00:02', '2022-01-27 11:00:02');
INSERT INTO `admin_operation_log` VALUES (2746, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 11:01:58', '2022-01-27 11:01:58');
INSERT INTO `admin_operation_log` VALUES (2747, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-27 11:02:03', '2022-01-27 11:02:03');
INSERT INTO `admin_operation_log` VALUES (2748, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:02:08', '2022-01-27 11:02:08');
INSERT INTO `admin_operation_log` VALUES (2749, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:02:11', '2022-01-27 11:02:11');
INSERT INTO `admin_operation_log` VALUES (2750, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:02:41', '2022-01-27 11:02:41');
INSERT INTO `admin_operation_log` VALUES (2751, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:02:43', '2022-01-27 11:02:43');
INSERT INTO `admin_operation_log` VALUES (2752, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:14:30', '2022-01-27 11:14:30');
INSERT INTO `admin_operation_log` VALUES (2753, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:14:32', '2022-01-27 11:14:32');
INSERT INTO `admin_operation_log` VALUES (2754, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:16:02', '2022-01-27 11:16:02');
INSERT INTO `admin_operation_log` VALUES (2755, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:16:04', '2022-01-27 11:16:04');
INSERT INTO `admin_operation_log` VALUES (2756, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:17:44', '2022-01-27 11:17:44');
INSERT INTO `admin_operation_log` VALUES (2757, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:17:47', '2022-01-27 11:17:47');
INSERT INTO `admin_operation_log` VALUES (2758, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:17:59', '2022-01-27 11:17:59');
INSERT INTO `admin_operation_log` VALUES (2759, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:03', '2022-01-27 11:18:03');
INSERT INTO `admin_operation_log` VALUES (2760, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '[]', '2022-01-27 11:18:11', '2022-01-27 11:18:11');
INSERT INTO `admin_operation_log` VALUES (2761, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 11:18:15', '2022-01-27 11:18:15');
INSERT INTO `admin_operation_log` VALUES (2762, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:17', '2022-01-27 11:18:17');
INSERT INTO `admin_operation_log` VALUES (2763, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2022-01-27 11:18:19', '2022-01-27 11:18:19');
INSERT INTO `admin_operation_log` VALUES (2764, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:21', '2022-01-27 11:18:21');
INSERT INTO `admin_operation_log` VALUES (2765, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:22', '2022-01-27 11:18:22');
INSERT INTO `admin_operation_log` VALUES (2766, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:31', '2022-01-27 11:18:31');
INSERT INTO `admin_operation_log` VALUES (2767, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:33', '2022-01-27 11:18:33');
INSERT INTO `admin_operation_log` VALUES (2768, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:51', '2022-01-27 11:18:51');
INSERT INTO `admin_operation_log` VALUES (2769, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:18:56', '2022-01-27 11:18:56');
INSERT INTO `admin_operation_log` VALUES (2770, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:19:14', '2022-01-27 11:19:14');
INSERT INTO `admin_operation_log` VALUES (2771, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 11:19:14', '2022-01-27 11:19:14');
INSERT INTO `admin_operation_log` VALUES (2772, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 11:19:15', '2022-01-27 11:19:15');
INSERT INTO `admin_operation_log` VALUES (2773, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:19:16', '2022-01-27 11:19:16');
INSERT INTO `admin_operation_log` VALUES (2774, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:20:05', '2022-01-27 11:20:05');
INSERT INTO `admin_operation_log` VALUES (2775, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:20:07', '2022-01-27 11:20:07');
INSERT INTO `admin_operation_log` VALUES (2776, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:20:29', '2022-01-27 11:20:29');
INSERT INTO `admin_operation_log` VALUES (2777, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:20:32', '2022-01-27 11:20:32');
INSERT INTO `admin_operation_log` VALUES (2778, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:21:13', '2022-01-27 11:21:13');
INSERT INTO `admin_operation_log` VALUES (2779, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:21:14', '2022-01-27 11:21:14');
INSERT INTO `admin_operation_log` VALUES (2780, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:22:21', '2022-01-27 11:22:21');
INSERT INTO `admin_operation_log` VALUES (2781, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:22:23', '2022-01-27 11:22:23');
INSERT INTO `admin_operation_log` VALUES (2782, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:23:32', '2022-01-27 11:23:32');
INSERT INTO `admin_operation_log` VALUES (2783, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:23:34', '2022-01-27 11:23:34');
INSERT INTO `admin_operation_log` VALUES (2784, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:25:08', '2022-01-27 11:25:08');
INSERT INTO `admin_operation_log` VALUES (2785, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:25:10', '2022-01-27 11:25:10');
INSERT INTO `admin_operation_log` VALUES (2786, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:25:47', '2022-01-27 11:25:47');
INSERT INTO `admin_operation_log` VALUES (2787, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:25:49', '2022-01-27 11:25:49');
INSERT INTO `admin_operation_log` VALUES (2788, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:26:24', '2022-01-27 11:26:24');
INSERT INTO `admin_operation_log` VALUES (2789, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:26:26', '2022-01-27 11:26:26');
INSERT INTO `admin_operation_log` VALUES (2790, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:27:39', '2022-01-27 11:27:39');
INSERT INTO `admin_operation_log` VALUES (2791, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:27:46', '2022-01-27 11:27:46');
INSERT INTO `admin_operation_log` VALUES (2792, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:08', '2022-01-27 11:28:08');
INSERT INTO `admin_operation_log` VALUES (2793, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:10', '2022-01-27 11:28:10');
INSERT INTO `admin_operation_log` VALUES (2794, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:19', '2022-01-27 11:28:19');
INSERT INTO `admin_operation_log` VALUES (2795, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:21', '2022-01-27 11:28:21');
INSERT INTO `admin_operation_log` VALUES (2796, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:31', '2022-01-27 11:28:31');
INSERT INTO `admin_operation_log` VALUES (2797, 1, 'admin/tasks/4/account', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:28:33', '2022-01-27 11:28:33');
INSERT INTO `admin_operation_log` VALUES (2798, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:31:14', '2022-01-27 11:31:14');
INSERT INTO `admin_operation_log` VALUES (2799, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:31:17', '2022-01-27 11:31:17');
INSERT INTO `admin_operation_log` VALUES (2800, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:33:52', '2022-01-27 11:33:52');
INSERT INTO `admin_operation_log` VALUES (2801, 1, 'admin/account-videos', 'GET', '127.0.0.1', '[]', '2022-01-27 11:34:14', '2022-01-27 11:34:14');
INSERT INTO `admin_operation_log` VALUES (2802, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:35:08', '2022-01-27 11:35:08');
INSERT INTO `admin_operation_log` VALUES (2803, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:35:09', '2022-01-27 11:35:09');
INSERT INTO `admin_operation_log` VALUES (2804, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2022-01-27 11:36:58', '2022-01-27 11:36:58');
INSERT INTO `admin_operation_log` VALUES (2805, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2022-01-27 11:38:08', '2022-01-27 11:38:08');
INSERT INTO `admin_operation_log` VALUES (2806, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:38:12', '2022-01-27 11:38:12');
INSERT INTO `admin_operation_log` VALUES (2807, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:38:14', '2022-01-27 11:38:14');
INSERT INTO `admin_operation_log` VALUES (2808, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:06', '2022-01-27 11:39:06');
INSERT INTO `admin_operation_log` VALUES (2809, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:08', '2022-01-27 11:39:08');
INSERT INTO `admin_operation_log` VALUES (2810, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:09', '2022-01-27 11:39:09');
INSERT INTO `admin_operation_log` VALUES (2811, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:56', '2022-01-27 11:39:56');
INSERT INTO `admin_operation_log` VALUES (2812, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:58', '2022-01-27 11:39:58');
INSERT INTO `admin_operation_log` VALUES (2813, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:39:59', '2022-01-27 11:39:59');
INSERT INTO `admin_operation_log` VALUES (2814, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:40:01', '2022-01-27 11:40:01');
INSERT INTO `admin_operation_log` VALUES (2815, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:40:03', '2022-01-27 11:40:03');
INSERT INTO `admin_operation_log` VALUES (2816, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2022-01-27 11:40:29', '2022-01-27 11:40:29');
INSERT INTO `admin_operation_log` VALUES (2817, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:40:34', '2022-01-27 11:40:34');
INSERT INTO `admin_operation_log` VALUES (2818, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\"}', '2022-01-27 11:42:54', '2022-01-27 11:42:54');
INSERT INTO `admin_operation_log` VALUES (2819, 1, 'admin/account-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:43:08', '2022-01-27 11:43:08');
INSERT INTO `admin_operation_log` VALUES (2820, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:43:10', '2022-01-27 11:43:10');
INSERT INTO `admin_operation_log` VALUES (2821, 1, 'admin/account-videos/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:44:49', '2022-01-27 11:44:49');
INSERT INTO `admin_operation_log` VALUES (2822, 1, 'admin/account-videos', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:44:51', '2022-01-27 11:44:51');
INSERT INTO `admin_operation_log` VALUES (2823, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:56:03', '2022-01-27 11:56:03');
INSERT INTO `admin_operation_log` VALUES (2824, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 11:56:38', '2022-01-27 11:56:38');
INSERT INTO `admin_operation_log` VALUES (2825, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 11:59:20', '2022-01-27 11:59:20');
INSERT INTO `admin_operation_log` VALUES (2826, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:50:35', '2022-01-27 13:50:35');
INSERT INTO `admin_operation_log` VALUES (2827, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:51:00', '2022-01-27 13:51:00');
INSERT INTO `admin_operation_log` VALUES (2828, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:51:33', '2022-01-27 13:51:33');
INSERT INTO `admin_operation_log` VALUES (2829, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:52:09', '2022-01-27 13:52:09');
INSERT INTO `admin_operation_log` VALUES (2830, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:52:28', '2022-01-27 13:52:28');
INSERT INTO `admin_operation_log` VALUES (2831, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:52:48', '2022-01-27 13:52:48');
INSERT INTO `admin_operation_log` VALUES (2832, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:53:49', '2022-01-27 13:53:49');
INSERT INTO `admin_operation_log` VALUES (2833, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:53:51', '2022-01-27 13:53:51');
INSERT INTO `admin_operation_log` VALUES (2834, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:54:34', '2022-01-27 13:54:34');
INSERT INTO `admin_operation_log` VALUES (2835, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:54:59', '2022-01-27 13:54:59');
INSERT INTO `admin_operation_log` VALUES (2836, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:55:23', '2022-01-27 13:55:23');
INSERT INTO `admin_operation_log` VALUES (2837, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:56:20', '2022-01-27 13:56:20');
INSERT INTO `admin_operation_log` VALUES (2838, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:56:40', '2022-01-27 13:56:40');
INSERT INTO `admin_operation_log` VALUES (2839, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:56:48', '2022-01-27 13:56:48');
INSERT INTO `admin_operation_log` VALUES (2840, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:57:32', '2022-01-27 13:57:32');
INSERT INTO `admin_operation_log` VALUES (2841, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 13:59:42', '2022-01-27 13:59:42');
INSERT INTO `admin_operation_log` VALUES (2842, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:00:28', '2022-01-27 14:00:28');
INSERT INTO `admin_operation_log` VALUES (2843, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:00:35', '2022-01-27 14:00:35');
INSERT INTO `admin_operation_log` VALUES (2844, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:00:42', '2022-01-27 14:00:42');
INSERT INTO `admin_operation_log` VALUES (2845, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:01:06', '2022-01-27 14:01:06');
INSERT INTO `admin_operation_log` VALUES (2846, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:01:14', '2022-01-27 14:01:14');
INSERT INTO `admin_operation_log` VALUES (2847, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:04:45', '2022-01-27 14:04:45');
INSERT INTO `admin_operation_log` VALUES (2848, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:07:51', '2022-01-27 14:07:51');
INSERT INTO `admin_operation_log` VALUES (2849, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:07:52', '2022-01-27 14:07:52');
INSERT INTO `admin_operation_log` VALUES (2850, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:08:40', '2022-01-27 14:08:40');
INSERT INTO `admin_operation_log` VALUES (2851, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"task_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:08:42', '2022-01-27 14:08:42');
INSERT INTO `admin_operation_log` VALUES (2852, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:09:18', '2022-01-27 14:09:18');
INSERT INTO `admin_operation_log` VALUES (2853, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:09:32', '2022-01-27 14:09:32');
INSERT INTO `admin_operation_log` VALUES (2854, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"task_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:09:34', '2022-01-27 14:09:34');
INSERT INTO `admin_operation_log` VALUES (2855, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"task_id\":\"3\"}', '2022-01-27 14:37:05', '2022-01-27 14:37:05');
INSERT INTO `admin_operation_log` VALUES (2856, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"task_id\":\"3\"}', '2022-01-27 14:38:04', '2022-01-27 14:38:04');
INSERT INTO `admin_operation_log` VALUES (2857, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"account_id\":\"4\",\"task_id\":\"3\"}', '2022-01-27 14:38:26', '2022-01-27 14:38:26');
INSERT INTO `admin_operation_log` VALUES (2858, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:45:40', '2022-01-27 14:45:40');
INSERT INTO `admin_operation_log` VALUES (2859, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:45:43', '2022-01-27 14:45:43');
INSERT INTO `admin_operation_log` VALUES (2860, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:45:49', '2022-01-27 14:45:49');
INSERT INTO `admin_operation_log` VALUES (2861, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:46:00', '2022-01-27 14:46:00');
INSERT INTO `admin_operation_log` VALUES (2862, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 14:49:42', '2022-01-27 14:49:42');
INSERT INTO `admin_operation_log` VALUES (2863, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:49:44', '2022-01-27 14:49:44');
INSERT INTO `admin_operation_log` VALUES (2864, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"videos\":{\"new_1\":{\"content\":null,\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 14:50:02', '2022-01-27 14:50:02');
INSERT INTO `admin_operation_log` VALUES (2865, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:50:25', '2022-01-27 14:50:25');
INSERT INTO `admin_operation_log` VALUES (2866, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"videos\":{\"new_1\":{\"content\":\"dfsgdfgdfgdfg\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 14:50:34', '2022-01-27 14:50:34');
INSERT INTO `admin_operation_log` VALUES (2867, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:51:08', '2022-01-27 14:51:08');
INSERT INTO `admin_operation_log` VALUES (2868, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:51:10', '2022-01-27 14:51:10');
INSERT INTO `admin_operation_log` VALUES (2869, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"videos\":{\"new_1\":{\"content\":\"1111111111111\",\"_remove_\":\"0\"},\"new_2\":{\"content\":\"2222222222222\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/create?account_id=4&task_id=3\"}', '2022-01-27 14:51:21', '2022-01-27 14:51:21');
INSERT INTO `admin_operation_log` VALUES (2870, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:52:28', '2022-01-27 14:52:28');
INSERT INTO `admin_operation_log` VALUES (2871, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:52:31', '2022-01-27 14:52:31');
INSERT INTO `admin_operation_log` VALUES (2872, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"videos\":{\"new_1\":{\"content\":\"qwerewr\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 14:52:42', '2022-01-27 14:52:42');
INSERT INTO `admin_operation_log` VALUES (2873, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 14:54:02', '2022-01-27 14:54:02');
INSERT INTO `admin_operation_log` VALUES (2874, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:54:02', '2022-01-27 14:54:02');
INSERT INTO `admin_operation_log` VALUES (2875, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 14:54:05', '2022-01-27 14:54:05');
INSERT INTO `admin_operation_log` VALUES (2876, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:54:05', '2022-01-27 14:54:05');
INSERT INTO `admin_operation_log` VALUES (2877, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 14:54:51', '2022-01-27 14:54:51');
INSERT INTO `admin_operation_log` VALUES (2878, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"videos\":{\"new_1\":{\"content\":\"11111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 14:54:59', '2022-01-27 14:54:59');
INSERT INTO `admin_operation_log` VALUES (2879, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:10:44', '2022-01-27 15:10:44');
INSERT INTO `admin_operation_log` VALUES (2880, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:10:45', '2022-01-27 15:10:45');
INSERT INTO `admin_operation_log` VALUES (2881, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"retertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:12:48', '2022-01-27 15:12:48');
INSERT INTO `admin_operation_log` VALUES (2882, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:12:48', '2022-01-27 15:12:48');
INSERT INTO `admin_operation_log` VALUES (2883, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"retertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:13:20', '2022-01-27 15:13:20');
INSERT INTO `admin_operation_log` VALUES (2884, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:13:34', '2022-01-27 15:13:34');
INSERT INTO `admin_operation_log` VALUES (2885, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:13:39', '2022-01-27 15:13:39');
INSERT INTO `admin_operation_log` VALUES (2886, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ertertertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:13:58', '2022-01-27 15:13:58');
INSERT INTO `admin_operation_log` VALUES (2887, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:13:59', '2022-01-27 15:13:59');
INSERT INTO `admin_operation_log` VALUES (2888, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ertertertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:16:26', '2022-01-27 15:16:26');
INSERT INTO `admin_operation_log` VALUES (2889, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:16:27', '2022-01-27 15:16:27');
INSERT INTO `admin_operation_log` VALUES (2890, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ertertertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:16:59', '2022-01-27 15:16:59');
INSERT INTO `admin_operation_log` VALUES (2891, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:16:59', '2022-01-27 15:16:59');
INSERT INTO `admin_operation_log` VALUES (2892, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ertertertert\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:19:33', '2022-01-27 15:19:33');
INSERT INTO `admin_operation_log` VALUES (2893, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:21:13', '2022-01-27 15:21:13');
INSERT INTO `admin_operation_log` VALUES (2894, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:21:15', '2022-01-27 15:21:15');
INSERT INTO `admin_operation_log` VALUES (2895, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"sfdsewrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:21:33', '2022-01-27 15:21:33');
INSERT INTO `admin_operation_log` VALUES (2896, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:21:38', '2022-01-27 15:21:38');
INSERT INTO `admin_operation_log` VALUES (2897, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:21:41', '2022-01-27 15:21:41');
INSERT INTO `admin_operation_log` VALUES (2898, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:21:53', '2022-01-27 15:21:53');
INSERT INTO `admin_operation_log` VALUES (2899, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:21:53', '2022-01-27 15:21:53');
INSERT INTO `admin_operation_log` VALUES (2900, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:22:28', '2022-01-27 15:22:28');
INSERT INTO `admin_operation_log` VALUES (2901, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:22:28', '2022-01-27 15:22:28');
INSERT INTO `admin_operation_log` VALUES (2902, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:23:36', '2022-01-27 15:23:36');
INSERT INTO `admin_operation_log` VALUES (2903, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:23:36', '2022-01-27 15:23:36');
INSERT INTO `admin_operation_log` VALUES (2904, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:23:58', '2022-01-27 15:23:58');
INSERT INTO `admin_operation_log` VALUES (2905, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:23:58', '2022-01-27 15:23:58');
INSERT INTO `admin_operation_log` VALUES (2906, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:26:40', '2022-01-27 15:26:40');
INSERT INTO `admin_operation_log` VALUES (2907, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:26:40', '2022-01-27 15:26:40');
INSERT INTO `admin_operation_log` VALUES (2908, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:27:22', '2022-01-27 15:27:22');
INSERT INTO `admin_operation_log` VALUES (2909, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:27:23', '2022-01-27 15:27:23');
INSERT INTO `admin_operation_log` VALUES (2910, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:27:46', '2022-01-27 15:27:46');
INSERT INTO `admin_operation_log` VALUES (2911, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:28:50', '2022-01-27 15:28:50');
INSERT INTO `admin_operation_log` VALUES (2912, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:29:02', '2022-01-27 15:29:02');
INSERT INTO `admin_operation_log` VALUES (2913, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:29:03', '2022-01-27 15:29:03');
INSERT INTO `admin_operation_log` VALUES (2914, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:29:05', '2022-01-27 15:29:05');
INSERT INTO `admin_operation_log` VALUES (2915, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 15:32:29', '2022-01-27 15:32:29');
INSERT INTO `admin_operation_log` VALUES (2916, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:32:30', '2022-01-27 15:32:30');
INSERT INTO `admin_operation_log` VALUES (2917, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:33:03', '2022-01-27 15:33:03');
INSERT INTO `admin_operation_log` VALUES (2918, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:34:14', '2022-01-27 15:34:14');
INSERT INTO `admin_operation_log` VALUES (2919, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:34:15', '2022-01-27 15:34:15');
INSERT INTO `admin_operation_log` VALUES (2920, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:34:29', '2022-01-27 15:34:29');
INSERT INTO `admin_operation_log` VALUES (2921, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:34:30', '2022-01-27 15:34:30');
INSERT INTO `admin_operation_log` VALUES (2922, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:36:59', '2022-01-27 15:36:59');
INSERT INTO `admin_operation_log` VALUES (2923, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:37:30', '2022-01-27 15:37:30');
INSERT INTO `admin_operation_log` VALUES (2924, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:37:31', '2022-01-27 15:37:31');
INSERT INTO `admin_operation_log` VALUES (2925, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:37:41', '2022-01-27 15:37:41');
INSERT INTO `admin_operation_log` VALUES (2926, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:37:41', '2022-01-27 15:37:41');
INSERT INTO `admin_operation_log` VALUES (2927, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:39:08', '2022-01-27 15:39:08');
INSERT INTO `admin_operation_log` VALUES (2928, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:39:08', '2022-01-27 15:39:08');
INSERT INTO `admin_operation_log` VALUES (2929, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:39:10', '2022-01-27 15:39:10');
INSERT INTO `admin_operation_log` VALUES (2930, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 15:40:00', '2022-01-27 15:40:00');
INSERT INTO `admin_operation_log` VALUES (2931, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:40:01', '2022-01-27 15:40:01');
INSERT INTO `admin_operation_log` VALUES (2932, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:41:16', '2022-01-27 15:41:16');
INSERT INTO `admin_operation_log` VALUES (2933, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:41:17', '2022-01-27 15:41:17');
INSERT INTO `admin_operation_log` VALUES (2934, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:44:59', '2022-01-27 15:44:59');
INSERT INTO `admin_operation_log` VALUES (2935, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 15:45:09', '2022-01-27 15:45:09');
INSERT INTO `admin_operation_log` VALUES (2936, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:45:10', '2022-01-27 15:45:10');
INSERT INTO `admin_operation_log` VALUES (2937, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:46:12', '2022-01-27 15:46:12');
INSERT INTO `admin_operation_log` VALUES (2938, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 15:46:24', '2022-01-27 15:46:24');
INSERT INTO `admin_operation_log` VALUES (2939, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:46:24', '2022-01-27 15:46:24');
INSERT INTO `admin_operation_log` VALUES (2940, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:50:00', '2022-01-27 15:50:00');
INSERT INTO `admin_operation_log` VALUES (2941, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:50:29', '2022-01-27 15:50:29');
INSERT INTO `admin_operation_log` VALUES (2942, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:52:19', '2022-01-27 15:52:19');
INSERT INTO `admin_operation_log` VALUES (2943, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:52:20', '2022-01-27 15:52:20');
INSERT INTO `admin_operation_log` VALUES (2944, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:52:45', '2022-01-27 15:52:45');
INSERT INTO `admin_operation_log` VALUES (2945, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:54:24', '2022-01-27 15:54:24');
INSERT INTO `admin_operation_log` VALUES (2946, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:54:24', '2022-01-27 15:54:24');
INSERT INTO `admin_operation_log` VALUES (2947, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:54:25', '2022-01-27 15:54:25');
INSERT INTO `admin_operation_log` VALUES (2948, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:54:37', '2022-01-27 15:54:37');
INSERT INTO `admin_operation_log` VALUES (2949, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:54:38', '2022-01-27 15:54:38');
INSERT INTO `admin_operation_log` VALUES (2950, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:54:45', '2022-01-27 15:54:45');
INSERT INTO `admin_operation_log` VALUES (2951, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:56:52', '2022-01-27 15:56:52');
INSERT INTO `admin_operation_log` VALUES (2952, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 15:58:22', '2022-01-27 15:58:22');
INSERT INTO `admin_operation_log` VALUES (2953, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 15:58:22', '2022-01-27 15:58:22');
INSERT INTO `admin_operation_log` VALUES (2954, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 15:58:28', '2022-01-27 15:58:28');
INSERT INTO `admin_operation_log` VALUES (2955, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 15:59:58', '2022-01-27 15:59:58');
INSERT INTO `admin_operation_log` VALUES (2956, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:00:16', '2022-01-27 16:00:16');
INSERT INTO `admin_operation_log` VALUES (2957, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:00:16', '2022-01-27 16:00:16');
INSERT INTO `admin_operation_log` VALUES (2958, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:00:19', '2022-01-27 16:00:19');
INSERT INTO `admin_operation_log` VALUES (2959, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:01:41', '2022-01-27 16:01:41');
INSERT INTO `admin_operation_log` VALUES (2960, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:01:53', '2022-01-27 16:01:53');
INSERT INTO `admin_operation_log` VALUES (2961, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:01:53', '2022-01-27 16:01:53');
INSERT INTO `admin_operation_log` VALUES (2962, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:01:55', '2022-01-27 16:01:55');
INSERT INTO `admin_operation_log` VALUES (2963, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:03:11', '2022-01-27 16:03:11');
INSERT INTO `admin_operation_log` VALUES (2964, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:03:11', '2022-01-27 16:03:11');
INSERT INTO `admin_operation_log` VALUES (2965, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:03:17', '2022-01-27 16:03:17');
INSERT INTO `admin_operation_log` VALUES (2966, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:06:07', '2022-01-27 16:06:07');
INSERT INTO `admin_operation_log` VALUES (2967, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:06:18', '2022-01-27 16:06:18');
INSERT INTO `admin_operation_log` VALUES (2968, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:06:47', '2022-01-27 16:06:47');
INSERT INTO `admin_operation_log` VALUES (2969, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[\"11\",null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:08:05', '2022-01-27 16:08:05');
INSERT INTO `admin_operation_log` VALUES (2970, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:08:05', '2022-01-27 16:08:05');
INSERT INTO `admin_operation_log` VALUES (2971, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:08:25', '2022-01-27 16:08:25');
INSERT INTO `admin_operation_log` VALUES (2972, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:08:35', '2022-01-27 16:08:35');
INSERT INTO `admin_operation_log` VALUES (2973, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:08:35', '2022-01-27 16:08:35');
INSERT INTO `admin_operation_log` VALUES (2974, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:09:20', '2022-01-27 16:09:20');
INSERT INTO `admin_operation_log` VALUES (2975, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:09:29', '2022-01-27 16:09:29');
INSERT INTO `admin_operation_log` VALUES (2976, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:09:30', '2022-01-27 16:09:30');
INSERT INTO `admin_operation_log` VALUES (2977, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:09:48', '2022-01-27 16:09:48');
INSERT INTO `admin_operation_log` VALUES (2978, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:09:55', '2022-01-27 16:09:55');
INSERT INTO `admin_operation_log` VALUES (2979, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:09:55', '2022-01-27 16:09:55');
INSERT INTO `admin_operation_log` VALUES (2980, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:10:12', '2022-01-27 16:10:12');
INSERT INTO `admin_operation_log` VALUES (2981, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:10:19', '2022-01-27 16:10:19');
INSERT INTO `admin_operation_log` VALUES (2982, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:10:19', '2022-01-27 16:10:19');
INSERT INTO `admin_operation_log` VALUES (2983, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:10:34', '2022-01-27 16:10:34');
INSERT INTO `admin_operation_log` VALUES (2984, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:10:39', '2022-01-27 16:10:39');
INSERT INTO `admin_operation_log` VALUES (2985, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:11:12', '2022-01-27 16:11:12');
INSERT INTO `admin_operation_log` VALUES (2986, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:11:12', '2022-01-27 16:11:12');
INSERT INTO `admin_operation_log` VALUES (2987, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"ewrrwer\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:11:18', '2022-01-27 16:11:18');
INSERT INTO `admin_operation_log` VALUES (2988, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:11:18', '2022-01-27 16:11:18');
INSERT INTO `admin_operation_log` VALUES (2989, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:11:21', '2022-01-27 16:11:21');
INSERT INTO `admin_operation_log` VALUES (2990, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:12:30', '2022-01-27 16:12:30');
INSERT INTO `admin_operation_log` VALUES (2991, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:12:31', '2022-01-27 16:12:31');
INSERT INTO `admin_operation_log` VALUES (2992, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:12:31', '2022-01-27 16:12:31');
INSERT INTO `admin_operation_log` VALUES (2993, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:12:33', '2022-01-27 16:12:33');
INSERT INTO `admin_operation_log` VALUES (2994, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"1111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:12:45', '2022-01-27 16:12:45');
INSERT INTO `admin_operation_log` VALUES (2995, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:12:46', '2022-01-27 16:12:46');
INSERT INTO `admin_operation_log` VALUES (2996, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:12:48', '2022-01-27 16:12:48');
INSERT INTO `admin_operation_log` VALUES (2997, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"1111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:12:51', '2022-01-27 16:12:51');
INSERT INTO `admin_operation_log` VALUES (2998, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:12:51', '2022-01-27 16:12:51');
INSERT INTO `admin_operation_log` VALUES (2999, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:12:53', '2022-01-27 16:12:53');
INSERT INTO `admin_operation_log` VALUES (3000, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:21:21', '2022-01-27 16:21:21');
INSERT INTO `admin_operation_log` VALUES (3001, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"1111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:21:30', '2022-01-27 16:21:30');
INSERT INTO `admin_operation_log` VALUES (3002, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:21:30', '2022-01-27 16:21:30');
INSERT INTO `admin_operation_log` VALUES (3003, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"1111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:22:03', '2022-01-27 16:22:03');
INSERT INTO `admin_operation_log` VALUES (3004, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:22:03', '2022-01-27 16:22:03');
INSERT INTO `admin_operation_log` VALUES (3005, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"1111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:23:15', '2022-01-27 16:23:15');
INSERT INTO `admin_operation_log` VALUES (3006, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:23:15', '2022-01-27 16:23:15');
INSERT INTO `admin_operation_log` VALUES (3007, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:23:17', '2022-01-27 16:23:17');
INSERT INTO `admin_operation_log` VALUES (3008, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"1111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:23:42', '2022-01-27 16:23:42');
INSERT INTO `admin_operation_log` VALUES (3009, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:23:42', '2022-01-27 16:23:42');
INSERT INTO `admin_operation_log` VALUES (3010, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:23:44', '2022-01-27 16:23:44');
INSERT INTO `admin_operation_log` VALUES (3011, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:39:23', '2022-01-27 16:39:23');
INSERT INTO `admin_operation_log` VALUES (3012, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"0\":{\"content\":\"1111\",\"_remove_\":\"1\"},\"new_1\":{\"content\":\"11111111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:39:38', '2022-01-27 16:39:38');
INSERT INTO `admin_operation_log` VALUES (3013, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:39:38', '2022-01-27 16:39:38');
INSERT INTO `admin_operation_log` VALUES (3014, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:40:04', '2022-01-27 16:40:04');
INSERT INTO `admin_operation_log` VALUES (3015, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:40:25', '2022-01-27 16:40:25');
INSERT INTO `admin_operation_log` VALUES (3016, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"111111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:40:35', '2022-01-27 16:40:35');
INSERT INTO `admin_operation_log` VALUES (3017, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:40:36', '2022-01-27 16:40:36');
INSERT INTO `admin_operation_log` VALUES (3018, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:40:43', '2022-01-27 16:40:43');
INSERT INTO `admin_operation_log` VALUES (3019, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:41:10', '2022-01-27 16:41:10');
INSERT INTO `admin_operation_log` VALUES (3020, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"new_1\":{\"content\":\"11111111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:41:23', '2022-01-27 16:41:23');
INSERT INTO `admin_operation_log` VALUES (3021, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:41:23', '2022-01-27 16:41:23');
INSERT INTO `admin_operation_log` VALUES (3022, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:42:17', '2022-01-27 16:42:17');
INSERT INTO `admin_operation_log` VALUES (3023, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"11111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:42:20', '2022-01-27 16:42:20');
INSERT INTO `admin_operation_log` VALUES (3024, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:42:27', '2022-01-27 16:42:27');
INSERT INTO `admin_operation_log` VALUES (3025, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:42:28', '2022-01-27 16:42:28');
INSERT INTO `admin_operation_log` VALUES (3026, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"11111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:42:34', '2022-01-27 16:42:34');
INSERT INTO `admin_operation_log` VALUES (3027, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:42:43', '2022-01-27 16:42:43');
INSERT INTO `admin_operation_log` VALUES (3028, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:42:45', '2022-01-27 16:42:45');
INSERT INTO `admin_operation_log` VALUES (3029, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"11111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:43:30', '2022-01-27 16:43:30');
INSERT INTO `admin_operation_log` VALUES (3030, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:43:41', '2022-01-27 16:43:41');
INSERT INTO `admin_operation_log` VALUES (3031, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:43:41', '2022-01-27 16:43:41');
INSERT INTO `admin_operation_log` VALUES (3032, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"11111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:43:44', '2022-01-27 16:43:44');
INSERT INTO `admin_operation_log` VALUES (3033, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:44:33', '2022-01-27 16:44:33');
INSERT INTO `admin_operation_log` VALUES (3034, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:44:34', '2022-01-27 16:44:34');
INSERT INTO `admin_operation_log` VALUES (3035, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"11111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:44:38', '2022-01-27 16:44:38');
INSERT INTO `admin_operation_log` VALUES (3036, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:45:17', '2022-01-27 16:45:17');
INSERT INTO `admin_operation_log` VALUES (3037, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:45:17', '2022-01-27 16:45:17');
INSERT INTO `admin_operation_log` VALUES (3038, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:45:18', '2022-01-27 16:45:18');
INSERT INTO `admin_operation_log` VALUES (3039, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":{\"0\":{\"content\":\"11111111\",\"_remove_\":\"1\"},\"new_1\":{\"content\":\"111111111\",\"_remove_\":\"0\"}},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:45:39', '2022-01-27 16:45:39');
INSERT INTO `admin_operation_log` VALUES (3040, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:45:44', '2022-01-27 16:45:44');
INSERT INTO `admin_operation_log` VALUES (3041, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 16:45:45', '2022-01-27 16:45:45');
INSERT INTO `admin_operation_log` VALUES (3042, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"111111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 16:45:56', '2022-01-27 16:45:56');
INSERT INTO `admin_operation_log` VALUES (3043, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:45:56', '2022-01-27 16:45:56');
INSERT INTO `admin_operation_log` VALUES (3044, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:46:48', '2022-01-27 16:46:48');
INSERT INTO `admin_operation_log` VALUES (3045, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"status\":\"10\",\"need_times\":\"0\",\"active\":\"on\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"starttime\":\"2022-01-24\",\"endtime\":\"2022-01-27\",\"units\":\"2\",\"frequency\":{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"},\"task_id\":\"3\",\"configs\":[{\"content\":\"111111111\",\"_remove_\":\"0\"}],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 16:46:56', '2022-01-27 16:46:56');
INSERT INTO `admin_operation_log` VALUES (3046, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 16:46:56', '2022-01-27 16:46:56');
INSERT INTO `admin_operation_log` VALUES (3047, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:47:38', '2022-01-27 16:47:38');
INSERT INTO `admin_operation_log` VALUES (3048, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 16:55:37', '2022-01-27 16:55:37');
INSERT INTO `admin_operation_log` VALUES (3049, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 17:01:45', '2022-01-27 17:01:45');
INSERT INTO `admin_operation_log` VALUES (3050, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 17:02:55', '2022-01-27 17:02:55');
INSERT INTO `admin_operation_log` VALUES (3051, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 17:03:18', '2022-01-27 17:03:18');
INSERT INTO `admin_operation_log` VALUES (3052, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 17:03:37', '2022-01-27 17:03:37');
INSERT INTO `admin_operation_log` VALUES (3053, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 17:03:58', '2022-01-27 17:03:58');
INSERT INTO `admin_operation_log` VALUES (3054, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 17:21:37', '2022-01-27 17:21:37');
INSERT INTO `admin_operation_log` VALUES (3055, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:27:59', '2022-01-27 17:27:59');
INSERT INTO `admin_operation_log` VALUES (3056, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:28:26', '2022-01-27 17:28:26');
INSERT INTO `admin_operation_log` VALUES (3057, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:29:53', '2022-01-27 17:29:53');
INSERT INTO `admin_operation_log` VALUES (3058, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:31:47', '2022-01-27 17:31:47');
INSERT INTO `admin_operation_log` VALUES (3059, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:34:15', '2022-01-27 17:34:15');
INSERT INTO `admin_operation_log` VALUES (3060, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:34:24', '2022-01-27 17:34:24');
INSERT INTO `admin_operation_log` VALUES (3061, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:34:49', '2022-01-27 17:34:49');
INSERT INTO `admin_operation_log` VALUES (3062, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:37:44', '2022-01-27 17:37:44');
INSERT INTO `admin_operation_log` VALUES (3063, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:37:58', '2022-01-27 17:37:58');
INSERT INTO `admin_operation_log` VALUES (3064, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:40:54', '2022-01-27 17:40:54');
INSERT INTO `admin_operation_log` VALUES (3065, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:41:16', '2022-01-27 17:41:16');
INSERT INTO `admin_operation_log` VALUES (3066, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:53:47', '2022-01-27 17:53:47');
INSERT INTO `admin_operation_log` VALUES (3067, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"task_id\":\"4\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\"}', '2022-01-27 17:55:21', '2022-01-27 17:55:21');
INSERT INTO `admin_operation_log` VALUES (3068, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 17:55:21', '2022-01-27 17:55:21');
INSERT INTO `admin_operation_log` VALUES (3069, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 17:55:25', '2022-01-27 17:55:25');
INSERT INTO `admin_operation_log` VALUES (3070, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:12:25', '2022-01-27 18:12:25');
INSERT INTO `admin_operation_log` VALUES (3071, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"task_id\":\"1\",\"device_id\":[\"1\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\"}', '2022-01-27 18:12:30', '2022-01-27 18:12:30');
INSERT INTO `admin_operation_log` VALUES (3072, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:12:31', '2022-01-27 18:12:31');
INSERT INTO `admin_operation_log` VALUES (3073, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:13:13', '2022-01-27 18:13:13');
INSERT INTO `admin_operation_log` VALUES (3074, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"task_id\":\"1\",\"device_id\":[\"1\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\"}', '2022-01-27 18:13:22', '2022-01-27 18:13:22');
INSERT INTO `admin_operation_log` VALUES (3075, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 18:13:45', '2022-01-27 18:13:45');
INSERT INTO `admin_operation_log` VALUES (3076, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:14:01', '2022-01-27 18:14:01');
INSERT INTO `admin_operation_log` VALUES (3077, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:14:10', '2022-01-27 18:14:10');
INSERT INTO `admin_operation_log` VALUES (3078, 1, 'admin/tasks/create', 'GET', '127.0.0.1', '[]', '2022-01-27 18:14:53', '2022-01-27 18:14:53');
INSERT INTO `admin_operation_log` VALUES (3079, 1, 'admin/tasks', 'POST', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"configs\":{\"dg\":[\"2\",null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\"}', '2022-01-27 18:15:33', '2022-01-27 18:15:33');
INSERT INTO `admin_operation_log` VALUES (3080, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 18:16:46', '2022-01-27 18:16:46');
INSERT INTO `admin_operation_log` VALUES (3081, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 18:16:49', '2022-01-27 18:16:49');
INSERT INTO `admin_operation_log` VALUES (3082, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[null],\"ag\":[\"1\",null],\"account_id\":[null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 18:17:03', '2022-01-27 18:17:03');
INSERT INTO `admin_operation_log` VALUES (3083, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:05:59', '2022-01-27 19:05:59');
INSERT INTO `admin_operation_log` VALUES (3084, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:14:05', '2022-01-27 19:14:05');
INSERT INTO `admin_operation_log` VALUES (3085, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:14:05', '2022-01-27 19:14:05');
INSERT INTO `admin_operation_log` VALUES (3086, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:17:08', '2022-01-27 19:17:08');
INSERT INTO `admin_operation_log` VALUES (3087, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:17:08', '2022-01-27 19:17:08');
INSERT INTO `admin_operation_log` VALUES (3088, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:18:24', '2022-01-27 19:18:24');
INSERT INTO `admin_operation_log` VALUES (3089, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:18:24', '2022-01-27 19:18:24');
INSERT INTO `admin_operation_log` VALUES (3090, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:18:42', '2022-01-27 19:18:42');
INSERT INTO `admin_operation_log` VALUES (3091, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:18:43', '2022-01-27 19:18:43');
INSERT INTO `admin_operation_log` VALUES (3092, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:18:58', '2022-01-27 19:18:58');
INSERT INTO `admin_operation_log` VALUES (3093, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:19:08', '2022-01-27 19:19:08');
INSERT INTO `admin_operation_log` VALUES (3094, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:19:11', '2022-01-27 19:19:11');
INSERT INTO `admin_operation_log` VALUES (3095, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 19:19:11', '2022-01-27 19:19:11');
INSERT INTO `admin_operation_log` VALUES (3096, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:20:52', '2022-01-27 19:20:52');
INSERT INTO `admin_operation_log` VALUES (3097, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 19:21:02', '2022-01-27 19:21:02');
INSERT INTO `admin_operation_log` VALUES (3098, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 19:21:03', '2022-01-27 19:21:03');
INSERT INTO `admin_operation_log` VALUES (3099, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:21:31', '2022-01-27 19:21:31');
INSERT INTO `admin_operation_log` VALUES (3100, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 19:21:34', '2022-01-27 19:21:34');
INSERT INTO `admin_operation_log` VALUES (3101, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:21:37', '2022-01-27 19:21:37');
INSERT INTO `admin_operation_log` VALUES (3102, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:23:41', '2022-01-27 19:23:41');
INSERT INTO `admin_operation_log` VALUES (3103, 1, 'admin/tasks/2', 'GET', '127.0.0.1', '[]', '2022-01-27 19:23:48', '2022-01-27 19:23:48');
INSERT INTO `admin_operation_log` VALUES (3104, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:23:50', '2022-01-27 19:23:50');
INSERT INTO `admin_operation_log` VALUES (3105, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:23:51', '2022-01-27 19:23:51');
INSERT INTO `admin_operation_log` VALUES (3106, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/2\"}', '2022-01-27 19:23:52', '2022-01-27 19:23:52');
INSERT INTO `admin_operation_log` VALUES (3107, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:24:21', '2022-01-27 19:24:21');
INSERT INTO `admin_operation_log` VALUES (3108, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:24:22', '2022-01-27 19:24:22');
INSERT INTO `admin_operation_log` VALUES (3109, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:24:23', '2022-01-27 19:24:23');
INSERT INTO `admin_operation_log` VALUES (3110, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:24:24', '2022-01-27 19:24:24');
INSERT INTO `admin_operation_log` VALUES (3111, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:24:43', '2022-01-27 19:24:43');
INSERT INTO `admin_operation_log` VALUES (3112, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:24:55', '2022-01-27 19:24:55');
INSERT INTO `admin_operation_log` VALUES (3113, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:24:56', '2022-01-27 19:24:56');
INSERT INTO `admin_operation_log` VALUES (3114, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:25:08', '2022-01-27 19:25:08');
INSERT INTO `admin_operation_log` VALUES (3115, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:25:09', '2022-01-27 19:25:09');
INSERT INTO `admin_operation_log` VALUES (3116, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:25:20', '2022-01-27 19:25:20');
INSERT INTO `admin_operation_log` VALUES (3117, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:25:22', '2022-01-27 19:25:22');
INSERT INTO `admin_operation_log` VALUES (3118, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:25:45', '2022-01-27 19:25:45');
INSERT INTO `admin_operation_log` VALUES (3119, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:25:46', '2022-01-27 19:25:46');
INSERT INTO `admin_operation_log` VALUES (3120, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:26:26', '2022-01-27 19:26:26');
INSERT INTO `admin_operation_log` VALUES (3121, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:26:27', '2022-01-27 19:26:27');
INSERT INTO `admin_operation_log` VALUES (3122, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:26:28', '2022-01-27 19:26:28');
INSERT INTO `admin_operation_log` VALUES (3123, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:26:31', '2022-01-27 19:26:31');
INSERT INTO `admin_operation_log` VALUES (3124, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:27:16', '2022-01-27 19:27:16');
INSERT INTO `admin_operation_log` VALUES (3125, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:27:24', '2022-01-27 19:27:24');
INSERT INTO `admin_operation_log` VALUES (3126, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:27:25', '2022-01-27 19:27:25');
INSERT INTO `admin_operation_log` VALUES (3127, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:27:26', '2022-01-27 19:27:26');
INSERT INTO `admin_operation_log` VALUES (3128, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:27:34', '2022-01-27 19:27:34');
INSERT INTO `admin_operation_log` VALUES (3129, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:27:35', '2022-01-27 19:27:35');
INSERT INTO `admin_operation_log` VALUES (3130, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:27:36', '2022-01-27 19:27:36');
INSERT INTO `admin_operation_log` VALUES (3131, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:27:44', '2022-01-27 19:27:44');
INSERT INTO `admin_operation_log` VALUES (3132, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:27:44', '2022-01-27 19:27:44');
INSERT INTO `admin_operation_log` VALUES (3133, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:16', '2022-01-27 19:28:16');
INSERT INTO `admin_operation_log` VALUES (3134, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:21', '2022-01-27 19:28:21');
INSERT INTO `admin_operation_log` VALUES (3135, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:22', '2022-01-27 19:28:22');
INSERT INTO `admin_operation_log` VALUES (3136, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:26', '2022-01-27 19:28:26');
INSERT INTO `admin_operation_log` VALUES (3137, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:28:34', '2022-01-27 19:28:34');
INSERT INTO `admin_operation_log` VALUES (3138, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:35', '2022-01-27 19:28:35');
INSERT INTO `admin_operation_log` VALUES (3139, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:37', '2022-01-27 19:28:37');
INSERT INTO `admin_operation_log` VALUES (3140, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[\"3\",null],\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:40', '2022-01-27 19:28:40');
INSERT INTO `admin_operation_log` VALUES (3141, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:42', '2022-01-27 19:28:42');
INSERT INTO `admin_operation_log` VALUES (3142, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[\"2\",\"3\",null],\"device_id\":[\"2\",\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:50', '2022-01-27 19:28:50');
INSERT INTO `admin_operation_log` VALUES (3143, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:52', '2022-01-27 19:28:52');
INSERT INTO `admin_operation_log` VALUES (3144, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"2\",\"5\",\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:28:58', '2022-01-27 19:28:58');
INSERT INTO `admin_operation_log` VALUES (3145, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:28:59', '2022-01-27 19:28:59');
INSERT INTO `admin_operation_log` VALUES (3146, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"2\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:29:03', '2022-01-27 19:29:03');
INSERT INTO `admin_operation_log` VALUES (3147, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:29:04', '2022-01-27 19:29:04');
INSERT INTO `admin_operation_log` VALUES (3148, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:29:16', '2022-01-27 19:29:16');
INSERT INTO `admin_operation_log` VALUES (3149, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-27 19:29:16', '2022-01-27 19:29:16');
INSERT INTO `admin_operation_log` VALUES (3150, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:29:56', '2022-01-27 19:29:56');
INSERT INTO `admin_operation_log` VALUES (3151, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"configs[medias\":null},\"configs\":{\"content\":\"like you\"},\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 19:39:29', '2022-01-27 19:39:29');
INSERT INTO `admin_operation_log` VALUES (3152, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:43:02', '2022-01-27 19:43:02');
INSERT INTO `admin_operation_log` VALUES (3153, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:43:03', '2022-01-27 19:43:03');
INSERT INTO `admin_operation_log` VALUES (3154, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"medias\":null},\"content\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/2\\/edit\"}', '2022-01-27 19:43:16', '2022-01-27 19:43:16');
INSERT INTO `admin_operation_log` VALUES (3155, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:43:17', '2022-01-27 19:43:17');
INSERT INTO `admin_operation_log` VALUES (3156, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:43:46', '2022-01-27 19:43:46');
INSERT INTO `admin_operation_log` VALUES (3157, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:43:54', '2022-01-27 19:43:54');
INSERT INTO `admin_operation_log` VALUES (3158, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:44:00', '2022-01-27 19:44:00');
INSERT INTO `admin_operation_log` VALUES (3159, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:44:01', '2022-01-27 19:44:01');
INSERT INTO `admin_operation_log` VALUES (3160, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:44:04', '2022-01-27 19:44:04');
INSERT INTO `admin_operation_log` VALUES (3161, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 19:44:07', '2022-01-27 19:44:07');
INSERT INTO `admin_operation_log` VALUES (3162, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:45:36', '2022-01-27 19:45:36');
INSERT INTO `admin_operation_log` VALUES (3163, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 19:58:04', '2022-01-27 19:58:04');
INSERT INTO `admin_operation_log` VALUES (3164, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:58:10', '2022-01-27 19:58:10');
INSERT INTO `admin_operation_log` VALUES (3165, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:59:17', '2022-01-27 19:59:17');
INSERT INTO `admin_operation_log` VALUES (3166, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 19:59:39', '2022-01-27 19:59:39');
INSERT INTO `admin_operation_log` VALUES (3167, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:00:10', '2022-01-27 20:00:10');
INSERT INTO `admin_operation_log` VALUES (3168, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:00:14', '2022-01-27 20:00:14');
INSERT INTO `admin_operation_log` VALUES (3169, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 20:00:14', '2022-01-27 20:00:14');
INSERT INTO `admin_operation_log` VALUES (3170, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:01:51', '2022-01-27 20:01:51');
INSERT INTO `admin_operation_log` VALUES (3171, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 20:01:51', '2022-01-27 20:01:51');
INSERT INTO `admin_operation_log` VALUES (3172, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:03:58', '2022-01-27 20:03:58');
INSERT INTO `admin_operation_log` VALUES (3173, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 20:03:58', '2022-01-27 20:03:58');
INSERT INTO `admin_operation_log` VALUES (3174, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:04:08', '2022-01-27 20:04:08');
INSERT INTO `admin_operation_log` VALUES (3175, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:04:44', '2022-01-27 20:04:44');
INSERT INTO `admin_operation_log` VALUES (3176, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:05:13', '2022-01-27 20:05:13');
INSERT INTO `admin_operation_log` VALUES (3177, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:05:39', '2022-01-27 20:05:39');
INSERT INTO `admin_operation_log` VALUES (3178, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:14:12', '2022-01-27 20:14:12');
INSERT INTO `admin_operation_log` VALUES (3179, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:15:06', '2022-01-27 20:15:06');
INSERT INTO `admin_operation_log` VALUES (3180, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:16:59', '2022-01-27 20:16:59');
INSERT INTO `admin_operation_log` VALUES (3181, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:17:02', '2022-01-27 20:17:02');
INSERT INTO `admin_operation_log` VALUES (3182, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 20:17:08', '2022-01-27 20:17:08');
INSERT INTO `admin_operation_log` VALUES (3183, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2022-01-27 20:17:25', '2022-01-27 20:17:25');
INSERT INTO `admin_operation_log` VALUES (3184, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:17:28', '2022-01-27 20:17:28');
INSERT INTO `admin_operation_log` VALUES (3185, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:17:30', '2022-01-27 20:17:30');
INSERT INTO `admin_operation_log` VALUES (3186, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-27 20:17:31', '2022-01-27 20:17:31');
INSERT INTO `admin_operation_log` VALUES (3187, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:17:49', '2022-01-27 20:17:49');
INSERT INTO `admin_operation_log` VALUES (3188, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:17:51', '2022-01-27 20:17:51');
INSERT INTO `admin_operation_log` VALUES (3189, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:18:02', '2022-01-27 20:18:02');
INSERT INTO `admin_operation_log` VALUES (3190, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:18:04', '2022-01-27 20:18:04');
INSERT INTO `admin_operation_log` VALUES (3191, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:18:19', '2022-01-27 20:18:19');
INSERT INTO `admin_operation_log` VALUES (3192, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:18:21', '2022-01-27 20:18:21');
INSERT INTO `admin_operation_log` VALUES (3193, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:18:32', '2022-01-27 20:18:32');
INSERT INTO `admin_operation_log` VALUES (3194, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:18:48', '2022-01-27 20:18:48');
INSERT INTO `admin_operation_log` VALUES (3195, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:18:50', '2022-01-27 20:18:50');
INSERT INTO `admin_operation_log` VALUES (3196, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 20:18:50', '2022-01-27 20:18:50');
INSERT INTO `admin_operation_log` VALUES (3197, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:19:06', '2022-01-27 20:19:06');
INSERT INTO `admin_operation_log` VALUES (3198, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:19:37', '2022-01-27 20:19:37');
INSERT INTO `admin_operation_log` VALUES (3199, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:19:39', '2022-01-27 20:19:39');
INSERT INTO `admin_operation_log` VALUES (3200, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:19:56', '2022-01-27 20:19:56');
INSERT INTO `admin_operation_log` VALUES (3201, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:19:57', '2022-01-27 20:19:57');
INSERT INTO `admin_operation_log` VALUES (3202, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:20:30', '2022-01-27 20:20:30');
INSERT INTO `admin_operation_log` VALUES (3203, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:20:31', '2022-01-27 20:20:31');
INSERT INTO `admin_operation_log` VALUES (3204, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:21:24', '2022-01-27 20:21:24');
INSERT INTO `admin_operation_log` VALUES (3205, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:21:26', '2022-01-27 20:21:26');
INSERT INTO `admin_operation_log` VALUES (3206, 1, 'admin/tasks/1', 'GET', '127.0.0.1', '[]', '2022-01-27 20:22:42', '2022-01-27 20:22:42');
INSERT INTO `admin_operation_log` VALUES (3207, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:22:43', '2022-01-27 20:22:43');
INSERT INTO `admin_operation_log` VALUES (3208, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:22:45', '2022-01-27 20:22:45');
INSERT INTO `admin_operation_log` VALUES (3209, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:23:25', '2022-01-27 20:23:25');
INSERT INTO `admin_operation_log` VALUES (3210, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:23:27', '2022-01-27 20:23:27');
INSERT INTO `admin_operation_log` VALUES (3211, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:24:00', '2022-01-27 20:24:00');
INSERT INTO `admin_operation_log` VALUES (3212, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:24:01', '2022-01-27 20:24:01');
INSERT INTO `admin_operation_log` VALUES (3213, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:24:26', '2022-01-27 20:24:26');
INSERT INTO `admin_operation_log` VALUES (3214, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:24:30', '2022-01-27 20:24:30');
INSERT INTO `admin_operation_log` VALUES (3215, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:24:40', '2022-01-27 20:24:40');
INSERT INTO `admin_operation_log` VALUES (3216, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:26:08', '2022-01-27 20:26:08');
INSERT INTO `admin_operation_log` VALUES (3217, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:40:57', '2022-01-27 20:40:57');
INSERT INTO `admin_operation_log` VALUES (3218, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-27 20:40:58', '2022-01-27 20:40:58');
INSERT INTO `admin_operation_log` VALUES (3219, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\\/1\"}', '2022-01-27 20:41:01', '2022-01-27 20:41:01');
INSERT INTO `admin_operation_log` VALUES (3220, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-27 20:41:46', '2022-01-27 20:41:46');
INSERT INTO `admin_operation_log` VALUES (3221, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"sg5JpCB1JsMeVf1MOoVKFz1hCr0RVwqPvLnWLdBH\",\"_method\":\"PUT\"}', '2022-01-27 20:41:48', '2022-01-27 20:41:48');
INSERT INTO `admin_operation_log` VALUES (3222, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 10:40:34', '2022-01-28 10:40:34');
INSERT INTO `admin_operation_log` VALUES (3223, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-28 10:40:37', '2022-01-28 10:40:37');
INSERT INTO `admin_operation_log` VALUES (3224, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 10:40:39', '2022-01-28 10:40:39');
INSERT INTO `admin_operation_log` VALUES (3225, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 10:42:49', '2022-01-28 10:42:49');
INSERT INTO `admin_operation_log` VALUES (3226, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 10:42:53', '2022-01-28 10:42:53');
INSERT INTO `admin_operation_log` VALUES (3227, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:36:35', '2022-01-28 11:36:35');
INSERT INTO `admin_operation_log` VALUES (3228, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:36:37', '2022-01-28 11:36:37');
INSERT INTO `admin_operation_log` VALUES (3229, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:37:18', '2022-01-28 11:37:18');
INSERT INTO `admin_operation_log` VALUES (3230, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:37:20', '2022-01-28 11:37:20');
INSERT INTO `admin_operation_log` VALUES (3231, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:38:07', '2022-01-28 11:38:07');
INSERT INTO `admin_operation_log` VALUES (3232, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:38:09', '2022-01-28 11:38:09');
INSERT INTO `admin_operation_log` VALUES (3233, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:38:50', '2022-01-28 11:38:50');
INSERT INTO `admin_operation_log` VALUES (3234, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:38:52', '2022-01-28 11:38:52');
INSERT INTO `admin_operation_log` VALUES (3235, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:39:13', '2022-01-28 11:39:13');
INSERT INTO `admin_operation_log` VALUES (3236, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:39:15', '2022-01-28 11:39:15');
INSERT INTO `admin_operation_log` VALUES (3237, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 11:48:37', '2022-01-28 11:48:37');
INSERT INTO `admin_operation_log` VALUES (3238, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"SMq0nRctchPPBxnBhhRtfHYB143qPmarKtwxTeUP\",\"_method\":\"PUT\"}', '2022-01-28 11:48:39', '2022-01-28 11:48:39');
INSERT INTO `admin_operation_log` VALUES (3239, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 14:39:51', '2022-01-28 14:39:51');
INSERT INTO `admin_operation_log` VALUES (3240, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 14:39:53', '2022-01-28 14:39:53');
INSERT INTO `admin_operation_log` VALUES (3241, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 14:40:10', '2022-01-28 14:40:10');
INSERT INTO `admin_operation_log` VALUES (3242, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 14:40:12', '2022-01-28 14:40:12');
INSERT INTO `admin_operation_log` VALUES (3243, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 14:42:41', '2022-01-28 14:42:41');
INSERT INTO `admin_operation_log` VALUES (3244, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 14:42:49', '2022-01-28 14:42:49');
INSERT INTO `admin_operation_log` VALUES (3245, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 14:46:30', '2022-01-28 14:46:30');
INSERT INTO `admin_operation_log` VALUES (3246, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 14:46:32', '2022-01-28 14:46:32');
INSERT INTO `admin_operation_log` VALUES (3247, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:37:15', '2022-01-28 15:37:15');
INSERT INTO `admin_operation_log` VALUES (3248, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:37:17', '2022-01-28 15:37:17');
INSERT INTO `admin_operation_log` VALUES (3249, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:38:05', '2022-01-28 15:38:05');
INSERT INTO `admin_operation_log` VALUES (3250, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:38:07', '2022-01-28 15:38:07');
INSERT INTO `admin_operation_log` VALUES (3251, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:53:05', '2022-01-28 15:53:05');
INSERT INTO `admin_operation_log` VALUES (3252, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:53:07', '2022-01-28 15:53:07');
INSERT INTO `admin_operation_log` VALUES (3253, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:55:42', '2022-01-28 15:55:42');
INSERT INTO `admin_operation_log` VALUES (3254, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:55:45', '2022-01-28 15:55:45');
INSERT INTO `admin_operation_log` VALUES (3255, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:55:54', '2022-01-28 15:55:54');
INSERT INTO `admin_operation_log` VALUES (3256, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:55:56', '2022-01-28 15:55:56');
INSERT INTO `admin_operation_log` VALUES (3257, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:56:47', '2022-01-28 15:56:47');
INSERT INTO `admin_operation_log` VALUES (3258, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:56:51', '2022-01-28 15:56:51');
INSERT INTO `admin_operation_log` VALUES (3259, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:58:05', '2022-01-28 15:58:05');
INSERT INTO `admin_operation_log` VALUES (3260, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:58:09', '2022-01-28 15:58:09');
INSERT INTO `admin_operation_log` VALUES (3261, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:58:47', '2022-01-28 15:58:47');
INSERT INTO `admin_operation_log` VALUES (3262, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:58:52', '2022-01-28 15:58:52');
INSERT INTO `admin_operation_log` VALUES (3263, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-28 15:59:17', '2022-01-28 15:59:17');
INSERT INTO `admin_operation_log` VALUES (3264, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"3\",\"4\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"HA0wJYoCNFuZjmCXSnlr9nmeEbaSBvxEEN3n6Y8d\",\"_method\":\"PUT\"}', '2022-01-28 15:59:20', '2022-01-28 15:59:20');
INSERT INTO `admin_operation_log` VALUES (3265, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-28 16:46:24', '2022-01-28 16:46:24');
INSERT INTO `admin_operation_log` VALUES (3266, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-28 16:46:39', '2022-01-28 16:46:39');
INSERT INTO `admin_operation_log` VALUES (3267, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-28 16:46:57', '2022-01-28 16:46:57');
INSERT INTO `admin_operation_log` VALUES (3268, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-01-28 16:47:13', '2022-01-28 16:47:13');
INSERT INTO `admin_operation_log` VALUES (3269, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-01-29 13:45:01', '2022-01-29 13:45:01');
INSERT INTO `admin_operation_log` VALUES (3270, 1, 'admin/group-devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:45:10', '2022-01-29 13:45:10');
INSERT INTO `admin_operation_log` VALUES (3271, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:18', '2022-01-29 13:46:18');
INSERT INTO `admin_operation_log` VALUES (3272, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:23', '2022-01-29 13:46:23');
INSERT INTO `admin_operation_log` VALUES (3273, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:46:25', '2022-01-29 13:46:25');
INSERT INTO `admin_operation_log` VALUES (3274, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:46:26', '2022-01-29 13:46:26');
INSERT INTO `admin_operation_log` VALUES (3275, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:28', '2022-01-29 13:46:28');
INSERT INTO `admin_operation_log` VALUES (3276, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:45', '2022-01-29 13:46:45');
INSERT INTO `admin_operation_log` VALUES (3277, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:48', '2022-01-29 13:46:48');
INSERT INTO `admin_operation_log` VALUES (3278, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:51', '2022-01-29 13:46:51');
INSERT INTO `admin_operation_log` VALUES (3279, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:46:54', '2022-01-29 13:46:54');
INSERT INTO `admin_operation_log` VALUES (3280, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"3\",\"4\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:47:00', '2022-01-29 13:47:00');
INSERT INTO `admin_operation_log` VALUES (3281, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:47:00', '2022-01-29 13:47:00');
INSERT INTO `admin_operation_log` VALUES (3282, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:47:04', '2022-01-29 13:47:04');
INSERT INTO `admin_operation_log` VALUES (3283, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:47:16', '2022-01-29 13:47:16');
INSERT INTO `admin_operation_log` VALUES (3284, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:47:16', '2022-01-29 13:47:16');
INSERT INTO `admin_operation_log` VALUES (3285, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:47:19', '2022-01-29 13:47:19');
INSERT INTO `admin_operation_log` VALUES (3286, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:47:29', '2022-01-29 13:47:29');
INSERT INTO `admin_operation_log` VALUES (3287, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:47:29', '2022-01-29 13:47:29');
INSERT INTO `admin_operation_log` VALUES (3288, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:47:54', '2022-01-29 13:47:54');
INSERT INTO `admin_operation_log` VALUES (3289, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:47:56', '2022-01-29 13:47:56');
INSERT INTO `admin_operation_log` VALUES (3290, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:47:57', '2022-01-29 13:47:57');
INSERT INTO `admin_operation_log` VALUES (3291, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:50:26', '2022-01-29 13:50:26');
INSERT INTO `admin_operation_log` VALUES (3292, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:50:27', '2022-01-29 13:50:27');
INSERT INTO `admin_operation_log` VALUES (3293, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:50:27', '2022-01-29 13:50:27');
INSERT INTO `admin_operation_log` VALUES (3294, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:50:32', '2022-01-29 13:50:32');
INSERT INTO `admin_operation_log` VALUES (3295, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:50:34', '2022-01-29 13:50:34');
INSERT INTO `admin_operation_log` VALUES (3296, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:50:34', '2022-01-29 13:50:34');
INSERT INTO `admin_operation_log` VALUES (3297, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:52:16', '2022-01-29 13:52:16');
INSERT INTO `admin_operation_log` VALUES (3298, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:52:19', '2022-01-29 13:52:19');
INSERT INTO `admin_operation_log` VALUES (3299, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:52:20', '2022-01-29 13:52:20');
INSERT INTO `admin_operation_log` VALUES (3300, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:52:23', '2022-01-29 13:52:23');
INSERT INTO `admin_operation_log` VALUES (3301, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:52:24', '2022-01-29 13:52:24');
INSERT INTO `admin_operation_log` VALUES (3302, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:52:25', '2022-01-29 13:52:25');
INSERT INTO `admin_operation_log` VALUES (3303, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:56:14', '2022-01-29 13:56:14');
INSERT INTO `admin_operation_log` VALUES (3304, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:56:16', '2022-01-29 13:56:16');
INSERT INTO `admin_operation_log` VALUES (3305, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:56:16', '2022-01-29 13:56:16');
INSERT INTO `admin_operation_log` VALUES (3306, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:56:22', '2022-01-29 13:56:22');
INSERT INTO `admin_operation_log` VALUES (3307, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:56:24', '2022-01-29 13:56:24');
INSERT INTO `admin_operation_log` VALUES (3308, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:56:24', '2022-01-29 13:56:24');
INSERT INTO `admin_operation_log` VALUES (3309, 1, 'admin/group-accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:57:36', '2022-01-29 13:57:36');
INSERT INTO `admin_operation_log` VALUES (3310, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:57:38', '2022-01-29 13:57:38');
INSERT INTO `admin_operation_log` VALUES (3311, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:57:55', '2022-01-29 13:57:55');
INSERT INTO `admin_operation_log` VALUES (3312, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:57:57', '2022-01-29 13:57:57');
INSERT INTO `admin_operation_log` VALUES (3313, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:57:58', '2022-01-29 13:57:58');
INSERT INTO `admin_operation_log` VALUES (3314, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:57:59', '2022-01-29 13:57:59');
INSERT INTO `admin_operation_log` VALUES (3315, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:58:03', '2022-01-29 13:58:03');
INSERT INTO `admin_operation_log` VALUES (3316, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:58:04', '2022-01-29 13:58:04');
INSERT INTO `admin_operation_log` VALUES (3317, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:58:05', '2022-01-29 13:58:05');
INSERT INTO `admin_operation_log` VALUES (3318, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:59:42', '2022-01-29 13:59:42');
INSERT INTO `admin_operation_log` VALUES (3319, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:59:43', '2022-01-29 13:59:43');
INSERT INTO `admin_operation_log` VALUES (3320, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:59:43', '2022-01-29 13:59:43');
INSERT INTO `admin_operation_log` VALUES (3321, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 13:59:47', '2022-01-29 13:59:47');
INSERT INTO `admin_operation_log` VALUES (3322, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 13:59:49', '2022-01-29 13:59:49');
INSERT INTO `admin_operation_log` VALUES (3323, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 13:59:49', '2022-01-29 13:59:49');
INSERT INTO `admin_operation_log` VALUES (3324, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:01:14', '2022-01-29 14:01:14');
INSERT INTO `admin_operation_log` VALUES (3325, 1, 'admin/accounts/3,4', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\"}', '2022-01-29 14:01:19', '2022-01-29 14:01:19');
INSERT INTO `admin_operation_log` VALUES (3326, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:01:19', '2022-01-29 14:01:19');
INSERT INTO `admin_operation_log` VALUES (3327, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:01:22', '2022-01-29 14:01:22');
INSERT INTO `admin_operation_log` VALUES (3328, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:01:23', '2022-01-29 14:01:23');
INSERT INTO `admin_operation_log` VALUES (3329, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:01:25', '2022-01-29 14:01:25');
INSERT INTO `admin_operation_log` VALUES (3330, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:01:26', '2022-01-29 14:01:26');
INSERT INTO `admin_operation_log` VALUES (3331, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:01:32', '2022-01-29 14:01:32');
INSERT INTO `admin_operation_log` VALUES (3332, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:01:33', '2022-01-29 14:01:33');
INSERT INTO `admin_operation_log` VALUES (3333, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:01:33', '2022-01-29 14:01:33');
INSERT INTO `admin_operation_log` VALUES (3334, 1, 'admin/accounts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:02:01', '2022-01-29 14:02:01');
INSERT INTO `admin_operation_log` VALUES (3335, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:04:06', '2022-01-29 14:04:06');
INSERT INTO `admin_operation_log` VALUES (3336, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:04:25', '2022-01-29 14:04:25');
INSERT INTO `admin_operation_log` VALUES (3337, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:04:28', '2022-01-29 14:04:28');
INSERT INTO `admin_operation_log` VALUES (3338, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:04:28', '2022-01-29 14:04:28');
INSERT INTO `admin_operation_log` VALUES (3339, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:04:31', '2022-01-29 14:04:31');
INSERT INTO `admin_operation_log` VALUES (3340, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:04:33', '2022-01-29 14:04:33');
INSERT INTO `admin_operation_log` VALUES (3341, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:04:33', '2022-01-29 14:04:33');
INSERT INTO `admin_operation_log` VALUES (3342, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:05:29', '2022-01-29 14:05:29');
INSERT INTO `admin_operation_log` VALUES (3343, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:05:32', '2022-01-29 14:05:32');
INSERT INTO `admin_operation_log` VALUES (3344, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:05:32', '2022-01-29 14:05:32');
INSERT INTO `admin_operation_log` VALUES (3345, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:05:34', '2022-01-29 14:05:34');
INSERT INTO `admin_operation_log` VALUES (3346, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:05:35', '2022-01-29 14:05:35');
INSERT INTO `admin_operation_log` VALUES (3347, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:05:36', '2022-01-29 14:05:36');
INSERT INTO `admin_operation_log` VALUES (3348, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:06:40', '2022-01-29 14:06:40');
INSERT INTO `admin_operation_log` VALUES (3349, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:06:48', '2022-01-29 14:06:48');
INSERT INTO `admin_operation_log` VALUES (3350, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:06:48', '2022-01-29 14:06:48');
INSERT INTO `admin_operation_log` VALUES (3351, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:06:50', '2022-01-29 14:06:50');
INSERT INTO `admin_operation_log` VALUES (3352, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:06:51', '2022-01-29 14:06:51');
INSERT INTO `admin_operation_log` VALUES (3353, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:06:51', '2022-01-29 14:06:51');
INSERT INTO `admin_operation_log` VALUES (3354, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:09:13', '2022-01-29 14:09:13');
INSERT INTO `admin_operation_log` VALUES (3355, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:09:14', '2022-01-29 14:09:14');
INSERT INTO `admin_operation_log` VALUES (3356, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:09:14', '2022-01-29 14:09:14');
INSERT INTO `admin_operation_log` VALUES (3357, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:09:16', '2022-01-29 14:09:16');
INSERT INTO `admin_operation_log` VALUES (3358, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:09:18', '2022-01-29 14:09:18');
INSERT INTO `admin_operation_log` VALUES (3359, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:09:18', '2022-01-29 14:09:18');
INSERT INTO `admin_operation_log` VALUES (3360, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:16:31', '2022-01-29 14:16:31');
INSERT INTO `admin_operation_log` VALUES (3361, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:16:32', '2022-01-29 14:16:32');
INSERT INTO `admin_operation_log` VALUES (3362, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:16:32', '2022-01-29 14:16:32');
INSERT INTO `admin_operation_log` VALUES (3363, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:16:34', '2022-01-29 14:16:34');
INSERT INTO `admin_operation_log` VALUES (3364, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:16:35', '2022-01-29 14:16:35');
INSERT INTO `admin_operation_log` VALUES (3365, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:16:35', '2022-01-29 14:16:35');
INSERT INTO `admin_operation_log` VALUES (3366, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:18:02', '2022-01-29 14:18:02');
INSERT INTO `admin_operation_log` VALUES (3367, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:18:06', '2022-01-29 14:18:06');
INSERT INTO `admin_operation_log` VALUES (3368, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:18:06', '2022-01-29 14:18:06');
INSERT INTO `admin_operation_log` VALUES (3369, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:18:08', '2022-01-29 14:18:08');
INSERT INTO `admin_operation_log` VALUES (3370, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:18:09', '2022-01-29 14:18:09');
INSERT INTO `admin_operation_log` VALUES (3371, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:18:10', '2022-01-29 14:18:10');
INSERT INTO `admin_operation_log` VALUES (3372, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:18:53', '2022-01-29 14:18:53');
INSERT INTO `admin_operation_log` VALUES (3373, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:18:56', '2022-01-29 14:18:56');
INSERT INTO `admin_operation_log` VALUES (3374, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:18:56', '2022-01-29 14:18:56');
INSERT INTO `admin_operation_log` VALUES (3375, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:18:57', '2022-01-29 14:18:57');
INSERT INTO `admin_operation_log` VALUES (3376, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:18:59', '2022-01-29 14:18:59');
INSERT INTO `admin_operation_log` VALUES (3377, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:18:59', '2022-01-29 14:18:59');
INSERT INTO `admin_operation_log` VALUES (3378, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:19:48', '2022-01-29 14:19:48');
INSERT INTO `admin_operation_log` VALUES (3379, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:19:49', '2022-01-29 14:19:49');
INSERT INTO `admin_operation_log` VALUES (3380, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:19:49', '2022-01-29 14:19:49');
INSERT INTO `admin_operation_log` VALUES (3381, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:19:52', '2022-01-29 14:19:52');
INSERT INTO `admin_operation_log` VALUES (3382, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:19:59', '2022-01-29 14:19:59');
INSERT INTO `admin_operation_log` VALUES (3383, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:19:59', '2022-01-29 14:19:59');
INSERT INTO `admin_operation_log` VALUES (3384, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:22:18', '2022-01-29 14:22:18');
INSERT INTO `admin_operation_log` VALUES (3385, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:22:19', '2022-01-29 14:22:19');
INSERT INTO `admin_operation_log` VALUES (3386, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:22:19', '2022-01-29 14:22:19');
INSERT INTO `admin_operation_log` VALUES (3387, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:22:21', '2022-01-29 14:22:21');
INSERT INTO `admin_operation_log` VALUES (3388, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:22:22', '2022-01-29 14:22:22');
INSERT INTO `admin_operation_log` VALUES (3389, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:22:22', '2022-01-29 14:22:22');
INSERT INTO `admin_operation_log` VALUES (3390, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:25:00', '2022-01-29 14:25:00');
INSERT INTO `admin_operation_log` VALUES (3391, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:25:02', '2022-01-29 14:25:02');
INSERT INTO `admin_operation_log` VALUES (3392, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:25:02', '2022-01-29 14:25:02');
INSERT INTO `admin_operation_log` VALUES (3393, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:25:03', '2022-01-29 14:25:03');
INSERT INTO `admin_operation_log` VALUES (3394, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:25:04', '2022-01-29 14:25:04');
INSERT INTO `admin_operation_log` VALUES (3395, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:25:04', '2022-01-29 14:25:04');
INSERT INTO `admin_operation_log` VALUES (3396, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:26:47', '2022-01-29 14:26:47');
INSERT INTO `admin_operation_log` VALUES (3397, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:26:49', '2022-01-29 14:26:49');
INSERT INTO `admin_operation_log` VALUES (3398, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:26:49', '2022-01-29 14:26:49');
INSERT INTO `admin_operation_log` VALUES (3399, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:26:50', '2022-01-29 14:26:50');
INSERT INTO `admin_operation_log` VALUES (3400, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:26:52', '2022-01-29 14:26:52');
INSERT INTO `admin_operation_log` VALUES (3401, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:26:52', '2022-01-29 14:26:52');
INSERT INTO `admin_operation_log` VALUES (3402, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:43:20', '2022-01-29 14:43:20');
INSERT INTO `admin_operation_log` VALUES (3403, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:43:24', '2022-01-29 14:43:24');
INSERT INTO `admin_operation_log` VALUES (3404, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:43:31', '2022-01-29 14:43:31');
INSERT INTO `admin_operation_log` VALUES (3405, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 14:43:33', '2022-01-29 14:43:33');
INSERT INTO `admin_operation_log` VALUES (3406, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:43:33', '2022-01-29 14:43:33');
INSERT INTO `admin_operation_log` VALUES (3407, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:43:36', '2022-01-29 14:43:36');
INSERT INTO `admin_operation_log` VALUES (3408, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:43:37', '2022-01-29 14:43:37');
INSERT INTO `admin_operation_log` VALUES (3409, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:43:37', '2022-01-29 14:43:37');
INSERT INTO `admin_operation_log` VALUES (3410, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:49:27', '2022-01-29 14:49:27');
INSERT INTO `admin_operation_log` VALUES (3411, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:49:28', '2022-01-29 14:49:28');
INSERT INTO `admin_operation_log` VALUES (3412, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:49:28', '2022-01-29 14:49:28');
INSERT INTO `admin_operation_log` VALUES (3413, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:49:35', '2022-01-29 14:49:35');
INSERT INTO `admin_operation_log` VALUES (3414, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:49:37', '2022-01-29 14:49:37');
INSERT INTO `admin_operation_log` VALUES (3415, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:49:37', '2022-01-29 14:49:37');
INSERT INTO `admin_operation_log` VALUES (3416, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:51:10', '2022-01-29 14:51:10');
INSERT INTO `admin_operation_log` VALUES (3417, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:51:12', '2022-01-29 14:51:12');
INSERT INTO `admin_operation_log` VALUES (3418, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:51:12', '2022-01-29 14:51:12');
INSERT INTO `admin_operation_log` VALUES (3419, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:51:31', '2022-01-29 14:51:31');
INSERT INTO `admin_operation_log` VALUES (3420, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:51:33', '2022-01-29 14:51:33');
INSERT INTO `admin_operation_log` VALUES (3421, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:51:34', '2022-01-29 14:51:34');
INSERT INTO `admin_operation_log` VALUES (3422, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:53:03', '2022-01-29 14:53:03');
INSERT INTO `admin_operation_log` VALUES (3423, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:53:05', '2022-01-29 14:53:05');
INSERT INTO `admin_operation_log` VALUES (3424, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:53:05', '2022-01-29 14:53:05');
INSERT INTO `admin_operation_log` VALUES (3425, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:53:07', '2022-01-29 14:53:07');
INSERT INTO `admin_operation_log` VALUES (3426, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:53:09', '2022-01-29 14:53:09');
INSERT INTO `admin_operation_log` VALUES (3427, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:53:09', '2022-01-29 14:53:09');
INSERT INTO `admin_operation_log` VALUES (3428, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:54:23', '2022-01-29 14:54:23');
INSERT INTO `admin_operation_log` VALUES (3429, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:54:25', '2022-01-29 14:54:25');
INSERT INTO `admin_operation_log` VALUES (3430, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:54:25', '2022-01-29 14:54:25');
INSERT INTO `admin_operation_log` VALUES (3431, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 14:56:28', '2022-01-29 14:56:28');
INSERT INTO `admin_operation_log` VALUES (3432, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 14:56:30', '2022-01-29 14:56:30');
INSERT INTO `admin_operation_log` VALUES (3433, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 14:56:30', '2022-01-29 14:56:30');
INSERT INTO `admin_operation_log` VALUES (3434, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:02:01', '2022-01-29 15:02:01');
INSERT INTO `admin_operation_log` VALUES (3435, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:02:02', '2022-01-29 15:02:02');
INSERT INTO `admin_operation_log` VALUES (3436, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:02:03', '2022-01-29 15:02:03');
INSERT INTO `admin_operation_log` VALUES (3437, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:03:18', '2022-01-29 15:03:18');
INSERT INTO `admin_operation_log` VALUES (3438, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:03:20', '2022-01-29 15:03:20');
INSERT INTO `admin_operation_log` VALUES (3439, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:03:20', '2022-01-29 15:03:20');
INSERT INTO `admin_operation_log` VALUES (3440, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:06:02', '2022-01-29 15:06:02');
INSERT INTO `admin_operation_log` VALUES (3441, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:06:04', '2022-01-29 15:06:04');
INSERT INTO `admin_operation_log` VALUES (3442, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:06:04', '2022-01-29 15:06:04');
INSERT INTO `admin_operation_log` VALUES (3443, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:07:52', '2022-01-29 15:07:52');
INSERT INTO `admin_operation_log` VALUES (3444, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:07:53', '2022-01-29 15:07:53');
INSERT INTO `admin_operation_log` VALUES (3445, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:07:53', '2022-01-29 15:07:53');
INSERT INTO `admin_operation_log` VALUES (3446, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:09:03', '2022-01-29 15:09:03');
INSERT INTO `admin_operation_log` VALUES (3447, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:09:05', '2022-01-29 15:09:05');
INSERT INTO `admin_operation_log` VALUES (3448, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:09:05', '2022-01-29 15:09:05');
INSERT INTO `admin_operation_log` VALUES (3449, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:39:30', '2022-01-29 15:39:30');
INSERT INTO `admin_operation_log` VALUES (3450, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:39:32', '2022-01-29 15:39:32');
INSERT INTO `admin_operation_log` VALUES (3451, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:39:32', '2022-01-29 15:39:32');
INSERT INTO `admin_operation_log` VALUES (3452, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:39:34', '2022-01-29 15:39:34');
INSERT INTO `admin_operation_log` VALUES (3453, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[\"3\",null],\"device_id\":[\"2\",null],\"ag\":[\"1\",null],\"account_id\":[\"1\",\"2\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:39:35', '2022-01-29 15:39:35');
INSERT INTO `admin_operation_log` VALUES (3454, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:39:35', '2022-01-29 15:39:35');
INSERT INTO `admin_operation_log` VALUES (3455, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:42:21', '2022-01-29 15:42:21');
INSERT INTO `admin_operation_log` VALUES (3456, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:42:27', '2022-01-29 15:42:27');
INSERT INTO `admin_operation_log` VALUES (3457, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:42:27', '2022-01-29 15:42:27');
INSERT INTO `admin_operation_log` VALUES (3458, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 15:42:50', '2022-01-29 15:42:50');
INSERT INTO `admin_operation_log` VALUES (3459, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 15:43:07', '2022-01-29 15:43:07');
INSERT INTO `admin_operation_log` VALUES (3460, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 15:43:07', '2022-01-29 15:43:07');
INSERT INTO `admin_operation_log` VALUES (3461, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:17:01', '2022-01-29 16:17:01');
INSERT INTO `admin_operation_log` VALUES (3462, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:17:11', '2022-01-29 16:17:11');
INSERT INTO `admin_operation_log` VALUES (3463, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:17:14', '2022-01-29 16:17:14');
INSERT INTO `admin_operation_log` VALUES (3464, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 16:17:16', '2022-01-29 16:17:16');
INSERT INTO `admin_operation_log` VALUES (3465, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-29 16:17:16', '2022-01-29 16:17:16');
INSERT INTO `admin_operation_log` VALUES (3466, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 16:19:56', '2022-01-29 16:19:56');
INSERT INTO `admin_operation_log` VALUES (3467, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-01-29 16:19:56', '2022-01-29 16:19:56');
INSERT INTO `admin_operation_log` VALUES (3468, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 16:20:05', '2022-01-29 16:20:05');
INSERT INTO `admin_operation_log` VALUES (3469, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:20:06', '2022-01-29 16:20:06');
INSERT INTO `admin_operation_log` VALUES (3470, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:20:40', '2022-01-29 16:20:40');
INSERT INTO `admin_operation_log` VALUES (3471, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"5\",\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 16:20:49', '2022-01-29 16:20:49');
INSERT INTO `admin_operation_log` VALUES (3472, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:20:50', '2022-01-29 16:20:50');
INSERT INTO `admin_operation_log` VALUES (3473, 1, 'admin/tasks/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:47:07', '2022-01-29 16:47:07');
INSERT INTO `admin_operation_log` VALUES (3474, 1, 'admin/tasks/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"1\",\"dg\":[null],\"device_id\":[\"11\",null],\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 16:47:09', '2022-01-29 16:47:09');
INSERT INTO `admin_operation_log` VALUES (3475, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:47:09', '2022-01-29 16:47:09');
INSERT INTO `admin_operation_log` VALUES (3476, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:52:26', '2022-01-29 16:52:26');
INSERT INTO `admin_operation_log` VALUES (3477, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 16:52:28', '2022-01-29 16:52:28');
INSERT INTO `admin_operation_log` VALUES (3478, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:52:32', '2022-01-29 16:52:32');
INSERT INTO `admin_operation_log` VALUES (3479, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"1\",\"2\",\"5\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 16:52:37', '2022-01-29 16:52:37');
INSERT INTO `admin_operation_log` VALUES (3480, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:54:02', '2022-01-29 16:54:02');
INSERT INTO `admin_operation_log` VALUES (3481, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"1\",\"2\",\"5\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 16:54:03', '2022-01-29 16:54:03');
INSERT INTO `admin_operation_log` VALUES (3482, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:57:45', '2022-01-29 16:57:45');
INSERT INTO `admin_operation_log` VALUES (3483, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"1\",\"2\",\"5\",\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\"}', '2022-01-29 16:57:50', '2022-01-29 16:57:50');
INSERT INTO `admin_operation_log` VALUES (3484, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:57:50', '2022-01-29 16:57:50');
INSERT INTO `admin_operation_log` VALUES (3485, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 16:58:58', '2022-01-29 16:58:58');
INSERT INTO `admin_operation_log` VALUES (3486, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 16:59:08', '2022-01-29 16:59:08');
INSERT INTO `admin_operation_log` VALUES (3487, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 16:59:08', '2022-01-29 16:59:08');
INSERT INTO `admin_operation_log` VALUES (3488, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:01:44', '2022-01-29 17:01:44');
INSERT INTO `admin_operation_log` VALUES (3489, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 17:01:47', '2022-01-29 17:01:47');
INSERT INTO `admin_operation_log` VALUES (3490, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 17:01:47', '2022-01-29 17:01:47');
INSERT INTO `admin_operation_log` VALUES (3491, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:08:42', '2022-01-29 17:08:42');
INSERT INTO `admin_operation_log` VALUES (3492, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 17:08:53', '2022-01-29 17:08:53');
INSERT INTO `admin_operation_log` VALUES (3493, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 17:08:54', '2022-01-29 17:08:54');
INSERT INTO `admin_operation_log` VALUES (3494, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:10:35', '2022-01-29 17:10:35');
INSERT INTO `admin_operation_log` VALUES (3495, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 17:10:36', '2022-01-29 17:10:36');
INSERT INTO `admin_operation_log` VALUES (3496, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 17:10:37', '2022-01-29 17:10:37');
INSERT INTO `admin_operation_log` VALUES (3497, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:26:02', '2022-01-29 17:26:02');
INSERT INTO `admin_operation_log` VALUES (3498, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"uCP37BJtPW5MEZPPChlyBtQF0Es9K2WJMS1vh4QO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-01-29 17:26:06', '2022-01-29 17:26:06');
INSERT INTO `admin_operation_log` VALUES (3499, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-01-29 17:26:06', '2022-01-29 17:26:06');
INSERT INTO `admin_operation_log` VALUES (3500, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:38:47', '2022-01-29 17:38:47');
INSERT INTO `admin_operation_log` VALUES (3501, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:38:51', '2022-01-29 17:38:51');
INSERT INTO `admin_operation_log` VALUES (3502, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-01-29 17:39:02', '2022-01-29 17:39:02');
INSERT INTO `admin_operation_log` VALUES (3503, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:12:02', '2022-02-07 15:12:02');
INSERT INTO `admin_operation_log` VALUES (3504, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:14:33', '2022-02-07 15:14:33');
INSERT INTO `admin_operation_log` VALUES (3505, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:15:33', '2022-02-07 15:15:33');
INSERT INTO `admin_operation_log` VALUES (3506, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:15:55', '2022-02-07 15:15:55');
INSERT INTO `admin_operation_log` VALUES (3507, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-02-07 15:16:16', '2022-02-07 15:16:16');
INSERT INTO `admin_operation_log` VALUES (3508, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:17:23', '2022-02-07 15:17:23');
INSERT INTO `admin_operation_log` VALUES (3509, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:20:32', '2022-02-07 15:20:32');
INSERT INTO `admin_operation_log` VALUES (3510, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:21:16', '2022-02-07 15:21:16');
INSERT INTO `admin_operation_log` VALUES (3511, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-02-07 15:21:23', '2022-02-07 15:21:23');
INSERT INTO `admin_operation_log` VALUES (3512, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:22:11', '2022-02-07 15:22:11');
INSERT INTO `admin_operation_log` VALUES (3513, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:22:35', '2022-02-07 15:22:35');
INSERT INTO `admin_operation_log` VALUES (3514, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:23:20', '2022-02-07 15:23:20');
INSERT INTO `admin_operation_log` VALUES (3515, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-07 15:23:26', '2022-02-07 15:23:26');
INSERT INTO `admin_operation_log` VALUES (3516, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-09 14:10:49', '2022-02-09 14:10:49');
INSERT INTO `admin_operation_log` VALUES (3517, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:36:44', '2022-02-09 15:36:44');
INSERT INTO `admin_operation_log` VALUES (3518, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:37:18', '2022-02-09 15:37:18');
INSERT INTO `admin_operation_log` VALUES (3519, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:37:21', '2022-02-09 15:37:21');
INSERT INTO `admin_operation_log` VALUES (3520, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:37:24', '2022-02-09 15:37:24');
INSERT INTO `admin_operation_log` VALUES (3521, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"3\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:32', '2022-02-09 15:37:32');
INSERT INTO `admin_operation_log` VALUES (3522, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"2\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:34', '2022-02-09 15:37:34');
INSERT INTO `admin_operation_log` VALUES (3523, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"1\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:36', '2022-02-09 15:37:36');
INSERT INTO `admin_operation_log` VALUES (3524, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:37', '2022-02-09 15:37:37');
INSERT INTO `admin_operation_log` VALUES (3525, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"4\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:39', '2022-02-09 15:37:39');
INSERT INTO `admin_operation_log` VALUES (3526, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"5\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:41', '2022-02-09 15:37:41');
INSERT INTO `admin_operation_log` VALUES (3527, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"6\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:43', '2022-02-09 15:37:43');
INSERT INTO `admin_operation_log` VALUES (3528, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"7\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:45', '2022-02-09 15:37:45');
INSERT INTO `admin_operation_log` VALUES (3529, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"key\":\"8\",\"medias\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\"}', '2022-02-09 15:37:48', '2022-02-09 15:37:48');
INSERT INTO `admin_operation_log` VALUES (3530, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"5\",\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-02-09 15:37:52', '2022-02-09 15:37:52');
INSERT INTO `admin_operation_log` VALUES (3531, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-09 15:37:53', '2022-02-09 15:37:53');
INSERT INTO `admin_operation_log` VALUES (3532, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:40:25', '2022-02-09 15:40:25');
INSERT INTO `admin_operation_log` VALUES (3533, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"5\",\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-02-09 15:40:26', '2022-02-09 15:40:26');
INSERT INTO `admin_operation_log` VALUES (3534, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-09 15:40:27', '2022-02-09 15:40:27');
INSERT INTO `admin_operation_log` VALUES (3535, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-09 15:48:20', '2022-02-09 15:48:20');
INSERT INTO `admin_operation_log` VALUES (3536, 1, 'admin/tasks/1', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d4b\\u8bd5111\",\"quality\":\"1\",\"task_id\":\"3\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"5\",\"6\",null],\"_file_sort_\":{\"medias\":null},\"commant\":\"like you!\\r\\nohh @girl\",\"_token\":\"BiIh9RiftjYNkota2FrkZCOianK1pOU6yLhYmttm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-02-09 15:48:22', '2022-02-09 15:48:22');
INSERT INTO `admin_operation_log` VALUES (3537, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-09 15:48:22', '2022-02-09 15:48:22');
INSERT INTO `admin_operation_log` VALUES (3538, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-10 11:42:59', '2022-02-10 11:42:59');
INSERT INTO `admin_operation_log` VALUES (3539, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 11:43:07', '2022-02-10 11:43:07');
INSERT INTO `admin_operation_log` VALUES (3540, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:44:00', '2022-02-10 11:44:00');
INSERT INTO `admin_operation_log` VALUES (3541, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:47:26', '2022-02-10 11:47:26');
INSERT INTO `admin_operation_log` VALUES (3542, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:48:03', '2022-02-10 11:48:03');
INSERT INTO `admin_operation_log` VALUES (3543, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:49:41', '2022-02-10 11:49:41');
INSERT INTO `admin_operation_log` VALUES (3544, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:49:51', '2022-02-10 11:49:51');
INSERT INTO `admin_operation_log` VALUES (3545, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:55:55', '2022-02-10 11:55:55');
INSERT INTO `admin_operation_log` VALUES (3546, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 11:56:26', '2022-02-10 11:56:26');
INSERT INTO `admin_operation_log` VALUES (3547, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 11:56:30', '2022-02-10 11:56:30');
INSERT INTO `admin_operation_log` VALUES (3548, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 11:58:56', '2022-02-10 11:58:56');
INSERT INTO `admin_operation_log` VALUES (3549, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 11:59:09', '2022-02-10 11:59:09');
INSERT INTO `admin_operation_log` VALUES (3550, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:42:41', '2022-02-10 13:42:41');
INSERT INTO `admin_operation_log` VALUES (3551, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:43:52', '2022-02-10 13:43:52');
INSERT INTO `admin_operation_log` VALUES (3552, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:44:10', '2022-02-10 13:44:10');
INSERT INTO `admin_operation_log` VALUES (3553, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:44:23', '2022-02-10 13:44:23');
INSERT INTO `admin_operation_log` VALUES (3554, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:44:30', '2022-02-10 13:44:30');
INSERT INTO `admin_operation_log` VALUES (3555, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:44:53', '2022-02-10 13:44:53');
INSERT INTO `admin_operation_log` VALUES (3556, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:45:32', '2022-02-10 13:45:32');
INSERT INTO `admin_operation_log` VALUES (3557, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:45:40', '2022-02-10 13:45:40');
INSERT INTO `admin_operation_log` VALUES (3558, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:45:56', '2022-02-10 13:45:56');
INSERT INTO `admin_operation_log` VALUES (3559, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:46:18', '2022-02-10 13:46:18');
INSERT INTO `admin_operation_log` VALUES (3560, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:46:29', '2022-02-10 13:46:29');
INSERT INTO `admin_operation_log` VALUES (3561, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:46:58', '2022-02-10 13:46:58');
INSERT INTO `admin_operation_log` VALUES (3562, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:47:46', '2022-02-10 13:47:46');
INSERT INTO `admin_operation_log` VALUES (3563, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:48:08', '2022-02-10 13:48:08');
INSERT INTO `admin_operation_log` VALUES (3564, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:48:40', '2022-02-10 13:48:40');
INSERT INTO `admin_operation_log` VALUES (3565, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:48:43', '2022-02-10 13:48:43');
INSERT INTO `admin_operation_log` VALUES (3566, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:51:37', '2022-02-10 13:51:37');
INSERT INTO `admin_operation_log` VALUES (3567, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:51:39', '2022-02-10 13:51:39');
INSERT INTO `admin_operation_log` VALUES (3568, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:51:53', '2022-02-10 13:51:53');
INSERT INTO `admin_operation_log` VALUES (3569, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:51:53', '2022-02-10 13:51:53');
INSERT INTO `admin_operation_log` VALUES (3570, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 13:52:45', '2022-02-10 13:52:45');
INSERT INTO `admin_operation_log` VALUES (3571, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 13:52:48', '2022-02-10 13:52:48');
INSERT INTO `admin_operation_log` VALUES (3572, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:52:48', '2022-02-10 13:52:48');
INSERT INTO `admin_operation_log` VALUES (3573, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Period\"}', '2022-02-10 13:54:34', '2022-02-10 13:54:34');
INSERT INTO `admin_operation_log` VALUES (3574, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:54:35', '2022-02-10 13:54:35');
INSERT INTO `admin_operation_log` VALUES (3575, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 13:55:26', '2022-02-10 13:55:26');
INSERT INTO `admin_operation_log` VALUES (3576, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos\":\"10\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-02-10 13:55:28', '2022-02-10 13:55:28');
INSERT INTO `admin_operation_log` VALUES (3577, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 13:55:28', '2022-02-10 13:55:28');
INSERT INTO `admin_operation_log` VALUES (3578, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-10 13:58:20', '2022-02-10 13:58:20');
INSERT INTO `admin_operation_log` VALUES (3579, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"tFD3GOyanoqILuIXS7WOdWlYZ4lspXpBAjyf1Q2K\",\"_action\":\"App_Admin_Actions_Task_Send\"}', '2022-02-10 14:00:32', '2022-02-10 14:00:32');
INSERT INTO `admin_operation_log` VALUES (3580, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-10 14:00:33', '2022-02-10 14:00:33');
INSERT INTO `admin_operation_log` VALUES (3581, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-11 14:19:19', '2022-02-11 14:19:19');
INSERT INTO `admin_operation_log` VALUES (3582, 1, 'admin/qrcode', 'GET', '127.0.0.1', '[]', '2022-02-11 14:20:17', '2022-02-11 14:20:17');
INSERT INTO `admin_operation_log` VALUES (3583, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-12 16:08:32', '2022-02-12 16:08:32');
INSERT INTO `admin_operation_log` VALUES (3584, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-12 16:08:45', '2022-02-12 16:08:45');
INSERT INTO `admin_operation_log` VALUES (3585, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-12 16:08:58', '2022-02-12 16:08:58');
INSERT INTO `admin_operation_log` VALUES (3586, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-12 16:09:19', '2022-02-12 16:09:19');
INSERT INTO `admin_operation_log` VALUES (3587, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-12 16:09:23', '2022-02-12 16:09:23');
INSERT INTO `admin_operation_log` VALUES (3588, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:11:53', '2022-02-12 16:11:53');
INSERT INTO `admin_operation_log` VALUES (3589, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:12:21', '2022-02-12 16:12:21');
INSERT INTO `admin_operation_log` VALUES (3590, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"videos[\":\"30\",\"seetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":\"wewer\\r\\nerwrwe\"},\"_token\":\"cdRtHuhaoAPXXHlVPx4dTknWMayeDnyy0qMfaWHN\",\"_method\":\"PUT\"}', '2022-02-12 16:12:28', '2022-02-12 16:12:28');
INSERT INTO `admin_operation_log` VALUES (3591, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-12 16:12:28', '2022-02-12 16:12:28');
INSERT INTO `admin_operation_log` VALUES (3592, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-12 16:12:32', '2022-02-12 16:12:32');
INSERT INTO `admin_operation_log` VALUES (3593, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:12:55', '2022-02-12 16:12:55');
INSERT INTO `admin_operation_log` VALUES (3594, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:13:17', '2022-02-12 16:13:17');
INSERT INTO `admin_operation_log` VALUES (3595, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:13:28', '2022-02-12 16:13:28');
INSERT INTO `admin_operation_log` VALUES (3596, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:14:27', '2022-02-12 16:14:27');
INSERT INTO `admin_operation_log` VALUES (3597, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:14:32', '2022-02-12 16:14:32');
INSERT INTO `admin_operation_log` VALUES (3598, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '[]', '2022-02-12 16:14:52', '2022-02-12 16:14:52');
INSERT INTO `admin_operation_log` VALUES (3599, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"minvideo\":\"3\",\"maxvideo\":\"10\",\"minseetime\":\"3\",\"maxseetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":null},\"_token\":\"cdRtHuhaoAPXXHlVPx4dTknWMayeDnyy0qMfaWHN\",\"_method\":\"PUT\"}', '2022-02-12 16:19:54', '2022-02-12 16:19:54');
INSERT INTO `admin_operation_log` VALUES (3600, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-12 16:19:54', '2022-02-12 16:19:54');
INSERT INTO `admin_operation_log` VALUES (3601, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-12 16:19:58', '2022-02-12 16:19:58');
INSERT INTO `admin_operation_log` VALUES (3602, 1, 'admin/tasks/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u517b\\u53f7\\u6d4b\\u8bd5\",\"quality\":\"0\",\"task_id\":\"2\",\"dg\":[null],\"device_id\":[null],\"ag\":[null],\"account_id\":[\"6\",null],\"configs\":{\"minvideo\":\"20\",\"maxvideo\":\"30\",\"minseetime\":\"5\",\"maxseetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":null},\"_token\":\"cdRtHuhaoAPXXHlVPx4dTknWMayeDnyy0qMfaWHN\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com\\/admin\\/tasks\"}', '2022-02-12 16:20:11', '2022-02-12 16:20:11');
INSERT INTO `admin_operation_log` VALUES (3603, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-12 16:20:12', '2022-02-12 16:20:12');
INSERT INTO `admin_operation_log` VALUES (3604, 1, 'admin/tasks/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-12 16:20:14', '2022-02-12 16:20:14');
INSERT INTO `admin_operation_log` VALUES (3605, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-14 19:11:02', '2022-02-14 19:11:02');
INSERT INTO `admin_operation_log` VALUES (3606, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-14 19:11:07', '2022-02-14 19:11:07');
INSERT INTO `admin_operation_log` VALUES (3607, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-14 19:13:20', '2022-02-14 19:13:20');
INSERT INTO `admin_operation_log` VALUES (3608, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"XFHTOEAOEDJnKRVudeWtjV8DZpBFzZFhrKhnPkL2\",\"_action\":\"App_Admin_Actions_Task_Send\",\"_input\":\"true\"}', '2022-02-14 19:13:25', '2022-02-14 19:13:25');
INSERT INTO `admin_operation_log` VALUES (3609, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-14 19:13:27', '2022-02-14 19:13:27');
INSERT INTO `admin_operation_log` VALUES (3610, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_Task\",\"_token\":\"XFHTOEAOEDJnKRVudeWtjV8DZpBFzZFhrKhnPkL2\",\"_action\":\"App_Admin_Actions_Task_Send\",\"_input\":\"true\"}', '2022-02-14 19:13:53', '2022-02-14 19:13:53');
INSERT INTO `admin_operation_log` VALUES (3611, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-14 19:13:56', '2022-02-14 19:13:56');
INSERT INTO `admin_operation_log` VALUES (3612, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-02-21 15:56:51', '2022-02-21 15:56:51');
INSERT INTO `admin_operation_log` VALUES (3613, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 15:56:57', '2022-02-21 15:56:57');
INSERT INTO `admin_operation_log` VALUES (3614, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 15:56:59', '2022-02-21 15:56:59');
INSERT INTO `admin_operation_log` VALUES (3615, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 16:33:36', '2022-02-21 16:33:36');
INSERT INTO `admin_operation_log` VALUES (3616, 1, 'admin/tasks/1/edit', 'GET', '127.0.0.1', '[]', '2022-02-21 16:34:23', '2022-02-21 16:34:23');
INSERT INTO `admin_operation_log` VALUES (3617, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 16:34:25', '2022-02-21 16:34:25');
INSERT INTO `admin_operation_log` VALUES (3618, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-21 16:34:40', '2022-02-21 16:34:40');
INSERT INTO `admin_operation_log` VALUES (3619, 1, 'admin/tasks', 'GET', '127.0.0.1', '[]', '2022-02-21 16:34:59', '2022-02-21 16:34:59');
INSERT INTO `admin_operation_log` VALUES (3620, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 17:31:06', '2022-02-21 17:31:06');
INSERT INTO `admin_operation_log` VALUES (3621, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 17:33:56', '2022-02-21 17:33:56');
INSERT INTO `admin_operation_log` VALUES (3622, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 17:34:28', '2022-02-21 17:34:28');
INSERT INTO `admin_operation_log` VALUES (3623, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-02-21 17:37:51', '2022-02-21 17:37:51');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, '设备组管理', 'devicegroup', 'GET,POST', '/group-devices\r\n/group-devices/create', '2022-01-10 14:38:08', '2022-01-10 14:38:54');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 6, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2021-11-22 07:37:01', '2021-11-22 07:37:01');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
INSERT INTO `admin_user_permissions` VALUES (2, 6, NULL, NULL);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT 0 COMMENT '父id',
  `pid_chain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '上级链',
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_device` smallint(5) NULL DEFAULT 1 COMMENT '设备最大连接数',
  `enttime` int(11) NULL DEFAULT 0 COMMENT '账号到期时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 0, NULL, 'admin', '$2y$10$nIu6ZCw.PX/S9bzqH9UQ2.cdWCHvvLa//VGQh/1DcXbU4VP1KpIQG', 'Administrator', 15, NULL, NULL, 'O42Zovs5n0u7WN5lo9VZAohFfOJpvsjh8jmM3xQ2Pqcq4kx0iGP7eO38S11n', '2021-11-22 07:37:01', '2021-12-16 16:15:34');
INSERT INTO `admin_users` VALUES (2, 0, NULL, 'test', '$2y$10$Wr05gZbHgBZyux4u5nIzMuMOCY1WZOmXCaOvslHX58nb2JvevHXXm', '测试账号', 1, 0, NULL, 'sh2QTaoO8lKssm3eM7hg3Ua9d4o4SIa7yrUSy5pxuy8Ewo2yPqlWFUgVVWeV', '2021-12-20 10:03:53', '2022-01-10 14:37:01');

-- ----------------------------
-- Table structure for device_to_groups
-- ----------------------------
DROP TABLE IF EXISTS `device_to_groups`;
CREATE TABLE `device_to_groups`  (
  `id` int(11) NOT NULL COMMENT '设备id',
  `gid` int(11) NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`, `gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备对应分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_to_groups
-- ----------------------------
INSERT INTO `device_to_groups` VALUES (2, 3);
INSERT INTO `device_to_groups` VALUES (5, 2);

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '对应用户id',
  `groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备所在的组',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备唯一编码',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备详细信息',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备备注',
  `number` smallint(6) NULL DEFAULT 0 COMMENT '设备编号',
  `user_num` smallint(6) NULL DEFAULT NULL COMMENT '用户自定义设备编号',
  `accounts` tinyint(2) NULL DEFAULT 0 COMMENT '该设备下账号数量',
  `history_uid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '历史所属用户列表',
  `lock` tinyint(1) NULL DEFAULT 1 COMMENT '当前用户是否锁定该设备',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态, 0为离线, 1为在线',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '设备首次添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '上次更新时间',
  `soft_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '软件版本',
  `soft_lang` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '软件语言',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `imei`(`imei`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of devices
-- ----------------------------
INSERT INTO `devices` VALUES (1, 1, '3', 'af2d9c04bd07c72a', '{\"brand\":\"xiaomi\",\"model\":\"Redmi Note 4X\",\"screenWidth\":1080,\"screenHeight\":1920,\"system\":\"7.0\",\"version\":\"7.0\",\"serial\":\"cd55682e0004\",\"appversion\":8082000}', '测试手机', 1, 1, 2, NULL, 0, 0, '2021-12-05 18:47:58', '2022-02-21 17:37:51', '22.6.4', 'english');
INSERT INTO `devices` VALUES (2, 1, '3', '866334036722060,866334036722078', '{\"brand\":\"Xiaomi\",\"model\":\"Redmi Note 4X\",\"language\":\"zh-CN\",\"screenWidth\":360,\"screenHeight\":640,\"system\":\"Android 7.0\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', NULL, 2, 2, 0, NULL, 0, 0, '2021-12-06 10:04:21', '2022-02-21 17:37:51', NULL, NULL);
INSERT INTO `devices` VALUES (4, 1, '1,2', '2feb5bfba9810ce5', '{\"brand\":\"HUAWEI\",\"model\":\"VOG-AL00\",\"language\":\"zh-CN\",\"screenWidth\":360,\"screenHeight\":780,\"system\":\"Android 10\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', NULL, 4, 8, 0, NULL, 1, 0, '2021-12-07 10:46:24', '2022-02-21 17:37:51', '22.6.4', NULL);
INSERT INTO `devices` VALUES (5, 1, '2', '6dd04aa35c130ccd', '{\"brand\":\"Sony\",\"model\":\"D6563\",\"language\":\"en-US\",\"screenWidth\":360,\"screenHeight\":592,\"system\":\"Android 6.0.1\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', NULL, 4, 3, 0, NULL, 1, 0, '2021-12-13 13:52:13', '2022-02-21 17:37:51', NULL, NULL);
INSERT INTO `devices` VALUES (6, 1, NULL, '866001032867724,866001032867732', '{\"brand\":\"Xiaomi\",\"model\":\"Redmi Note 4X\",\"language\":\"en-US\",\"screenWidth\":360,\"screenHeight\":640,\"system\":\"Android 7.0\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', NULL, 5, 5, 0, NULL, 1, 0, '2021-12-27 18:57:00', '2022-02-21 17:37:51', NULL, NULL);
INSERT INTO `devices` VALUES (7, 1, NULL, '2e1962de4bb2f467', '{\"brand\":\"SHARP\",\"model\":\"SH-03J\",\"language\":\"en-US\",\"screenWidth\":360,\"screenHeight\":592,\"system\":\"Android 9\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', NULL, 6, 12, 0, NULL, 1, 0, '2022-01-10 17:18:44', '2022-02-21 17:37:51', '20.4.3', 'english');
INSERT INTO `devices` VALUES (9, 1, NULL, 'cfdd009de9a889e2', '{\"brand\":\"DOCOMO\",\"model\":\"SH-03J\",\"screenWidth\":1440,\"screenHeight\":2560,\"system\":\"9\",\"version\":\"9\",\"serial\":\"unknown\",\"appversion\":8182200}', NULL, 7, 7, 0, NULL, 1, 0, '2022-01-14 15:09:26', '2022-02-21 17:37:51', '22.9.2', 'english');
INSERT INTO `devices` VALUES (10, 1, NULL, '1cb81bfc94006d2b', '{\"brand\":\"vivo\",\"model\":\"V1824A\",\"screenWidth\":720,\"screenHeight\":1280,\"system\":\"7.1.2\",\"version\":\"7.1.2\",\"serial\":\"00a887dc\",\"appversion\":8182200}', NULL, 8, 8, 0, NULL, 1, 0, '2022-01-15 19:09:21', '2022-02-21 17:37:51', '22.6.4', 'english');
INSERT INTO `devices` VALUES (11, 1, NULL, '4e8425d768cc9c62', '{\"brand\":\"xiaomi\",\"model\":\"Redmi Note 4X\",\"screenWidth\":1080,\"screenHeight\":1920,\"system\":\"7.0\",\"version\":\"7.0\",\"serial\":\"cd55682e0004\",\"appversion\":8182200}', NULL, 9, 9, 2, NULL, 1, 0, '2022-01-18 11:14:20', '2022-02-21 17:37:51', '20.4.3', 'english');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_accounts
-- ----------------------------
DROP TABLE IF EXISTS `group_accounts`;
CREATE TABLE `group_accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '所属用户',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `accounts` smallint(3) NULL DEFAULT 0 COMMENT '分组中的账号数量',
  `orderby` smallint(6) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_accounts
-- ----------------------------
INSERT INTO `group_accounts` VALUES (1, 1, '账号组1', 2, 2);
INSERT INTO `group_accounts` VALUES (2, 1, '账号组2', 1, NULL);

-- ----------------------------
-- Table structure for group_devices
-- ----------------------------
DROP TABLE IF EXISTS `group_devices`;
CREATE TABLE `group_devices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组名',
  `devices` smallint(5) NULL DEFAULT 0 COMMENT '设备数',
  `orderby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_devices
-- ----------------------------
INSERT INTO `group_devices` VALUES (1, 1, '设备测试', 0, '0');
INSERT INTO `group_devices` VALUES (2, 1, '好的', 1, '0');
INSERT INTO `group_devices` VALUES (3, 1, '设备组3', 1, NULL);

-- ----------------------------
-- Table structure for lang_to_texts
-- ----------------------------
DROP TABLE IF EXISTS `lang_to_texts`;
CREATE TABLE `lang_to_texts`  (
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语言iso',
  `key` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '前端引用的key',
  `version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本,如果指定,仅对应tiktok版本才有',
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  INDEX `version`(`version`) USING BTREE,
  INDEX `key`(`key`) USING BTREE,
  INDEX `lang`(`lang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '多语言对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lang_to_texts
-- ----------------------------
INSERT INTO `lang_to_texts` VALUES ('english', 'discover', NULL, 'Discover');
INSERT INTO `lang_to_texts` VALUES ('english', 'followers', NULL, 'Followers');
INSERT INTO `lang_to_texts` VALUES ('english', 'following', NULL, 'Following');
INSERT INTO `lang_to_texts` VALUES ('english', 'home', NULL, 'Home');
INSERT INTO `lang_to_texts` VALUES ('english', 'inbox', NULL, 'Inbox');
INSERT INTO `lang_to_texts` VALUES ('english', 'likes', NULL, 'Likes');
INSERT INTO `lang_to_texts` VALUES ('english', 'profile', NULL, 'Profile');
INSERT INTO `lang_to_texts` VALUES ('english', 'sigiup', NULL, 'Sign up');
INSERT INTO `lang_to_texts` VALUES ('english', 'copylink', NULL, 'Copy link');
INSERT INTO `lang_to_texts` VALUES ('english', 'switchaccount', NULL, 'Switch account');
INSERT INTO `lang_to_texts` VALUES ('english', 'profile', '20.4.3', 'Me');
INSERT INTO `lang_to_texts` VALUES ('english', 'next', NULL, 'Next');
INSERT INTO `lang_to_texts` VALUES ('english', 'post', NULL, 'Post');
INSERT INTO `lang_to_texts` VALUES ('english', 'postnow', NULL, 'Post Now');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for task_types
-- ----------------------------
DROP TABLE IF EXISTS `task_types`;
CREATE TABLE `task_types`  (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称,如养号,视频发布',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '和手机脚本约定的类型',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务说明',
  `default_configs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '该任务的默认配置',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isdevice` tinyint(1) NULL DEFAULT 0 COMMENT '是否仅设备任务',
  `sameconf` tinyint(1) NULL DEFAULT 1 COMMENT '是否相同配置',
  `orderby` smallint(5) NULL DEFAULT 0 COMMENT '排序',
  `isone` tinyint(1) NULL DEFAULT 0 COMMENT '是否是单次执行的任务',
  `model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用model模型的什么方法格式化数据',
  `quality` smallint(4) NULL DEFAULT 0 COMMENT '默认权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_types
-- ----------------------------
INSERT INTO `task_types` VALUES (1, '获取账号', 'accounts', NULL, NULL, 'accounts', 1, 1, 0, 1, NULL, 9);
INSERT INTO `task_types` VALUES (2, '养号', 'raise', NULL, NULL, 'raise', 0, 1, 10, 0, 'raise', 0);
INSERT INTO `task_types` VALUES (3, '视频发布', 'post', NULL, NULL, 'post', 0, 0, 0, 0, 'videos', 8);
INSERT INTO `task_types` VALUES (4, '关注用户', NULL, NULL, NULL, 'fllowers', 0, 0, 0, 0, NULL, 1);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `task_id` int(11) NOT NULL COMMENT '任务类型',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `device_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备编号',
  `account_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '账号编号,如果账号id为空,则执行的是基于设备的任务',
  `quality` smallint(4) NULL DEFAULT 0 COMMENT '任务权重',
  `starttime` int(11) NULL DEFAULT 0 COMMENT '开始时间',
  `endtime` int(11) NULL DEFAULT NULL COMMENT '任务过期时间',
  `configs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务参数',
  `errmsg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行错误信息',
  `status` smallint(4) NULL DEFAULT 0 COMMENT '任务状态,-2任务中断, -1失败,0待执行,1执行中,2客户端挂起,3已经发送给手机端,10执行成功',
  `active` tinyint(1) NULL DEFAULT 1 COMMENT '任务是否有效',
  `frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行频率',
  `units` tinyint(2) NULL DEFAULT NULL COMMENT '频率单位',
  `dg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备组',
  `ag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '账号组',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '任务创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '任务更新时间',
  `need_times` smallint(5) NULL DEFAULT 0 COMMENT '任务最大执行次数,0为不限制次数',
  `medias` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视频',
  `commant` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视频标题',
  `run_times` smallint(5) NULL DEFAULT 0 COMMENT '任务已经执行次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 1, 3, '测试111', '', '5,6', 1, 1642953600, 1643212800, '{\"content\":\"like you\",\"medias\":[{}]}', NULL, 10, 1, '{\"daily\":\"1\",\"start\":\"08:00:00\",\"end\":\"12:00:00\"}', 2, '', '', '2021-12-17 19:37:55', '2022-02-09 15:37:53', 0, '[\"files\\/6962063290197462309.mp4\"]', 'like you!\r\nohh @girl', 0);
INSERT INTO `tasks` VALUES (2, 1, 1, '测试', '11', NULL, 0, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, '', NULL, '2022-01-27 18:13:22', '2022-01-27 19:29:16', 0, NULL, NULL, 0);
INSERT INTO `tasks` VALUES (3, 1, 2, '养号测试', '', '6', 0, 0, NULL, '{\"minvideo\":\"20\",\"maxvideo\":\"30\",\"minseetime\":\"5\",\"maxseetime\":\"10\",\"dianzan\":\"10\",\"comment_pro\":\"10\",\"commants\":null}', NULL, 0, 1, NULL, NULL, '', '', '2022-01-27 18:15:34', '2022-02-12 16:20:12', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for tiktok_version_buttons
-- ----------------------------
DROP TABLE IF EXISTS `tiktok_version_buttons`;
CREATE TABLE `tiktok_version_buttons`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mainId` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要控件id',
  `ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '所有用得到的控件id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mainId`(`mainId`) USING BTREE,
  INDEX `version`(`version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tiktok控件id和版本对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiktok_version_buttons
-- ----------------------------
INSERT INTO `tiktok_version_buttons` VALUES (1, '22.6.4', 'cmw', '{\"send\":\"cmw\",\"profile\":\"cn0\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"big\",\"editprofile\":\"cug\",\"uid\":\"ffo\",\"change_account\":\"cvv\",\"profile_avatar\":\"bj1\"}');
INSERT INTO `tiktok_version_buttons` VALUES (2, 'v20.7.3(2022007030)', '1', '{\"send\":\"cmw\",\"profile\":\"cn0\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"big\",\"editprofile\":\"cug\",\"uid\":\"ffo\"}');
INSERT INTO `tiktok_version_buttons` VALUES (3, 'v22.7.4(2022207040)', '1', '{\"send\":\"cmw\",\"profile\":\"cn0\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"big\",\"editprofile\":\"cug\",\"uid\":\"ffo\",\"change_account\":\"cvv\",\"profile_avatar\":\"bj1\"}');
INSERT INTO `tiktok_version_buttons` VALUES (4, '22.9.2', '1', '{\"send\":\"cmw\",\"profile\":\"cn0\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"big\",\"editprofile\":\"cug\",\"uid\":\"ffo\",\"change_account\":\"cym\",\"profile_avatar\":\"bkr\"}');
INSERT INTO `tiktok_version_buttons` VALUES (5, '20.4.3', '1', '{\"send\":\"c74\",\"profile\":\"c78\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"big\",\"editprofile\":\"cug\",\"uid\":\"ffo\",\"change_account\":\"title\",\"profile_avatar\":\"bkr\",\"like\":\"ai3\",\"comment\":\"a7e\",\"commentsend\":\"a7q\",\"videotxt\":\"agf\",\"chooseupload\":\"bs4\",\"videoselect\":\"bcu\",\"posting\":\"d6b\"}');
INSERT INTO `tiktok_version_buttons` VALUES (6, '23.1.4', '1', '{\"send\":\"ct3\",\"profile\":\"ct8\",\"signup\":\"a2o\",\"switchaccount\":\"cv0\",\"avatar\":\"bmq\",\"editprofile\":\"d17\",\"uid\":\"d1s\",\"change_account\":\"d1s\",\"profile_avatar\":\"bkr\",\"like\":\"arj\",\"comment\":\"aej\",\"commentsend\":\"af3\",\"videotxt\":\"apk\",\"chooseupload\":\"cae\",\"videoselect\":\"bu8\",\"posting\":\"e2e\"}');

-- ----------------------------
-- Table structure for tt_users
-- ----------------------------
DROP TABLE IF EXISTS `tt_users`;
CREATE TABLE `tt_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `account_id` int(11) NOT NULL COMMENT '关注的账号',
  `did` int(11) NOT NULL COMMENT '设备id',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uuid',
  `uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台用户id,唯一的',
  `sec_uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '很重要的id',
  `short_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短id',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique_id',
  `shareUrl` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享的链接地址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '签名',
  `follower_count` int(11) NULL DEFAULT 0 COMMENT '粉丝数',
  `aweme_count` int(11) NULL DEFAULT 0 COMMENT '作品数量',
  `total_favorited` int(11) NULL DEFAULT 0 COMMENT '获赞数',
  `following_count` int(11) NULL DEFAULT 0 COMMENT '关注数',
  `favoriting_count` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `isSecret` tinyint(1) NULL DEFAULT 0 COMMENT '是否私密账户',
  `openFavorite` tinyint(1) NULL DEFAULT 0 COMMENT '送否开启喜欢权限',
  `region` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号所属区域',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '是否回关',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tiktok用户列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tt_users
-- ----------------------------
INSERT INTO `tt_users` VALUES (1, 0, 1, 1, 'ykf66886688', '108724851792', 'MS4wLjABAAAAeK--ZQVLsqDIzwcPcj9G76eN-rYuta1C9KbPGK08cXI', '2231979783', 'ykf66886688', 'https://v.douyin.com/Rn1dJ6o/', 'https://p26.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-avt-0015_f28d4f0a49fe3d56b5dec240535430d4.jpeg?from=2956013662', '全村的希望撒', '秋风扫落叶，孔雀东南飞', 1044, 11, 359, 91, 2225, 0, NULL, 'CN', '2021-12-17 11:25:50', '2021-12-05 18:48:41', 1);
INSERT INTO `tt_users` VALUES (2, 0, 1, 1, '98183224246', '2154644806304628', 'MS4wLjABAAAAqxUJLr0it2JvZHH2St6yRVoc_L0eJN3TJcWXWHSLdd5crGvB83RNadlsRk4HqeXn', '98183224246', '98183224246', 'https://v.douyin.com/RnqQsVX/', 'https://p29.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-i-0813_f6667567188f4a4e9791ee3198da2146.jpeg?from=2956013662', '新的名字', '新的名字', 24, 17, 9, 133, 92, 0, NULL, 'CN', '2021-12-17 10:49:12', '2021-12-05 18:48:41', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `max_device` int(11) NULL DEFAULT 0 COMMENT '用户最多可绑定的设备数量',
  `endtime` int(11) NULL DEFAULT NULL COMMENT '用户授权结束时间',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '测试', NULL, NULL, NULL, NULL, 10, NULL, NULL, '2021-12-13 15:12:52');

SET FOREIGN_KEY_CHECKS = 1;
