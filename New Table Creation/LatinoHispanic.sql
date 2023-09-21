CREATE TABLE `LatinoHispanic` AS
(SELECT * 
FROM `SusTotal`
WHERE 
	`CountyName` = 'Marin'
AND `AggregateLevel` = 'S'
AND `ReportingCategory` = 'Hispanic or Latino'
);


ALTER TABLE `LatinoHispanic`
ADD COLUMN
(
`DefianceRate` DOUBLE(8,4)
, `ViolentInjuryRate` DOUBLE(8,4)
, `ViolentNonInjuryRate` DOUBLE(8,4)
, `WeaponPossessionRate` DOUBLE(8,4)
, `DrugSuspensionRate` DOUBLE(8,4)
, `OtherSuspensionRate` DOUBLE(8,4)
);


UPDATE `LatinoHispanic`
		SET 
		`DefianceRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Unduplicated_Defiance_Students`/`TotalSuspensions`) * 100 
			END
		,
		`ViolentInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`ViolentIncident_Injury`/`TotalSuspensions`) * 100 
			END
		,
		`ViolentNonInjuryRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`ViolentIncident_NoInjury`/`TotalSuspensions`) * 100 
			END
		,
		`WeaponPossessionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`WeaponsPossession`/`TotalSuspensions`) * 100 
			END
		,
		`DrugSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Drug_Related`/`TotalSuspensions`) * 100 
			END
		,
		`OtherSuspensionRate` = CASE
			WHEN `TotalSuspensions` = 0 THEN NULL
			ELSE (`Other_Reasons`/`TotalSuspensions`) * 100 
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

UPDATE `LatinoHispanic`
	SET `ViolentInjuryRate` = 0 WHERE `ViolentInjuryRate` IS NULL; 
    
UPDATE `LatinoHispanic`
	SET `ViolentNonInjuryRate` = 0 WHERE `ViolentNonInjuryRate` IS NULL;  

UPDATE `LatinoHispanic`
	SET `WeaponPossessionRate` = 0 WHERE `WeaponPossessionRate` IS NULL;  
    
UPDATE `LatinoHispanic`
	SET `DrugSuspensionRate` = 0 WHERE `DrugSuspensionRate` IS NULL;  

UPDATE `LatinoHispanic`
	SET `OtherSuspensionRate` = 0 WHERE `OtherSuspensionRate` IS NULL;  
    
UPDATE `LatinoHispanic`
	SET `DefianceRate` = 0 WHERE `DefianceRate` IS NULL;
    
    
SELECT * 
FROM `LatinoHispanic`
WHERE `CharterYN` = 'No'
ORDER BY `SchoolName`;

SELECT COUNT(`SchoolName`), `SchoolName`
FROM `LatinoHispanic`
WHERE `CharterYN` = 'No'
GROUP BY `SchoolName`
ORDER BY `SchoolName`;

