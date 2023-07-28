USE `Suspension data`;

SELECT * FROM `SusData`;

CREATE TABLE `SusData`
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
    
    LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/suspension_data.csv' INTO TABLE `SusData`
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
     LINES
        STARTING BY '2021-22'
        TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    LOAD DATA LOCAL INFILE '/Users/markzerrudo/Desktop/untitled folder/2020_21 Suspension Data.csv' INTO TABLE `SusData`
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
     LINES
        STARTING BY '2020-2021'
        TERMINATED BY '\r\n'
    IGNORE 1 LINES;

#Gender Level Information
    #VIEW OF MALE SUSPENSION RATES BY COUNTY
    SELECT * FROM MaleSuspension;
    
    CREATE VIEW MaleSuspension AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'GM';
    
    #VIEW OF MALE SUSPENSION RATES BY District
    SELECT * FROM FemaleSuspension;
    
    CREATE VIEW FemaleSuspension AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'GF';
    
    #VIEW OF NON-BINARY GX COUNTY
    SELECT * FROM Non_BinarySuspension;
    
	CREATE VIEW Non_BinarySuspension AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'GX';
    
    DROP VIEW MaleSuspension, FemaleSuspension, Non_BinarySuspension;
    
    #VIEW OF SS = Socioeconomically Disadvantaged
    SELECT * FROM SS_Suspensions; 
    
	#Race level information below
    #VIEW OF RW = WHITE School level
	SELECT * FROM White_Suspensions; 
    
    #VIEW OF RB = African American School level
    SELECT * FROM AfricanAmerican;
    CREATE VIEW AfricanAmerican AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RB';
    
    #View of RI = American Indian or Alaska Native School level
    SELECT * FROM American_Indian_Alaskan_Native;
    CREATE VIEW American_Indian_Alaskan_Native AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RI';
    
	#View of RA = Asian School level
    SELECT * FROM Asian;
CREATE VIEW Asian AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RA';
    
	#View of RF = Filipino School level
	SELECT * FROM Filipino;
CREATE VIEW Filipino AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RF';
    
    #View of RH = Hispanic or Latino School level
	SELECT * FROM Hispanic_Latino;
    CREATE VIEW Hispanic_Latino AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RH';
    
    #View of RP = Pacific Islander School level
	SELECT * FROM Pacific_Islander;
    
    CREATE VIEW Pacific_Islander AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'C' AND `ReportingCategory` = 'RP';
    
    #View of RT = Two or More Races School level
 	SELECT * FROM Two_or_more_races;
    CREATE VIEW Two_or_more_races AS
    SELECT DISTINCT DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RT';
    
    
    
    
    
    
    
    
    #County Level RAcial Data
    #Race level information below
    SELECT * FROM Total
    LIMIT 3000;
    
    CREATE VIEW Total AS (
    
    SELECT DISTINCT 
    CountyName, 
    DistrictName, 
    SchoolName, 
    CharterYN, 
    ReportingCategory, 
    CumulativeEnrollment, 
    TotalSuspensions, 
    TotalSusStudents, 
    TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C'
    LIMIT 3000
    );
    
    #VIEW OF RW = WHITE County level
	SELECT * FROM White_Suspensions_county;
    
    CREATE VIEW White_Suspensions_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RW';
    
    #VIEW OF RB = African American School level
    SELECT * FROM AfricanAmerican_county;
    
    CREATE VIEW AfricanAmerican_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RB';
    
    #View of RI = American Indian or Alaska Native School level
    SELECT * FROM American_Indian_Alaskan_Native_county;
    
    CREATE VIEW American_Indian_Alaskan_Native_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RI';
    
    
	#View of RA = Asian School level
    SELECT * FROM Asian_county;
    
	CREATE VIEW Asian_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RA';
    
	#View of RF = Filipino School level
	SELECT * FROM Filipino_county;
    
	CREATE VIEW Filipino_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RF';
    
    #View of RH = Hispanic or Latino School level
	SELECT * FROM Hispanic_Latino_county;
    
    CREATE VIEW Hispanic_Latino_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RH';
    
    #View of RP = Pacific Islander School level
	SELECT * FROM Pacific_Islander_county;
    
    CREATE VIEW Pacific_Islander_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RP';
    
    #View of RT = Two or More Races School level
 	SELECT * FROM Two_or_more_races_county;
    
    CREATE VIEW Two_or_more_races_county AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `AggregateLevel` = 'C' AND `ReportingCategory` = 'RT';
    
    #Socially economically disadvantaged school level
    SELECT * FROM soc_disadvantaged;
    
    CREATE VIEW soc_disadvantaged AS
    SELECT DISTINCT CountyName, DistrictName, SchoolName, CharterYN, ReportingCategory, CumulativeEnrollment, TotalSuspensions, TotalSusStudents, TotalDefiance, SuspensionRate, SuspensionViolent_Injury, NonInjury_Violent_Suspension, Weapon_possession_suspension, Drug_Suspensino_Defiance, Other_Suspension_Reason  FROM `SusData`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'SS';
    
