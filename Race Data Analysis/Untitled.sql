USE `Suspension Data`;

UPDATE `SusDataTotal`
SET `CharterYN` = 'No' 
WHERE `CharterYN` = 'No ';

CREATE TABLE `LatinoHispanic` AS(
SELECT 
`AcademicYear`
, `CountyName`
, `DistrictName`
, `SchoolName`
, `ReportingCategory`
, `CumulativeEnrollment`
, `TotalSuspensions`
, `TotalSusStudents`
, `TotalDefiance`
, `SuspensionViolent_Injury`
, `NonInjury_Violent_Suspension`
, `Weapon_possession_suspension`
, `Drug_Suspensino_Defiance`
, `Other_Suspension_Reason`
FROM `SusDataTotal`
WHERE 
	`CharterYN` = 'No'
AND
	`ReportingCategory` = 'Hispanic or Latino'
AND
	`CountyName` = 'Marin'
AND 
	`AggregateLevel` = 'S'
    );


SELECT 
`AcademicYear`
,`TotalSusStudents`/`CumulativeEnrollment` * 100 AS `SuspensionRate`
, `SchoolName`
, `ReportingCategory`
, `CumulativeEnrollment`
, `TotalSuspensions`
, `TotalSusStudents`
, `TotalDefiance`
, `SuspensionViolent_Injury`
, `NonInjury_Violent_Suspension`
, `Weapon_possession_suspension`
, `Drug_Suspensino_Defiance`
, `Other_Suspension_Reason`
FROM `LatinoHispanic`
ORDER BY `AcademicYear` DESC;

SELECT 
`AcademicYear`
, `TEST_Percentage`
, `SchoolName`
, `CumulativeEnrollment`
, `TotalSuspensions`
, `TotalSusStudents`
,`TotalSusStudents`/`CumulativeEnrollment` * 100 AS `SuspensionRate`
, `TotalDefiance`
, `TotalDefiance`/`TotalSuspensions` * 100 AS `DefianceRate`
, `SuspensionViolent_Injury`
, `SuspensionViolent_Injury`/`TotalSuspensions` * 100 AS `ViolentInjuryRate`
, `NonInjury_Violent_Suspension`
, `NonInjury_Violent_Suspension`/`TotalSuspensions` * 100 AS `ViolentNonInjuryRate`
, `Weapon_possession_suspension`
, `Weapon_possession_suspension`/`TotalSuspensions` * 100 AS `WeaponPossessionRate`
, `Drug_Suspensino_Defiance`
, `Drug_Suspensino_Defiance`/`TotalSuspensions` * 100 AS `DrugSuspensionRate`
, `Other_Suspension_Reason`
, `Other_Suspension_Reason`/ `TotalSuspensions`* 100 AS `OtherSuspensionRate`
FROM
	`LatinoHispanic`
ORDER BY 
	`AcademicYear`, `SchoolName`;
    
#Below will be sql code to check if the percentages add up to 1. It should return the name of the field if not. 

ALTER TABLE `LatinoHispanic`
ADD 
`TEST_Percentage` Int
,;

WITH CTE_TEST AS
(SELECT 
`AcademicYear`
, `SchoolName`
, `TEST_Percentage`
, `CumulativeEnrollment`
, `TotalSuspensions`
, `TotalSusStudents`
,`TotalSusStudents`/`CumulativeEnrollment` * 100 AS `SuspensionRate`
, `TotalDefiance`
, `TotalDefiance`/`TotalSuspensions` * 100 AS `DefianceRate`
, `SuspensionViolent_Injury`
, `SuspensionViolent_Injury`/`TotalSuspensions` * 100 AS `ViolentInjuryRate`
, `NonInjury_Violent_Suspension`
, `NonInjury_Violent_Suspension`/`TotalSuspensions` * 100 AS `ViolentNonInjuryRate`
, `Weapon_possession_suspension`
, `Weapon_possession_suspension`/`TotalSuspensions` * 100 AS `WeaponPossessionRate`
, `Drug_Suspensino_Defiance`
, `Drug_Suspensino_Defiance`/`TotalSuspensions` * 100 AS `DrugSuspensionRate`
, `Other_Suspension_Reason`
, `Other_Suspension_Reason`/ `TotalSuspensions`* 100 AS `OtherSuspensionRate`
FROM
	`LatinoHispanic`
ORDER BY 
	`AcademicYear`, `SchoolName`
)
CREATE TABLE 
    
#Partition? I need to be able to calculate the sum across rows. 
SELECT 