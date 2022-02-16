/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO ANIMALS VALUES(1,'Agumon','03/02/2020', 0,'1', 10.23);
INSERT INTO ANIMALS VALUES(2,'Gabumon','11/15/2018', 2,'1', 8);
INSERT INTO ANIMALS VALUES(3,'Pikachu','6/7/2021', 1,'0', 15.04);
INSERT INTO ANIMALS VALUES(4,'Devimon','5/12/2017', 5,'1', 11);

ALTER TABLE animals
ADD COLUMN species VARCHAR;

INSERT INTO ANIMALS VALUES(5,'Charmander','2/8/2020', 0,'0', -11);
INSERT INTO ANIMALS VALUES(6,'Plantmon','11/15/2022', 2,'0', -5.7);
INSERT INTO ANIMALS VALUES(7,'Squirtle','4/2/1973', 3,'0', -12.13);
INSERT INTO ANIMALS VALUES(8,'Angemon','6/12/2005', 1,'1', -45);
INSERT INTO ANIMALS VALUES(9,'Boarmon','6/7/2005', 7,'1', 20.4);
INSERT INTO ANIMALS VALUES(10,'Blossom','9/13/1998', 3,'1', 17);

-- START : Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before transaction.
BEGIN;

UPDATE animals
 SET species = 'unspecified';


SELECT * FROM animals;

ROLLBACK TRANSACTION;
--END

-- START : Inside a transaction
BEGIN;
  -- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals
 SET species = 'digimon'
 WHERE name LIKE '%mon';

 -- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
 SET species = 'pokemon'
 WHERE species IS NULL;

 -- Commit the transaction.
COMMIT;

 -- Verify that change was made and persists after commit.
SELECT * FROM animals;
-- END

-- START : Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
-- END

-- START : After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;)
SELECT * FROM animals;
-- END

-- START : Inside a transaction
  -- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth  > '6/1/2022';

  -- Create a savepoint for the transaction.
SAVEPOINT deleted_young_animal;

  -- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

  -- Rollback to the savepoint
ROLLBACK TO deleted_young_animal;

  -- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

  -- Commit transaction
COMMIT;
-- END