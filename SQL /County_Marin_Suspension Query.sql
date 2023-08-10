USE `Suspension data`;

#Table Creation for 2018-2021 suspenion data
CREATE TABLE `SusDataTotal`
(
	AcademicYear varchar(255),
    AggregateLevel varchar(255),
    CountyCode varchar(255),
    DistrictCode varchar(255),
    SchoolCode varchar(255),
    CountyName	varchar(255),
    DistrictName varchar(255),
    SchoolName varchar(255),
    CharterYN varchar(255),
    ReportingCategory varchar(255),
    CumulativeEnrollment INT,
    TotalSuspensions INT,
    TotalSusStudents INT,
    TotalDefiance INT,
    SuspensionRate FLOAT,
    SuspensionViolent_Injury INT,
    NonInjury_Violent_Suspension INT,
    Weapon_possession_suspension INT,
    Drug_Suspensino_Defiance INT,
    Other_Suspension_Reason INT
    );
    
#Data Import 
LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/Substance-Use-Prevention/Raw Data/2018-19 Suspension.csv' 
INTO TABLE `SusDataTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/Substance-Use-Prevention/Raw Data/2019-20 Suspension.csv' 
INTO TABLE `SusDataTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/Substance-Use-Prevention/Raw Data/2020-21 Suspension.csv' 
INTO TABLE `SusDataTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/Substance-Use-Prevention/Raw Data/2021-22 Suspension.csv' 
INTO TABLE `SusDataTotal`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
IGNORE 1 LINES;

#Changing varchar to date format. Academic year will be changed to starting date 08-01
UPDATE `SusDataTotal`
SET `AcademicYear` = 
	CASE
		WHEN `AcademicYear` = '2018-19' THEN '2018-08-01'
        WHEN `AcademicYear` = '2019-20' THEN '2019-08-01'
        WHEN `AcademicYear` = '2020-21' THEN '2020-08-01'
        WHEN `AcademicYear` = '2021-22' THEN '2021-08-01'
        ELSE AcademicYear
        END;
        
SELECT `AcademicYear`, COUNT(`AcademicYear`) FROM `SusDataTotal`
GROUP BY `AcademicYear`;

UPDATE `SusDataTotal`
SET `AcademicYear` = STR_TO_DATE(`AcademicYear`, '%Y-%d-%m');

DESCRIBE `SusDataTotal`;

CREATE VIEW County_Marin_Suspensions AS
SELECT * FROM `SusDataTotal`
WHERE `CountyName` = 'Marin' 
	AND `AggregateLevel` = 'C' 
ORDER BY `AcademicYear`,`ReportingCategory`;

SELECT * FROM County_Marin_Suspensions;

CREATE VIEW District_Marin_Suspensions AS
SELECT * FROM `SusDataTotal`
WHERE `CountyName` = 'Marin' 
	AND `AggregateLevel` = 'D' 
ORDER BY `AcademicYear`,`ReportingCategory`;

UPDATE `SusDataTotal`
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

UPDATE `SusDatatotal`
SET `SchoolName` = 'Archie Williams High'
WHERE `SchoolName` = 'Sir Francis Drake high';

#I need to change the academic years to dates as well. 

#I need to change Drake to Archie Willian for continuity August 8th
#Changing from code to actual reporting category name for tableau export