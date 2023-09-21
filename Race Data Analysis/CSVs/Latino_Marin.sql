CREATE TABLE `LatinoHispanic_Marin` AS
(SELECT * 
FROM `SusTotal`
WHERE 
	`CountyName` = 'Marin'
AND `ReportingCategory` = 'Hispanic or Latino'
);


ALTER TABLE `LatinoHispanic_Marin`
ADD COLUMN
(
`DefianceRate` DOUBLE(8,4)
, `ViolentInjuryRate` DOUBLE(8,4)
, `ViolentNonInjuryRate` DOUBLE(8,4)
, `WeaponPossessionRate` DOUBLE(8,4)
, `DrugSuspensionRate` DOUBLE(8,4)
, `OtherSuspensionRate` DOUBLE(8,4)
);


UPDATE `LatinoHispanic_Marin`
		SET 
		`DefianceRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Unduplicated_Defiance_Students`/`TotalSuspensions`) 
			END
		,
		`ViolentInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`ViolentIncident_Injury`/`TotalSuspensions`) 
			END
		,
		`ViolentNonInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`ViolentIncident_NoInjury`/`TotalSuspensions`)
			END
		,
		`WeaponPossessionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`WeaponsPossession`/`TotalSuspensions`) 
			END
		,
		`DrugSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Drug_Related`/`TotalSuspensions`) 
			END
		,
		`OtherSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Other_Reasons`/`TotalSuspensions`) 
            END;


SELECT `AcademicYear`
, `SchoolName`
, `DistrictName`
, `TotalSuspensions`
,`ViolentInjuryRate` 
, `ViolentNonInjuryRate` 
, `WeaponPossessionRate`
, `DrugSuspensionRate`
, `OtherSuspensionRate` 
FROM `LatinoHispanic`
WHERE `TotalSuspensions` < 1;

UPDATE `LatinoHispanic_Marin`
	SET `ViolentInjuryRate` = 0 WHERE `ViolentInjuryRate` IS NULL; 
    
UPDATE `LatinoHispanic_Marin`
	SET `ViolentNonInjuryRate` = 0 WHERE `ViolentNonInjuryRate` IS NULL;  

UPDATE `LatinoHispanic_Marin`
	SET `WeaponPossessionRate` = 0 WHERE `WeaponPossessionRate` IS NULL;  
    
UPDATE `LatinoHispanic_Marin`
	SET `DrugSuspensionRate` = 0 WHERE `DrugSuspensionRate` IS NULL;  

UPDATE `LatinoHispanic_Marin`
	SET `OtherSuspensionRate` = 0 WHERE `OtherSuspensionRate` IS NULL;  
    
UPDATE `LatinoHispanic_Marin`
	SET `DefianceRate` = 0 WHERE `DefianceRate` IS NULL;
    
    
SELECT * 
FROM `LatinoHispanic_Marin`
ORDER BY `SchoolName`;


SELECT COUNT(`SchoolName`), `SchoolName`
FROM `LatinoHispanic_district`
WHERE `CharterYN` = 'No'
AND `AggregateLevel` = 'D'
GROUP BY `SchoolName`
ORDER BY `SchoolName`;

