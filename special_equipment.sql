CREATE DATABASE  IF NOT EXISTS `special_equipment` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `special_equipment`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: special_equipment
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_area_platform`
--

DROP TABLE IF EXISTS `t_area_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_area_platform` (
  `area_code` varchar(10) NOT NULL COMMENT '地区编号，符合GB/T 2260-2007中地区名称对应的数字代码（如110228代表密云县）',
  `server_domain` varchar(50) NOT NULL COMMENT '平台域名或访问地址，带http://或https://前缀',
  `report_username` varchar(50) NOT NULL COMMENT '上级平台分配给我方的账号',
  `report_password` varchar(50) NOT NULL COMMENT '上级平台分配给我方的密码，MD5加密',
  `query_username` varchar(50) NOT NULL COMMENT '我方分配给上级平台的账号',
  `query_password` varchar(50) NOT NULL COMMENT '我方分配给上级平台的密码，MD5加密。',
  `enabled` int(11) NOT NULL COMMENT '启用状态。\n1：启用；0：未启用。',
  `server_ip` varchar(50) NOT NULL COMMENT '平台IP地址',
  `token` varchar(100) NOT NULL COMMENT '令牌',
  `is_verify_token_ip` int(11) NOT NULL COMMENT '是否验证用户名绑定的令牌和平台IP地址。\n1：验证；0：不验证。',
  PRIMARY KEY (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区域上级平台信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_bridge_crane_data`
--

DROP TABLE IF EXISTS `t_bridge_crane_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bridge_crane_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '起重机械载荷。\n单位：t',
  `lift_height` decimal(4,1) NOT NULL COMMENT '提升高度。\n单位：m',
  `lift_speed` decimal(4,1) NOT NULL COMMENT '起升速度。\n单位：m/min',
  `span` decimal(4,1) NOT NULL COMMENT '跨度，单位：m',
  `crane_status` varchar(1) NOT NULL COMMENT '起重机总电源开关状态。\n1：起重机总电源开启；\n2：起重机总电源关闭。',
  `weight_value` decimal(4,2) NOT NULL COMMENT '起重量。\n单位：t；保留两位小数。',
  `overloading_status` varchar(1) NOT NULL COMMENT '起重量限制器状态。\n1：起重量限制器工作；\n2：起重量限制器未工作',
  `heightlimiter_status` varchar(1) NOT NULL COMMENT '起升高度限制器状态。\n1：起升高度限制器工作；\n2：起升高度限制器未工作。',
  `gantrylimiter_status` varchar(1) NOT NULL COMMENT '大车行程开关状态。\n1：大车行程开关工作；\n2：大车行程开关未工作。',
  `trolleylimiter_status` varchar(1) NOT NULL COMMENT '小车行程开关状态。\n1：小车行程开关工作；\n2：小车行程开关未工作。',
  `doorinterlock_status` varchar(1) NOT NULL COMMENT '门连锁保护装置状态。\n1：门连锁保护装置工作；\n2：门连锁保护装置未工作。',
  `m_interlock_status` varchar(1) NOT NULL COMMENT '机构之间连锁保护装置状态。\n1：机构之间连锁保护装置工作；\n2：机构之间连锁保护装置未工作。',
  `safedistance_status` varchar(1) NOT NULL COMMENT '安全距离保护装置状态。\n1：安全距离保护装置工作；\n2：安全距离保护装置不工作。',
  `anticollision_status` varchar(1) NOT NULL COMMENT '防碰撞装置状态。\n1：防碰撞装置工作；\n2：防碰撞装置未工作。',
  `overspeed_status` varchar(1) NOT NULL COMMENT '超速保护装置状态。\n1：超速保护装置工作；\n2：超速保护装置未工作。',
  `brake_status` varchar(1) NOT NULL COMMENT '起升机构制动器状态。\n1：起升机构制动器工作；\n2：起升机构制动器未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `present_counter_valu` int(11) NOT NULL COMMENT '设备累计工作循环',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='桥式起重机数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_clsg_boiler_data`
--

