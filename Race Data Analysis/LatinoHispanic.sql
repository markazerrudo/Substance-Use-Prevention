#Bruh I might have to recreate everything again
USE `Suspension Data`;

SELECT * FROM `SusDataTotal`
WHERE `AggregateLevel` = 'S'
AND `CountyName`= 'Marin';

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

#Details of suspension rates
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
ORDER BY `AcademicYear` DESC
;

#I'll be using a lot of this sql to create and update a new table. 
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
ADD COLUMN
(
 `SuspensionRate` DOUBLE(8,4)
, `DefianceRate` DOUBLE(8,4)
, `ViolentInjuryRate` DOUBLE(8,4)
, `ViolentNonInjuryRate` DOUBLE(8,4)
, `WeaponPossessionRate` DOUBLE(8,4)
, `DrugSuspensionRate` DOUBLE(8,4)
, `OtherSuspensionRate` DOUBLE(8,4)
);

SELECT `SuspensionRate` FROM `LatinoHispanic`;

UPDATE `LatinoHispanic`
		SET 
		`SuspensionRate` = CASE
			WHEN `CumulativeEnrollment` = 0 THEN NULL
			ELSE (`TotalSusStudents`/`CumulativeEnrollment`) * 100
			END
		,
		`DefianceRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`TotalDefiance`/`TotalSuspensions`) * 100 
			END
		,
		`ViolentInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`SuspensionViolent_Injury`/`TotalSuspensions`) * 100 
			END
		,
		`ViolentNonInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`NonInjury_Violent_Suspension`/`TotalSuspensions`) * 100 
			END
		,
		`WeaponPossessionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Weapon_possession_suspension`/`TotalSuspensions`) * 100 
			END
		,
		`DrugSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Drug_Suspensino_Defiance`/`TotalSuspensions`) * 100 
			END
		,
		`OtherSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Other_Suspension_Reason`/`TotalSuspensions`) * 100 
			END;
		
UPDATE `LatinoHispanic`
SET `TEST_Percentage` = 
							`DefianceRate`
							+ `DefianceRate` 
							+ `ViolentInjuryRate`
							+ `ViolentNonInjuryRate`
							+ `WeaponPossessionRate`
							+ `DrugSuspensionRate`
							+ `OtherSuspensionRate`
							;
                            
SELECT 
`SchoolName`
,`TEST_Percentage`
, `SuspensionRate` 
,`DefianceRate`
, `DefianceRate` 
, `ViolentInjuryRate` 
, `ViolentNonInjuryRate` 
, `WeaponPossessionRate` 
, `DrugSuspensionRate` 
, `OtherSuspensionRate` 
FROM `LatinoHispanic`;

#Next figure out why the percentage rate isn't adding up to 100