WITH cur AS
(
    SELECT name, MAX(rate_to_usd) AS rate_to_usd, id
    FROM currency
    JOIN balance ON balance.currency_id = currency.id
    GROUP BY name, id
)

SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type, 
    SUM(money) AS volume,
    COALESCE(cur.name, 'not defined') AS currency_name,
    COALESCE(cur.rate_to_usd, 1) AS last_rate_to_usd,
    CAST(SUM(money) * COALESCE(cur.rate_to_usd, 1) AS FLOAT) AS total_volume_in_usd
FROM balance 
JOIN "user" ON "user".id = id
LEFT JOIN cur ON balance.currency_id = cur.id 
WHERE "user".id = balance.user_id
GROUP BY "user".id, type, currency_name, last_rate_to_usd
ORDER BY name DESC, lastname ASC, type ASC;