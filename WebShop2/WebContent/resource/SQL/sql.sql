CREATE TABLE member(
	cid VARCHAR(32) PRIMARY KEY,
	cpassword VARCHAR(32),
	cname VARCHAR(32),
	cgender VARCHAR(32),
	cbirth VARCHAR(32),
	cemail VARCHAR(32),
	cphone VARCHAR(32),
	caddress VARCHAR(32),
	cregiday VARCHAR(32)
) DEFAULT CHARSET=utf8;


CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(32) DEFAULT NULL,
  `pdescription` varchar(32) DEFAULT NULL,
  `pprice` varchar(32) DEFAULT NULL,
  `pfilename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) DEFAULT CHARSET=utf8;
