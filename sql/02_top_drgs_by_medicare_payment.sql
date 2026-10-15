-- Business question: Which DRG categories account for the highest total Medicare payments?

SELECT
    d.DRG_Cd,
    d.DRG_Desc,
    SUM(f.Total_Mdcr_Pymt) AS total_medicare_payments
FROM drgs d
JOIN fact_discharges f
ON d.DRG_Cd = f.DRG_Cd
GROUP BY d.DRG_Cd, d.DRG_Desc
ORDER BY total_medicare_payments DESC LIMIT 10