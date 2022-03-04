/*
MySQL Data Transfer
Source Host: localhost
Source Database: crs
Target Host: localhost
Target Database: crs
Date: 3/2/2022 12:07:26 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` varchar(32) default NULL,
  KEY `adminId` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `courseCode` varchar(32) NOT NULL default '',
  `courseName` varchar(32) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`courseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseCode` varchar(100) NOT NULL ,
  `courseName` varchar(32) NOT NULL,
  `instructorId` varchar(32) NOT NULL,
  `availableSeats` int(10) NOT NULL,
  `courseFee` double(32,0) default NULL,
  PRIMARY KEY  (`courseCode`),
  KEY `courseCode` (`courseCode`,`courseName`,`instructorId`,`availableSeats`),
  KEY `instructorId` (`instructorId`),
  CONSTRAINT `instructorId` FOREIGN KEY (`instructorId`) REFERENCES `professor` (`instructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `referenceId` varchar(32) default NULL,
  `notificationType` varchar(32) default NULL,
  `notificationId` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`notificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` varchar(32) NOT NULL,
  `branch` varchar(32) NOT NULL,
  `batch` varchar(32) NOT NULL,
  `isRegistered` varchar(32) NOT NULL,
  `isApproved` varchar(32) default NULL,
  PRIMARY KEY  (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `referenceId` varchar(32) default NULL,
  `studentId` varchar(32) NOT NULL,
  `amount` float(32,0) default NULL,
  `modeOfPayment` varchar(32) default NULL,
  `status` TINYINT (1) default 0,
  KEY `studentId` (`studentId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for professor
-- ----------------------------
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `instructorId` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  `designation` varchar(32) NOT NULL,
  PRIMARY KEY  (`instructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for registeredcourse
-- ----------------------------
DROP TABLE IF EXISTS `registeredcourse`;
CREATE TABLE `registeredcourse` (
  `studentId` varchar(32) NOT NULL,
  `courseCode` varchar(32) NOT NULL,
  `grade` varchar(32) NOT NULL,
  KEY `courseCode` (`courseCode`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `registeredcourse_ibfk_7` FOREIGN KEY (`courseCode`) REFERENCES `course` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registeredcourse_ibfk_8` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleType` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `gender` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `role` varchar(32) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('101');
INSERT INTO `catalog` VALUES ('2er', 'www', 'Test');
INSERT INTO `catalog` VALUES ('abtty', 'www', 'Test');
INSERT INTO `catalog` VALUES ('AWS', 'Amazon', 'Amazon cloud certifcation');
INSERT INTO `catalog` VALUES ('Az-104', 'Azure', 'Microsoft certification');
INSERT INTO `catalog` VALUES ('Az-900', 'Azure', 'Microsoft certification');
INSERT INTO `catalog` VALUES ('lz-808', 'Java', 'Java certification');
INSERT INTO `catalog` VALUES ('office365', 'MS', 'Ms certification');
INSERT INTO `catalog` VALUES ('ooo', 'xyz', 'Test');
INSERT INTO `catalog` VALUES ('ooy', 'www', 'Test');
INSERT INTO `catalog` VALUES ('qqq', 'www', 'Test');
INSERT INTO `catalog` VALUES ('sdd', 'www', 'Test');
INSERT INTO `catalog` VALUES ('uiu', 'www', 'Test');
INSERT INTO `catalog` VALUES ('www', 'xyz', 'Test');
INSERT INTO `course` VALUES ('Python', 'Python Certification', '2', '2', '1500');

INSERT INTO `registeredcourse` VALUES ('21', 'Python', 'A');
INSERT INTO `student` VALUES ('1', 'IT', '2022', '1', '1', '1', '1');
INSERT INTO `student` VALUES ('10', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('101', 'CS', '2020', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('11', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('13', 'IT', '2019', '0', '0', '0', '0');
INSERT INTO `student` VALUES ('15', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('16', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('18', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('20', 'IT', '2019', '0', '0', '0', '0');
INSERT INTO `student` VALUES ('21', 'IT', '2019', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('4', 'EXTC', '2019', '1', '1', '1', '1');
INSERT INTO `student` VALUES ('7', 'IT', '2022', '0', '0', '0', '0');
INSERT INTO `student` VALUES ('8', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `student` VALUES ('9', 'IT', '2019', '0', '0', '1', '0');
INSERT INTO `user` VALUES ('laxmi', 'root', 'laxmi', 'FEMALE', 'mumbai', 'STUDENT');
