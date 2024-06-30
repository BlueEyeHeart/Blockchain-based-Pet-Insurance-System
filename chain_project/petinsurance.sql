/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : petinsurance

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 06/06/2024 11:09:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_pet
-- ----------------------------
DROP TABLE IF EXISTS `app_pet`;
CREATE TABLE `app_pet`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `species` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_pet_owner_id_0f40b076_fk_custom_user_id`(`owner_id` ASC) USING BTREE,
  CONSTRAINT `app_pet_owner_id_0f40b076_fk_custom_user_id` FOREIGN KEY (`owner_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_pet
-- ----------------------------
INSERT INTO `app_pet` VALUES (2, '柯基', 2, 'Female', 5, '小红');
INSERT INTO `app_pet` VALUES (3, '哈士奇', 4, 'Female', 5, '二炮');
INSERT INTO `app_pet` VALUES (4, '土狗', 3, 'Male', 5, '二十');

-- ----------------------------
-- Table structure for app_policy
-- ----------------------------
DROP TABLE IF EXISTS `app_policy`;
CREATE TABLE `app_policy`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `term_years` int NOT NULL,
  `premium_amount` decimal(10, 2) NOT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `pet_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `app_policy_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_policy
-- ----------------------------
INSERT INTO `app_policy` VALUES (1, '身体意外保险', '以宠物的寿命和身体为保险标的的保险。当宠物发生死亡、伤残、疾病、年老等风险事故时或者达到合同约定的年龄、期限时，保险公司按照约定给付保险金。为每一个宠物的主人减轻宠物在生病医疗方面的费用。', 3, 666.00, '2024-06-06 00:09:53', '2024-08-01 00:09:56', NULL, NULL);
INSERT INTO `app_policy` VALUES (2, '宠物责任险', '宠物责任险是指被保险人在保险期内合法拥有、照料的宠物，造成第三者人身伤害或者财产损失，保险人按照合同约定赔偿。\r\n\r\n换言之，如果你家的宠物被狗咬伤了，保险公司就会为你需要向第三方赔偿的金额进行赔偿，包括这三种意外事故，以及三种意外医疗费用以及财产损失费用。', 4, 888.00, '2024-06-06 00:11:46', '2024-08-01 00:11:49', NULL, NULL);
INSERT INTO `app_policy` VALUES (3, '宠物健康保险', '一般情况下，投保2个月至10岁的犬、猫，在指定的医院和服务点内发生的医疗费用，包括宠物每天自发出现并需要就医的疾病，皮肤、呼吸系统疾病、肠胃道疾病、猫传腹、犬细小病毒、传染病、尿道疾病、结石病、猫瘟、犬瘟、口腔疾病，此外，日常和重大疾病，如癌症，也包括宠物在日常生活中因意外受伤或疾病而引起的医疗意外费用，如摔伤造成筋骨损伤、误食有毒物质或异物，日常生活中发生的意外伤害，如意外烫伤\n\n等。', 6, 999.00, '2024-06-06 00:13:06', '2024-07-01 00:13:09', NULL, NULL);
INSERT INTO `app_policy` VALUES (4, '宠物托运保险', '这种保险常出现在旅行出发地，通常是在宠物托运服务处，就像我们寄快递时的报价服务一样。 一般来说，这种宠物的托运金额从几百元到几千元不等。 若在托运过程中宠物发生意外或死亡，主人可获得托运运费数倍的赔偿。换言之，如果一个狗子在托运上花费500元，那么发生事故的宠物主人可以得到5000元的赔偿。 根据宠物托运地点和目的地的距离、宠物种类、体重等因素确定托运费用。', 2, 100.00, '2024-06-06 00:14:07', '2024-09-01 00:14:10', NULL, NULL);

