#@uthor edwardpantojalegaspi
#@since 2009.08.18
#@description DMS Local Schema Script

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

USE `dms-local-fresh`;

--
-- Database: `icis-dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `atributs`
--

DROP TABLE IF EXISTS `atributs`;
CREATE TABLE IF NOT EXISTS `atributs` (
  `AID` INTEGER DEFAULT NULL,
  `GID` INTEGER NOT NULL,
  `ATYPE` INTEGER NOT NULL,
  `AUID` INTEGER NOT NULL,
  `AVAL` varchar(255) DEFAULT NULL,
  `ALOCN` INTEGER DEFAULT NULL,
  `AREF` INTEGER DEFAULT NULL,
  `ADATE` INTEGER DEFAULT NULL,
  KEY `AID` (`AID`),
  KEY `ALOCN` (`ALOCN`),
  KEY `ATYPE` (`ATYPE`),
  KEY `AUID` (`AUID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bibrefs`
--

DROP TABLE IF EXISTS `bibrefs`;
CREATE TABLE IF NOT EXISTS `bibrefs` (
  `REFID` INTEGER NOT NULL,
  `PUBTYPE` INTEGER DEFAULT NULL,
  `PUBDATE` INTEGER DEFAULT NULL,
  `AUTHORS` varchar(100) DEFAULT NULL,
  `EDITORS` varchar(100) DEFAULT NULL,
  `ANALYT` varchar(255) DEFAULT NULL,
  `MONOGR` varchar(255) DEFAULT NULL,
  `SERIES` varchar(255) DEFAULT NULL,
  `VOLUME` varchar(10) DEFAULT NULL,
  `ISSUE` varchar(10) DEFAULT NULL,
  `PAGECOL` varchar(25) DEFAULT NULL,
  `PUBLISH` varchar(50) DEFAULT NULL,
  `PUCITY` varchar(30) DEFAULT NULL,
  `PUCNTRY` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`REFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
