-- Check data types
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Sales';

-- Validate totals
SELECT
    SUM(Sales) AS TotalSales,
    SUM(Cost) AS TotalCost,
    SUM(Margin) AS TotalMargin,
    SUM(GrossSales) AS TotalGrossSales
FROM dbo.Sales;