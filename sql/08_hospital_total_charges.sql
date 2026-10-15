-- Business question: Which hospitals have the highest estimated total submitted charges?

SELECT
    h.Rndrng_Prvdr_CCN,
    h.Rndrng_Prvdr_Org_Name,
    h.Rndrng_Prvdr_State_Abrvtn,
    SUM(f.Total_Charges) AS Total_Charges
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
GROUP BY h.Rndrng_Prvdr_CCN, h.Rndrng_Prvdr_Org_Name, h.Rndrng_Prvdr_State_Abrvtn
ORDER BY Total_Charges DESC LIMIT 10