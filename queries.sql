/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM ANIMALS WHERE name LIKE  '%mon';
SELECT name FROM ANIMALS WHERE date_of_birth BETWEEN '1/1/2016' AND '1/1/2019';
SELECT name FROM ANIMALS WHERE neutered='1' AND escape_attempts < 3;
SELECT date_of_birth FROM ANIMALS WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM ANIMALS WHERE weight_kg > 10.5;
SELECT * FROM ANIMALS WHERE neutered = '1';
SELECT * FROM ANIMALS WHERE NOT name = 'Gabumon';
SELECT * FROM ANIMALS WHERE weight_kg > 10.4 AND weight_kg < 17.3;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered , MAX(escape_attempts) FROM animals;
-- What is the minimum and maximum weight of each type of animal?
SELECT neutered , MAX(escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '6/1/1990' AND '12,31,2000' GROUP BY species;


-- What animals belong to Melody Pond?
SELECT *
  FROM animals a
  JOIN owners o
  ON a.owner_id = o.id
  WHERE o.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT *
  FROM animals a JOIN species s
  ON a.species_id = s.id
  WHERE s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal
SELECT *
  FROM owners o FULL OUTER JOIN animals a
  ON o.id = a.owner_id;

-- How many animals are there per species?
SELECT s.name, COUNT(*)
  FROM species s JOIN animals a
  ON s.id =  a.species_id
  GROUP BY s.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals a JOIN owners o
  ON a.owner_id = o.id
  WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 
    (SELECT id from species WHERE name = 'Digimon');

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT *
  FROM animals a JOIN owners o
  ON a.owner_id = o.id
  WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

-- Who owns the most animals?
 SELECT o.full_name, COUNT(*) AS total
  FROM owners o JOIN animals a
  ON o.id =  a.owner_id
  GROUP BY o.full_name
  ORDER BY total DESC
  LIMIT 1;