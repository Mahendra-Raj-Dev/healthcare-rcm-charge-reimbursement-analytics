-- Business question: Which hospitals have the largest gap between estimated total submitted charges and estimated total Medicare payments?

SELECT
    h.Rndrng_Prvdr_CCN,
    h.Rndrng_Prvdr_Org_Name,
    h.Rndrng_Prvdr_State_Abrvtn,
    SUM(f.Total_Charges) AS Total_Charges,
    SUM(f.Total_Mdcr_Pymt) AS Total_Mdcr_Pymt,
    ABS(SUM(f.Total_Charges) - SUM(f.Total_Mdcr_Pymt)) AS Diff
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
GROUP BY h.Rndrng_Prvdr_CCN, h.Rndrng_Prvdr_Org_Name, h.Rndrng_Prvdr_State_Abrvtn
ORDER BY Diff DESC LIMIT 10