DROP TABLE IF EXISTS `t_clsg_boiler_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_clsg_boiler_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '锅炉型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `boiler_ratcon` int(11) NOT NULL COMMENT '额定蒸发量（功率）。单位：t/h',
  `exhaust_temp` decimal(4,2) NOT NULL COMMENT '排烟温度。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_front` decimal(4,2) NOT NULL COMMENT '排烟温度（前）。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_back` decimal(4,2) NOT NULL COMMENT '排烟温度（后）。\n单位：摄氏度；保留两位小数。',
  `comprehensive_alarm` varchar(1) NOT NULL COMMENT '综合报警信号。\n1：报警；\n2：未报警。',
  `ff_alarm` varchar(1) NOT NULL COMMENT '熄火故障报警。\n1：报警；\n2：未报警。',
  `operation_singal` varchar(1) NOT NULL COMMENT '锅炉运行信号。\n1：运行；\n2：停止。',
  `ignition_signal` varchar(1) NOT NULL COMMENT '点火信号。\n1：运行；2：停止。',
  `gf_signal` varchar(1) NOT NULL COMMENT '鼓风机运行信号。\n1：运行；\n2：停止。',
  `yf_signal` varchar(1) NOT NULL COMMENT '引风机运行信号。\n1：运行；\n2：停止。',
  `ambient_temp` decimal(6,2) NOT NULL COMMENT '环境温度。\n单位：摄氏度；保留两位小数。',
  `blowing_rate` decimal(4,2) NOT NULL COMMENT '风量。\n单位：立方米/分',
  `fuel_pressure` decimal(4,2) NOT NULL COMMENT '燃料压力。\n单位：MPa，保留两位小数',
  `fuel_type` varchar(20) NOT NULL COMMENT '燃料种类',
  `fuel_flow` decimal(6,2) NOT NULL COMMENT '燃料流量（汽液）。\n单位：m3/h；保留两位小数。',
  `fuel_heat_value` decimal(4,2) NOT NULL COMMENT '燃料热值。单位：kJ/m3，保留两位小数。',
  `furnace_temp` decimal(6,2) NOT NULL COMMENT '炉膛温度。\n单位：摄氏度；保留两位小数。',
  `furnace_pressure` decimal(6,2) NOT NULL COMMENT '炉膛压力。\n单位：MPa，保留两位小数',
  `excess_air_coefficient` decimal(5,2) NOT NULL COMMENT '排烟处过量空气系数。\n单位：%，保留两位小数。',
  `boiler_q2` decimal(5,2) NOT NULL COMMENT '排烟热损失（q2）。\n单位：%，保留两位小数。',
  `boiler_q3` decimal(5,2) NOT NULL COMMENT '气体未完全燃烧热损失（q3）。\n单位：%，保留两位小数。',
  `boiler_q4` decimal(5,2) NOT NULL COMMENT '固体未完全燃烧热损失（q4）。\n单位：%，保留两位小数。',
  `boiler_q5` decimal(5,2) NOT NULL COMMENT '散热损失（q5）。\n单位：%，保留两位小数。',
  `boiler_q6` decimal(5,2) NOT NULL COMMENT '灰渣物理热损失（q6）。\n单位：%，保留两位小数。',
  `boiler_efficiency` decimal(5,2) NOT NULL COMMENT '锅炉热效率。\n单位：%，保留两位小数。',
  `feed_water_temp` decimal(5,2) NOT NULL COMMENT '给水温度',
  `feed_water_temp_cold` decimal(5,2) NOT NULL COMMENT '给水温度（冷水）。\n单位：摄氏度；保留两位小数。',
  `feed_water_temp_hot` decimal(5,2) NOT NULL COMMENT '给水温度（热水）。\n单位：摄氏度；保留两位小数。',
  `export_temp` decimal(5,2) NOT NULL COMMENT '热水出水（导热油出口）温度',
  `import_temp` decimal(5,2) NOT NULL COMMENT '热水回水（导热油进口）温度',
  `export_pressure` decimal(5,2) NOT NULL COMMENT '热水出水（导热油进口）压力',
  `import_pressure` decimal(5,2) NOT NULL COMMENT '热水回水（导热油进口）压力',
  `export_flow` decimal(6,2) NOT NULL COMMENT '热水出水（导热油出口）流量',
  `elw_alarm` varchar(1) NOT NULL COMMENT '极低水位报警。\n1：报警；\n2：未报警。',
  `shw_alarm` varchar(1) NOT NULL COMMENT '超高水位报警。\n1：报警；\n2：未报警。',
  `swd_alarm` varchar(1) NOT NULL COMMENT '软水硬度报警。\n1：报警；\n2：未报警。',
  `feed_water_pressure_cold` decimal(6,2) NOT NULL COMMENT '给水压力（冷水）。\n单位：MPa；保留两位小数。',
  `feed_water_pressure_hot` decimal(6,2) NOT NULL COMMENT '给水压力（热水）。\n单位：MPa；保留两位小数。',
  `feed_water_flow` decimal(6,2) NOT NULL COMMENT '给水流量。\n单位：kg/h；保留两位小数。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热水锅炉数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cylinder_data`
--

DROP TABLE IF EXISTS `t_cylinder_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cylinder_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n气瓶设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n气瓶设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `use_unt` varchar(100) NOT NULL COMMENT '产权单位/使用单位\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `manufacturer` varchar(100) NOT NULL COMMENT '制造单位名称',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `gas_volume` decimal(6,2) NOT NULL COMMENT '容积。\n单位：L；保留两位小数。',
  `filling_medium` varchar(10) NOT NULL COMMENT '充装介质',
  `nominal_working_pressure` decimal(4,2) NOT NULL COMMENT '公称工作压力。单位：MPa，保留两位小数。',
  `eqp_age` int(11) NOT NULL COMMENT '设计使用年限',
  `gas_station` varchar(20) NOT NULL COMMENT '充装单位',
  `gasworder_id` varchar(20) NOT NULL COMMENT '充装作业人员',
  `gasgun_id` varchar(10) NOT NULL COMMENT '充装设备编号',
  `gasfill_date` date NOT NULL COMMENT '充装日期',
  `fillstart_time` time NOT NULL COMMENT '充装时间',
  `gasfill_unit` int(11) NOT NULL COMMENT '充装量的单位。\n1：单位L；\n0：单位Kg。',
  `gasfill_volume` decimal(8,2) NOT NULL COMMENT '充装介质的重量或体积',
  `gas_density` decimal(8,2) NOT NULL COMMENT '气体密度。\n单位：kg/m2',
  `gas_pressure` decimal(8,2) NOT NULL COMMENT '气体压力。\n单位：MPa',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='气瓶设备数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_elevator_data`
--

