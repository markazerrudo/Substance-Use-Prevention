USE `SUSDATA`;

UPDATE `SusDataTotal`
SET `AcademicYear` = 
	CASE
		WHEN `AcademicYear` = '8-1-2018' THEN '2018-08-01'
        WHEN `AcademicYear` = '8-1-2019' THEN '2019-08-01'
        WHEN `AcademicYear` = '8-1-2020' THEN '2020-08-01'
		WHEN `AcademicYear` = '8-1-2021' THEN '2021-08-01'
        ELSE AcademicYear
        END;

UPDATE `SusDataTotal`
SET `AcademicYear` = STR_TO_DATE(AcademicYear, '%Y-%d-%m');


CREATE VIEW County_Marin_Suspensions AS
SELECT * FROM `SusDataTotal`
WHERE `CountyName` = 'Marin' 
	AND `AggregateLevel` = 'C' 
ORDER BY `AcademicYear`,`ReportingCategory`;

SELECT * FROM County_Marin_Suspensions;

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
    WHEN 'SD' THEN 'Studnets iwth Disabilities'
    WHEN 'SS' THEN 'Socioeconomically Disadvantaged'
    WHEN 'SM' THEN 'Migrant'
    WHEN 'SF' THEN 'Foster'
    WHEN 'SH' THEN 'Homeless'
    WHEN 'TA' THEN 'Total'
    ELSE ReportingCategory
    END;
    
CREATE VIEW District_Marin_Suspensions AS
SELECT * FROM `SusDataTotal`
WHERE `CountyName` = 'Marin' 
	AND `AggregateLevel` = 'D' 
ORDER BY `AcademicYear`,`ReportingCategory`;

SELECT * FROM District_Marin_Suspensions;

CREATE VIEW Schools_Marin_Suspensions AS
SELECT * FROM `SusDataTotal`
WHERE `CountyName` = 'Marin' 
	AND `AggregateLevel` = 'S' 
ORDER BY `AcademicYear`,`ReportingCategory`;

SELECT * FROM Schools_Marin_Suspensions;

SELECT * FROM `SusDataTotal`
ORDER BY `AcademicYear`;