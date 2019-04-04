/*
Navicat MySQL Data Transfer

Source Server         : 172.16.0.176
Source Server Version : 50133
Source Host           : 172.16.0.176:3306
Source Database       : roster

Target Server Type    : MYSQL
Target Server Version : 50133
File Encoding         : 65001

Date: 2017-06-28 11:08:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activitycallresult
-- ----------------------------
DROP TABLE IF EXISTS `activitycallresult`;
CREATE TABLE `activitycallresult` (
  `Id` varchar(50) DEFAULT NULL COMMENT '唯一标志，UUID',
  `FirstName` varchar(50) DEFAULT NULL COMMENT '客户名',
  `LastName` varchar(50) DEFAULT NULL COMMENT '客户姓',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `rosterinfo_id` varchar(50) DEFAULT NULL COMMENT '名单id',
  `Callid` varchar(50) DEFAULT NULL COMMENT '一次呼叫的唯一标志',
  `Callstarttime` datetime DEFAULT NULL COMMENT '开始时间',
  `Callendtime` datetime DEFAULT NULL COMMENT '结束时间',
  `Result` varchar(50) DEFAULT NULL COMMENT '外呼结果，是否成功',
  `ResultCode` int(11) DEFAULT NULL COMMENT '外呼结果，失败原因(0：成功；1：用户正忙；2：来电提醒；3：无法接通；4：呼叫限制；5：呼叫转移；6：关机；7：停机；8：空号；9：正在通话中；10：网络忙；11：超时；12：短忙音；13：长忙音)',
  `contactnum` varchar(50) DEFAULT NULL COMMENT '客户联系号码',
  `identifyid` varchar(50) DEFAULT NULL,
  `calltimes` int(11) DEFAULT NULL COMMENT '呼叫次数',
  `CallAnswerTime` datetime DEFAULT NULL COMMENT '应答时间',
  `CallEndType` int(11) DEFAULT NULL COMMENT '呼叫结束类型，是否转人工 。1 转人工',
  `contactID` varchar(50) DEFAULT NULL COMMENT '联系人ID，表示联系人唯一性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;











