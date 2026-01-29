-- 1. supply chain Risk status
CREATE VIEW analytics.supply_chain_risk AS
SELECT drugs.drug_id,
	drugs."name" AS current_name,
	stock.quantity AS current_stock,
	CASE
		WHEN stock.quantity <= 100 THEN 'CRITICAL: stockout'
		WHEN stock.quantity <= 500 THEN 'WARNING: Low Stock'
		ELSE 'Good Stock'
	END AS risk_status,
	suppliers.name AS supplier_name,
	suppliers.contact_email AS supplier_contact_email
FROM inventory.stock
LEFT JOIN inventory.drugs ON stock.drug_id = drugs.drug_id
LEFT JOIN inventory.suppliers ON drugs.drug_id = 
suppliers.drug_id
WHERE stock.quantity <= 1000;

select * from analytics.supply_chain_risk;