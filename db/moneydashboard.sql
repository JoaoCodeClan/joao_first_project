DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS budgets;


CREATE TABLE budgets(
  id SERIAL8 PRIMARY KEY,
  budget INT8,
  month VARCHAR(255)
);

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  type_of_purchase VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  date_of_transaction DATE,
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id),
  budget_id INT4 REFERENCES budgets(id)
);
