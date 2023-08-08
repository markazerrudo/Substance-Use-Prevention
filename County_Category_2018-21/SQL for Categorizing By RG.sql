SELECT * FROM `SUSDATATOTAL`;

DESCRIBE `SUSDATATOTAL`;
#DATE HAS ALREADY BEEN SET FOR ACADEMIC YEAR

CREATE VIEW Marin_School_AfricanAmerican AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'African American';

CREATE VIEW Marin_School_AmericanIndian AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'American Indian or Alaska Native';
    
CREATE VIEW Marin_School_Asian AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Asian';

CREATE VIEW Marin_School_Filipino AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Filipino';

CREATE VIEW Marin_School_HispanicLatino AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Hispanic or Latino';

CREATE VIEW Marin_School_2orMoreRaces AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Two or More Races';
    
CREATE VIEW Marin_School_PacificIslander AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Pacific Islander';    

CREATE VIEW Marin_School_White AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'White';    

CREATE VIEW Marin_School_Male AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Male';    

CREATE VIEW Marin_School_Female AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Male'; 

CREATE VIEW Marin_School_NonBinary AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Non-Binary Gender'; 

CREATE VIEW Marin_School_EnglishLearners AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'English Learners'; 

CREATE VIEW Marin_School_StudentsWithDisabilities AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Students with Disabilities'; 


CREATE VIEW Marin_School_SocioEconomicallyDisadvantaged AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Socioeconomically Disadvantaged'; 

CREATE VIEW Marin_School_Migrant
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'English Learners'; 

CREATE VIEW Marin_School_Foster AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Foster'; 

CREATE VIEW Marin_School_Homeless AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Homeless'; 
    

CREATE VIEW Marin_School_Total AS
SELECT * FROM `SUSDATATOTAL`
WHERE 
	`CountyName` = 'Marin' 
    AND `AggregateLevel` = 'S'
    AND `ReportingCategory` = 'Total'; 









