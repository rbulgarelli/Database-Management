-1-
SELECT name, city
FROM agents
WHERE name='Bond';

-2-
SELECT pid, name, quantity
FROM products
WHERE priceUSD>.99;

-3-
SELECT ordno, qty
FROM orders;

-4-
SELECT name, city
FROM customers
WHERE city='Duluth';

-5-
SELECT name
FROM agents
WHERE city != 'New York' and city != 'London';

-6-
SELECT *
FROM products
WHERE city!='Duluth' and city!='Dallas' and priceUSD<=1.00;

-7-
SELECT *
FROM orders
WHERE mon = 'jan' or mon = 'apr';

-8-
SELECT *
FROM orders
WHERE mon = 'feb' and dollars>200.00;

-9-
SELECT *
FROM orders
WHERE cid='C005';



