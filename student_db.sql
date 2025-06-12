/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : student_db

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 12/06/2025 16:52:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isdelete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `isdelete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendances
-- ----------------------------

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '授课教师',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课班级',
  `schedule_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课时间',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课地点',
  `isdelete` tinyint(1) NULL DEFAULT 0 COMMENT '是否被伪删除',
  `teacher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `schedule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (1, '语文', NULL, NULL, NULL, NULL, 0, '123', '123');
INSERT INTO `courses` VALUES (2, '数学', NULL, NULL, NULL, NULL, 0, '张三', '周五');

-- ----------------------------
-- Table structure for reward_punish
-- ----------------------------
DROP TABLE IF EXISTS `reward_punish`;
CREATE TABLE `reward_punish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date` date NULL DEFAULT NULL,
  `isdelete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reward_punish
-- ----------------------------
INSERT INTO `reward_punish` VALUES (1, 1, '奖励', '213123', '2025-06-02', 0);
INSERT INTO `reward_punish` VALUES (2, 1, '奖励', '2', '2025-06-02', 0);
INSERT INTO `reward_punish` VALUES (3, 1, '奖励', '2', '2025-06-03', 0);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isdelete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_students_isdelete`(`isdelete`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, '张3', '男', '2002-05-01', '软件工程二班', '软件工程', '13800138000', 'zhangsan@example.com', 0);
INSERT INTO `students` VALUES (2, '李四', '女', '2003-03-15', '计算机二班', '计算机科学', '13800138001', 'lisi@example.com', 0);
INSERT INTO `students` VALUES (3, '王五修改后', '男', '2001-10-05', '软件工程三班', '人工智能', '13800138888', 'wangwu_new@example.com', 0);
INSERT INTO `students` VALUES (4, 'test', '男', '2025-06-08', '21', '21', '21', '12', 0);
INSERT INTO `students` VALUES (5, 'test1', '女', '2025-06-09', '3', '1', '231', '123', 0);
INSERT INTO `students` VALUES (6, 'tess333', '男', '2025-06-02', '123', '412', '123', '4123', 0);
INSERT INTO `students` VALUES (7, '孙权', '男', '2020-01-06', '计算机2206', '计算机科学', '17552662452', '705304500@qq.com', 0);
INSERT INTO `students` VALUES (8, '李四', '男', '2025-06-11', '123', '231', '123', '123', 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linkphone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isdelete` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '123456', '13888888888', '2025-06-09 01:14:00', 0);
INSERT INTO `t_user` VALUES (2, 'test', '123456', '13999999999', '2025-06-09 01:14:00', 0);

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属院系',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `isdelete` tinyint(1) NULL DEFAULT 0 COMMENT '是否被伪删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 'test12', '男', NULL, '信息学院', '教师', '12', '21', 0);
INSERT INTO `teachers` VALUES (2, '胡兆鹏', '男', NULL, '计算机科学', '讲师', 'xxxxx', '124', 0);
INSERT INTO `teachers` VALUES (3, '李四', '男', NULL, '学院', '数学', '123', '1234', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','teacher','student') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `users` VALUES (2, 'test', '123456', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
