USE experimentiq;

-- ============================================================
-- ExperimentIQ
-- 02_experiment_metrics.sql
-- Core experiment performance metrics
-- ============================================================

-- Recreate the compact experiment summary table
-- so the SQL workflow is reproducible.

DROP TABLE IF EXISTS experiment_summary;

CREATE TABLE experiment_summary (
    treatment TINYINT,
    observations BIGINT,
    conversions BIGINT,
    visits BIGINT,
    exposures BIGINT,
    conversion_rate DOUBLE,
    visit_rate DOUBLE
);

INSERT INTO experiment_summary VALUES
(0, 2096937, 4063, 80105, 0, 0.00193759, 0.03820100),
(1, 11882655, 36711, 576824, 428212, 0.00308946, 0.04854336);


-- ============================================================
-- Core experiment metrics
-- ============================================================

DROP TABLE IF EXISTS experiment_metrics;

CREATE TABLE experiment_metrics (
    control_conversion_rate DOUBLE,
    treatment_conversion_rate DOUBLE,
    absolute_conversion_lift DOUBLE,
    relative_conversion_lift DOUBLE,

    control_visit_rate DOUBLE,
    treatment_visit_rate DOUBLE,
    absolute_visit_lift DOUBLE,
    relative_visit_lift DOUBLE,

    estimated_incremental_conversions DOUBLE,
    incremental_conversions_per_million DOUBLE
);

INSERT INTO experiment_metrics
SELECT
    MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
        AS control_conversion_rate,

    MAX(CASE WHEN treatment = 1 THEN conversion_rate END)
        AS treatment_conversion_rate,

    MAX(CASE WHEN treatment = 1 THEN conversion_rate END)
      - MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
        AS absolute_conversion_lift,

    (
        MAX(CASE WHEN treatment = 1 THEN conversion_rate END)
        - MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
    )
    / MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
        AS relative_conversion_lift,

    MAX(CASE WHEN treatment = 0 THEN visit_rate END)
        AS control_visit_rate,

    MAX(CASE WHEN treatment = 1 THEN visit_rate END)
        AS treatment_visit_rate,

    MAX(CASE WHEN treatment = 1 THEN visit_rate END)
      - MAX(CASE WHEN treatment = 0 THEN visit_rate END)
        AS absolute_visit_lift,

    (
        MAX(CASE WHEN treatment = 1 THEN visit_rate END)
        - MAX(CASE WHEN treatment = 0 THEN visit_rate END)
    )
    / MAX(CASE WHEN treatment = 0 THEN visit_rate END)
        AS relative_visit_lift,

    (
        MAX(CASE WHEN treatment = 1 THEN conversion_rate END)
        - MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
    )
    * MAX(CASE WHEN treatment = 1 THEN observations END)
        AS estimated_incremental_conversions,

    (
        MAX(CASE WHEN treatment = 1 THEN conversion_rate END)
        - MAX(CASE WHEN treatment = 0 THEN conversion_rate END)
    )
    * 1000000
        AS incremental_conversions_per_million

FROM experiment_summary;


-- View final metrics
SELECT *
FROM experiment_metrics;