CREATE TABLE IF NOT EXISTS `changes` (
  `CID` INTEGER NOT NULL,
  `CTABLE` varchar(16) NOT NULL,
  `CFIELD` varchar(16) NOT NULL,
  `CRECORD` INTEGER NOT NULL,
  `CFROM` INTEGER DEFAULT NULL,
  `CTO` INTEGER DEFAULT NULL,
  `CDATE` INTEGER DEFAULT NULL,
  `CTIME` INTEGER DEFAULT NULL,
  `CGROUP` varchar(20) DEFAULT NULL,
  `CUID` INTEGER DEFAULT NULL,
  `CREF` INTEGER DEFAULT NULL,
  `CSTATUS` INTEGER NOT NULL,
  `CDESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `CRECORD` (`CRECORD`),
  KEY `CID` (`CID`,`CRECORD`,`CTABLE`),
  KEY `CTABLE` (`CTABLE`,`CFIELD`,`CRECORD`,`CFROM`,`CTO`,`CSTATUS`),
  KEY `CTABLE_2` (`CTABLE`,`CRECORD`,`CFIELD`,`CFROM`,`CSTATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datattr`
--

DROP TABLE IF EXISTS `datattr`;
CREATE TABLE IF NOT EXISTS `datattr` (
  `DATTRID` INTEGER NOT NULL,
  `DATYPE` INTEGER DEFAULT NULL,
  `DATABLE` varchar(2) DEFAULT NULL,
  `OUNITID` INTEGER DEFAULT NULL,
  `VARIATID` INTEGER DEFAULT NULL,
  `DATVAL` text,
  PRIMARY KEY (`DATTRID`),
  KEY `DATTRID` (`DATTRID`),
  KEY `OUNITID` (`OUNITID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_c`
--

DROP TABLE IF EXISTS `data_c`;
CREATE TABLE IF NOT EXISTS `data_c` (
  `OUNITID` INTEGER DEFAULT NULL,
  `VARIATID` INTEGER DEFAULT NULL,
  `DVALUE` varchar(50) DEFAULT NULL,
  KEY `DVALUE` (`DVALUE`),
  KEY `OUNITID` (`OUNITID`),
  KEY `OUNITID_2` (`OUNITID`,`VARIATID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_n`
--

DROP TABLE IF EXISTS `data_n`;
CREATE TABLE IF NOT EXISTS `data_n` (
  `OUNITID` INTEGER DEFAULT NULL,
  `VARIATID` INTEGER DEFAULT NULL,
  `DVALUE` double DEFAULT NULL,
  KEY `DVALUE` (`DVALUE`),
  KEY `OUNITID` (`OUNITID`,`VARIATID`),
  KEY `OUNITID_2` (`OUNITID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_t`
--

DROP TABLE IF EXISTS `data_t`;
CREATE TABLE IF NOT EXISTS `data_t` (
  `OUNITID` INTEGER DEFAULT NULL,
  `VARIATID` INTEGER DEFAULT NULL,
  `DVALUE` text,
  KEY `OUNITID` (`OUNITID`,`VARIATID`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dmsattr`
--

DROP TABLE IF EXISTS `dmsattr`;
CREATE TABLE IF NOT EXISTS `dmsattr` (
  `DMSATID` INTEGER NOT NULL,
  `DMSATYPE` INTEGER DEFAULT NULL,
  `DMSATAB` varchar(10) DEFAULT NULL,
  `DMSATREC` INTEGER DEFAULT NULL,
  `DMSATVAL` text,
  PRIMARY KEY (`DMSATID`),
  KEY `DMSATID` (`DMSATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dudflds`
--

DROP TABLE IF EXISTS `dudflds`;
CREATE TABLE IF NOT EXISTS `dudflds` (
  `FLDNO` INTEGER DEFAULT NULL,
  `FTABLE` varchar(24) DEFAULT NULL,
  `FTYPE` varchar(12) DEFAULT NULL,
  `FCODE` varchar(8) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FFMT` varchar(255) DEFAULT NULL,
  `FDESC` text,
  `LFLDNO` INTEGER DEFAULT NULL,
  `FUID` INTEGER DEFAULT NULL,
  `FDATE` INTEGER DEFAULT NULL,
  `OldFLDNO` INTEGER DEFAULT NULL,
  `OldFLDID` INTEGER DEFAULT NULL,
  UNIQUE KEY `FLDNO` (`FLDNO`),
  KEY `FCODE` (`FCODE`),
  KEY `FUID` (`FUID`),
  KEY `OldFLDID` (`OldFLDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `effect`
--

DROP TABLE IF EXISTS `effect`;
CREATE TABLE IF NOT EXISTS `effect` (
  `REPRESNO` INTEGER NOT NULL,
  `FACTORID` INTEGER DEFAULT NULL,
  `EFFECTID` INTEGER DEFAULT NULL,
  KEY `REPRESNO` (`REPRESNO`),
  KEY `EFFECTID` (`EFFECTID`),
  KEY `FACTORID` (`FACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `factor`
--

DROP TABLE IF EXISTS `factor`;
CREATE TABLE IF NOT EXISTS `factor` (
  `LABELID` INTEGER NOT NULL,
  `FACTORID` INTEGER DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `STUDYID` INTEGER NOT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `SCALEID` INTEGER DEFAULT NULL,
  `TMETHID` INTEGER DEFAULT NULL,
  `LTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`LABELID`),
  KEY `FACTORID` (`FACTORID`),
  KEY `STUDYID` (`STUDYID`,`FNAME`),
  KEY `TRAITID` (`TRAITID`,`SCALEID`,`TMETHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `georef`
--

DROP TABLE IF EXISTS `georef`;
CREATE TABLE IF NOT EXISTS `georef` (
  `LOCID` INTEGER DEFAULT NULL,
  `LLPN` INTEGER DEFAULT NULL,
  `LAT` double DEFAULT NULL,
  `LON` double DEFAULT NULL,
  `ALT` double DEFAULT NULL,
  KEY `LOCID` (`LOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `germplsm`
--

DROP TABLE IF EXISTS `germplsm`;
CREATE TABLE IF NOT EXISTS `germplsm` (
  `GID` INTEGER NOT NULL,
  `METHN` INTEGER DEFAULT NULL,
  `GNPGS` INTEGER DEFAULT NULL,
  `GPID1` INTEGER DEFAULT NULL,
  `GPID2` INTEGER DEFAULT NULL,
  `GERMUID` INTEGER DEFAULT NULL,
  `LGID` INTEGER DEFAULT NULL,
  `GLOCN` INTEGER DEFAULT NULL,
  `GDATE` INTEGER DEFAULT NULL,
  `GREF` INTEGER DEFAULT NULL,
  `GRPLCE` INTEGER DEFAULT NULL,
  `MGID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`GID`),
  KEY `GLOCN` (`GLOCN`),
  KEY `GPID1` (`GPID1`),
  KEY `GPID2` (`GPID2`),
  KEY `GERMUID` (`GERMUID`),
  KEY `LGID` (`LGID`),
  KEY `METHN` (`METHN`),
  KEY `MGID` (`MGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_labelinfo`
--

DROP TABLE IF EXISTS `ims_labelinfo`;
CREATE TABLE IF NOT EXISTS `ims_labelinfo` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT,
  `LABELINFO_ID` INTEGER NOT NULL,
  `GROUP_PREFIX` varchar(50) DEFAULT NULL,
  `LABELITEMCOUNT` INTEGER DEFAULT NULL,
  PRIMARY KEY (`LABELINFO_ID`),
  KEY `ID` (`ID`),
  KEY `LABELINFO_ID` (`LABELINFO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `ims_label_otherinfo`
--

DROP TABLE IF EXISTS `ims_label_otherinfo`;
CREATE TABLE IF NOT EXISTS `ims_label_otherinfo` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT,
  `OTHERINFO_ID` INTEGER NOT NULL,
  `LABELINFO_ID` INTEGER DEFAULT NULL,
  `GROUP_PREFIX` varchar(50) DEFAULT NULL,
  `TABLENAME` varchar(50) DEFAULT NULL,
  `FIELDNAME` varchar(50) DEFAULT NULL,
  `FOREIGN_FIELDNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OTHERINFO_ID`),
  KEY `ID` (`ID`),
  KEY `LABELINFO_ID` (`LABELINFO_ID`),
  KEY `OTHERINFO_ID` (`OTHERINFO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `ims_lot`
--

DROP TABLE IF EXISTS `ims_lot`;
CREATE TABLE IF NOT EXISTS `ims_lot` (
  `LOTID` INTEGER DEFAULT NULL,
  `USERID` INTEGER DEFAULT NULL,
  `ETYPE` varchar(15) DEFAULT NULL,
  `EID` INTEGER DEFAULT NULL,
  `LOCID` INTEGER DEFAULT NULL,
  `SCALEID` INTEGER DEFAULT NULL,
  `STATUS` INTEGER DEFAULT NULL,
  `SOURCEID` INTEGER DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  KEY `EID` (`EID`),
  KEY `LOCID` (`LOCID`),
  KEY `LOTID` (`LOTID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `SOURCEID` (`SOURCEID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ims_transaction`
--

DROP TABLE IF EXISTS `ims_transaction`;
CREATE TABLE IF NOT EXISTS `ims_transaction` (
  `TRNID` INTEGER DEFAULT NULL,
  `USERID` INTEGER DEFAULT NULL,
  `LOTID` INTEGER DEFAULT NULL,
  `TRNDATE` INTEGER DEFAULT NULL,
  `TRNSTAT` INTEGER DEFAULT NULL,
  `TRNQTY` double DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `CMTDATA` INTEGER DEFAULT NULL,
  `SOURCETYPE` varchar(12) DEFAULT NULL,
  `SOURCEID` INTEGER DEFAULT NULL,
  `RECORDID` INTEGER DEFAULT NULL,
  `PREVAMOUNT` double DEFAULT NULL,
  `PERSONID` INTEGER DEFAULT NULL,
  KEY `LOTID` (`LOTID`),
  KEY `PERSONID` (`PERSONID`),
  KEY `RECORDID` (`RECORDID`),
  KEY `SOURCEID` (`SOURCEID`),
  KEY `TRNID` (`TRNID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institut`
--

DROP TABLE IF EXISTS `institut`;
CREATE TABLE IF NOT EXISTS `institut` (
  `INSTITID` INTEGER NOT NULL,
  `PINSID` INTEGER NOT NULL,
  `INSNAME` varchar(150) NOT NULL,
  `INSACR` varchar(20) NOT NULL,
  `INSTYPE` INTEGER NOT NULL,
  `STREET` varchar(125) NOT NULL,
  `POSTBOX` varchar(25) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATEID` INTEGER DEFAULT NULL,
  `CPOSTAL` varchar(10) NOT NULL,
  `CNTRYID` INTEGER NOT NULL,
  `APHONE` varchar(25) NOT NULL,
  `AFAX` varchar(25) NOT NULL,
  `AEMAIL` varchar(40) NOT NULL,
  `WEBURL` varchar(60) NOT NULL,
  `SINS` INTEGER NOT NULL,
  `EINS` INTEGER NOT NULL,
  `ICHANGE` INTEGER NOT NULL,
  PRIMARY KEY (`INSTITID`),
  KEY `CNTRYID` (`CNTRYID`),
  KEY `PINSID` (`PINSID`),
  KEY `STATEID` (`STATEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instln`
--

DROP TABLE IF EXISTS `instln`;
CREATE TABLE IF NOT EXISTS `instln` (
  `INSTALID` INTEGER NOT NULL,
  `ADMIN` INTEGER NOT NULL,
  `UDATE` INTEGER NOT NULL,
  `UGID` INTEGER NOT NULL,
  `ULOCN` INTEGER NOT NULL,
  `UCID` INTEGER DEFAULT NULL,
  `UNID` INTEGER DEFAULT NULL,
  `UAID` INTEGER DEFAULT NULL,
  `ULDID` INTEGER DEFAULT NULL,
  `UMETHN` INTEGER NOT NULL,
  `UFLDNO` INTEGER NOT NULL,
  `UREFNO` INTEGER NOT NULL,
  `UPID` INTEGER DEFAULT NULL,
  `IDESC` varchar(255) DEFAULT NULL,
  `ULISTID` INTEGER DEFAULT NULL,
  `DMS_STATUS` INTEGER NOT NULL,
  `ULRECID` INTEGER DEFAULT NULL,
  KEY `INSTALID` (`INSTALID`),
  KEY `ADMIN` (`ADMIN`),
  KEY `UCID` (`UCID`),
  KEY `UAID` (`UAID`),
  KEY `UGID` (`UGID`),
  KEY `ULDID` (`ULDID`),
  KEY `UNID` (`UNID`),
  KEY `UPID` (`UPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_accession`
--

DROP TABLE IF EXISTS `i_accession`;
CREATE TABLE IF NOT EXISTS `i_accession` (
  `ACCID` varchar(50) DEFAULT NULL,
  `CULTNAME` varchar(50) DEFAULT NULL,
  `ALTNAME` varchar(50) DEFAULT NULL,
  `DERVNAME` varchar(50) DEFAULT NULL,
  `CROSS` varchar(50) DEFAULT NULL,
  `DNRNO` varchar(50) DEFAULT NULL,
  `ALTERID` varchar(50) DEFAULT NULL,
  `SRCACC` varchar(50) DEFAULT NULL,
  `SPECIES` varchar(50) DEFAULT NULL,
  `METHA` INTEGER DEFAULT NULL,
  `METHS` INTEGER DEFAULT NULL,
  `AORIG` INTEGER DEFAULT NULL,
  `BORIG` INTEGER DEFAULT NULL,
  `ADATE` varchar(50) DEFAULT NULL,
  `SDATE` varchar(50) DEFAULT NULL,
  `COLLID` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `COLLENV` varchar(50) DEFAULT NULL,
  `MISSCDE` varchar(50) DEFAULT NULL,
  `DNRID` varchar(50) DEFAULT NULL,
  `DNRCTY` varchar(50) DEFAULT NULL,
  `RECNO` INTEGER DEFAULT NULL,
  `GID` INTEGER DEFAULT NULL,
  UNIQUE KEY `RECNO` (`RECNO`),
  KEY `ALTERID` (`ALTERID`),
  KEY `DNRID` (`DNRID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_bchist`
--

DROP TABLE IF EXISTS `i_bchist`;
CREATE TABLE IF NOT EXISTS `i_bchist` (
  `BCID` varchar(50) DEFAULT NULL,
  `FEMALE_ORIG` varchar(50) DEFAULT NULL,
  `FEMALE` varchar(50) DEFAULT NULL,
  `MALE_ORIG` varchar(50) DEFAULT NULL,
  `MALE` varchar(50) DEFAULT NULL,
  `METHOD` INTEGER DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `DATE` INTEGER DEFAULT NULL,
  `RECNO` INTEGER DEFAULT NULL,
  `GID` INTEGER DEFAULT NULL,
  KEY `BCID` (`BCID`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i_cultlist`
--

DROP TABLE IF EXISTS `i_cultlist`;
CREATE TABLE IF NOT EXISTS `i_cultlist` (
  `NAME` varchar(50) DEFAULT NULL,
  `NTYPE` INTEGER DEFAULT NULL,
  `DATE` INTEGER DEFAULT NULL,
  `LOCATION` INTEGER DEFAULT NULL,
  `METHOD` INTEGER DEFAULT NULL,
  `CROSS` varchar(150) DEFAULT NULL,
  `CROSSDATE` INTEGER DEFAULT NULL,
  `ALTNAME` varchar(50) DEFAULT NULL,
  `ANTYPE` INTEGER DEFAULT NULL,
  `RECNO` INTEGER DEFAULT NULL,
  `GID` INTEGER DEFAULT NULL,
  KEY `NAME` (`NAME`),
  KEY `GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
CREATE TABLE IF NOT EXISTS `levels` (
  `LEVELNO` INTEGER NOT NULL,
  `FACTORID` INTEGER NOT NULL,
  PRIMARY KEY (`LEVELNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_c`
--

DROP TABLE IF EXISTS `level_c`;
CREATE TABLE IF NOT EXISTS `level_c` (
  `LABELID` INTEGER DEFAULT NULL,
  `FACTORID` INTEGER DEFAULT NULL,
  `LEVELNO` INTEGER DEFAULT NULL,
  `LVALUE` varchar(255) DEFAULT NULL,
  KEY `LABELID` (`LABELID`),
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`),
  KEY `FACTORID_3` (`FACTORID`,`LVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_n`
--

DROP TABLE IF EXISTS `level_n`;
CREATE TABLE IF NOT EXISTS `level_n` (
  `LABELID` INTEGER DEFAULT NULL,
  `FACTORID` INTEGER DEFAULT NULL,
  `LEVELNO` INTEGER DEFAULT NULL,
  `LVALUE` double DEFAULT NULL,
  KEY `LABELID` (`LABELID`),
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`,`LVALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level_t`
--

DROP TABLE IF EXISTS `level_t`;
CREATE TABLE IF NOT EXISTS `level_t` (
  `FACTORID` INTEGER DEFAULT NULL,
  `LEVELNO` INTEGER DEFAULT NULL,
  `LVALUE` text,
  `LABELID` INTEGER DEFAULT NULL,
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `FACTORID_2` (`FACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listdata`
--

DROP TABLE IF EXISTS `listdata`;
CREATE TABLE IF NOT EXISTS `listdata` (
  `LISTID` INTEGER NOT NULL,
  `GID` INTEGER DEFAULT NULL,
  `ENTRYID` INTEGER NOT NULL,
  `ENTRYCD` varchar(47) DEFAULT NULL,
  `SOURCE` varchar(255) DEFAULT NULL,
  `DESIG` varchar(255) DEFAULT NULL,
  `GRPNAME` varchar(255) DEFAULT NULL,
  `LRSTATUS` INTEGER DEFAULT NULL,
  `LRECID` INTEGER NOT NULL,
  `LLRECID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`LISTID`,`LRECID`),
  KEY `ENTRYCD` (`ENTRYCD`),
  KEY `ENTRYID` (`ENTRYID`),
  KEY `GID` (`GID`),
  KEY `LISTID` (`LISTID`,`GID`,`LRSTATUS`),
  KEY `LISTID_2` (`LISTID`,`ENTRYID`,`LRSTATUS`),
  KEY `LISTID_3` (`LISTID`),
  KEY `SOURCE` (`SOURCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listnms`
--

DROP TABLE IF EXISTS `listnms`;
CREATE TABLE IF NOT EXISTS `listnms` (
  `LISTID` INTEGER NOT NULL,
  `LISTNAME` varchar(47) NOT NULL,
  `LISTDATE` INTEGER DEFAULT NULL,
  `LISTTYPE` varchar(7) NOT NULL DEFAULT 'LST',
  `LISTUID` INTEGER DEFAULT NULL,
  `LISTDESC` varchar(255) DEFAULT NULL,
  `LISTSTATUS` INTEGER DEFAULT NULL,
  `LHIERARCHY` INTEGER DEFAULT NULL,
  PRIMARY KEY (`LISTID`),
  UNIQUE KEY `LISTID_2` (`LISTID`),
  KEY `LISTID` (`LISTID`,`LHIERARCHY`),
  KEY `LISTUID` (`LISTUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `LOCID` INTEGER NOT NULL,
  `LTYPE` INTEGER DEFAULT NULL,
  `NLLP` INTEGER DEFAULT NULL,
  `LNAME` varchar(60) DEFAULT NULL,
  `LABBR` varchar(8) DEFAULT NULL,
  `SNL3ID` INTEGER DEFAULT NULL,
  `SNL2ID` INTEGER DEFAULT NULL,
  `SNL1ID` INTEGER DEFAULT NULL,
  `CNTRYID` INTEGER DEFAULT NULL,
  `LRPLCE` INTEGER DEFAULT NULL,
  PRIMARY KEY (`LOCID`),
  KEY `CNTRYID` (`CNTRYID`),
  KEY `SNL1ID` (`SNL1ID`),
  KEY `SNL2ID` (`SNL2ID`),
  KEY `SNL3ID` (`SNL3ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locdes`
--

DROP TABLE IF EXISTS `locdes`;
CREATE TABLE IF NOT EXISTS `locdes` (
  `LDID` INTEGER DEFAULT NULL,
  `LOCID` INTEGER NOT NULL,
  `DTYPE` INTEGER NOT NULL,
  `DUID` INTEGER NOT NULL,
  `DVAL` varchar(255) DEFAULT NULL,
  `DDATE` INTEGER DEFAULT NULL,
  `DREF` INTEGER DEFAULT NULL,
  KEY `DTYPE` (`DTYPE`),
  KEY `DUID` (`DUID`),
  KEY `LOCID` (`LOCID`),
  KEY `LDID` (`LDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
CREATE TABLE IF NOT EXISTS `methods` (
  `MID` INTEGER NOT NULL,
  `MTYPE` varchar(3) DEFAULT NULL,
  `MGRP` varchar(3) DEFAULT NULL,
  `MCODE` varchar(8) DEFAULT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `MDESC` varchar(255) DEFAULT NULL,
  `MREF` INTEGER DEFAULT NULL,
  `MPRGN` INTEGER DEFAULT NULL,
  `MFPRG` INTEGER DEFAULT NULL,
  `MATTR` INTEGER DEFAULT NULL,
  `GENEQ` INTEGER DEFAULT NULL,
  `MUID` INTEGER DEFAULT NULL,
  `LMID` INTEGER DEFAULT NULL,
  `MDATE` INTEGER DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `LMID` (`LMID`),
  KEY `MCODE` (`MCODE`),
  KEY `MUID` (`MUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
CREATE TABLE IF NOT EXISTS `names` (
  `NID` INTEGER DEFAULT NULL,
  `GID` INTEGER DEFAULT NULL,
  `NTYPE` INTEGER DEFAULT NULL,
  `NSTAT` INTEGER DEFAULT NULL,
  `NUID` INTEGER DEFAULT NULL,
  `NVAL` varchar(255) DEFAULT NULL,
  `NLOCN` INTEGER DEFAULT NULL,
  `NDATE` INTEGER DEFAULT NULL,
  `NREF` INTEGER DEFAULT NULL,
  KEY `GID` (`GID`),
  KEY `NID` (`NID`),
  KEY `NLOCN` (`NLOCN`),
  KEY `NTYPE` (`NTYPE`),
  KEY `NUID` (`NUID`),
  KEY `NVAL` (`NVAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `obsunit`
--

DROP TABLE IF EXISTS `obsunit`;
CREATE TABLE IF NOT EXISTS `obsunit` (
  `OUNITID` INTEGER NOT NULL,
  `EFFECTID` INTEGER NOT NULL,
  PRIMARY KEY (`OUNITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oindex`
--

DROP TABLE IF EXISTS `oindex`;
CREATE TABLE IF NOT EXISTS `oindex` (
  `OUNITID` INTEGER DEFAULT NULL,
  `FACTORID` INTEGER DEFAULT NULL,
  `LEVELNO` INTEGER DEFAULT NULL,
  `REPRESNO` INTEGER DEFAULT NULL,
  KEY `FACTORID` (`FACTORID`,`LEVELNO`),
  KEY `OUNITID` (`OUNITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `PERSONID` INTEGER NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(50) NOT NULL,
  `IONAME` varchar(15) NOT NULL,
  `INSTITID` INTEGER NOT NULL,
  `PTITLE` varchar(25) NOT NULL,
  `PONAME` varchar(50) NOT NULL,
  `PLANGU` INTEGER NOT NULL,
  `PPHONE` varchar(20) NOT NULL,
  `PEXTENT` varchar(20) NOT NULL,
  `PFAX` varchar(20) NOT NULL,
  `PEMAIL` varchar(40) NOT NULL,
  `PROLE` INTEGER NOT NULL,
  `SPERSON` INTEGER NOT NULL,
  `EPERSON` INTEGER NOT NULL,
  `PSTATUS` INTEGER NOT NULL,
  `PNOTES` text,
  `CONTACT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONID`),
  KEY `INSTITID` (`INSTITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `progntrs`
--

DROP TABLE IF EXISTS `progntrs`;
CREATE TABLE IF NOT EXISTS `progntrs` (
  `GID` INTEGER DEFAULT NULL,
  `PNO` INTEGER DEFAULT NULL,
  `PID` INTEGER DEFAULT NULL,
  KEY `GID` (`GID`),
  KEY `PID` (`PID`),
  KEY `PNO` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reflinks`
--

DROP TABLE IF EXISTS `reflinks`;
CREATE TABLE IF NOT EXISTS `reflinks` (
  `BREFLID` INTEGER NOT NULL,
  `BTABLE` INTEGER NOT NULL,
  `BRECORD` INTEGER NOT NULL,
  KEY `BREFLID` (`BREFLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `represtn`
--

DROP TABLE IF EXISTS `represtn`;
CREATE TABLE IF NOT EXISTS `represtn` (
  `REPRESNO` INTEGER NOT NULL,
  `EFFECTID` INTEGER NOT NULL,
  `REPRESNAME` varchar(150) NOT NULL,
  PRIMARY KEY (`REPRESNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
CREATE TABLE IF NOT EXISTS `scale` (
  `SCALEID` INTEGER NOT NULL,
  `SCNAME` varchar(50) DEFAULT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `SCTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCALEID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TRAITID` (`TRAITID`,`SCNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scalecon`
--

DROP TABLE IF EXISTS `scalecon`;
CREATE TABLE IF NOT EXISTS `scalecon` (
  `SCALEID` INTEGER NOT NULL,
  `SLEVEL` double NOT NULL,
  `ELEVEL` double NOT NULL,
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scaledis`
--

DROP TABLE IF EXISTS `scaledis`;
CREATE TABLE IF NOT EXISTS `scaledis` (
  `SCALEID` INTEGER NOT NULL,
  `VALUE` varchar(10) NOT NULL,
  `VALDESC` varchar(255) NOT NULL,
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scaletab`
--

DROP TABLE IF EXISTS `scaletab`;
CREATE TABLE IF NOT EXISTS `scaletab` (
  `SCALEID` INTEGER NOT NULL,
  `SSQL` varchar(250) NOT NULL,
  `SMODULE` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scale_bak`
--

DROP TABLE IF EXISTS `scale_bak`;
CREATE TABLE IF NOT EXISTS `scale_bak` (
  `SCALEID` INTEGER NOT NULL,
  `SCNAME` varchar(30) DEFAULT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `SCTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCALEID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TRAITID` (`TRAITID`,`SCNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `steffect`
--

DROP TABLE IF EXISTS `steffect`;
CREATE TABLE IF NOT EXISTS `steffect` (
  `EFFECTID` INTEGER NOT NULL,
  `STUDYID` INTEGER NOT NULL,
  `EFFECTNAME` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
CREATE TABLE IF NOT EXISTS `study` (
  `STUDYID` INTEGER NOT NULL,
  `SNAME` varchar(50) DEFAULT NULL,
  `PMKEY` INTEGER DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `OBJECTIV` text,
  `INVESTID` INTEGER DEFAULT NULL,
  `STYPE` varchar(1) DEFAULT NULL,
  `SDATE` INTEGER DEFAULT NULL,
  `EDATE` INTEGER DEFAULT NULL,
  `USERID` INTEGER DEFAULT NULL,
  `SSTATUS` INTEGER DEFAULT '1',
  `SHIERARCHY` INTEGER DEFAULT NULL,
  PRIMARY KEY (`STUDYID`),
  KEY `INVESTID` (`INVESTID`),
  KEY `PMKEY` (`PMKEY`),
  KEY `SNAME` (`SNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tmethod`
--

DROP TABLE IF EXISTS `tmethod`;
CREATE TABLE IF NOT EXISTS `tmethod` (
  `TMETHID` INTEGER NOT NULL,
  `TMNAME` varchar(50) DEFAULT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `TMABBR` varchar(6) DEFAULT NULL,
  `TMDESC` text,
  PRIMARY KEY (`TMETHID`),
  KEY `TMETHID` (`TMETHID`),
  KEY `TRAITID` (`TRAITID`,`TMNAME`),
  KEY `TRAITID_2` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trait`
--

DROP TABLE IF EXISTS `trait`;
CREATE TABLE IF NOT EXISTS `trait` (
  `TID` INTEGER DEFAULT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `TRNAME` varchar(50) DEFAULT NULL,
  `TRABBR` varchar(6) DEFAULT NULL,
  `TRDESC` text,
  `SCALEID` INTEGER DEFAULT NULL,
  `TMETHID` INTEGER DEFAULT NULL,
  `TNSTAT` INTEGER DEFAULT NULL,
  KEY `TMETHID` (`TMETHID`),
  KEY `SCALEID` (`SCALEID`),
  KEY `TID` (`TID`),
  KEY `TRAITID` (`TRAITID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `udflds`
--

DROP TABLE IF EXISTS `udflds`;
CREATE TABLE IF NOT EXISTS `udflds` (
  `FLDNO` INTEGER NOT NULL,
  `FTABLE` varchar(24) DEFAULT NULL,
  `FTYPE` varchar(12) DEFAULT NULL,
  `FCODE` varchar(50) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FFMT` varchar(255) DEFAULT NULL,
  `FDESC` varchar(255) DEFAULT NULL,
  `LFLDNO` INTEGER DEFAULT NULL,
  `FUID` INTEGER DEFAULT NULL,
  `FDATE` INTEGER DEFAULT NULL,
  `SCALEID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`FLDNO`),
  KEY `FCODE` (`FCODE`),
  KEY `FUID` (`FUID`),
  KEY `SCALEID` (`SCALEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `USERID` INTEGER NOT NULL,
  `INSTALID` INTEGER DEFAULT NULL,
  `USTATUS` INTEGER DEFAULT NULL,
  `UACCESS` INTEGER DEFAULT NULL,
  `UTYPE` INTEGER DEFAULT NULL,
  `UNAME` varchar(30) DEFAULT NULL,
  `UPSWD` varchar(10) DEFAULT NULL,
  `PERSONID` INTEGER DEFAULT NULL,
  `ADATE` INTEGER DEFAULT NULL,
  `CDATE` INTEGER DEFAULT NULL,
  PRIMARY KEY (`USERID`),
  KEY `INSTALID` (`INSTALID`),
  KEY `PERSONID` (`PERSONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variate`
--

DROP TABLE IF EXISTS `variate`;
CREATE TABLE IF NOT EXISTS `variate` (
  `VARIATID` INTEGER NOT NULL,
  `VNAME` varchar(50) DEFAULT NULL,
  `STUDYID` INTEGER DEFAULT NULL,
  `VTYPE` varchar(2) DEFAULT NULL,
  `TRAITID` INTEGER DEFAULT NULL,
  `SCALEID` INTEGER DEFAULT NULL,
  `TMETHID` INTEGER DEFAULT NULL,
  `DTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`VARIATID`),
  KEY `STUDYID` (`STUDYID`,`VNAME`),
  KEY `TRAITID` (`TRAITID`,`SCALEID`,`TMETHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `veffect`
--

DROP TABLE IF EXISTS `veffect`;
CREATE TABLE IF NOT EXISTS `veffect` (
  `REPRESNO` INTEGER NOT NULL,
  `VARIATID` INTEGER DEFAULT NULL,
  KEY `REPRESNO` (`REPRESNO`),
  KEY `VARIATID` (`VARIATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