DROP TABLE IF EXISTS `t_elevator_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_elevator_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '设备注册代码\n电梯设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n电梯设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `code_lift` varchar(20) NOT NULL COMMENT '电梯整机编码\n电梯设备质量追溯代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `manufacturer` varchar(100) NOT NULL COMMENT '设备制造单位或进口单位的名称',
  `equipment_date` date NOT NULL COMMENT '设备出厂日期',
  `installation_unit` varchar(100) NOT NULL COMMENT '设备安装单位',
  `installation_date` date NOT NULL COMMENT '设备安装日期',
  `maintenance_unit` varchar(100) NOT NULL COMMENT '维护保养单位名称',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `custom_number` varchar(20) NOT NULL COMMENT '设备内部编号',
  `emergency_number` varchar(20) NOT NULL COMMENT '应急救援电话',
  `total_floor` int(11) NOT NULL COMMENT '层数。',
  `total_station` int(11) NOT NULL COMMENT '站数。',
  `total_door` int(11) NOT NULL COMMENT '门数。',
  `rated_speed` decimal(4,2) NOT NULL COMMENT '额定速度。单位m/s',
  `rated_load` int(11) NOT NULL COMMENT '额定载重量。',
  `fault_id` varchar(36) NOT NULL COMMENT '故障编号。\n故障唯一序列号。',
  `order_number` varchar(15) NOT NULL COMMENT '故障处置单号',
  `fault_type` varchar(2) NOT NULL COMMENT '故障类型。\n直梯：\n01：电梯运行时安全回路断路\n02：关门故障。\n03：开门故障。\n04：轿厢在开锁区域外停止。\n05：轿厢意外移动。\n06：电动机运转时间限制器动作。\n07：楼层位置丢失。\n08：防止电梯再运行故障。\n09：轿厢冲顶。\n10：轿厢蹲底。\n11：困人。\n扶梯：\n61：安全回路断路。\n62：超速保护。\n63：非操作逆转保护。\n64：梯级或踏板的缺失保护。\n65：防止重新启动故障。',
  `fault_timestamp` datetime NOT NULL COMMENT '故障发生时间',
  `deal_status` varchar(2) NOT NULL COMMENT '故障处置状态。\n00：处置完成。\n01：故障发生。\n02：处置相应。\n04：处置到场。\n05：误报。',
  `deal_respond_time` datetime NOT NULL COMMENT '故障相应时间',
  `deal_arrive_time` datetime NOT NULL COMMENT '故障处置到场时间',
  `deal_end_time` datetime NOT NULL COMMENT '故障处置完成时间',
  `car_status` varchar(1) NOT NULL COMMENT '轿厢运行状态。\n0：停止；\n1：运行；',
  `car_direction` varchar(1) NOT NULL COMMENT '轿厢运行方向。\n0：无方向；\n1：上行；\n2：下行。',
  `door_zone` varchar(1) NOT NULL COMMENT '门区。\n1：轿厢在门区；\n2：轿厢在非门区。',
  `car_position` varchar(4) NOT NULL COMMENT '电梯当前楼层。',
  `door_status` varchar(1) NOT NULL COMMENT '关门到位。\n1：关门到位；\n2：无关门到位信号。',
  `passenger_status` varchar(1) NOT NULL COMMENT '轿内是否有人。\n1：有人；\n2：无人。',
  `service_mode` varchar(1) NOT NULL COMMENT '当前服务模式。\n0：停止服务；\n1：正常运行；\n2：检修；\n3：消防返回；\n4：消防员运行；\n5：应急电源运行。\n6：地震模式；\n7：未知。',
  `stats_timestamp` datetime NOT NULL COMMENT '设备统计信息时间戳',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间，单位：小时',
  `present_counter_value` int(11) NOT NULL COMMENT '设备累计运行次数',
  `up_limit` varchar(1) NOT NULL COMMENT '上极限开关：\n1：是；\n2：否。',
  `down_limit` varchar(1) NOT NULL COMMENT '下极限开关。\n1：是；\n2：否。',
  `deal_node` varchar(2000) NOT NULL COMMENT '故障处置说明',
  `power_status` varchar(1) NOT NULL COMMENT '电源状态：\n1：正常；\n2：停电。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='电梯数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_escalator_data`
--

DROP TABLE IF EXISTS `t_escalator_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_escalator_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '设备注册代码\n自动扶梯设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n自动扶梯设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `code_lift` varchar(20) NOT NULL COMMENT '电梯整机编码\n电梯设备质量追溯代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `manufacturer` varchar(100) NOT NULL COMMENT '设备制造单位或进口单位的名称',
  `equipment_date` date NOT NULL COMMENT '设备出厂日期',
  `installation_unit` varchar(100) NOT NULL COMMENT '设备安装单位',
  `installation_date` date NOT NULL COMMENT '设备安装日期',
  `maintenance_unit` varchar(100) NOT NULL COMMENT '维护保养单位名称',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `custom_number` varchar(20) NOT NULL COMMENT '设备内部编号',
  `emergency_number` varchar(20) NOT NULL COMMENT '应急救援电话',
  `nominal_speed` decimal(4,2) NOT NULL COMMENT '名义速度。单位m/s',
  `lifting_height` decimal(6,2) NOT NULL COMMENT '提升高度。单位：m',
  `inclination_angle` decimal(4,1) NOT NULL COMMENT '倾斜角。单位：度',
  `nominal_width` int(11) NOT NULL COMMENT '名义宽度。',
  `public_transport` varchar(1) NOT NULL COMMENT '公共交通型。1：公共交通型；2：非公共交通型',
  `indoor` varchar(1) NOT NULL COMMENT '是否室内。1：室内；2：室外。',
  `fault_id` varchar(36) NOT NULL COMMENT '故障编号。\n故障唯一序列号。',
  `order_number` varchar(15) NOT NULL COMMENT '故障处置单号',
  `fault_type` varchar(2) NOT NULL COMMENT '故障类型。\n直梯：\n01：电梯运行时安全回路断路\n02：关门故障。\n03：开门故障。\n04：轿厢在开锁区域外停止。\n05：轿厢意外移动。\n06：电动机运转时间限制器动作。\n07：楼层位置丢失。\n08：防止电梯再运行故障。\n09：轿厢冲顶。\n10：轿厢蹲底。\n11：困人。\n扶梯：\n61：安全回路断路。\n62：超速保护。\n63：非操作逆转保护。\n64：梯级或踏板的缺失保护。\n65：防止重新启动故障。',
  `fault_timestamp` datetime NOT NULL COMMENT '故障发生时间',
  `deal_status` varchar(2) NOT NULL COMMENT '故障处置状态。\n00：处置完成。\n01：故障发生。\n02：处置相应。\n04：处置到场。\n05：误报。',
  `deal_respond_time` datetime NOT NULL COMMENT '故障相应时间',
  `deal_arrive_time` datetime NOT NULL COMMENT '故障处置到场时间',
  `deal_end_time` datetime NOT NULL COMMENT '故障处置完成时间',
  `operation_status` varchar(1) NOT NULL COMMENT '运行状态。\n0：停止；\n1：运行。',
  `operation_direction` varchar(1) NOT NULL COMMENT '运行方向。\n0：无方向；1：上行；2：下行。',
  `service_mode` varchar(1) NOT NULL COMMENT '当前服务模式。\n0：停止运行；\n1：正常运行；\n2：检修；\n3：未知。',
  `stats_timestamp` datetime NOT NULL COMMENT '设备统计信息时间戳',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间，单位：小时',
  `present_counter_value` int(11) NOT NULL COMMENT '设备累计运行次数',
  `up_limit` varchar(1) NOT NULL COMMENT '上极限开关：\n1：是；\n2：否。',
  `down_limit` varchar(1) NOT NULL COMMENT '下极限开关。\n1：是；\n2：否。',
  `deal_node` varchar(2000) NOT NULL COMMENT '故障处置说明',
  `power_status` varchar(1) NOT NULL COMMENT '电源状态：\n1：正常；\n2：停电。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动扶梯数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_gantry_crane_data`
