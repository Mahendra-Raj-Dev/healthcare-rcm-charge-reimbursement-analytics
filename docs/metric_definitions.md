# Healthcare RCM Analytics — Metric Definitions

## 1. Total Charges

**Definition:** The estimated sum of reported hospital charges across the included hospital-DRG records.

**Calculation:**

`Total Charges = SUM(Discharges × Average Charge)`

**Business meaning:** Represents the aggregate reported charges associated with the included inpatient discharges. These charges are not necessarily the amounts Medicare pays.

## 2. Total Medicare Payment

**Definition:** The estimated aggregate Medicare payment represented by the included records, calculated using discharge counts and the average Medicare payment amount.

**Calculation:**

`Total Medicare Payment = SUM(Discharges × Average Medicare Payment)`

**Business meaning:** Provides an estimate of aggregate Medicare payments for comparison with reported hospital charges. The precise payment definition will be confirmed against the official CMS documentation.

## 3. Weighted Average Charge

**Definition:** The average reported charge per discharge, weighted by the number of discharges in each included record.

**Calculation:**

`Weighted Average Charge = Total Charges / Total Discharges`

**Business meaning:** Gives more weight to records representing more discharges. This is more representative of the overall charge per discharge than taking a simple average of record-level average charges.

## 4. Charge-to-Medicare-Payment Ratio

**Definition:** The ratio of aggregate reported hospital charges to aggregate Medicare payments.

**Calculation:**

`Charge-to-Medicare-Payment Ratio = Total Charges / Total Medicare Payment`

**Business meaning:** Describes how reported charges compare with Medicare payments. A ratio of 2.5× means reported charges are 2.5 times the Medicare payment amount.

**Interpretation limitation:** This ratio is not a claims approval rate, denial rate, collection rate, or measure of lost revenue. Hospital charges and Medicare payments are determined differently.

## General Notes

* Metrics will be calculated using valid, included records after data-quality checks.
* Weighted metrics will be calculated from aggregated totals, not by averaging record-level averages or ratios.
* Missing, suppressed, or otherwise excluded values will be handled according to the official CMS documentation and documented in the analysis.
* The formulas and interpretations will be validated against the dataset's actual column definitions before final analysis.
