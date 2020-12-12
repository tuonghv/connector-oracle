-- Create and populate our products using a single insert with many rows
CREATE TABLE products (
  id NUMBER(4) NOT NULL PRIMARY KEY,
  name VARCHAR2(255) NOT NULL,
  description VARCHAR2(512),
  weight FLOAT
);
GRANT SELECT ON products to uminor;
ALTER TABLE products ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

INSERT INTO products
  VALUES (101,'scooter','Small 2-wheel scooter',3.14);
INSERT INTO products
  VALUES (102,'car battery','12V car battery',8.1);


-- Create and populate the products on hand using multiple inserts
CREATE TABLE products_on_hand (
  product_id NUMBER(4) NOT NULL PRIMARY KEY,
  quantity NUMBER(4) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);
GRANT SELECT ON products_on_hand to uminor;
ALTER TABLE products_on_hand ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

INSERT INTO products_on_hand VALUES (101,3);
INSERT INTO products_on_hand VALUES (102,8);
INSERT INTO products_on_hand VALUES (103,18);
INSERT INTO products_on_hand VALUES (104,4);
INSERT INTO products_on_hand VALUES (105,5);
INSERT INTO products_on_hand VALUES (106,0);
INSERT INTO products_on_hand VALUES (107,44);
INSERT INTO products_on_hand VALUES (108,2);
INSERT INTO products_on_hand VALUES (109,5);

-- Create some customers ...
CREATE TABLE customers (
  id NUMBER(4)  NOT NULL PRIMARY KEY,
  first_name VARCHAR2(255) NOT NULL,
  last_name VARCHAR2(255) NOT NULL,
  email VARCHAR2(255) NOT NULL UNIQUE
);
GRANT SELECT ON customers to uminor;
ALTER TABLE customers ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

INSERT INTO customers
  VALUES (1001,'Sally','Thomas','sally.thomas@acme.com');
INSERT INTO customers
  VALUES (1002,'George','Bailey','gbailey@foobar.com');


-- Create some very simple orders
CREATE TABLE orders (
  id NUMBER(6) NOT NULL PRIMARY KEY,
  order_date DATE NOT NULL,
  purchaser NUMBER(4) NOT NULL,
  quantity NUMBER(4) NOT NULL,
  product_id NUMBER(4) NOT NULL
);
GRANT SELECT ON orders to uminor;
ALTER TABLE orders ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

INSERT INTO orders
  VALUES (100, '16-JAN-2016', 1001, 1, 101);
INSERT INTO orders
  VALUES (101, '17-JAN-2016', 1002, 2, 102);
