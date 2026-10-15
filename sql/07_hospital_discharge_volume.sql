-- Business question: Which hospitals have the highest total inpatient discharge volumes?

SELECT
    h.Rndrng_Prvdr_CCN,
    h.Rndrng_Prvdr_Org_Name,
    h.Rndrng_Prvdr_State_Abrvtn,
    SUM(f.Tot_Dschrgs) AS Tot_Dschrgs
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
GROUP BY h.Rndrng_Prvdr_CCN, h.Rndrng_Prvdr_Org_Name, h.Rndrng_Prvdr_State_Abrvtn
ORDER BY Tot_Dschrgs DESC LIMIT 10