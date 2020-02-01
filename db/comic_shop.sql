DROP TABLE inventory;
DROP TABLE comics;
DROP TABLE suppliers;


CREATE TABLE suppliers(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
active BOOLEAN,
location VARCHAR(255)
);
CREATE TABLE comics(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  stock INT,
  cost INT,
  RRP INT,
  supplier INT references suppliers(id)
);
