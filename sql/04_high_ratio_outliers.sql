-- Business question: Which hospitals have a substantially higher charge-to-Medicare-payment ratio than other hospitals in the same state for the same DRG?

WITH state_drg_benchmark AS (
    SELECT
        h.Rndrng_Prvdr_State_Abrvtn,
        f.DRG_Cd,
        AVG(f.Chrg_to_Mdcr_Pymt_Ratio) AS avg_state_drg_ratio
    FROM hospitals h
    JOIN fact_discharges f
    ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
    GROUP BY h.Rndrng_Prvdr_State_Abrvtn, f.DRG_Cd
)


SELECT
    h.Rndrng_Prvdr_State_Abrvtn,
    h.Rndrng_Prvdr_Org_Name,
    f.DRG_Cd,
    f.Chrg_to_Mdcr_Pymt_Ratio,
    s.avg_state_drg_ratio,
    f.Chrg_to_Mdcr_Pymt_Ratio / s.avg_state_drg_ratio AS ratio_vs_benchmark
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
JOIN state_drg_benchmark s
ON h.Rndrng_Prvdr_State_Abrvtn = s.Rndrng_Prvdr_State_Abrvtn
AND f.DRG_Cd = s.DRG_Cd
WHERE f.Chrg_to_Mdcr_Pymt_Ratio >= 1.5 * s.avg_state_drg_ratio