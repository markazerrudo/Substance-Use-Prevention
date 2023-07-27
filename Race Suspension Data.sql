SELECT * FROM `SusDataTotal`;

#African American Students
SELECT * FROM AfricanAmerican;

CREATE VIEW AfricanAmerican AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RB';

#American Indian/Alaskan Native
SELECT * FROM American_Indian_Alaskan_Native; 

CREATE VIEW American_Indian_Alaskan_Native AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RI';
    
#Asian Students
SELECT * FROM Asian; 

CREATE VIEW  Asian AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RA';
 
#Filipino Students
SELECT * FROM Filipino; 

CREATE VIEW Filipino AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RF';
    
CREATE VIEW  AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = '';
    
CREATE VIEW  AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = '';
    
CREATE VIEW  AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = '';
    
CREATE VIEW  AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = '';