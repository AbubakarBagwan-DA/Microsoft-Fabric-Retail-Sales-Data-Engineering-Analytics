-- =========================================================
-- Retail Sales Data Engineering & Analytics Platform
-- Gold Layer Validation
-- =========================================================

-- 1. Gold table row counts
SELECT 'DimCustomer' AS TableName, COUNT(*) AS RowCount
FROM dbo.DimCustomer

UNION ALL

SELECT 'DimProduct', COUNT(*)
FROM dbo.DimProduct

UNION ALL

SELECT 'DimStore', COUNT(*)
FROM dbo.DimStore

UNION ALL

SELECT 'FactSales', COUNT(*)
FROM dbo.FactSales

UNION ALL

SELECT 'FactReturns', COUNT(*)
FROM dbo.FactReturns;


-- 2. Duplicate dimension key checks

SELECT CustomerID, COUNT(*) AS DuplicateCount
FROM dbo.DimCustomer
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT ProductID, COUNT(*) AS DuplicateCount
FROM dbo.DimProduct
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT StoreID, COUNT(*) AS DuplicateCount
FROM dbo.DimStore
GROUP BY StoreID
HAVING COUNT(*) > 1;


-- 3. NULL / missing key checks

SELECT
    (SELECT COUNT(*) FROM dbo.DimCustomer
     WHERE CustomerKey IS NULL) AS NullCustomerKey,

    (SELECT COUNT(*) FROM dbo.DimProduct
     WHERE ProductKey IS NULL) AS NullProductKey,

    (SELECT COUNT(*) FROM dbo.DimStore
     WHERE StoreKey IS NULL) AS NullStoreKey,

    (SELECT COUNT(*) FROM dbo.FactSales
     WHERE CustomerKey IS NULL) AS FactNullCustomerKey,

    (SELECT COUNT(*) FROM dbo.FactSales
     WHERE ProductKey IS NULL) AS FactNullProductKey,

    (SELECT COUNT(*) FROM dbo.FactSales
     WHERE StoreKey IS NULL) AS FactNullStoreKey,

    (SELECT COUNT(*) FROM dbo.FactSales
     WHERE DateKey IS NULL) AS FactNullDateKey;


-- 4. FactSales → DimCustomer referential integrity

SELECT COUNT(*) AS OrphanCustomerKeys
FROM dbo.FactSales f
LEFT JOIN dbo.DimCustomer d
    ON f.CustomerKey = d.CustomerKey
WHERE d.CustomerKey IS NULL;


-- 5. FactSales → DimProduct referential integrity

SELECT COUNT(*) AS OrphanProductKeys
FROM dbo.FactSales f
LEFT JOIN dbo.DimProduct d
    ON f.ProductKey = d.ProductKey
WHERE d.ProductKey IS NULL;


-- 6. FactSales → DimStore referential integrity

SELECT COUNT(*) AS OrphanStoreKeys
FROM dbo.FactSales f
LEFT JOIN dbo.DimStore d
    ON f.StoreKey = d.StoreKey
WHERE d.StoreKey IS NULL;


-- 7. FactSales → DimDate referential integrity

SELECT COUNT(*) AS OrphanDateKeys
FROM dbo.FactSales f
LEFT JOIN dbo.DimDate d
    ON f.DateKey = d.DateKey
WHERE d.DateKey IS NULL;


-- 8. FactSales measure sanity check

SELECT
    COUNT(*) AS FactSalesRows,
    SUM(Quantity) AS TotalQuantity,
    SUM(LineAmount) AS TotalSalesAmount,
    MIN(UnitPrice) AS MinUnitPrice,
    MAX(UnitPrice) AS MaxUnitPrice,
    MIN(LineAmount) AS MinLineAmount,
    MAX(LineAmount) AS MaxLineAmount
FROM dbo.FactSales;