--

DROP TABLE IF EXISTS `t_gantry_crane_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_gantry_crane_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '起重机械载荷。\n单位：t',
  `lift_height` decimal(4,1) NOT NULL COMMENT '提升高度。\n单位：m',
  `lift_speed` decimal(4,1) NOT NULL COMMENT '起升速度。\n单位：m/min',
  `rate_amplitude` decimal(4,1) NOT NULL COMMENT '工作幅度，单位：m',
  `rate_loadmoment` decimal(8,2) NOT NULL COMMENT '额定起重力矩，单位：t*m',
  `crane_status` varchar(1) NOT NULL COMMENT '起重机总电源开闭状态。\n1：起重机总电源开启；\n2：起重机总电源关闭。',
  `weight_value` decimal(4,2) NOT NULL COMMENT '总重量。\n单位：t；保留两位小数',
  `overloading_status` varchar(1) NOT NULL COMMENT '起重量限制器状态。\n1：起重量限制器工作；\n2：起重量限制器未工作。',
  `lifting_moment_value` decimal(6,2) NOT NULL COMMENT '起重力矩。\n单位：tm；保留两位小数',
  `lifting_moment_status` varchar(1) NOT NULL COMMENT '起重力矩限制器状态。\n1：起重力矩限制器工作；\n2：起重力矩限制器未工作。',
  `heightlimiter_status` varchar(1) NOT NULL COMMENT '起升高度限制器状态。\n1：起升高度限制器工作；\n2：起升高度限制器未工作。',
  `amplitude_value` decimal(4,2) NOT NULL COMMENT '幅度。\n单位：m，保留两位小数',
  `amplitude_status` varchar(1) NOT NULL COMMENT '幅度限制器。\n1：幅度限制器工作；\n2：幅度限制器未工作。',
  `rotary_status` varchar(1) NOT NULL COMMENT '回转限制器。\n1：回转限制器工作；\n2：回转限制器未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `present_counter_value` int(11) NOT NULL COMMENT '设备累计工作循环',
  `gantrylimiter_status` varchar(1) NOT NULL COMMENT '大车行程开关状态。\n1：大车行程开关工作；\n2：大车行程开关未工作。',
  `doorinterlock_status` varchar(1) NOT NULL COMMENT '门连锁保护装置状态。\n1：门连锁保护装置工作；\n2：门连锁保护装置未工作。',
  `m_interlock_status` varchar(1) NOT NULL COMMENT '机构之间连锁保护装置状态。\n1：机构之间连锁保护装置工作；\n2：机构之间连锁保护装置未工作。',
  `windresistant_status` varchar(1) NOT NULL COMMENT '抗风防滑装置工作状态。\n1：抗风防滑装置工作；\n2：抗风防滑装置未工作。',
  `anemometer_status` varchar(1) NOT NULL COMMENT '风速仪开关。\n1：风速仪工作；\n2：风速仪未工作。',
  `safedistance_status` varchar(1) NOT NULL COMMENT '安全距离保护装置状态。\n1：安全距离保护装置工作；\n2：安全距离保护装置未工作。',
  `anticollision_status` varchar(1) NOT NULL COMMENT '防碰撞装置状态。\n1：防碰撞装置工作；\n2：防碰撞装置未工作。',
  `overspeed_status` varchar(1) NOT NULL COMMENT '超速保护装置状态。\n1：超速保护装置工作；\n2：超速保护装置未工作。',
  `cablelimit_status` varchar(1) NOT NULL COMMENT '供电电缆安全极限。\n1：供电电缆安全极限装置工作；\n2：供电电缆安全极限装置未工作。',
  `brake_status` varchar(1) NOT NULL COMMENT '起升机构制动器状态。\n1：起升机构制动器打开；\n2：起升机构制动器闭合。',
  `luf_brake_status` varchar(1) NOT NULL COMMENT '变幅机构制动器状态。\n1：打开；2：关闭。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门座式起重机数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mechanical_parking_equipment_data`
--

DROP TABLE IF EXISTS `t_mechanical_parking_equipment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mechanical_parking_equipment_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类型\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '额定起重量。\n单位：t',
  `rate_speed` decimal(4,1) NOT NULL COMMENT '额定速度。单位：m/min',
  `car_quality` decimal(4,1) NOT NULL COMMENT '适停汽车质量。单位：t',
  `berth_num` int(11) NOT NULL COMMENT '泊位数',
  `floor_num` int(11) NOT NULL COMMENT '层数',
  `crane_status` varchar(1) NOT NULL COMMENT '设备总电源开闭状态。\n1：停车设备总电源开启；\n2：停车设备总电源关闭。',
  `car_carrier_status` varchar(1) NOT NULL COMMENT '载车板移动。\n1：载车板开始移动；\n2：载车板停止移动。',
  `limit_switch_status` varchar(1) NOT NULL COMMENT '限位开关。\n1：限位开关工作；\n2：限位开关未工作。',
  `overrun_switch_status` varchar(1) NOT NULL COMMENT '超限开关。\n1：超限开关工作；\n2：超限开关未工作。',
  `size_switch_status` varchar(1) NOT NULL COMMENT '汽车长宽高超限装置。\n1：汽车超限装置开关工作；\n2：汽车超限装置开关未工作。',
  `strayed_status` varchar(1) NOT NULL COMMENT '人车误入检出装置。\n1：人车误入检出装置工作；\n2：人车误入检出装置未工作。',
  `interlock_status` varchar(1) NOT NULL COMMENT '门联锁装置。\n1：门联锁装置工作；\n2：门联锁装置未工作。',
  `falling_status` varchar(1) NOT NULL COMMENT '防载车板坠落装置。\n1：防载车板坠落装置工作；\n2：防载车板坠落装置未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机械式停车设备数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mobile_crane_data`
--

