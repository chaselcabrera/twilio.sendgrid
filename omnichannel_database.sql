CREATE DATABASE `omnichannel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

CREATE TABLE `credentials` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `api_key` varchar(200) DEFAULT NULL,
  `qt_id` int(1) DEFAULT NULL,
  `account_sid` varchar(50) DEFAULT NULL,
  `auth_token` varchar(50) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `c_dt_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `c_dt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `omnichannel_queue` (
  `oq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key\nRequired',
  `qt_id` int(1) DEFAULT NULL,
  `sent` int(1) NOT NULL DEFAULT '0' COMMENT '0 - Has the queued record been sent\n1 - Call was successfully sent \nRequired',
  `from_email` varchar(320) DEFAULT NULL COMMENT 'Address email is coming from\nRequired',
  `to_email` varchar(320) DEFAULT NULL COMMENT 'Address email is going to\nRequired',
  `bcc_email` text COMMENT 'Blind Carbon Copy \nConceals the person entered in the BCC field from the other recipients\nNot required',
  `cc_email` text COMMENT 'Carbon Copy\nDisplays the from the other recipients\nNot required',
  `replyto_email` text COMMENT 'When a recipient replies to an email this is the address emails will be delivered to\nNot Required',
  `subject` varchar(256) DEFAULT NULL COMMENT 'A lot of email clients will impose a 255/256 character limit on the subject of an email\nRequired',
  `body` text COMMENT 'Corrispondence contents\nRequired',
  `attachments` text COMMENT 'Attachement Location\nNot Required\n',
  `to_number` varchar(15) DEFAULT NULL COMMENT 'Phone Number Call is going to\\nRequired',
  `oq_dt_created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation of record Date and Time',
  `oq_dt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modification of record Date and Time',
  PRIMARY KEY (`oq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `queue_type` (
  `qt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `qt_description` varchar(45) NOT NULL COMMENT 'describes what type of communication is queued',
  `qt_dt_created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time of record creation',
  `qt_dt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date and time of record modification',
  PRIMARY KEY (`qt_id`),
  UNIQUE KEY `qt_description_UNIQUE` (`qt_description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
