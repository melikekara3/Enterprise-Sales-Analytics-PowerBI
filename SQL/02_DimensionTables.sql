-- Create Region dimension table
CREATE TABLE dbo.DimRegion (
    Region_Code INT PRIMARY KEY,
    Region NVARCHAR(50) NOT NULL
);

-- Insert region values
INSERT INTO dbo.DimRegion (Region_Code, Region)
VALUES
    (3, 'GERMANY'),
    (1, 'JAPAN'),
    (5, 'NORDIC'),
    (0, 'SPAIN'),
    (2, 'UK'),
    (4, 'USA');

-- Fill missing region values in Customers
UPDATE cu
SET cu.Region = r.Region
FROM Customers cu
JOIN DimRegion r
ON cu.Region = r.Region;

-- Add Region_Code column to Cities if it does not exist
IF COL_LENGTH('dbo.Cities', 'Region_Code') IS NULL
BEGIN
    ALTER TABLE dbo.Cities
    ADD Region_Code INT NULL;
END;

-- Populate Region_Code in Cities
UPDATE c
SET c.Region_Code = r.Region_Code
FROM Cities c
JOIN DimRegion r
ON UPPER(LTRIM(RTRIM(c.Region))) = r.Region;

-- Replace blank values with NULL
UPDATE Customers
SET Line_of_Business = NULL
WHERE LTRIM(RTRIM(Line_of_Business)) = '';

-- Trim unnecessary spaces
UPDATE Customers
SET Line_of_Business = LTRIM(RTRIM(Line_of_Business))
WHERE Line_of_Business IS NOT NULL;

-- Create Customer dimension view
IF OBJECT_ID('dbo.DimCustomer', 'V') IS NOT NULL
    DROP VIEW dbo.DimCustomer;
GO

CREATE VIEW dbo.DimCustomer AS
SELECT
    Customer_Number,
    MIN(Customer) AS Customer,
    MIN(Region) AS Region,
    MIN(Region_Code) AS Region_Code
FROM dbo.Customers
GROUP BY Customer_Number;
GO