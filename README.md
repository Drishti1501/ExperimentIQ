# ExperimentIQ — Experimentation & Incrementality Analytics

ExperimentIQ is an end-to-end experimentation and incrementality analytics project built to evaluate whether an advertising treatment generated a measurable increase in user conversions compared with a control group.

The project combines Python-based statistical analysis, MySQL analytical tables, and Power BI reporting to move from experiment data to measurable treatment impact and business decision support.

---

## 1. Problem Statement

When users are exposed to an advertising treatment, an increase in conversions does not automatically mean that the advertising caused the increase.

ExperimentIQ addresses the question:

> **Did the advertising treatment actually generate incremental conversions compared with users who were not targeted?**

The project evaluates treatment versus control performance using conversion and visit outcomes, statistical testing, confidence intervals, power analysis, exploratory segment analysis, and business-impact scenarios.

---

## 2. Business Question

The central business question is:

> **What was the incremental impact of the advertising treatment, and is the observed improvement large enough to support further business evaluation?**

The analysis focuses on:

- Conversion rate
- Visit rate
- Absolute treatment lift
- Relative treatment lift
- Statistical significance
- Confidence intervals
- Statistical power
- Minimum detectable effect (MDE)
- Treatment-effect heterogeneity
- Incremental conversions
- Business-impact scenarios

---

## 3. Dataset

The project uses the **Criteo Uplift Prediction Dataset**, released by Criteo AI Lab.

The dataset was constructed from several incrementality tests using a randomized trial procedure in which a randomly selected portion of the population was prevented from being targeted.

The project uses the **unbiased version** of the dataset.

Dataset characteristics:

- **13,979,592 observations**
- **16 columns**
- 12 anonymized features: `f0`–`f11`
- `treatment`
- `conversion`
- `visit`
- `exposure`
- No missing values in the analyzed dataset

The feature values are anonymized and do not have real-world business meanings assigned to them.

### Dataset source

Criteo AI Lab:

https://ailab.criteo.com/criteo-uplift-prediction-dataset/

The dataset is associated with:

> Diemert, Eustache, Betlei, and Renaudin.  
> **A Large Scale Benchmark for Uplift Modeling**.  
> AdKDD 2018.

The dataset is provided under the **CC BY-NC-SA 4.0** license.

The raw dataset is not included in this repository because of its size and licensing restrictions.

---

## 4. Experiment Design

The analysis follows a treatment-versus-control experimentation framework.

### Control

Users who were not targeted by the advertising treatment.

### Treatment

Users who were targeted by the advertising treatment.

### Primary metric

**Conversion rate**

Conversion is the primary business outcome used to evaluate incremental impact.

### Secondary metric

**Visit rate**

Visit rate is used as a supporting behavioral metric.

### Exposure

The dataset also contains an `exposure` variable describing whether the user was exposed to the treatment.

---

## 5. Project Workflow

The project follows this workflow:

```text
Criteo Experiment Dataset
        ↓
Data Quality Checks
        ↓
Exploratory Data Analysis
        ↓
Treatment vs Control Analysis
        ↓
Lift & Incremental Impact
        ↓
Statistical Testing
        ↓
Confidence Intervals
        ↓
Power & MDE Analysis
        ↓
Exploratory Segment Analysis
        ↓
Business Impact Scenario
        ↓
MySQL Analytical Tables
        ↓
Power BI Dashboard
        ↓
Business Decision Support