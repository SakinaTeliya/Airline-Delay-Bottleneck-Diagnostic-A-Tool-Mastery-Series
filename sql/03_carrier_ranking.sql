USE airline_delay_diagnostic;
SELECT * FROM airlines;
WITH monthly_carrier_delay AS (
    SELECT
        f.AIRLINE AS carrier_code,
        a.AIRLINE AS carrier_name,
        f.MONTH,
        ROUND(AVG(f.DEPARTURE_DELAY), 2) AS avg_departure_delay,
        COUNT(*) AS num_flights
    FROM flights f
    JOIN airlines a ON f.AIRLINE = a.IATA_CODE
    GROUP BY f.AIRLINE, a.AIRLINE, f.MONTH
)
SELECT
    MONTH,
    carrier_name,
    avg_departure_delay,
    num_flights,
    RANK() OVER (
        PARTITION BY MONTH
        ORDER BY avg_departure_delay ASC
    ) AS delay_rank
FROM monthly_carrier_delay
ORDER BY MONTH, delay_rank
LIMIT 50;
WITH monthly_carrier_delay AS (
    SELECT
        f.AIRLINE AS carrier_code,
        a.AIRLINE AS carrier_name,
        f.MONTH,
        ROUND(AVG(f.DEPARTURE_DELAY), 2) AS avg_departure_delay
    FROM flights f
    JOIN airlines a ON f.AIRLINE = a.IATA_CODE
    GROUP BY f.AIRLINE, a.AIRLINE, f.MONTH
),
ranked AS (
    SELECT
        carrier_name,
        MONTH,
        avg_departure_delay,
        RANK() OVER (PARTITION BY MONTH ORDER BY avg_departure_delay ASC) AS delay_rank
    FROM monthly_carrier_delay
)
SELECT
    carrier_name,
    ROUND(AVG(delay_rank), 1) AS avg_rank_across_year,
    MIN(delay_rank) AS best_rank,
    MAX(delay_rank) AS worst_rank,
    (MAX(delay_rank) - MIN(delay_rank)) AS rank_swing
FROM ranked
GROUP BY carrier_name
ORDER BY rank_swing ASC;