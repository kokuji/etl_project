USE `eeoc_db`;

DROP TABLE IF EXISTS `EEOC_Asian`;
CREATE TABLE `EEOC_Asian` (
  `company`  VARCHAR(200),
  `year` int(11) DEFAULT NULL,
  `race` VARCHAR(150),
  `gender` VARCHAR(20),
  `job_category` VARCHAR(200),
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS `EEOC_Female`;
CREATE TABLE `EEOC_Female` (
  `company`  VARCHAR(200),
  `year` int(11) DEFAULT NULL,
  `race` VARCHAR(150),
  `gender` VARCHAR(20),
  `job_category` VARCHAR(200),
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS `EEOC_Manager`;
CREATE TABLE `EEOC_Manager` (
  `company`  VARCHAR(200),
  `year` int(11) DEFAULT NULL,
  `race` VARCHAR(150),
  `gender` VARCHAR(20),
  `job_category` VARCHAR(200),
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL
);

DROP TABLE IF EXISTS `EEOC_Professional`;
CREATE TABLE `EEOC_Professional` (
  `company`  VARCHAR(200),
  `year` int(11) DEFAULT NULL,
  `race` VARCHAR(150),
  `gender` VARCHAR(20),
  `job_category` VARCHAR(200),
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL,
   PRIMARY KEY (`company`, `race`, `gender`)
);

DROP TABLE IF EXISTS `EEOC_White`;
CREATE TABLE `EEOC_White` (
  `company`  VARCHAR(200),
  `year` int(11) DEFAULT NULL,
  `race` VARCHAR(150),
  `gender` VARCHAR(20),
  `job_category` VARCHAR(200),
  `count` int(11) DEFAULT NULL,
  `CA count` int(11) DEFAULT NULL,
   PRIMARY KEY (`company`, `gender`, `job_category`)
);

-- Asian and White counts by gender and job category
select * 
from (
SELECT 
    `EEOC_Asian`.`year`,
    `EEOC_Asian`.`race`,
    `EEOC_Asian`.`gender`,
    `EEOC_Asian`.`job_category`,
    sum(`EEOC_Asian`.`count`) `Silicon Valley Asian Count`,
    `EEOC_Asian`.`CA count` `CA Asian Count`
FROM `eeoc_db`.`EEOC_Asian`
group by
    `EEOC_Asian`.`year`,
    `EEOC_Asian`.`race`,
    `EEOC_Asian`.`gender`,
    `EEOC_Asian`.`job_category`,
    `EEOC_Asian`.`CA count` 
		) `EEOC_Asian`
inner join 
		(
SELECT 
    `EEOC_White`.`year`,
    `EEOC_White`.`race`,
    `EEOC_White`.`gender`,
    `EEOC_White`.`job_category`,
    sum(`EEOC_White`.`count`) `Silicon White Valley Count`,
    `EEOC_White`.`CA count` `CA White Count`
FROM `eeoc_db`.`EEOC_White`
group by
  `EEOC_White`.`year`,
    `EEOC_White`.`race`,
    `EEOC_White`.`gender`,
    `EEOC_White`.`job_category`,
    `EEOC_White`.`CA count`
			) `EEOC_White`
on  `EEOC_Asian`.`gender`= `EEOC_White`.`gender` and `EEOC_Asian`.`job_category`= `EEOC_White`.`job_category`;

-- Professional and Managers by race and gender
select *
from (
SELECT 
    `EEOC_Professional`.`year`,
    `EEOC_Professional`.`race`,
    `EEOC_Professional`.`gender`,
    `EEOC_Professional`.`job_category`,
    SUM(`EEOC_Professional`.`count`) `Silicon Valley Professional Count`,
    `EEOC_Professional`.`CA count` `CA Professional Count`
FROM
    `eeoc_db`.`EEOC_Professional`
GROUP BY `EEOC_Professional`.`year` ,
`EEOC_Professional`.`race` ,
`EEOC_Professional`.`gender` ,
`EEOC_Professional`.`job_category` ,
`EEOC_Professional`.`CA count`
	) `EEOC_Professional`
inner join
	(
SELECT 
    `EEOC_Manager`.`year`,
    `EEOC_Manager`.`race`,
    `EEOC_Manager`.`gender`,
    `EEOC_Manager`.`job_category`,
    SUM(`EEOC_Manager`.`count`) `Silicon Valley Manager Count`,
    `EEOC_Manager`.`CA count` `CA Professional Count`
FROM
    `eeoc_db`.`EEOC_Manager`
GROUP BY `EEOC_Manager`.`year` ,
`EEOC_Manager`.`race` ,
`EEOC_Manager`.`gender` ,
`EEOC_Manager`.`job_category` ,
`EEOC_Manager`.`CA count`
	) `EEOC_Manager`
on `EEOC_Professional`.`race`=`EEOC_Manager`.`race` and `EEOC_Professional`.`gender`=`EEOC_Manager`.`gender`;
