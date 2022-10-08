
--- LEFT, RIGHT AND INNER JOIN CONNECTIONS ---
SELECT * 
	FROM wsb_schema.stock_tab s
	RIGHT JOIN  wsb_schema.product_table p ON p.product_id = s.product_id;

SELECT * 
	FROM wsb_schema.stock_tab s
	LEFT JOIN  wsb_schema.product_table p ON p.product_id = s.product_id;

SELECT * 
	FROM wsb_schema.payment_tab p
	INNER JOIN  wsb_schema.invoice_tab i ON i.invoice_id = p.invoice_id;

SELECT * 
	FROM wsb_schema.payment_tab p
	INNER JOIN  wsb_schema.invoice_tab i ON i.invoice_id = p.invoice_id
;
SELECT * 
	FROM wsb_schema.order_tab o
	RIGHT JOIN  wsb_schema.customer_tab c ON c.customer_id = o.customer_id;

--- QUERIES ---

--- 1. NUMBER OF CUSTOMER PER EACH COUNTRY
SELECT a.iso_country, COUNT(a.iso_country) AS "customer per country"
	FROM wsb_schema.customer_tab c
    RIGHT JOIN wsb_schema.address_tab a ON a.address_id = c.address_id
    GROUP BY (a.iso_country);
    
--- 2. CUSTOMER SPENDING
SELECT c.customer_id, c.customer_name, SUM(p.payment_value) AS "spending"
FROM wsb_schema.payment_tab p
JOIN wsb_schema.invoice_tab i ON i.invoice_id = p.invoice_id
JOIN wsb_schema.order_tab o ON o.order_id = i.order_id
RIGHT JOIN wsb_schema.customer_tab c ON c.customer_id = o.customer_id
GROUP BY(c.customer_name)
ORDER BY 3 DESC;

--- 3. TOTAL VALUE IN EACH WAREHOUSE WAREHOUSE
SELECT w.warehouse_desc, s.warehouse_id, (pt.price*s.qty) AS "total value of products"
	FROM wsb_schema.warehouse_tab w
    JOIN wsb_schema.stock_tab s ON s.warehouse_id = w.warehouse_id
    JOIN wsb_schema.product_table pt ON pt.product_id = s.product_id
    GROUP BY w.warehouse_desc
    ORDER BY 3 DESC;

--- 4. MOST ORDERED PRODUCTS

SELECT pt.product_description, SUM(ol.qty) AS "total ordered quantity"
	FROM wsb_schema.order_line_tab ol
	JOIN wsb_schema.product_table pt ON pt.product_id = ol.product_id 
	GROUP BY ol.product_id
    ORDER BY 2 DESC;

--- 5. AVERAGE PAYMENT VALUE
SELECT AVG(p.payment_value) AS "average patment value"
	FROM wsb_schema.payment_tab p;
  
  --- 6. TOTAL PRODUCT IN EACH WAREHOUSE
SELECT w.warehouse_desc, s.warehouse_id, SUM(s.qty) AS "total products"
	FROM wsb_schema.warehouse_tab w
    JOIN wsb_schema.stock_tab s ON s.warehouse_id = w.warehouse_id
    JOIN wsb_schema.product_table pt ON pt.product_id = s.product_id
    GROUP BY w.warehouse_desc
    ORDER BY 3 DESC;

--- 7. ORDERS PER COUNTRY
SELECT country.iso_country, COUNT(o.order_id) AS "number of orders per country"
	FROM wsb_schema.order_tab o
    JOIN wsb_schema.customer_tab c ON c.customer_id = o.customer_id
	JOIN wsb_schema.address_tab a ON a.address_id = c.address_id
    JOIN wsb_schema.country_tab country ON country.iso_country = a.iso_country
    GROUP BY iso_country;
    