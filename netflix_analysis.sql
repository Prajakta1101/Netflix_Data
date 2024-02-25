DROP table if exists netflix_data;

create table netflix_data (
	show_id VARCHAR(100) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_ TEXT,
    country VARCHAR(255),
    date_added VARCHAR(255),
    release_year VARCHAR(255),
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in VARCHAR(255),
    description TEXT);

SELECT * FROM netflix_data;

/* Data Clening*/
--- Deleting the 1st row
delete from netflix_data where show_id='show_id';    --- Duplicate row, same as headings

--- Missing data in a 'title' Column
Select * from netflix_data where title is null;

--- Missing data in a 'director' & 'cast_' Columns
Select * from netflix_data 
where director is null 
and cast_ is null;

--- Deleting data where 'director' & 'cast_' are missing
DELETE from netflix_data 
where director is null 
and cast_ is null;

--- Deleting data where 'date_added' is missing
DELETE from netflix_data 
where date_added is null;

SELECT * FROM netflix_data;

--- Renaming Null Values in columns
select show_id, type, title, 
COALESCE (director, 'NO Director') as director,
COALESCE (cast_, 'NO Cast') as cast_
from netflix_data;

--- Understanding unique genres
select count(distinct listed_in) from netflix_data;

select distinct listed_in from netflix_data;

--- Adding Column Genre
Alter table netflix_data 
ADD genre VARCHAR(255);

--- Update the 'genre' column based on the values in the 'listed_in' column
UPDATE netflix_data
SET genre = CASE
	when listed_in LIKE '%Docu%' then 'Documentaries'
	when listed_in LIKE '%Dramas%' then 'Drama'
	when listed_in LIKE '%Comed%' then 'Comedy'
	when listed_in LIKE '%Action & Adventure%' then 'Action & Adventure'
	when listed_in LIKE '%Thriller%' then 'Thriller'
	when listed_in LIKE '%Horror%' then 'Horror'
	when listed_in LIKE '%Crime%' then 'Crime'
	when listed_in LIKE '%Anime%' then 'Animation'
	when listed_in LIKE '%Reality%' then 'Reality Show'
	when listed_in LIKE '%Music & Musicals%' then 'Musical Show'
	when listed_in LIKE '%Sci-Fi & Fantasy%' then 'Sci-Fi Shows'
	when listed_in LIKE '%Romantic%' then 'Romantic Shows'
	when listed_in LIKE '%Mysteries%' then 'Mystery'
	when listed_in LIKE '%Kids%' then 'Kid Shows'
	else 'Other'
end;
	
select * from netflix_data;	
	
/* Exploratory Data Analysis*/

---Get the number of records in the dataset ()
SELECT COUNT(*) AS total_records FROM netflix_data;

-- Count the number of TV shows and movies
SELECT
    type,
    COUNT(*) AS count
FROM netflix_data
GROUP BY type;

-- Top 10 directors with the most content
SELECT
    director,
    COUNT(*) AS content_count
FROM netflix_data
WHERE director IS NOT NULL
GROUP BY director
ORDER BY content_count DESC
LIMIT 10;

-- Popular genres on Netflix
SELECT
    genre,
    COUNT(*) AS count
FROM (
    SELECT
        UNNEST(string_to_array(listed_in, ', ')) AS genre
    FROM netflix_data
) AS genres
GROUP BY genre
ORDER BY count DESC
LIMIT 10;

-- 10 most recently added titles
SELECT
    title,
    date_added 
FROM netflix_data
ORDER BY date_added DESC 
LIMIT 10;

-- Average release year by content type
SELECT
    type,
    AVG(cast(release_year as INT)) AS avg_release_year
FROM netflix_data
GROUP BY type;

-- Top 10 countries with the most content
SELECT
    country,
    COUNT(*) AS content_count
FROM netflix_data
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC
LIMIT 10;

-- Longest and shortest duration
SELECT title, duration
FROM netflix_data
where duration is not null
ORDER BY duration DESC
LIMIT 1;

SELECT title, duration
FROM netflix_data
where duration is not null and duration not like '%Season%'
ORDER BY duration ASC
LIMIT 1;

-- Content added per year
SELECT 
    date_part('year', CAST(date_added AS DATE)) AS year_added,
    COUNT(*) AS content_count
FROM 
    netflix_data
GROUP BY 
    year_added
ORDER BY 
    year_added;
