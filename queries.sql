/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE NAME LIKE '%mon';
SELECT NAME FROM animals WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED AND ESCAPE_ATTEMPTS< 3;
SELECT DATE_OF_BIRTH FROM animals WHERE NAME IN ('Agumon' , 'Pikachu');
SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
SELECT * FROM animals WHERE NEUTERED='true';
SELECT * FROM animals WHERE NAME NOT IN('Gabumon') ;
SELECT * FROM animals WHERE WEIGHT_KG >=10.4 AND WEIGHT_KG <=17.3;

-- TRANSACTION FOR UPDATING SPECIES COLUMN WITH UNSPECIFIED and ROLLBACK

BEGIN;

UPDATE ANIMALS SET SPECIES = 'UNSPECIFIED';

SELECT * FROM ANIMALS; 

ROLLBACK; 

SELECT * FROM ANIMALS;

--  TRANSACTION FOR UPDATING TO DIGIMON AND POKEMON WITH COMMIT

BEGIN; 

UPDATE ANIMALS SET SPECIES = 'DIGIMON' WHERE NAME LIKE '%mon';
UPDATE ANIMALS SET SPECIES = 'POKEMON' WHERE SPECIES IS NULL;

COMMIT; 

SELECT * FROM ANIMALS;

-- TRANSACTION FOR DELETE ALL RECORDS

BEGIN; 

TRUNCATE TABLE ANIMALS; 

SELECT * FROM ANIMALS; 

ROLLBACK; 

SELECT * FROM ANIMALS;

-- SAVEPOINT TRANSACTIONS FOR UPDATE 

BEGIN; 

DELETE FROM ANIMALS WHERE DATE_OF_BIRTH > '2022-01-01'; 

SAVEPOINT ANIMALS_AFTER_JAN; 

UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG *-1; 

ROLLBACK TO ANIMALS_AFTER_JAN; 

UPDATE ANIMALS SET WEIGHT_KG = WEIGHT_KG * -1 WHERE WEIGHT_KG < 0; 

COMMIT; 

SELECT * FROM ANIMALS;

-- QUERIES FOR ANSWRING THE QUESTIONS IN DB

SELECT COUNT(*) FROM ANIMALS;

SELECT COUNT(*) FROM ANIMALS WHERE ESCAPE_ATTEMPTS = 0;

SELECT AVG(WEIGHT_KG) FROM ANIMALS;

SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS 
    WHERE ESCAPE_ATTEMPTS = (
    SELECT MAX(ESCAPE_ATTEMPTS) FROM ANIMALS
    );

SELECT SPECIES, MIN(WEIGHT_KG) , MAX(WEIGHT_KG) FROM ANIMALS GROUP BY SPECIES;

SELECT SPECIES, AVG(ESCAPE_ATTEMPTS) FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY SPECIES;