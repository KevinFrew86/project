DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animals
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR (255),
  breed VARCHAR(255),
  admission_date VARCHAR(255),
  trained BOOLEAN,
  health BOOLEAN,
  adoptability BOOLEAN,
);

CREATE TABLE adoptions
(
  id SERIAL8 PRIMARY KEY,
  owner_id INT REFERENCES owners(id),
  animal_id INT REFERENCES animals(id),
);
