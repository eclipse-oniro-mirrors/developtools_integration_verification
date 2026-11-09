/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
/*
 Navicat Premium Data Transfer

 Source Server         : jeecg-boot
 Source Server Type    : MySQL
 Source Server Version : 50741
 Source Host           : localhost:3306
 Source Schema         : jeecg-boot

 Target Server Type    : MySQL
 Target Server Version : 50741
 File Encoding         : 65001

 Date: 14/12/2023 09:58:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oh_sample_short_video
-- ----------------------------
DROP TABLE IF EXISTS `oh_sample_short_video`;
CREATE TABLE `oh_sample_short_video`
(
    `id`          varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频名称',
    `url`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频链接',
    `status`      int(1) NULL DEFAULT 0 COMMENT '状态',
    `del_flag`    int(1) NULL DEFAULT 0 COMMENT '删除状态',
    `cover`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
    `remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oh_sample_business
-- ----------------------------
DROP TABLE IF EXISTS `oh_sample_business`;
CREATE TABLE `oh_sample_business`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商家名称',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `is_open` int(1) NULL DEFAULT NULL COMMENT '是否营业0否1是',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家手机号',
  `start_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `notice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告',
  `start_price` float NULL DEFAULT NULL COMMENT '起送价格',
  `delivery_price` float NULL DEFAULT NULL COMMENT '配送费',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除状态',
  `distance` double NULL DEFAULT NULL COMMENT '距离',
  `score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评分',
  `monthly_sale` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月销',
  `per_capita` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人均',
  `delivery_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配送时间',
  `ranking` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oh_sample_business_comment
-- ----------------------------
DROP TABLE IF EXISTS `oh_sample_business_comment`;
CREATE TABLE `oh_sample_business_comment`
(
    `id`          varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `business_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家id',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
    `user_name`   varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论用户名',
    `star`        int(1) NULL DEFAULT NULL COMMENT '评级1-5',
    `content`     varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
    `del_flag`    int(1) NULL DEFAULT 0 COMMENT '删除状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

    -- ----------------------------
-- Table structure for oh_sample_business_goods
-- ----------------------------
DROP TABLE IF EXISTS `oh_sample_business_goods`;
CREATE TABLE `oh_sample_business_goods`
(
    `id`            varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `business_id`   varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `create_by`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_by`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime NULL DEFAULT NULL COMMENT '更新日期',
    `name`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `cover`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
    `price`         varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格',
    `sale_price`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '折后价',
    `price_explain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格说明',
    `sales_number`  varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销量',
    `total_number`  varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '总量',
    `description`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
    `standards`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
    `weight`        varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重量',
    `brand`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌',
    `breed`         varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品种',
    `made`          int(2) NULL DEFAULT NULL COMMENT '国产0，进口1',
    `producer`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产地',
    `quality_date`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保质期',
    `packing`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包装方式',
    `category`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
    `taste`         varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '口味',
    `keep_type`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '储存方式',
    `del_flag`      int(1) NULL DEFAULT 0 COMMENT '删除状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

    -- ----------------------------
-- Table structure for oh_sample_group_site
-- ----------------------------
DROP TABLE IF EXISTS `oh_sample_group_site`;
CREATE TABLE `oh_sample_group_site`
(
    `id`          varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新日期',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商家名称',
    `cover`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
    `is_open`     int(1) NULL DEFAULT NULL COMMENT '是否营业0否1是',
    `address`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
    `longitude`   varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
    `latitude`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纬度',
    `start_time`  varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
    `end_time`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束时间',
    `notice`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告',
    `del_flag`    int(1) NULL DEFAULT 0 COMMENT '删除状态',
    `distance`    double NULL DEFAULT NULL COMMENT '距离',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `jeecg-boot`.`sys_user` (`id`, `username`, `realname`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `org_code`, `status`, `del_flag`, `third_id`, `third_type`, `activiti_sync`, `work_no`, `post`, `telephone`, `create_by`, `create_time`, `update_by`, `update_time`, `user_identity`, `depart_ids`, `client_id`, `login_tenant_id`, `bpm_status`) VALUES ('1735185182555668482', '13700000001', 'oh_sample_1', '0a2336450341645a716669413a1b0c52', 'oU4VHkXh', NULL, NULL, NULL, '13700000001@163.com', '13700000001', NULL, 1, 0, NULL, NULL, 1, '1', 'wcpjwwunmr', NULL, 'admin', '2023-12-14 14:29:20', NULL, NULL, 1, '', NULL, NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_user` (`id`, `username`, `realname`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `org_code`, `status`, `del_flag`, `third_id`, `third_type`, `activiti_sync`, `work_no`, `post`, `telephone`, `create_by`, `create_time`, `update_by`, `update_time`, `user_identity`, `depart_ids`, `client_id`, `login_tenant_id`, `bpm_status`) VALUES ('1735185294220623873', '13700000002', 'oh_sample_2', '5bdaf0a843efdafeddf60b8d0c7a75d0', 'Z4CjoI2U', NULL, NULL, NULL, '13700000002@163.com', '13700000002', NULL, 1, 0, NULL, NULL, 1, '2', 'wcpjwwunmr', NULL, 'admin', '2023-12-14 14:29:47', NULL, NULL, 1, '', NULL, NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_user` (`id`, `username`, `realname`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `org_code`, `status`, `del_flag`, `third_id`, `third_type`, `activiti_sync`, `work_no`, `post`, `telephone`, `create_by`, `create_time`, `update_by`, `update_time`, `user_identity`, `depart_ids`, `client_id`, `login_tenant_id`, `bpm_status`) VALUES ('1735185403566129153', '13700000003', 'oh_sample_3', '1f44876976e04ae134eddc7482cd7460', 'KLBnYPbC', NULL, NULL, NULL, '13700000003@163.com', '13700000003', NULL, 1, 0, NULL, NULL, 1, '3', 'wcpjwwunmr', NULL, 'admin', '2023-12-14 14:30:13', NULL, NULL, 1, '', NULL, NULL, NULL);


INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735104068424167426', '', 'oh-sample', '/oh-sample', 'layouts/RouteView', 1, '', NULL, 0, NULL, '0', 1.00, 0, 'ant-design:insert-row-above-outlined', 0, 0, 0, 0, NULL, 'admin', '2023-12-14 09:07:01', 'admin', '2023-12-14 09:38:13', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735106177429270529', '1735104068424167426', '短视频应用', '/oh-sample/video', 'oh-sample/video', 1, '', NULL, 1, NULL, '0', 1.00, 0, 'ant-design:video-camera-add-outlined', 0, 0, 0, 0, NULL, 'admin', '2023-12-14 09:15:24', 'admin', '2023-12-14 09:17:28', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735106861096628225', '1735104068424167426', '外卖应用', '/oh-sample/takeaway', 'oh-sample/takeaway', 1, '', NULL, 1, NULL, '0', 1.00, 0, 'ant-design:shopping-cart-outlined', 0, 0, 0, 0, NULL, 'admin', '2023-12-14 09:18:07', 'admin', '2023-12-14 09:22:53', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735106998653022209', '1735106861096628225', '商家列表', '/oh-sample/takeaway/business/index', 'oh-sample/takeaway/business/index', 1, '', NULL, 1, NULL, '0', 1.00, 0, 'ant-design:unordered-list-outlined', 1, 0, 0, 0, NULL, 'admin', '2023-12-14 09:18:40', 'admin', '2023-12-14 09:37:12', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735107116215169025', '1735106861096628225', '站点列表', '/oh-sample/takeaway/site/index', 'oh-sample/takeaway/site/index', 1, '', NULL, 1, NULL, '0', 2.00, 0, 'ant-design:shop-twotone', 1, 0, 0, 0, NULL, 'admin', '2023-12-14 09:19:08', 'admin', '2023-12-14 09:37:17', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735107238571405314', '1735106861096628225', '商品列表', '/oh-sample/takeaway/goods/index', 'oh-sample/takeaway/goods/index', 1, '', NULL, 1, NULL, '0', 3.00, 0, 'ant-design:shopping-outlined', 1, 0, 0, 0, NULL, 'admin', '2023-12-14 09:19:37', 'admin', '2023-12-14 09:37:23', 0, 0, NULL, 0);
INSERT INTO `jeecg-boot`.`sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `is_route`, `component_name`, `redirect`, `menu_type`, `perms`, `perms_type`, `sort_no`, `always_show`, `icon`, `is_leaf`, `keep_alive`, `hidden`, `hide_tab`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `rule_flag`, `status`, `internal_or_external`) VALUES ('1735111480019382274', '1735106177429270529', '视频审核列表', '/oh-sample/video/index', 'oh-sample/video/index', 1, '', NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-12-14 09:36:28', NULL, NULL, 0, 0, NULL, 0);

INSERT INTO `jeecg-boot`.`sys_dict` (`id`, `dict_name`, `dict_code`, `description`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `type`, `tenant_id`, `low_app_id`) VALUES ('1735113660168269825', '进口/国产', 'made', NULL, 0, 'admin', '2023-12-14 09:45:08', NULL, NULL, 0, 0, NULL);
INSERT INTO `jeecg-boot`.`sys_dict` (`id`, `dict_name`, `dict_code`, `description`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `type`, `tenant_id`, `low_app_id`) VALUES ('1735114494528581633', '审核状态', 'check_status', NULL, 0, 'admin', '2023-12-14 09:48:27', NULL, NULL, 0, 0, NULL);

INSERT INTO `jeecg-boot`.`sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1739838713310814210', '1735113660168269825', '进口', '2', NULL, 1, 1, 'admin', '2023-12-27 10:40:49', NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1739838686651817985', '1735113660168269825', '国产', '1', NULL, 1, 1, 'admin', '2023-12-27 10:40:42', NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1739838622470578178', '1735114494528581633', '审核不通过', '2', NULL, 1, 1, 'admin', '2023-12-27 10:40:27', NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1739838590564507649', '1735114494528581633', '审核通过', '1', NULL, 1, 1, 'admin', '2023-12-27 10:40:19', NULL, NULL);
INSERT INTO `jeecg-boot`.`sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES ('1739838540337717249', '1735114494528581633', '未审核', '0', NULL, 1, 1, 'admin', '2023-12-27 10:40:07', NULL, NULL);

INSERT INTO `jeecg-boot`.`sys_position` (`id`, `code`, `name`, `post_rank`, `company_id`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_org_code`, `tenant_id`) VALUES ('1735119103519223810', 'wcpjwwunmr', 'oh-sample', NULL, NULL, 'admin', '2023-12-14 10:06:46', NULL, NULL, 'A01', 0);

INSERT INTO `jeecg-boot`.`sys_role` (`id`, `role_name`, `role_code`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `tenant_id`) VALUES ('1735118567969517570', 'oh-sample', 'oh_sample', 'OH Sample示例', 'admin', '2023-12-14 10:04:38', NULL, NULL, 0);



INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147061915650', '1735118567969517570', '1735104068424167426', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147061915651', '1735118567969517570', '1735106177429270529', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147070304257', '1735118567969517570', '1735111480019382274', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147070304258', '1735118567969517570', '1735106861096628225', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147070304259', '1735118567969517570', '1735106998653022209', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147070304260', '1735118567969517570', '1735107116215169025', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196147070304261', '1735118567969517570', '1735107238571405314', NULL, '2023-12-14 15:12:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088681398274', 'f6817f48af4fb3af11b9e8bf182f618b', '1735104068424167426', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592578', 'f6817f48af4fb3af11b9e8bf182f618b', '1735106177429270529', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592579', 'f6817f48af4fb3af11b9e8bf182f618b', '1735111480019382274', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592580', 'f6817f48af4fb3af11b9e8bf182f618b', '1735106861096628225', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592581', 'f6817f48af4fb3af11b9e8bf182f618b', '1735106998653022209', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592582', 'f6817f48af4fb3af11b9e8bf182f618b', '1735107116215169025', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jeecg-boot`.`sys_role_permission` (`id`, `role_id`, `permission_id`, `data_rule_ids`, `operate_date`, `operate_ip`) VALUES ('1735196088685592583', 'f6817f48af4fb3af11b9e8bf182f618b', '1735107238571405314', NULL, '2023-12-14 15:12:41', '0:0:0:0:0:0:0:1');

INSERT INTO `jeecg-boot`.`sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES ('1735202450614288385', '1735185403566129153', '1735118567969517570', 0);
INSERT INTO `jeecg-boot`.`sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES ('1735202471145406466', '1735185294220623873', '1735118567969517570', 0);
INSERT INTO `jeecg-boot`.`sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES ('1735202493056450562', '1735185182555668482', '1735118567969517570', 0);


INSERT INTO `jeecg-boot`.`oh_sample_short_video` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `url`, `status`, `del_flag`, `cover`, `remark`) VALUES ('1', NULL, '2023-12-14 13:39:21', NULL, '2023-12-14 13:39:36', '2023再见，2024加油！', 'opt/upFiles/video/test2.mp4', 0, 0, NULL, '奋斗，努力！');
INSERT INTO `jeecg-boot`.`oh_sample_short_video` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `url`, `status`, `del_flag`, `cover`, `remark`) VALUES ('2', NULL, '2023-12-14 13:52:00', NULL, '2023-12-14 13:52:04', '好风景', 'opt/upFiles/video/test.mp4', 0, 0, NULL, NULL);

INSERT INTO `jeecg-boot`.`oh_sample_business` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `phone_number`, `start_time`, `end_time`, `notice`, `start_price`, `delivery_price`, `del_flag`, `distance`, `score`, `monthly_sale`, `per_capita`, `delivery_time`, `ranking`) VALUES ('1735112443329376257', 'admin', '2023-12-14 09:40:18', '13700000001', '2023-12-14 13:51:12', '绿野水果', 'temp/mt.png', 1, '长沙市岳麓区金茂览秀城3F305', '112.900443', '28.0939', '17365456544', '8::00', '18:00', '新店运营！活动多多！', 5, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jeecg-boot`.`oh_sample_business` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `phone_number`, `start_time`, `end_time`, `notice`, `start_price`, `delivery_price`, `del_flag`, `distance`, `score`, `monthly_sale`, `per_capita`, `delivery_time`, `ranking`) VALUES ('1735145719947456513', '13700000001', '2023-12-14 11:52:32', '13700000001', '2023-12-14 13:51:01', '商家3', NULL, 1, '长沙市岳麓区上回路88号', '112.900443', '28.1958', NULL, '8::00', '24:00', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jeecg-boot`.`oh_sample_business` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `phone_number`, `start_time`, `end_time`, `notice`, `start_price`, `delivery_price`, `del_flag`, `distance`, `score`, `monthly_sale`, `per_capita`, `delivery_time`, `ranking`) VALUES ('1735146768917721089', '13700000001', '2023-12-14 11:56:42', '13700000001', '2023-12-14 13:51:08', '商家2', NULL, 1, '深圳市南山产业园14栋', '112.945791', '28.0939', NULL, '8::00', '24:00', NULL, 2, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jeecg-boot`.`oh_sample_business` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `phone_number`, `start_time`, `end_time`, `notice`, `start_price`, `delivery_price`, `del_flag`, `distance`, `score`, `monthly_sale`, `per_capita`, `delivery_time`, `ranking`) VALUES ('1735146876761665538', '13700000001', '2023-12-14 11:57:08', '13700000001', '2023-12-14 13:51:05', '商家1', NULL, 0, '深圳市南山产业园10栋', '112.945791', '28.0939', '13700000001', '8::00', '24:00', '哈哈哈哈哈哈哈哈哈哈或或或或或', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735113203391787009', '1735112443329376257', 'admin', '2023-12-14 09:43:19', 'admin', '2023-12-14 09:46:03', '赣州蜜橙', NULL, '4.8/斤', '3.8/斤', NULL, '100kg', '1000kg', '很好吃的赣州蜜橙！', '约2000g/份', '2000g', '赣州蜜橙', '橙子', 2, '赣州', '2023-12-29', '袋装', '水果', '酸甜', '常温', 0);
INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735144596624764930', '1735112443329376257', '13700000001', '2023-12-14 11:48:04', NULL, NULL, '湘西香柚', NULL, '4.8/斤', '3.8/斤', NULL, '22', '2222', '湘西香柚，又香又甜！', '约250g/个', '250g', '湘西香柚', '柚子', 2, '湘西', '2023-12-31', '袋装', '水果', '酸甜', '常温', 0);
INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735147314898661377', '1735146768917721089', '13700000001', '2023-12-14 11:58:52', '13700000001', '2023-12-14 12:00:58', '商品1', NULL, '10', '10', NULL, '0', '100kg', '哒哒哒哒哒哒', '约2000g/份', NULL, '红富士', '苹果', 2, '中国', '2025-01-01', '袋装', '水果', '33', '冷藏', 0);
INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735147721351884801', '1735145719947456513', '13700000001', '2023-12-14 12:00:29', NULL, NULL, '商品', NULL, '4.8/斤', '3.8/斤', NULL, '100kg', '1000kg', '啊啊啊啊啊啊啊啊啊啊啊', '约2000g/份', '2000g', '红富士', '榴莲', 1, '欧洲', '2024-12-14', '袋装', '水果', '酸甜', '常温', 0);
INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735148168150118401', '1735146876761665538', '13700000001', '2023-12-14 12:02:15', NULL, NULL, '菠萝', NULL, '10', '3.8/斤', NULL, '100kg', '2222', '啊啊啊啊啊啊啊啊', '约2000g/份', NULL, '菠萝', '菠萝', 1, '东南亚', '2023-12-14', '袋装', '水果', '菠萝', '常温', 0);
INSERT INTO `jeecg-boot`.`oh_sample_business_goods` (`id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `price`, `sale_price`, `price_explain`, `sales_number`, `total_number`, `description`, `standards`, `weight`, `brand`, `breed`, `made`, `producer`, `quality_date`, `packing`, `category`, `taste`, `keep_type`, `del_flag`) VALUES ('1735174913712553985', '1735112443329376257', '13700000001', '2023-12-14 13:48:32', NULL, NULL, '商品3', NULL, '4.8/斤', '3.8/斤', NULL, '100kg', '100kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '水果', NULL, NULL, 0);

INSERT INTO `jeecg-boot`.`oh_sample_group_site` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `start_time`, `end_time`, `notice`, `del_flag`, `distance`) VALUES ('1735148355887165442', '13700000001', '2023-12-14 12:03:00', '13700000001', '2023-12-14 12:04:20', '站点名称1', 'temp/mt.png', 1, '长沙市桐梓坡西路8888号', '112.900443', '22.35', '8::00', '18:00', '红红火火恍恍惚惚', 0, NULL);
INSERT INTO `jeecg-boot`.`oh_sample_group_site` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `start_time`, `end_time`, `notice`, `del_flag`, `distance`) VALUES ('1735148510505988097', '13700000001', '2023-12-14 12:03:37', NULL, NULL, '站点名称2', 'temp/mt.png', 1, '长沙市岳麓区金茂览秀城', '11.33', '22.35', '8::00', '18:00', 'wwwwwwwwwww', 0, NULL);
INSERT INTO `jeecg-boot`.`oh_sample_group_site` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `cover`, `is_open`, `address`, `longitude`, `latitude`, `start_time`, `end_time`, `notice`, `del_flag`, `distance`) VALUES ('1735148634997125122', '13700000001', '2023-12-14 12:04:07', NULL, NULL, '站点名称3', 'temp/mt.png', 0, '长沙市桐梓坡西路', '112.900443', NULL, '6:00', '18:00', '啊啊啊啊啊啊', 0, NULL);

SET
FOREIGN_KEY_CHECKS = 1;