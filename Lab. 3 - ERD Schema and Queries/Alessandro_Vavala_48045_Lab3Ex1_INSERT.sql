-- Inserting values

INSERT INTO wsb_schema.address_tab VALUES(01, 10, "ul. batorego", "krakow", 12, 2, 31500);
INSERT INTO wsb_schema.address_tab VALUES(01, 11, "ul. nowy", "katowice", 4, 5, 30700);
INSERT INTO wsb_schema.address_tab VALUES(01, 12, "ul. gorska ", "krakow", 1, 8, 31500);
INSERT INTO wsb_schema.address_tab VALUES(02, 13, "ul. centurione", "milan", 7, 2, 20100);
INSERT INTO wsb_schema.address_tab VALUES(02, 14, "ul. bologna", "genoa", 2, 12, 16100);
INSERT INTO wsb_schema.address_tab VALUES(02, 15, "ul. senna", "milan", 10, 9, 20100);

INSERT INTO wsb_schema.country_tab VALUES(01);
INSERT INTO wsb_schema.country_tab VALUES(02);

INSERT INTO wsb_schema.customer_tab VALUES(1, "olek", "buys once a month", 10);
INSERT INTO wsb_schema.customer_tab VALUES(2, "agata", "new customer", 11);
INSERT INTO wsb_schema.customer_tab VALUES(3, "matteo", "buys once a month", 13);
INSERT INTO wsb_schema.customer_tab VALUES(4, "klaudia", "buys twice a year", 12);
INSERT INTO wsb_schema.customer_tab VALUES(5, "marco", "buys twice a year", 14);
INSERT INTO wsb_schema.customer_tab VALUES(6, "francesco", "new customer", 15);

INSERT INTO wsb_schema.order_tab VALUES(010, "delivered", 3);
INSERT INTO wsb_schema.order_tab VALUES(011, "delivered", 4);
INSERT INTO wsb_schema.order_tab VALUES(012, "delivered", 1);
INSERT INTO wsb_schema.order_tab VALUES(013, "delivered", 4);
INSERT INTO wsb_schema.order_tab VALUES(014, "delivered", 5);
INSERT INTO wsb_schema.order_tab VALUES(015, "delivered", 5);

INSERT INTO wsb_schema.invoice_tab VALUES(01, 010);
INSERT INTO wsb_schema.invoice_tab VALUES(02, 011);
INSERT INTO wsb_schema.invoice_tab VALUES(03, 012);
INSERT INTO wsb_schema.invoice_tab VALUES(04, 013);
INSERT INTO wsb_schema.invoice_tab VALUES(05, 014);
INSERT INTO wsb_schema.invoice_tab VALUES(06, 015);

INSERT INTO wsb_schema.product_table VALUES(1, 'samsung monitor', 300);
INSERT INTO wsb_schema.product_table VALUES(2, 'laptop lenovo', 1000);
INSERT INTO wsb_schema.product_table VALUES(3, 'macbook pro', 1300);
INSERT INTO wsb_schema.product_table VALUES(4, 'dell keyboard', 30);
INSERT INTO wsb_schema.product_table VALUES(5, 'logitech mouse', 20);
INSERT INTO wsb_schema.product_table VALUES(6, 'iphone 13', 1450);


INSERT INTO wsb_schema.order_line_tab VALUES(1, 010, 4, 10, "on time");
INSERT INTO wsb_schema.order_line_tab VALUES(1, 012, 2, 30, "on time");
INSERT INTO wsb_schema.order_line_tab VALUES(1, 015, 3, 100, "on time");
INSERT INTO wsb_schema.order_line_tab VALUES(2, 014, 1, 20, "on time");
INSERT INTO wsb_schema.order_line_tab VALUES(2, 013, 4, 10, "on time");
INSERT INTO wsb_schema.order_line_tab VALUES(2, 011, 5, 10, "on time");

INSERT INTO wsb_schema.payment_tab VALUES(01, 1000.0, '2022-01-13', 'credit card');
INSERT INTO wsb_schema.payment_tab VALUES(02, 100.0, '2022-01-13', 'credit card');
INSERT INTO wsb_schema.payment_tab VALUES(03, 3000.0, '2022-01-13', 'credit card');
INSERT INTO wsb_schema.payment_tab VALUES(04, 200.0, '2022-01-14', 'credit card');
INSERT INTO wsb_schema.payment_tab VALUES(05, 1550.0, '2022-01-14', 'cash');
INSERT INTO wsb_schema.payment_tab VALUES(06, 1000.0, '2022-01-14', 'credit card');

INSERT INTO wsb_schema.warehouse_tab VALUES (1, 'warehouse in katowice');
INSERT INTO wsb_schema.warehouse_tab VALUES (2, 'warehouse in warsaw');
INSERT INTO wsb_schema.warehouse_tab VALUES (3, 'warehouse in gdansk');
INSERT INTO wsb_schema.warehouse_tab VALUES (4, 'warehouse in krakow');

INSERT INTO wsb_schema.stock_tab VALUES (1, 1, 100);
INSERT INTO wsb_schema.stock_tab VALUES (2, 5, 10);
INSERT INTO wsb_schema.stock_tab VALUES (3, 1, 40);
INSERT INTO wsb_schema.stock_tab VALUES (4, 5, 150);
--
SELECT * FROM wsb_schema.address_tab;
SELECT * FROM wsb_schema.invoice_tab;
SELECT * FROM wsb_schema.customer_tab;
SELECT * FROM wsb_schema.country_tab;
SELECT * FROM wsb_schema.order_tab;
SELECT * FROM wsb_schema.order_line_tab;
SELECT * FROM wsb_schema.payment_tab;
SELECT * FROM wsb_schema.product_table;
SELECT * FROM wsb_schema.stock_tab;
SELECT * FROM wsb_schema.warehouse_tab;