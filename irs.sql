
CREATE TABLE `departmentTable` (`departmentID` int (10) NOT NULL,
`departmentName` varchar(50) NOT NULL, PRIMARY KEY (`departmentID`))ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `userTable` (`userID` varchar(15) NOT NULL,`username` varchar(15) NOT NULL ,
`password` varchar(15) NOT NULL,`fullname` varchar(100) NOT NULL,
`DOB` date NOT NULL ,`userImage` varchar(150),
`phonenumber` int (15) NOT NULL,`email` varchar(50) NOT NULL,
`userRole` varchar(15) NOT NULL,`departmentID` int(10) NOT NULL,
 PRIMARY KEY (`userID`), FOREIGN KEY (`departmentID`)
  REFERENCES `departmentTable` (`departmentID`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `requestTable` (`requestID` varchar(15) NOT NULL,`requestType` varchar(15) NOT NULL,
`requestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,`requestStatus` enum ('VERIFIED','PENDING','DECLINED'),`userID` varchar(15) NOT NULL, PRIMARY KEY (`requestID`),FOREIGN KEY (`userID`) REFERENCES `userTable` (`userID`))ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categoryTable` (`categoryID` varchar (15) NOT NULL,`categoryName` varchar(50) NOT NULL, PRIMARY KEY (`categoryID`))ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `materialTable`(`materialID` int(15) NOT null,`materialName` varchar (50) NOT NULL,`quantity` int(10) NOT NULL,`categoryID` varchar (15) NOT NULL, PRIMARY KEY (`materialID`),
 FOREIGN KEY (`categoryID`) REFERENCES `categoryTable` (`categoryID`))ENGINE=InnoDB DEFAULT CHARSET=utf8;

 INSERT INTO `departmentTable` (`departmentID`,`departmentName`) VALUES (1,'Management');


 INSERT INTO `userTable` (`userID`,`username`,`password`,`fullname`,`DOB`,`userImage`,`phonenumber`,`email`,`userRole`,`departmentID`) 
 VALUES ('USR100','admin','admin','Chika Ani',13/4/1987,'admin.jpg',4455444,'casmonas@gmail.com','admin',1);