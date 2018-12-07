DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE animals
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR (255),
  breed VARCHAR(255),
  admission_date VARCHAR(255),
  trained BOOLEAN,
  health BOOLEAN,
  adoptability BOOLEAN
);

CREATE TABLE owners
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  pets INT REFERENCES animals(id)
);
