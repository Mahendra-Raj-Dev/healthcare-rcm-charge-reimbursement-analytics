-- Business question: How do charge-to-payment ratios and total Medicare payments differ between rural and metropolitan hospitals?

WITH x AS (
    SELECT
    h.Rndrng_Prvdr_CCN,
    h.Rndrng_Prvdr_Org_Name,
    h.Rndrng_Prvdr_RUCA,
    CASE
        WHEN CAST(h.Rndrng_Prvdr_RUCA AS FLOAT) >= 1.0 AND CAST(h.Rndrng_Prvdr_RUCA AS FLOAT) <= 3.0
            THEN 'Metropolitan'
        WHEN CAST(h.Rndrng_Prvdr_RUCA AS FLOAT) >= 4.0 AND CAST(h.Rndrng_Prvdr_RUCA AS FLOAT) <= 10.0
            THEN 'Non-metropolitan'
        ELSE 'Unknown'
    END AS area_type
    FROM hospitals h
)

SELECT
    x.area_type,
    COUNT(DISTINCT h.Rndrng_Prvdr_CCN ) AS Prvdr_Cnt,
    SUM(f.Total_Mdcr_Pymt) AS Total_Mdcr_Pymt,
    SUM(Total_Charges) / SUM(Total_Mdcr_Pymt) AS Weigt_Chrg_Pymt_ratio
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
JOIN x
ON h.Rndrng_Prvdr_CCN = x.Rndrng_Prvdr_CCN
GROUP BY x.area_type
HAVING x.area_type NOT IN ("Unknown")