DROP TABLE IF EXISTS `t_mobile_crane_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mobile_crane_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '起重机械载荷。\n单位：t',
  `lift_height` decimal(4,1) NOT NULL COMMENT '提升高度。\n单位：m',
  `lift_speed` decimal(4,1) NOT NULL COMMENT '起升速度。\n单位：m/min',
  `rate_amplitude` decimal(4,1) NOT NULL COMMENT '工作幅度，单位：m',
  `rate_loadmoment` decimal(8,2) NOT NULL COMMENT '额定起重力矩，单位：t*m',
  `crane_status` varchar(1) NOT NULL COMMENT '起重机总电源开闭状态。\n1：起重机总电源开启；\n2：起重机总电源关闭。',
  `weight_value` decimal(4,2) NOT NULL COMMENT '总重量。\n单位：t；保留两位小数',
  `overloading_status` varchar(1) NOT NULL COMMENT '起重量限制器状态。\n1：起重量限制器工作；\n2：起重量限制器未工作。',
  `lifting_moment_value` decimal(6,2) NOT NULL COMMENT '起重力矩。\n单位：tm；保留两位小数',
  `lifting_moment_status` varchar(1) NOT NULL COMMENT '起重力矩限制器状态。\n1：起重力矩限制器工作；\n2：起重力矩限制器未工作。',
  `heightlimiter_status` varchar(1) NOT NULL COMMENT '起升高度限制器状态。\n1：起升高度限制器工作；\n2：起升高度限制器未工作。',
  `amplitude_value` decimal(4,2) NOT NULL COMMENT '幅度。\n单位：m，保留两位小数',
  `amplitude_status` varchar(1) NOT NULL COMMENT '幅度限制器。\n1：幅度限制器工作；\n2：幅度限制器未工作。',
  `rotary_status` varchar(1) NOT NULL COMMENT '回转限制器。\n1：回转限制器工作；\n2：回转限制器未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `present_counter_value` int(11) NOT NULL COMMENT '设备累计工作循环。\n单位：秒',
  `antitilting_status` varchar(1) NOT NULL COMMENT '防后倾装置。\n1：防后倾装置工作；\n2：防后倾装置未工作。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流动式起重机数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_mobile_pressure_vessel_data`
--

DROP TABLE IF EXISTS `t_mobile_pressure_vessel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mobile_pressure_vessel_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n移动式压力设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n移动式压力设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `qc_cod` varchar(20) NOT NULL COMMENT '使用铭牌编号',
  `ukey_cod` varchar(20) NOT NULL COMMENT 'Ukey编号',
  `manufacturer` varchar(100) NOT NULL COMMENT '制造单位，进口设备代理商名称。',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_age` int(11) NOT NULL COMMENT '设计使用年限',
  `eqp_volume` decimal(5,2) NOT NULL COMMENT '设计容积。单位：m3，保留两位小数。',
  `eqp_pressure` decimal(5,2) NOT NULL COMMENT '设计压力。单位：MPa，保留两位小数。',
  `eqp_temp` decimal(5,2) NOT NULL COMMENT '设计温度。单位：摄氏度，保留两位小数。',
  `eqp_date` date NOT NULL COMMENT '设备制造日期',
  `filling_medium` varchar(20) NOT NULL COMMENT '充装介质',
  `eqp_user` varchar(100) NOT NULL COMMENT '产权单位名称',
  `license_number` varchar(15) NOT NULL COMMENT '车牌号码',
  `use_date` date NOT NULL COMMENT '投入使用日期',
  `filling_company` varchar(20) NOT NULL COMMENT '充装单位',
  `filling_id` varchar(20) NOT NULL COMMENT '充装作业人员',
  `fill_date` date NOT NULL COMMENT '充装日期',
  `fill_time` time NOT NULL COMMENT '充装时间',
  `filling_unit` varchar(1) NOT NULL COMMENT '充装量的单位。\n1：单位L；\n2：单位Kg。',
  `filling_volume` decimal(8,2) NOT NULL COMMENT '充装量',
  `eqp_longitude` decimal(14,11) NOT NULL COMMENT '经度',
  `eqp_latitude` decimal(14,11) NOT NULL COMMENT '纬度',
  `tank_pressure` decimal(10,2) NOT NULL COMMENT '压力。\n单位：帕。',
  `liquid_level` decimal(10,2) NOT NULL COMMENT '液位。\n单位：厘米。',
  `environment_temperature` decimal(10,2) NOT NULL COMMENT '环境温度。\n单位：摄氏度。',
  `eqp_temperature` decimal(10,2) NOT NULL COMMENT '介质温度。\n单位：摄氏度。',
  `leakage` varchar(1) NOT NULL COMMENT '是否泄露。\n1：泄露；\n2：未泄露。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动式压力容器数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_moving_sidewalk_data`
--

