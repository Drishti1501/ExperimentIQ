-- ExperimentIQ
-- 01_data_quality.sql
-- Purpose: Validate experiment data quality and integrity

-- 1. Total number of observations
SELECT COUNT(*) AS total_observations
FROM experiment_data;


-- 2. Check for missing values
SELECT
    SUM(CASE WHEN treatment IS NULL THEN 1 ELSE 0 END) AS missing_treatment,
    SUM(CASE WHEN conversion IS NULL THEN 1 ELSE 0 END) AS missing_conversion,
    SUM(CASE WHEN visit IS NULL THEN 1 ELSE 0 END) AS missing_visit,
    SUM(CASE WHEN exposure IS NULL THEN 1 ELSE 0 END) AS missing_exposure
FROM experiment_data;


-- 3. Treatment group distribution
SELECT
    treatment,
    COUNT(*) AS observations
FROM experiment_data
GROUP BY treatment
ORDER BY treatment;


-- 4. Outcome distribution
SELECT
    SUM(conversion) AS total_conversions,
    SUM(visit) AS total_visits,
    SUM(exposure) AS total_exposures
FROM experiment_data;


-- 5. Validate binary treatment/outcome values
SELECT DISTINCT treatment
FROM experiment_data
ORDER BY treatment;

SELECT DISTINCT conversion
FROM experiment_data
ORDER BY conversion;

SELECT DISTINCT visit
FROM experiment_data
ORDER BY visit;

SELECT DISTINCT exposure
FROM experiment_data
ORDER BY exposure;