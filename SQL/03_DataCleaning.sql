-- Add new numeric columns
ALTER TABLE dbo.Sales
ADD
    Sales_fixed DECIMAL(18,4),
    Cost_fixed DECIMAL(18,4),
    Margin_fixed DECIMAL(18,4),
    GrossSales_fixed DECIMAL(18,4);
GO

-- Convert text values to numeric values
UPDATE dbo.Sales
SET
    Sales_fixed = CAST(REPLACE(Sales, ',', '.') AS DECIMAL(18,4)),
    Cost_fixed = CAST(REPLACE(Cost, ',', '.') AS DECIMAL(18,4)),
    Margin_fixed = CAST(REPLACE(Margin, ',', '.') AS DECIMAL(18,4)),
    GrossSales_fixed = CAST(REPLACE(GrossSales, ',', '.') AS DECIMAL(18,4));
GO

-- Validate converted values
SELECT
    SUM(Sales_fixed) AS TotalSales,
    SUM(Cost_fixed) AS TotalCost,
    SUM(Margin_fixed) AS TotalMargin,
    SUM(GrossSales_fixed) AS TotalGrossSales
FROM dbo.Sales;

-- Remove incorrect columns
ALTER TABLE dbo.Sales
DROP COLUMN Sales, Cost, Margin, GrossSales;
GO

-- Rename corrected columns
EXEC sp_rename 'dbo.Sales.Sales_fixed', 'Sales', 'COLUMN';
EXEC sp_rename 'dbo.Sales.Cost_fixed', 'Cost', 'COLUMN';
EXEC sp_rename 'dbo.Sales.Margin_fixed', 'Margin', 'COLUMN';
EXEC sp_rename 'dbo.Sales.GrossSales_fixed', 'GrossSales', 'COLUMN';
GO