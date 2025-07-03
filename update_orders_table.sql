ALTER TABLE orders
ADD COLUMN product_id INT,
ADD COLUMN quantity INT;

UPDATE orders SET product_id = 1, quantity = 3 WHERE order_id = 201;
UPDATE orders SET product_id = 2, quantity = 2 WHERE order_id = 202;
UPDATE orders SET product_id = 3, quantity = 4 WHERE order_id = 203;
UPDATE orders SET product_id = 1, quantity = 1 WHERE order_id = 204;
UPDATE orders SET product_id = 4, quantity = 2 WHERE order_id = 205;
