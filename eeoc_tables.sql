use EEOC_db;
CREATE TABLE `EEOC_Asian` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `EEOC_Female` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `EEOC_Manager` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `EEOC_Professional` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `EEOC_White` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `EEOC_Male` (
  `company` text,
  `year` int(11) DEFAULT NULL,
  `race` text,
  `gender` text,
  `job_category` text,
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1







