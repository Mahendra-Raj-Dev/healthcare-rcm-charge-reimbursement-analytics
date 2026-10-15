-- Business question: Which DRG categories have the highest estimated Medicare payment per discharge?

SELECT
    f.DRG_Cd,
    d.DRG_Desc,
    SUM(f.Tot_Dschrgs) AS Tot_Dschrgs,
    SUM(f.Total_Mdcr_Pymt) AS Total_Mdcr_Pymt,
    SUM(f.Total_Mdcr_Pymt) / SUM(f.Tot_Dschrgs)  AS Weighted_Avg_Medicare_Payment_Per_Discharge
FROM fact_discharges f
JOIN drgs d
ON f.DRG_Cd = d.DRG_Cd
GROUP BY f.DRG_Cd, d.DRG_Desc
ORDER BY Weighted_Avg_Medicare_Payment_Per_Discharge DESC LIMIT 10