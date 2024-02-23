# Netflix Data

## Analysis of Netflix Data with SQL

Netflix, the world’s leading streaming entertainment service, has revolutionized the way we consume content. With a vast library of TV shows, movies, and documentaries, Netflix offers something for everyone. In this article, we will dive into the world of Netflix data using SQL to uncover interesting insights and answer essential questions.

### The Dataset
To perform our analysis, we can use Kaggle’s extensive dataset, which provides detailed information about Netflix shows and movies. It includes more than 8000 datapoints.  

### Data set details
1. show_id : Show number
2. type : Shows are differntiated basis 'TV show' or 'Movies'.
3. director : Name of director/directors
4. cast_ : Details regarding cast of the respective show.
5. date_added : Date when the show was added on Netflix.
6. relaese_year : Year when show was released.
7. rating : Rating of the show
8. duration : Duration of the show
9. listed_in : Different Genres of the show
10. discription : Storyline of the show  

### Exploratory Data Analysis
Primarily I cleaned data by deleting irrelavant rows like without titles, without directors & cast. I have included 'genre' Column to exisiting table based on 'listed_in' Column. Then I tried answering some questions like,
1. Starting with understanding Data structure
2. How many TV shows and movies are available on Netflix?
3. Who are the top 10 directors with the most content on Netflix?
4. What are the most popular genres on Netflix?
5. What are the 10 most recently added titles on Netflix?
6. Calculate the average release year for TV shows and movies separately.
7. Identify the top 10 countries with the most content available on Netflix.
8. Find the titles with the longest and shortest durations on Netflix.
9. Analyze how much content was added to Netflix each year.
10. Find the top 10 movies with the longest titles.
