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