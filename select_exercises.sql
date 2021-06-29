SHOW databases;
USE albums_db;
-- Primary Key
DESCRIBE albums;
-- 31 rows
SELECT *
FROM albums;
-- 23 Unique artists
SELECT DISTINCT artist
FROM albums;
-- oldest date 1967
SELECT release_date
FROM albums 
WHERE release_date <=1970;
-- Recent date 2011
SELECT release_date
FROM albums 
WHERE release_date >=2000;
-- Oldest and recent release dates "2011 and 1967" --alternative try
SELECT MAX(release_date), MIN(release_date)
FROM albums;
-- Pink Floyd albums "The Dark Side of the Moon" and "The Wall"
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';
-- The year Sgt. Pepper's Lonely Hearts Club Band was released - 1967
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- The genre for the album Nevermind "Grunge, Alternative rock"
SELECT genre
FROM albums
WHERE name = 'Nevermind';
-- Which albums were released in the 1990s "11"
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
-- Which albums had less than 20 million certified sales "13"
SELECT name 
FROM albums
WHERE sales <= 20;
-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? "5 - the WHERE statement does ot include HARD"
SELECT name
FROM albums
WHERE genre = 'rock';