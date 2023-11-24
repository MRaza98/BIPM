

-- LIKE SQL Statement

SELECT
	* 
FROM artists
WHERE name LIKE 'Barbara%'
AND name LIKE '%Hep%';


-- Levenshtein Distance

CREATE EXTENSION fuzzystrmatch;

SELECT levenshtein('GUMBO', 'GAMBOL');
SELECT levenshtein('extensive', 'exhaustive');
SELECT levenshtein('Saturday', 'Sunday');


SELECT
	*,
    LEVENSHTEIN(name, 'Freda Kallo')
FROM artists
ORDER BY LEVENSHTEIN(name, 'Freda Kallo') ASC
LIMIT 5

-- SOUNDEX SIMILARITY


SELECT soundex('Roland');

SELECT soundex('Anne'), soundex('Anne'), difference('Anne', 'Anne')  as soundex_similarity;
SELECT soundex('Anne'), soundex('Anni'), difference('Anne', 'Anni')  as soundex_similarity;
SELECT soundex('Anne'), soundex('Andrew'), difference('Anne', 'Andrew')  as soundex_similarity;
SELECT soundex('Anne'), soundex('Margaret'), difference('Anne', 'Margaret')  as soundex_similarity;
SELECT soundex('Roland'), soundex('Ronald'), difference('Roland', 'Ronald') as soundex_similarity;
SELECT soundex('Assistance'), soundex('Assistants'), difference('Assistance', 'Assistants') as soundex_similarity;


SELECT
	*
FROM artists
WHERE nationality IN ('American', 'British')
AND SOUNDEX(name) = SOUNDEX('Damian Hurst');


SELECT *, difference(name, 'Freda Kallo')  FROM artists WHERE difference(name, 'Freda Kallo') > 3
ORDER BY difference(name, 'Freda Kallo') ASC;

-- METAPHONE

SELECT metaphone('Assistance', 100);
SELECT metaphone('Assistants', 100);	


SELECT
	artist_id,
    name,
    METAPHONE(name,10)
FROM artists
WHERE nationality = 'American'
LIMIT 5;



SELECT
	*
FROM artists
WHERE nationality = 'American'
ORDER BY SIMILARITY(
	METAPHONE(name,10),
    METAPHONE('Si Tomlee',10)
    ) DESC
LIMIT 5;

-- Trigrams

CREATE EXTENSION pg_trgm;

SELECT show_trgm('Leo');

SELECT show_trgm('Roland Mueller');
SELECT show_trgm('Ronald Müller');

SELECT SIMILARITY('ABCABC','ABCABCABC');
SELECT SIMILARITY('ABCABC','ABCABCABD');


SELECT
	*
FROM artists
WHERE SIMILARITY(name,'Claud Monay') > 0.4 ;

SELECT 
	*
FROM artists
ORDER BY SIMILARITY(name,'Lee Casner') DESC
LIMIT 5;