DROP TABLE IF EXISTS `t_moving_sidewalk_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_moving_sidewalk_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '设备注册代码\n自动人行道设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n自动人行道设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `code_lift` varchar(20) NOT NULL COMMENT '电梯整机编码\n电梯设备质量追溯代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `manufacturer` varchar(100) NOT NULL COMMENT '设备制造单位或进口单位的名称',
  `equipment_date` date NOT NULL COMMENT '设备出厂日期',
  `installation_unit` varchar(100) NOT NULL COMMENT '设备安装单位',
  `installation_date` date NOT NULL COMMENT '设备安装日期',
  `maintenance_unit` varchar(100) NOT NULL COMMENT '维护保养单位名称',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `custom_number` varchar(20) NOT NULL COMMENT '设备内部编号',
  `emergency_number` varchar(20) NOT NULL COMMENT '应急救援电话',
  `nominal_speed` decimal(4,2) NOT NULL COMMENT '名义速度。单位：m/s',
  `extend_length` decimal(6,2) NOT NULL COMMENT '使用区段长度。单位：m',
  `inclination_angle` decimal(4,1) NOT NULL COMMENT '倾斜角。',
  `nominal_width` int(11) NOT NULL COMMENT '名义宽度。',
  `public_transport` varchar(1) NOT NULL COMMENT '公共交通型。1：公共交通型；2：非公共交通型',
  `indoor` varchar(1) NOT NULL COMMENT '是否室内。1：室内；2：室外。',
  `fault_id` varchar(36) NOT NULL COMMENT '故障编号。\n故障唯一序列号。',
  `order_number` varchar(15) NOT NULL COMMENT '故障处置单号',
  `fault_type` varchar(2) NOT NULL COMMENT '故障类型。\n直梯：\n01：电梯运行时安全回路断路\n02：关门故障。\n03：开门故障。\n04：轿厢在开锁区域外停止。\n05：轿厢意外移动。\n06：电动机运转时间限制器动作。\n07：楼层位置丢失。\n08：防止电梯再运行故障。\n09：轿厢冲顶。\n10：轿厢蹲底。\n11：困人。\n扶梯：\n61：安全回路断路。\n62：超速保护。\n63：非操作逆转保护。\n64：梯级或踏板的缺失保护。\n65：防止重新启动故障。',
  `fault_timestamp` datetime NOT NULL COMMENT '故障发生时间',
  `deal_status` varchar(2) NOT NULL COMMENT '故障处置状态。\n00：处置完成。\n01：故障发生。\n02：处置相应。\n04：处置到场。\n05：误报。',
  `deal_respond_time` datetime NOT NULL COMMENT '故障相应时间',
  `deal_arrive_time` datetime NOT NULL COMMENT '故障处置到场时间',
  `deal_end_time` datetime NOT NULL COMMENT '故障处置完成时间',
  `operation_status` varchar(1) NOT NULL COMMENT '运行状态。\n0：停止；\n1：运行。',
  `operation_direction` varchar(1) NOT NULL COMMENT '运行方向。\n0：无方向；1：上行；2：下行。',
  `service_mode` varchar(1) NOT NULL COMMENT '当前服务模式。\n0：停止运行；\n1：正常运行；\n2：检修；\n3：未知。',
  `stats_timestamp` datetime NOT NULL COMMENT '设备统计信息时间戳',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间，单位：小时',
  `present_counter_value` int(11) NOT NULL COMMENT '设备累计运行次数',
  `up_limit` varchar(1) NOT NULL COMMENT '上极限开关：\n1：是；\n2：否。',
  `down_limit` varchar(1) NOT NULL COMMENT '下极限开关。\n1：是；\n2：否。',
  `deal_node` varchar(2000) NOT NULL COMMENT '故障处置说明',
  `power_status` varchar(1) NOT NULL COMMENT '电源状态：\n1：正常；\n2：停电。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动人行道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_portal_crane_data`
--

DROP TABLE IF EXISTS `t_portal_crane_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_portal_crane_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '起重机械载荷。\n单位：t',
  `lift_height` decimal(4,1) NOT NULL COMMENT '提升高度。\n单位：m',
  `lift_speed` decimal(4,1) NOT NULL COMMENT '起升速度。\n单位：m/min',
  `span` decimal(4,1) NOT NULL COMMENT '跨度，单位：m',
  `crane_status` varchar(1) NOT NULL COMMENT '起重机总电源开关状态。\n1：起重机总电源开启；\n2：起重机总电源关闭。',
  `weight_value` decimal(4,2) NOT NULL COMMENT '起重量。\n单位：t；保留两位小数。',
  `overloading_status` varchar(1) NOT NULL COMMENT '起重量限制器状态。\n1：起重量限制器工作；\n2：起重量限制器未工作',
  `heightlimiter_status` varchar(1) NOT NULL COMMENT '起升高度限制器状态。\n1：起升高度限制器工作；\n2：起升高度限制器未工作。',
  `gantrylimiter_status` varchar(1) NOT NULL COMMENT '大车行程开关状态。\n1：大车行程开关工作；\n2：大车行程开关未工作。',
  `trolleylimiter_status` varchar(1) NOT NULL COMMENT '小车行程开关状态。\n1：小车行程开关工作；\n2：小车行程开关未工作。',
  `doorinterlock_status` varchar(1) NOT NULL COMMENT '门连锁保护装置状态。\n1：门连锁保护装置工作；\n2：门连锁保护装置未工作。',
  `m_interlock_status` varchar(1) NOT NULL COMMENT '机构之间连锁保护装置状态。\n1：机构之间连锁保护装置工作；\n2：机构之间连锁保护装置未工作。',
  `safedistance_status` varchar(1) NOT NULL COMMENT '安全距离保护装置状态。\n1：安全距离保护装置工作；\n2：安全距离保护装置不工作。',
  `anticollision_status` varchar(1) NOT NULL COMMENT '防碰撞装置状态。\n1：防碰撞装置工作；\n2：防碰撞装置未工作。',
  `overspeed_status` varchar(1) NOT NULL COMMENT '超速保护装置状态。\n1：超速保护装置工作；\n2：超速保护装置未工作。',
  `brake_status` varchar(1) NOT NULL COMMENT '起升机构制动器状态。\n1：起升机构制动器工作；\n2：起升机构制动器未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `present_counter_valu` int(11) NOT NULL COMMENT '设备累计工作循环',
  `deflection_status` varchar(1) NOT NULL COMMENT '偏斜限位器工作状态。\n1：偏斜限位器工作；\n2：偏斜限位器未工作。',
  `windresistant_status` varchar(1) NOT NULL COMMENT '抗风防滑装置工作状态。\n1：抗风防滑装置工作；\n2：抗风防滑装置未工作。',
  `anemometer_status` varchar(1) NOT NULL COMMENT '风速仪开关。\n1：风速仪工作；\n2：风速仪未工作。',
  `cablelimit_status` varchar(1) NOT NULL COMMENT '供电电缆安全极限。\n1：供电电缆安全极限装置工作；\n2：供电电缆安全极限装置未工作。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门式起重机数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_steam_boiler_data`
--