-- ----------------------------
-- Table structure for app_profile
-- ----------------------------
DROP TABLE IF EXISTS `app_profile`;
CREATE TABLE `app_profile`  (
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_profile
-- ----------------------------
INSERT INTO `app_profile` VALUES (NULL, '15213521456', '中国广东', 18, '男', 1, 5);

-- ----------------------------
-- Table structure for app_purchase
-- ----------------------------
DROP TABLE IF EXISTS `app_purchase`;
CREATE TABLE `app_purchase`  (
  `pet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `policy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `purchase_date` datetime NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pet_id` int NULL DEFAULT NULL,
  `policy_id` int NULL DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `claimed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_purchase
-- ----------------------------
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 2, 1, 2, NULL);
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 2, 2, 3, NULL);
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 3, 2, 4, NULL);
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 2, 1, 5, '1');
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 3, 3, 7, '1');
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 2, 1, 9, '1');
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-05 00:00:00', '5', 2, 4, 10, '0');
INSERT INTO `app_purchase` VALUES (NULL, NULL, '2024-06-06 00:00:00', '5', 3, 2, 11, '0');

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (5, '2024-06-06 02:19:54.032268', 0, 'wang', 'wenjv', '1015794959@gmail.com', 0, 1, '2024-04-29 06:57:21.182422', '231215008', 'pbkdf2_sha256$720000$lBN4E9x5hNXiZrB6unnw1a$89dez8MOUQEyOFFeZQmtBHhcF979S+BS05GPr8D4t1s=', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_user_groups`;
CREATE TABLE `app_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `custom_user_groups_user_id_group_id_747bb497_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `custom_user_groups_group_id_02874f21_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `custom_user_groups_group_id_02874f21_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `custom_user_groups_user_id_fc78735a_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `app_user_user_permissions`;
CREATE TABLE `app_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `custom_user_user_permissions_user_id_permission_id_31f85e8f_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `custom_user_user_permissions_user_id_0634b1dc_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_user');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_user');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_user');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_user');
INSERT INTO `auth_permission` VALUES (25, 'Can add pet', 7, 'add_pet');
INSERT INTO `auth_permission` VALUES (26, 'Can change pet', 7, 'change_pet');
INSERT INTO `auth_permission` VALUES (27, 'Can delete pet', 7, 'delete_pet');
INSERT INTO `auth_permission` VALUES (28, 'Can view pet', 7, 'view_pet');
INSERT INTO `auth_permission` VALUES (29, 'Can add policy', 8, 'add_policy');
INSERT INTO `auth_permission` VALUES (30, 'Can change policy', 8, 'change_policy');
INSERT INTO `auth_permission` VALUES (31, 'Can delete policy', 8, 'delete_policy');
INSERT INTO `auth_permission` VALUES (32, 'Can view policy', 8, 'view_policy');
INSERT INTO `auth_permission` VALUES (33, 'Can add profile', 9, 'add_profile');
INSERT INTO `auth_permission` VALUES (34, 'Can change profile', 9, 'change_profile');
INSERT INTO `auth_permission` VALUES (35, 'Can delete profile', 9, 'delete_profile');
INSERT INTO `auth_permission` VALUES (36, 'Can view profile', 9, 'view_profile');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_custom_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'pet');
INSERT INTO `django_content_type` VALUES (8, 'app', 'policy');
INSERT INTO `django_content_type` VALUES (9, 'app', 'profile');
INSERT INTO `django_content_type` VALUES (6, 'app', 'user');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-04-29 02:41:32.010358');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-04-29 02:41:32.110666');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-04-29 02:41:32.508930');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-04-29 02:41:32.632472');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-04-29 02:41:32.646357');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-04-29 02:41:32.660926');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-04-29 02:41:32.675830');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-04-29 02:41:32.682216');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-29 02:41:32.694423');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-04-29 02:41:32.707544');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-29 02:41:32.716274');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-04-29 02:41:32.741100');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-04-29 02:41:32.752175');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-29 02:41:32.759738');
INSERT INTO `django_migrations` VALUES (15, 'app', '0001_initial', '2024-04-29 02:42:53.118529');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-04-29 02:42:53.342419');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-04-29 02:42:53.353028');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-29 02:42:53.367112');
INSERT INTO `django_migrations` VALUES (19, 'app', '0002_alter_user_options_remove_user_age_and_more', '2024-04-29 02:42:54.198734');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2024-04-29 02:42:54.248961');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('9bcgdr4qum3te5xlqb3192wa3ca1oas1', '.eJxVjMsOwiAUBf-FtSFAi1dcuvcbyH2AVA0kpV0Z_12bdKHbMzPnpSKuS4lrT3OcRJ2VV4ffjZAfqW5A7lhvTXOryzyR3hS9066vTdLzsrt_BwV7-dbgPEFwiQTAOBLiI5AnOwoMCcnn4LOAYwpBBmsNGz4lzmCDRTeOWb0_-Fs4ZQ:1sF2jK:-NCKzGa_aU_b2yR3porOnUfOYlabSgWvmAPWZEd2VRc', '2024-06-20 02:19:54.035750');
INSERT INTO `django_session` VALUES ('yna9db2dc30hkcjxcejf56kwo8m2klub', '.eJxVjMsOwiAUBf-FtSFAi1dcuvcbyH2AVA0kpV0Z_12bdKHbMzPnpSKuS4lrT3OcRJ2VV4ffjZAfqW5A7lhvTXOryzyR3hS9066vTdLzsrt_BwV7-dbgPEFwiQTAOBLiI5AnOwoMCcnn4LOAYwpBBmsNGz4lzmCDRTeOWb0_-Fs4ZQ:1s8bye:AX3zbheNaaZTiDXcNyfo8b0FJD29uu8EavOJLnXYbcM', '2024-06-02 08:33:08.967171');

SET FOREIGN_KEY_CHECKS = 1;
