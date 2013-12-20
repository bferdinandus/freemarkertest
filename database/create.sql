CREATE TABLE `bankrecords` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `description` varchar(40) COLLATE utf8_bin NOT NULL,
  `account` varchar(25) COLLATE utf8_bin NOT NULL,
  `contraAccount` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(2) COLLATE utf8_bin NOT NULL,
  `addSubtract` varchar(3) COLLATE utf8_bin NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `mutationType` varchar(45) COLLATE utf8_bin NOT NULL,
  `remarks` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dateRemarksAmount_idx` (`date`,`description`,`amount`,`remarks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `system` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lastImport` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `freemarker`.`labels` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `labelsBankRecords` (
  `bankrecordID` int(11) unsigned NOT NULL,
  `labelID` int(11) unsigned NOT NULL,
  KEY `labelLink_idx` (`labelID`),
  KEY `bankrecordLink_idx` (`bankrecordID`),
  CONSTRAINT `bankrecordLink` FOREIGN KEY (`bankrecordID`) REFERENCES `bankrecords` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `labelLink` FOREIGN KEY (`labelID`) REFERENCES `labels` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;