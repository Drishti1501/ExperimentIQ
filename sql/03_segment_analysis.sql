USE experimentiq;

-- ============================================================
-- ExperimentIQ
-- 03_segment_analysis.sql
-- Exploratory treatment-effect heterogeneity summary
-- ============================================================

DROP TABLE IF EXISTS segment_analysis;

CREATE TABLE segment_analysis (
    feature VARCHAR(20),
    heterogeneity_evidence VARCHAR(50),
    interpretation VARCHAR(255)
);

INSERT INTO segment_analysis VALUES
(
    'f0',
    'Yes',
    'Evidence of treatment-effect heterogeneity'
),
(
    'f2',
    'No clear evidence',
    'No clear evidence of treatment-effect heterogeneity'
),
(
    'f6',
    'Yes',
    'Evidence of treatment-effect heterogeneity'
),
(
    'f8',
    'No clear evidence',
    'No clear evidence of treatment-effect heterogeneity'
),
(
    'f9',
    'No clear evidence',
    'No clear evidence of treatment-effect heterogeneity'
);


-- ============================================================
-- Summary: number of features with evidence
-- ============================================================

SELECT
    heterogeneity_evidence,
    COUNT(*) AS feature_count
FROM segment_analysis
GROUP BY heterogeneity_evidence
ORDER BY feature_count DESC;


-- ============================================================
-- Full segment-analysis result
-- ============================================================

SELECT
    feature,
    heterogeneity_evidence,
    interpretation
FROM segment_analysis
ORDER BY feature;