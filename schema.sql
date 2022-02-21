/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS( 
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT, 
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD PRIMARY KEY (id),

ALTER TABLE animals
  DROP species;

ALTER TABLE animals
  ADD species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);


ALTER TABLE animals
  ADD owner_id INT,
  ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners (id); 

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id)REFERENCES vets(id),
  PRIMARY KEY (id)
);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_animals FOREIGN KEY(animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
  PRIMARY KEY (id)
);