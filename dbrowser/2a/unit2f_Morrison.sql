-- =====================================================================
-- Unit 2f — Joining Two Tables
-- Database Applications Development · MCCC
--
-- Databases: movies_small.db for 1-3, nba_5seasons.db for 4-6
-- Note above each query which database it uses.
--
-- Rename this file with your last name before you start.
--
-- Read unit2f_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Show every movie's title alongside its average rating.
SELECT m.title, r.avg_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
ORDER BY r.avg_rating DESC

-- 2. Show the ten most-voted movies: title, average rating, and
--    number of votes.
SELECT m.title, r.avg_rating, r.num_votes
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
ORDER BY r.num_votes DESC

-- 3. Show movies rated above 8.5: title, release year, and rating,
--    highest rated first.
SELECT m.title, r.avg_rating, r.num_votes
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
WHERE (r.avg_rating > 8.5)
ORDER BY r.num_votes DESC

-- 4. Show the game date, team name, and points for the first 20 rows
--    of team_game_stats.
SELECT g.game_date, g.matchup, t.full_name, g.pts
FROM team_game_stats g
JOIN teams t ON t.team_id = g.team_id
ORDER BY game_date DESC
LIMIT 20;

-- 5. Show the ten highest-scoring player seasons: player name,
--    season, and points.
SELECT s.season, s.pts, p.full_name
FROM player_season_stats s
JOIN players p ON s.player_id = p.player_id
ORDER BY pts DESC

-- 6. For the 2024-25 season, show the ten highest-scoring players
--    with their name, their team's name, and their points.
--    (Three tables.)
SELECT s.season, s.pts, p.full_name, t.full_name AS Team_name
FROM player_season_stats s
JOIN players p ON s.player_id = p.player_id
JOIN teams t ON t.team_id = s.team_id
WHERE season = '2024-25'
ORDER BY pts DESC
LIMIT 10;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 1 returns 2,659 rows — the same as the number of movies.
-- What does that tell you about the relationship between movies and
-- ratings?
--Ratings are connected to movies by how many movies there are. Each movie has a rating, so the number of rows is the same.

-- In query 6, which table sits in the middle connecting the other two?
--The `player_season_stats` table sits in the middle connecting the `players` and `teams` tables.

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Join:
-- A join connects two tables together based on a related column between them.

-- INNER JOIN:
--you keep only the rows that have matching values in both tables.

-- Table alias:
--defines which table a value is coming from when two tables have the same value name
