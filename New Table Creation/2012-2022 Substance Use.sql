USE `SuspensionData`;

#Next steps were to create the table again, do the data inload stuff, then update everything below. 
CREATE TABLE `SusTotal`
(
	AcademicYear varchar(100)
	,AggregateLevel	varchar(100)
    ,CountyCode varchar(100)
	,DistrictCode varchar(100)
    , SchoolCode varchar(100)
	, CountyName varchar(100)
    , DistrictName varchar(100)
    , SchoolName varchar(100)	
    , CharterYN	varchar(100)
    , ReportingCategory	varchar(100)
    , CumulativeEnrollment INT
	, TotalSuspensions INT
    , Unduplicated_Students_Suspended INT
	, Unduplicated_Defiance_Students INT
    , SuspensionRate DOUBLE(8,4)
	, ViolentIncident_Injury INT
	, ViolentIncident_NoInjury INT
    , WeaponsPossession INT	
    , Drug_Related INT
	, DefianceTotal INT
	, Other_Reasons INT);

#Loading 2012-2022 Data
LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2022.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

USE `SuspensionData`; 

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2021.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2020.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2019.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2018.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2017.csv'
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2016.csv'
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2015.csv'
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2014.csv'
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2013.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/Suspension New Import/CSV Final Import/2012.csv' 
INTO TABLE `SusTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\';

#34million rows
SELECT count(*) FROM `SusTotal`;

#Changing dates to years for more analysis
UPDATE `SusTotal`
SET `AcademicYear` = 
	CASE
		WHEN `AcademicYear` = '2011-12' THEN '2011-01-08'
        WHEN `AcademicYear` = '2012-13' THEN '2012-01-08'
        WHEN `AcademicYear` = '2013-14' THEN '2013-01-08'
        WHEN `AcademicYear` = '2014-15' THEN '2014-01-08'
        WHEN `AcademicYear` = '2015-16' THEN '2015-01-08'
        WHEN `AcademicYear` = '2016-17' THEN '2016-01-08'
        WHEN `AcademicYear` = '2017-18' THEN '2017-01-08'
        WHEN `AcademicYear` = '2018-19' THEN '2018-01-08'
        WHEN `AcademicYear` = '2019-20' THEN '2019-01-08'
        WHEN `AcademicYear` = '2020-21' THEN '2020-01-08'
        WHEN `AcademicYear` = '2021-22' THEN '2021-01-08'
        ELSE AcademicYear
        END;
        
SELECT `AcademicYear`, COUNT(`AcademicYear`)
FROM `SusTotal`
GROUP BY `AcademicYear`;

DELETE FROM `SusTotal` WHERE `AcademicYear` = 'AcademicYear';
        
UPDATE `SusTotal`
SET `AcademicYear` = STR_TO_DATE(`AcademicYear`, '%Y-%d-%m');

SELECT * FROM `SusTotal`;

DROP TABLE `SusTotal`;

#readability of data for reporting categories 
UPDATE `SusTotal`
	SET `ReportingCategory` = Case `Reportingcategory`
		WHEN 'RB' THEN 'African American'
		WHEN 'RI' THEN 'American Indian or Alaska Native'
		WHEN 'RA' THEN 'Asian'
		WHEN 'RF' THEN 'Filipino'
		WHEN 'RD' THEN 'Not Reported'
		WHEN 'RH' Then 'Hispanic or Latino'
		WHEN 'RP' Then 'Pacific Islander'
		WHEN 'RT' THEN 'Two or More Races'
		WHEN 'RW' THEN 'White'
		WHEN 'GM' THEN 'Male'
		WHEN 'GF' THEN 'Female'
		WHEN 'GX' THEN 'Non-Binary Gender'
		WHEN 'GZ' THEN 'Missing Gender'
		WHEN 'SE' THEN 'English Learners'
		WHEN 'SD' THEN 'Students with Disabilities'
		WHEN 'SS' THEN 'Socioeconomically Disadvantaged'
		WHEN 'SM' THEN 'Migrant'
		WHEN 'SF' THEN 'Foster'
		WHEN 'SH' THEN 'Homeless'
		WHEN 'TA' THEN 'Total'
        	ELSE ReportingCategory
		END;
        
#Continuity of Archie Williams
UPDATE `SusTotal`
SET `SchoolName` = 'Archie Williams High'
WHERE `SchoolName` = 'Sir Francis Drake High';