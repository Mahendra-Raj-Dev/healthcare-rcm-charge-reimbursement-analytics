-- Business question: How do total charges, Medicare payments,
-- and the weighted charge-to-payment ratio vary by state?

SELECT
    h.Rndrng_Prvdr_State_Abrvtn,
    SUM(f.Total_Charges) AS Total_submitted_charges,
    SUM(f.Total_Mdcr_Pymt) AS Total_Medicare_payments,
    SUM(f.Total_Charges) / SUM(f.Total_Mdcr_Pymt) AS Weighted_charge_to_payment_ratio
FROM hospitals h
JOIN fact_discharges f
ON h.Rndrng_Prvdr_CCN = f.Rndrng_Prvdr_CCN
GROUP BY h.Rndrng_Prvdr_State_Abrvtn
ORDER BY Weighted_charge_to_payment_ratio DESC LIMIT 5