DROP TABLE IF EXISTS `t_steam_boiler_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_steam_boiler_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '锅炉型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `boiler_ratcon` int(11) NOT NULL COMMENT '额定蒸发量（功率）。单位：t/h',
  `exhaust_temp` decimal(4,2) NOT NULL COMMENT '排烟温度。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_front` decimal(4,2) NOT NULL COMMENT '排烟温度（前）。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_back` decimal(4,2) NOT NULL COMMENT '排烟温度（后）。\n单位：摄氏度；保留两位小数。',
  `comprehensive_alarm` varchar(1) NOT NULL COMMENT '综合报警信号。\n1：报警；\n2：未报警。',
  `ff_alarm` varchar(1) NOT NULL COMMENT '熄火故障报警。\n1：报警；\n2：未报警。',
  `operation_singal` varchar(1) NOT NULL COMMENT '锅炉运行信号。\n1：运行；\n2：停止。',
  `ignition_signal` varchar(1) NOT NULL COMMENT '点火信号。\n1：运行；2：停止。',
  `gf_signal` varchar(1) NOT NULL COMMENT '鼓风机运行信号。\n1：运行；\n2：停止。',
  `yf_signal` varchar(1) NOT NULL COMMENT '引风机运行信号。\n1：运行；\n2：停止。',
  `ambient_temp` decimal(6,2) NOT NULL COMMENT '环境温度。\n单位：摄氏度；保留两位小数。',
  `blowing_rate` decimal(4,2) NOT NULL COMMENT '风量。\n单位：立方米/分',
  `fuel_pressure` decimal(4,2) NOT NULL COMMENT '燃料压力。\n单位：MPa，保留两位小数',
  `fuel_type` varchar(20) NOT NULL COMMENT '燃料种类',
  `fuel_flow` decimal(6,2) NOT NULL COMMENT '燃料流量（汽液）。\n单位：m3/h；保留两位小数。',
  `fuel_heat_value` decimal(4,2) NOT NULL COMMENT '燃料热值。单位：kJ/m3，保留两位小数。',
  `furnace_temp` decimal(6,2) NOT NULL COMMENT '炉膛温度。\n单位：摄氏度；保留两位小数。',
  `furnace_pressure` decimal(6,2) NOT NULL COMMENT '炉膛压力。\n单位：MPa，保留两位小数',
  `excess_air_coefficient` decimal(5,2) NOT NULL COMMENT '排烟处过量空气系数。\n单位：%，保留两位小数。',
  `boiler_q2` decimal(5,2) NOT NULL COMMENT '排烟热损失（q2）。\n单位：%，保留两位小数。',
  `boiler_q3` decimal(5,2) NOT NULL COMMENT '气体未完全燃烧热损失（q3）。\n单位：%，保留两位小数。',
  `boiler_q4` decimal(5,2) NOT NULL COMMENT '固体未完全燃烧热损失（q4）。\n单位：%，保留两位小数。',
  `boiler_q5` decimal(5,2) NOT NULL COMMENT '散热损失（q5）。\n单位：%，保留两位小数。',
  `boiler_q6` decimal(5,2) NOT NULL COMMENT '灰渣物理热损失（q6）。\n单位：%，保留两位小数。',
  `boiler_efficiency` decimal(5,2) NOT NULL COMMENT '锅炉热效率。\n单位：%，保留两位小数。',
  `steam_temp` decimal(6,2) NOT NULL COMMENT '蒸汽温度。\n单位：摄氏度；保留两位小数。',
  `steam_pressure` decimal(6,2) NOT NULL COMMENT '蒸汽压力。\n单位：MPa；保留两位小数。',
  `feed_water_temp` decimal(5,2) NOT NULL COMMENT '给水温度',
  `feed_water_temp_cold` decimal(5,2) NOT NULL COMMENT '给水温度（冷水）。\n单位：摄氏度；保留两位小数。',
  `feed_water_temp_hot` decimal(6,2) NOT NULL COMMENT '给水温度（热水）。\n单位：摄氏度；保留两位小数。',
  `elw_alarm` varchar(1) NOT NULL COMMENT '极低水位报警。\n1：报警；\n2：未报警。',
  `shw_alarm` varchar(1) NOT NULL COMMENT '超高水位报警。\n1：报警；\n2：未报警。',
  `op_alarm` varchar(1) NOT NULL COMMENT '蒸汽超压报警。\n1：报警；\n2：未报警。',
  `swd_alarm` varchar(1) NOT NULL COMMENT '软水硬度报警。\n1：报警；\n2：未报警。',
  `steam_flow` decimal(6,2) NOT NULL COMMENT '蒸汽流量。\n单位：kg/h；保留两位小数。',
  `feed_water_pressure_cold` decimal(6,2) NOT NULL COMMENT '给水压力（冷水）。\n单位：MPa；保留两位小数。',
  `feed_water_pressure_hot` decimal(6,2) NOT NULL COMMENT '给水压力（热水）。\n单位：MPa；保留两位小数。',
  `feed_water_flow` decimal(6,2) NOT NULL COMMENT '给水流量。\n单位：kg/h；保留两位小数。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蒸汽锅炉数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tower_crane_data`
--

DROP TABLE IF EXISTS `t_tower_crane_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tower_crane_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n起重机械进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n起重机械进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `dev_cod` varchar(20) NOT NULL COMMENT '设备代码\n起重机械出厂时由制造企业按TSG 08-2017编制的起重机设备代码',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '设备型号\n由制造单位定义的产品型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `lift_load` decimal(4,1) NOT NULL COMMENT '起重机械载荷。\n单位：t',
  `lift_height` decimal(4,1) NOT NULL COMMENT '提升高度。\n单位：m',
  `lift_speed` decimal(4,1) NOT NULL COMMENT '起升速度。\n单位：m/min',
  `rate_amplitude` decimal(4,1) NOT NULL COMMENT '工作幅度，单位：m',
  `rate_loadmoment` decimal(8,2) NOT NULL COMMENT '额定起重力矩，单位：t*m',
  `crane_status` varchar(1) NOT NULL COMMENT '起重机总电源开闭状态。\n1：起重机总电源开启；\n2：起重机总电源关闭。',
  `weight_value` decimal(4,2) NOT NULL COMMENT '总重量。\n单位：t；保留两位小数',
  `overloading_status` varchar(1) NOT NULL COMMENT '起重量限制器状态。\n1：起重量限制器工作；\n2：起重量限制器未工作。',
  `lifting_moment_value` decimal(6,2) NOT NULL COMMENT '起重力矩。\n单位：tm；保留两位小数',
  `lifting_moment_status` varchar(1) NOT NULL COMMENT '起重力矩限制器状态。\n1：起重力矩限制器工作；\n2：起重力矩限制器未工作。',
  `heightlimiter_status` varchar(1) NOT NULL COMMENT '起升高度限制器状态。\n1：起升高度限制器工作；\n2：起升高度限制器未工作。',
  `amplitude_value` decimal(4,2) NOT NULL COMMENT '幅度。\n单位：m，保留两位小数',
  `amplitude_status` varchar(1) NOT NULL COMMENT '幅度限制器。\n1：幅度限制器工作；\n2：幅度限制器未工作。',
  `rotary_status` varchar(1) NOT NULL COMMENT '回转限制器。\n1：回转限制器工作；\n2：回转限制器未工作。',
  `single_running_time` int(11) NOT NULL COMMENT '设备本次运行时间。\n单位：秒',
  `total_running_time` int(11) NOT NULL COMMENT '设备累计运行时间。\n单位：秒',
  `present_counter_valu` int(11) NOT NULL COMMENT '设备累计工作循环',
  `gantrylimiter_status` varchar(1) NOT NULL COMMENT '大车行程开关状态。\n1：大车行程开关工作；\n2：大车行程开关未工作。',
  `windresistant_status` varchar(1) NOT NULL COMMENT '抗风防滑装置工作状态。\n1：抗风防滑装置工作；\n2：抗风防滑装置未工作。',
  `anemometer_status` varchar(1) NOT NULL COMMENT '风速仪开关。\n1：风速仪工作；\n2：风速仪未工作。',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='塔式起重机数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_ygl_boiler_data`
