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

 Date: 06/12/2021 09:53:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '管理员id',
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
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 1, 1, 'ykf66886688', '108724851792', 'MS4wLjABAAAAeK--ZQVLsqDIzwcPcj9G76eN-rYuta1C9KbPGK08cXI', '2231979783', 'ykf66886688', 'https://v.douyin.com/Rn1dJ6o/', 'https://p26.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-avt-0015_f28d4f0a49fe3d56b5dec240535430d4.jpeg?from=2956013662', '全村的希望撒', '秋风扫落叶，孔雀东南飞', 1044, 11, 359, 91, 2225, 'CN', '2021-12-06 09:23:52', '2021-12-05 18:48:41', 1);
INSERT INTO `accounts` VALUES (2, 1, 1, '98183224246', '2154644806304628', 'MS4wLjABAAAAqxUJLr0it2JvZHH2St6yRVoc_L0eJN3TJcWXWHSLdd5crGvB83RNadlsRk4HqeXn', '98183224246', '98183224246', 'https://v.douyin.com/Rn1Admj/', 'https://p9.douyinpic.com/aweme/1080x1080/aweme-avatar/tos-cn-i-0813_f6667567188f4a4e9791ee3198da2146.jpeg?from=2956013662', '新的名字', '新的名字', 23, 17, 9, 133, 92, 'CN', '2021-12-06 09:23:52', '2021-12-05 18:48:41', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '控制台', 'fa-bar-chart', '/', NULL, NULL, '2021-12-03 10:06:25');
INSERT INTO `admin_menu` VALUES (2, 0, 6, '管理员', 'fa-tasks', NULL, NULL, NULL, '2021-12-03 11:01:23');
INSERT INTO `admin_menu` VALUES (3, 2, 7, '管理员列表', 'fa-users', 'auth/users', NULL, NULL, '2021-12-03 11:01:24');
INSERT INTO `admin_menu` VALUES (4, 2, 8, '角色列表', 'fa-user', 'auth/roles', NULL, NULL, '2021-12-03 11:01:24');
INSERT INTO `admin_menu` VALUES (5, 2, 9, '权限列表', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-12-03 11:01:24');
INSERT INTO `admin_menu` VALUES (6, 2, 10, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2021-12-03 11:01:24');
INSERT INTO `admin_menu` VALUES (7, 2, 11, '日志', 'fa-history', 'auth/logs', NULL, NULL, '2021-12-03 11:01:24');
INSERT INTO `admin_menu` VALUES (8, 0, 2, '设备管理', 'fa-motorcycle', NULL, NULL, '2021-12-03 10:26:33', '2021-12-04 11:49:07');
INSERT INTO `admin_menu` VALUES (9, 8, 4, '手机管理', 'fa-mobile-phone', 'devices', NULL, '2021-12-03 10:30:58', '2021-12-03 11:01:23');
INSERT INTO `admin_menu` VALUES (10, 8, 5, '账号管理', 'fa-space-shuttle', 'accounts', NULL, '2021-12-03 10:32:28', '2021-12-03 11:01:23');
INSERT INTO `admin_menu` VALUES (11, 8, 3, '账号分组', 'fa-object-group', 'groups', NULL, '2021-12-03 11:01:18', '2021-12-04 11:48:49');

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
) ENGINE = InnoDB AUTO_INCREMENT = 464 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

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
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 0, NULL, 'admin', '$2y$10$nIu6ZCw.PX/S9bzqH9UQ2.cdWCHvvLa//VGQh/1DcXbU4VP1KpIQG', 'Administrator', NULL, 'O42Zovs5n0u7WN5lo9VZAohFfOJpvsjh8jmM3xQ2Pqcq4kx0iGP7eO38S11n', '2021-11-22 07:37:01', '2021-11-22 07:37:01');

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '对应用户id',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备唯一编码',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备详细信息',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备备注',
  `number` smallint(6) NULL DEFAULT 0 COMMENT '设备编号',
  `user_num` smallint(6) NULL DEFAULT NULL COMMENT '用户自定义设备编号',
  `accounts` tinyint(2) NULL DEFAULT 0 COMMENT '该设备下账号数量',
  `history_uid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '历史所属用户列表',
  `lock` tinyint(1) NULL DEFAULT 0 COMMENT '当前用户是否锁定该设备',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态, 0为离线, 1为在线',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '设备首次添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '上次更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `imei`(`imei`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of devices
-- ----------------------------
INSERT INTO `devices` VALUES (1, 1, 'af2d9c04bd07c72a', '{\"brand\":\"Xiaomi\",\"model\":\"Redmi Note 4X\",\"language\":\"zh-CN\",\"screenWidth\":360,\"screenHeight\":640,\"system\":\"Android 7.0\",\"version\":\"1.9.9.81096\",\"appversion\":\"1.0.1\"}', '测试手机', 1, 1, 2, NULL, 0, 0, '2021-12-05 18:47:58', '2021-12-06 09:23:52');

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
-- Table structure for groupaccounts
-- ----------------------------
DROP TABLE IF EXISTS `groupaccounts`;
CREATE TABLE `groupaccounts`  (
  `id` int(11) NOT NULL COMMENT '账号id',
  `gid` int(11) NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`, `gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupaccounts
-- ----------------------------
INSERT INTO `groupaccounts` VALUES (1, 1);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '所属用户',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `accounts` smallint(3) NULL DEFAULT 0 COMMENT '分组中的账号数量',
  `orderby` smallint(6) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 1, '测试', 1, 2, 1);

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
INSERT INTO `users` VALUES (1, '测试', NULL, NULL, NULL, NULL, 3, NULL, NULL, '2021-12-06 09:16:04');

SET FOREIGN_KEY_CHECKS = 1;
