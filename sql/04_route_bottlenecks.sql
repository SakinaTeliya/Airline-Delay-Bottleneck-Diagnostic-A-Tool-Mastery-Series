USE airline_delay_diagnostic;

SELECT
    f.ORIGIN_AIRPORT,
    ap.AIRPORT AS airport_name,
    ap.CITY,
    COUNT(*) AS num_flights,
    ROUND(AVG(f.DEPARTURE_DELAY), 2) AS avg_departure_delay
FROM flights f
JOIN airports ap ON f.ORIGIN_AIRPORT = ap.IATA_CODE
GROUP BY f.ORIGIN_AIRPORT, ap.AIRPORT, ap.CITY
HAVING COUNT(*) >= 10000
ORDER BY avg_departure_delay DESC
LIMIT 15;
WITH route_delay AS (
    SELECT
        f.ORIGIN_AIRPORT,
        f.DESTINATION_AIRPORT,
        COUNT(*) AS num_flights,
        ROUND(AVG(f.DEPARTURE_DELAY), 2) AS avg_departure_delay
    FROM flights f
    GROUP BY f.ORIGIN_AIRPORT, f.DESTINATION_AIRPORT
    HAVING COUNT(*) >= 1000
)
SELECT
    r.ORIGIN_AIRPORT,
    o.CITY AS origin_city,
    r.DESTINATION_AIRPORT,
    d.CITY AS destination_city,
    r.num_flights,
    r.avg_departure_delay
FROM route_delay r
JOIN airports o ON r.ORIGIN_AIRPORT = o.IATA_CODE
JOIN airports d ON r.DESTINATION_AIRPORT = d.IATA_CODE
ORDER BY r.avg_departure_delay DESC
LIMIT 15;