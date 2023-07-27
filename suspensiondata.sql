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
    
#Hispanic/Latino
SELECT * FROM HispanicLatino;

CREATE VIEW HispanicLatino AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RH';
    
#Pacific Islander
SELECT * FROM PacificIslander; 

CREATE VIEW PacificIslander AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RP';

#Two or More Races
SELECT * FROM TwoOrMore; 

CREATE VIEW TwoOrMore AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RT';

#White Students
SELECT * FROM White; 

CREATE VIEW White AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'RW';

#Total
SELECT * FROM Total; 

CREATE VIEW Total AS
    SELECT DISTINCT * FROM `SusDataTotal`
    WHERE `CountyName` = 'Marin' AND `AggregateLevel` = 'S' AND `ReportingCategory` = 'TA';