--

DROP TABLE IF EXISTS `t_ygl_boiler_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ygl_boiler_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID，自增',
  `reg_cod` varchar(20) NOT NULL COMMENT '注册代码\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的起重机注册代码',
  `use_cod` varchar(20) NOT NULL COMMENT '使用登记证编号\n锅炉设备进行使用登记时由特种设备安全监督管理部门设置的使用登记证编号',
  `eqp_type` varchar(4) NOT NULL COMMENT '设备种类\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_sort` varchar(4) NOT NULL COMMENT '设备类别\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `eqp_vart` varchar(4) NOT NULL COMMENT '设备品种\n设备按照其基本属性对应的分类所列代码进行编码，按《特种设备目录》中的规定执行',
  `use_unt` varchar(100) NOT NULL COMMENT '使用单位名称\n使用登记证上的设备使用单位的名称',
  `eqp_mod` varchar(60) NOT NULL COMMENT '锅炉型号',
  `fac_cod` varchar(60) NOT NULL COMMENT '出厂编号\n产品合格证上标示的设备编号',
  `boiler_ratcon` int(11) NOT NULL COMMENT '额定蒸发量（功率）。单位：t/h',
  `exhaust_temp` decimal(4,2) NOT NULL COMMENT '排烟温度。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_front` decimal(4,2) NOT NULL COMMENT '排烟温度（前）。\n单位：摄氏度；保留两位小数。',
  `exhaust_temp_back` decimal(4,2) NOT NULL COMMENT '排烟温度（后）。\n单位：摄氏度；保留两位小数。',
  `comprehensive_alarm` varchar(1) NOT NULL COMMENT '综合报警信号。\n1：报警；\n2：未报警。',
  `ff_alarm` varchar(1) NOT NULL COMMENT '熄火故障报警。\n1：报警；\n2：未报警。',
  `operation_singal` varchar(1) NOT NULL COMMENT '锅炉运行信号。\n1：运行；\n2：停止。',
  `ignition_signal` varchar(1) NOT NULL COMMENT '点火信号。\n1：运行；2：停止。',
  `gf_signal` varchar(1) NOT NULL COMMENT '鼓风机运行信号。\n1：运行；\n2：停止。',
  `yf_signal` varchar(1) NOT NULL COMMENT '引风机运行信号。\n1：运行；\n2：停止。',
  `ambient_temp` decimal(6,2) NOT NULL COMMENT '环境温度。\n单位：摄氏度；保留两位小数。',
  `blowing_rate` decimal(4,2) NOT NULL COMMENT '风量。\n单位：立方米/分',
  `fuel_pressure` decimal(4,2) NOT NULL COMMENT '燃料压力。\n单位：MPa，保留两位小数',
  `fuel_type` varchar(20) NOT NULL COMMENT '燃料种类',
  `fuel_flow` decimal(6,2) NOT NULL COMMENT '燃料流量（汽液）。\n单位：m3/h；保留两位小数。',
  `fuel_heat_value` decimal(4,2) NOT NULL COMMENT '燃料热值。单位：kJ/m3，保留两位小数。',
  `furnace_temp` decimal(6,2) NOT NULL COMMENT '炉膛温度。\n单位：摄氏度；保留两位小数。',
  `furnace_pressure` decimal(6,2) NOT NULL COMMENT '炉膛压力。\n单位：MPa，保留两位小数',
  `excess_air_coefficient` decimal(5,2) NOT NULL COMMENT '排烟处过量空气系数。\n单位：%，保留两位小数。',
  `boiler_q2` decimal(5,2) NOT NULL COMMENT '排烟热损失（q2）。\n单位：%，保留两位小数。',
  `boiler_q3` decimal(5,2) NOT NULL COMMENT '气体未完全燃烧热损失（q3）。\n单位：%，保留两位小数。',
  `boiler_q4` decimal(5,2) NOT NULL COMMENT '固体未完全燃烧热损失（q4）。\n单位：%，保留两位小数。',
  `boiler_q5` decimal(5,2) NOT NULL COMMENT '散热损失（q5）。\n单位：%，保留两位小数。',
  `boiler_q6` decimal(5,2) NOT NULL COMMENT '灰渣物理热损失（q6）。\n单位：%，保留两位小数。',
  `boiler_efficiency` decimal(5,2) NOT NULL COMMENT '锅炉热效率。\n单位：%，保留两位小数。',
  `export_temp` decimal(5,2) NOT NULL COMMENT '热水出水（导热油出口）温度',
  `import_temp` decimal(5,2) NOT NULL COMMENT '热水回水（导热油进口）温度',
  `export_pressure` decimal(5,2) NOT NULL COMMENT '热水出水（导热油出口）压力',
  `import_pressure` decimal(5,2) NOT NULL COMMENT '热水回水（导热油进口）压力',
  `export_flow` decimal(5,2) NOT NULL COMMENT '热水出水（导热油出口）流量',
  `optype` varchar(20) NOT NULL COMMENT '操作类型。\nUPLOAD/UPDATE/DELETE',
  `optime` datetime NOT NULL COMMENT '操作时间',
  `uptime` datetime NOT NULL COMMENT '更新到上级平台的时间。',
  `area_code` varchar(10) NOT NULL COMMENT '所属区域的行政区划编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='有机热载体锅炉数据';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-01 16:24:41
