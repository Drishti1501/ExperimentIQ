USE experimentiq;

-- ============================================================
-- ExperimentIQ
-- 04_business_impact.sql
-- Business impact scenario analysis
-- ============================================================

DROP TABLE IF EXISTS business_impact;

CREATE TABLE business_impact (
    audience_size BIGINT,
    baseline_conversion_rate DOUBLE,
    treatment_conversion_rate DOUBLE,
    expected_conversions_without_treatment DOUBLE,
    expected_conversions_with_treatment DOUBLE,
    estimated_incremental_conversions DOUBLE,
    value_per_conversion DOUBLE,
    estimated_incremental_value DOUBLE
);


-- ============================================================
-- Business scenario
-- Assumption:
-- 1,000,000 treated users
-- $100 value per incremental conversion
-- ============================================================

INSERT INTO business_impact
SELECT
    1000000 AS audience_size,

    control_conversion_rate
        AS baseline_conversion_rate,

    treatment_conversion_rate
        AS treatment_conversion_rate,

    1000000 * control_conversion_rate
        AS expected_conversions_without_treatment,

    1000000 * treatment_conversion_rate
        AS expected_conversions_with_treatment,

    1000000 *
    (treatment_conversion_rate - control_conversion_rate)
        AS estimated_incremental_conversions,

    100.00 AS value_per_conversion,

    (
        1000000 *
        (treatment_conversion_rate - control_conversion_rate)
    ) * 100.00
        AS estimated_incremental_value

FROM experiment_metrics;


-- ============================================================
-- View business impact
-- ============================================================

SELECT
    audience_size,
    baseline_conversion_rate,
    treatment_conversion_rate,
    expected_conversions_without_treatment,
    expected_conversions_with_treatment,
    estimated_incremental_conversions,
    value_per_conversion,
    estimated_incremental_value
FROM business_impact;