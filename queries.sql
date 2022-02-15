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