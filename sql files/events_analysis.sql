CREATE DATABASE ecommerce_funnel;
use ecommerce_funnel;


CREATE table events (
		timestamp BIGINT,
        visitorid BIGINT,
        event varchar(20),
        itemid BIGINT,
        transactionid BIGINT NULL);
        
DROP TABLE IF EXISTS events;

CREATE table events(
		timestamp BIGINT,
        visitorid BIGINT,
        event varchar(20),
        itemid BIGINT,
        transactionid varchar(50));
        
        
SELECT COUNT(*) FROM events;

SELECT event, COUNT(*) FROM events GROUP BY event;

CREATE VIEW events_clean AS
SELECT
	visitorid,
    event,
    itemid,
    transactionid,
    from_unixtime(timestamp/1000) AS event_time
FROM events;

WITH user_events AS (
	SELECT 
		visitorid,
        MIN(CASE WHEN event = 'view' THEN event_time END) AS view_time,
		MIN(CASE WHEN event = 'addtocart' THEN event_time END) AS cart_time,
        MIN(CASE WHEN event = 'transaction' THEN event_time END) AS purchase_time
	FROM events_clean
    GROUP BY visitorid
)

-- SELECT * FROM user_events; 


SELECT
	COUNT(CASE WHEN view_time IS NOT NULL THEN 1 END) AS stage_1_view,
    COUNT(CASE WHEN view_time IS NOT NULL AND cart_time > view_time  THEN 1 END) AS stage_2_cart,
    COUNT(
		CASE
			WHEN view_time IS NOT NULL
             AND cart_time > view_time 
             AND purchase_time > cart_time
            THEN 1
		END
	) AS stage_3_purchase
FROM user_events;



-- CONVERSION RATES

WITH funnel AS (
	SELECT 
		COUNT(CASE WHEN view_time IS NOT NULL THEN 1 END) AS views,
        COUNT(CASE WHEN view_time IS NOT NULL AND cart_time > view_time THEN 1 END) AS carts,
        COUNT(
			CASE 
				WHEN view_time IS NOT NULL
				 AND cart_time > view_time
                 AND purchase_time > cart_time
				THEN 1
			END
		) AS purchases
	 FROM (
		SELECT
			visitorid,
            MIN(CASE WHEN event = 'view' THEN event_time END) AS view_time,
            MIN(CASE WHEN event = 'addtocart' THEN event_time END) AS cart_time,
            MIN(CASE WHEN event = 'transaction' THEN event_time END) AS purchase_time
		FROM events_clean
        GROUP BY visitorid
	) t
) 

SELECT
	views,
    carts,
    purchases,
    carts * 100/ views AS view_to_cart_rate,
    purchases * 100/ carts AS cart_to_purchase_rate,
    purchases * 100/ views AS overall_conversion_rate
FROM funnel;


-- DROP-OF ANALYSIS

SELECT
	COUNT(*) AS viewed_only
FROM (
	SELECT visitorid
    FROM events_clean
    GROUP BY visitorid
    HAVING SUM(event = 'view') > 0
	   AND SUM(event = 'addtocart') = 0
) t;	


-- PRODUCT LEVEL CONVERSION

SELECT 
	itemid,
    COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS views,
    COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) AS purchases,
    COUNT(DISTINCT CASE WHEN event = 'transaction' THEN visitorid END) /
    COUNT(DISTINCT CASE WHEN event = 'view' THEN visitorid END) AS conversion_rate
FROM events_clean
GROUP BY itemid
HAVING views > 100
ORDER BY conversion_rate DESC
LIMIT 10;












