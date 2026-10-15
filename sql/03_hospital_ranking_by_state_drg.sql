-- Business question: Within each state, which hospitals have the highest total Medicare payments for each DRG?

SELECT
    h.Rndrng_Prvdr_State_Abrvtn,
    h.Rndrng_Prvdr_CCN,
    h.Rndrng_Prvdr_Org_Name,
    f.DRG_Cd,
    f.Total_Mdcr_Pymt,
    RANK() OVER(PARTITION BY h.Rndrng_Prvdr_State_Abrvtn, f.DRG_Cd
                ORDER BY f.Total_Mdcr_Pymt DESC) AS Rnk
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN