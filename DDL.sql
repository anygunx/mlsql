/*
Navicat MySQL Data Transfer

Source Server         : 254
Source Server Version : 50173
Source Host           : 10.10.10.254:3306
Source Database       : GameX

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-05-06 16:10:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Account
-- ----------------------------
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Guid` int(32) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(60) COLLATE utf8_bin NOT NULL,
  `Password` blob NOT NULL,
  `AccountInfo` blob NOT NULL,
  `Seal` INT NOT NULL,
  `PhoneNumber` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- ----------------------------
-- Table structure for `Player`
-- ----------------------------
DROP TABLE IF EXISTS `Player`;
CREATE TABLE `Player` (
  `PlayerGuid` int(32) NOT NULL,
  `UserName` varchar(60) COLLATE utf8_bin NOT NULL,
  `PlayerName` varchar(60) COLLATE utf8_bin NOT NULL,
  `PlayerLevel` int(11) NOT NULL,
  `PlayerProfession` int(11) NOT NULL,
  `PlayerGrade` int(11) NOT NULL,
  `Money` int(32) NOT NULL,
  `Diamond` int(32) NOT NULL,
  `Magic` int(32) NOT NULL,				/** ˮ�� */
  `LogoutTime` 	BIGINT 		NOT NULL,
  `BinData` blob NOT NULL,
  `Seal` int(11) NOT NULL,
  `Freeze` int(11) NOT NULL,
  `InDoorId` INT NOT NULL,
  `VersionNumber` int(11) NOT NULL,
  PRIMARY KEY (`PlayerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `EndlessStair`
-- ----------------------------
DROP TABLE IF EXISTS `EndlessStair`;
CREATE TABLE `EndlessStair` (
  `Rank` int(32) NOT NULL,
  `PlayerName` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `EndlessStair`
-- ----------------------------
DROP TABLE IF EXISTS `Baby`;
CREATE TABLE `Baby` (
  `ID` INT(32) NOT NULL AUTO_INCREMENT,
  `BabyGuid` int(11) NOT NULL,
  `BabyGrade` int(11) NOT NULL,
  `OwnerName` varchar(60) COLLATE utf8_bin NOT NULL,
  `BabyName` varchar(60) COLLATE utf8_bin NOT NULL,
  `BabyLevel` int(32) NOT NULL,
  `TableID` int(32) NOT NULL,
  `AddProp` int(32) NOT NULL,
  `BinData` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `EndlessStair`
-- ----------------------------
DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `ID` INT(32) NOT NULL AUTO_INCREMENT,
  `EmployeeGuid` int(11) NOT NULL,
  `EmployeeGrade` int(11) NOT NULL,
  `OwnerName` varchar(60) COLLATE utf8_bin NOT NULL,
  `EmployeeName` varchar(60) COLLATE utf8_bin NOT NULL,
  `BinData` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of Player
-- ----------------------------

DROP TABLE IF EXISTS `Mail`;
CREATE TABLE `Mail` (
  `MailGuid` INT(32) NOT NULL AUTO_INCREMENT,
  `RecvName` varchar(60) COLLATE utf8_bin NOT NULL,
  `SendTime`	BIGINT 	NOT NULL,		/*** ����ʱ��*/
  `ItemNum`	INT(32) NOT NULL,		/*** ItemNum��Ϊ0�и���*/
  `BinData` blob NOT NULL,
  PRIMARY KEY (`MailGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/** 
 * @brief ���ɱ�
 * */
DROP TABLE IF EXISTS `Guild`;	
CREATE TABLE `Guild`
(
	`GuildId`	    	INT 		NOT NULL,/*** ����ID*/
	`GuildName`   	VARCHAR(60)	NOT NULL,/*** ������*/
	`GuildLevel` 	TINYINT		NOT NULL,/*** ���ɵȼ�*/
	`Contribution`	INT 		NOT NULL,/*** ���ɹ���*/
	`Fundz`			INT 		NOT NULL,/*** �����ʽ�*/
	`Credit`		INT 		NOT NULL,/*** */
	`Master`		BIGINT 		NOT NULL,/*** ����*/
	`MasterName`  	VARCHAR(60)	NOT NULL,/*** ������(δ����)*/
	`Notice`      	TEXT 		NOT NULL,/*** ���ɹ���*/
	`RequestList` 	BLOB 		NOT NULL,/*** �����б�*/
	`Buildings`		BLOB 		NOT NULL,/*** ���ɽ���*/
	`Progenitus`	BLOB 		NOT NULL,/*** ��������*/
	`ProgenitusPos`	BLOB 		NOT NULL,/*** ��������λ��*/
	`PresentNum`  	INT 		NOT NULL,/*** �ɼ�����*/
	PRIMARY KEY(guildId),
	UNIQUE KEY guildNameIdx   (guildName)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/**
 * @brief ���ɳ�Ա��
 * */
 DROP TABLE IF EXISTS `GuildMember`;
CREATE TABLE `GuildMember`
(
	`GuildId`		INT 		NOT NULL,/*** ����ID(��� ���ɱ�)*/
	`RoleId`		BIGINT 		NOT NULL,/*** ��Ա����ID*/
	`Job`		TINYINT 	NOT NULL,/*** ְλ*/
	`Contribution`	INT 		NOT NULL,/*** ����*/
	`Rolelevel`      	TINYINT 	NOT NULL,/*** ��Ա�ȼ�*/
	`JoinTime`		INT 		NOT NULL,/*** ��Ա�������ʱ��*/
	`Proftype`		INT 		NOT NULL,/*** ��Աְҵ����*/
	`Proflevel`		INT 		NOT NULL,/*** ��Աְҵ�ȼ�*/
	`OfflineTime` 	BIGINT 		NOT NULL,/*** �����ۼ�ʱ��*/
	`RoleName`   	VARCHAR(60)	NOT NULL,/*** ��Ա��*/
	PRIMARY KEY(roleId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `MallTable`;
CREATE TABLE `MallTable` (
  `SortKey` INT(32) NOT NULL AUTO_INCREMENT,
  `Guid` int(32) NOT NULL,
  `PlayerId` int(32) NOT NULL,
  `SellPrice` int(32) NOT NULL,
  `Title` varchar(60) COLLATE utf8_bin NOT NULL,
  `ItemSubType` int(32) NOT NULL,
  `RaceType` int(32) NOT NULL,
  `ItemId` int(32) NOT NULL,
  `BabyId` int(32) NOT NULL,
  `SellItem` blob NOT NULL,
  PRIMARY KEY (`SortKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `MallSelledTable`;
CREATE TABLE `MallSelledTable` (
  `Guid` INT(32) NOT NULL AUTO_INCREMENT,
  `PlayerId` INT(32) NOT NULL ,
  `SellPrice` INT(32) NOT NULL ,
  `Stack` INT(32) NOT NULL ,
  `BabyId` INT(32) NOT NULL ,
  `ItemId` INT(32) NOT NULL ,
  `SelledTime` INT(32) NOT NULL ,
  `Tax` INT(32) NOT NULL ,
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `KeyGiftTable`
-- ----------------------------
DROP TABLE IF EXISTS `KeyGiftTable`;
CREATE TABLE `KeyGiftTable` (
  `sortId` int(11) NOT NULL AUTO_INCREMENT,
  `cdkey` varchar(60) COLLATE utf8_bin NOT NULL,
  `pfIp` varchar(60) COLLATE utf8_bin NOT NULL,
  `giftName` varchar(60) COLLATE utf8_bin NOT NULL,
  `playerName` varchar(60) COLLATE utf8_bin NOT NULL,
  `useTime` 	BIGINT 		NOT NULL,
  `rewardItem` blob NOT NULL,
  PRIMARY KEY (`sortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `Activity`
-- ----------------------------
DROP TABLE IF EXISTS `Activity`;
CREATE TABLE `Activity` (
  `ADType` int(32) NOT NULL,
  `BinData` blob NOT NULL,
  PRIMARY KEY (`ADType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `EmployeeQuestTable`;
CREATE TABLE `EmployeeQuestTable` (
  `PlayerId` int(32) NOT NULL,
  `BinData` blob NOT NULL,
  PRIMARY KEY (`PlayerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;