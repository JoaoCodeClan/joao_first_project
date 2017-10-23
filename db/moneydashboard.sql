DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;


CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  type_of_buy VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  date VARCHAR(255),
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id)

);
