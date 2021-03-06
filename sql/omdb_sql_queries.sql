/*!
By: Aziz Moalim
7.43
Give me a summary of m_link_type. The result set should contain the count of each m_link_type. 

*/

SELECT m_link_type, count(*)
FROM movie_media
GROUP BY m_link_type;

/*
By: Mahamad Osman
7.52
Give me a summary of the song count by the “theme”
*/
SELECT DISTINCT theme, COUNT(*) as 'number of songs'FROM songs GROUP BY theme DESC;


/*
By: Kim Pampusch
7.59
Give me the list of people who played “leading actor” role 
and their corresponding “screen name”
*/
SELECT `movie_people`.`screen_name`, `people`.`first_name`, `people`.`last_name` 
FROM `movie_people` INNER JOIN `people` ON (`movie_people`.`people_id` = `people`.`id`) 
WHERE LOWER(`movie_people`.`role`) = "lead actor";

/*!
By: Kimsan Heng
7.64
Given a search string, the query should search across native_name (in movies table), stage_name (in peoples table) and title (in songs table). And the query should return all the matches specifying the type of the item (movie, people, song) matched. Let us say I have given the input string as “o”, your tuples may look as follows since “o” is there in “frozen”, “tom hanks”, and “let it snow”.

*/

SELECT `movie_id` AS `id`,`native_name` AS `name_matched`, "movie" AS `type_of_match`
FROM `movies`
WHERE (`native_name`) LIKE '%o%'
UNION ALL

SELECT `id`,`stage_name` AS `name_matched`, "people" AS `type_of_match`
FROM `people`
WHERE (`stage_name`) LIKE '%o%'
UNION ALL

SELECT `song_id`,`title` AS `name_matched`, "song" AS `type_of_match`
FROM `songs`
WHERE (`title`) LIKE '%o%'

/*
By: Louis Atu Tetuh 
7.58
Give me the list of people who played “supporting actor” role 
and their corresponding “screen name"
*/
SELECT p.id, p.first_name, p.middle_name, p.last_name, mp.screen_name
FROM `people` p
INNER JOIN movie_people mp ON p.id = mp.people_id WHERE mp.role = 'supporting actor';

/*
By: Sharmarke Mohamed 
7.65
Give the list of all the movies which didn’t make any money (compare budget with box_office)
*/
SELECT movies.movie_id, movies.native_name, (movie_numbers.box_office - movie_numbers.budget) 
AS "Loss" 
FROM movie_numbers 
INNER JOIN movies 
ON movie_numbers.movie_id = movies.movie_id 
WHERE (movie_numbers.box_office - movie_numbers.budget) < 0