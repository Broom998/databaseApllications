-- =====================================================================
-- Unit 2g — Keeping the Unmatched Rows
-- Database Applications Development · MCCC
--
-- Databases: nba_5seasons.db for 1-3, movies_small.db for 4-5
--
-- Rename this file with your last name before you start.
--
-- Read unit2g_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Using an INNER JOIN, count how many players have stats for the
--    2025-26 season.
SELECT s.season, s.pts, s.blk, s.reb, s.gp, p.full_name
FROM player_season_stats s
JOIN players p ON s.player_id = p.player_id AND s.season = '2025-26'
ORDER BY pts DESC

-- 2. Using a LEFT JOIN from players, count how many rows you get for
--    the same thing.
SELECT s.season, s.pts, s.blk, s.reb, s.gp, p.full_name
FROM player_season_stats s
LEFT JOIN players p ON s.player_id = p.player_id AND s.season = '2025-26'
ORDER BY pts DESC

-- 3. List the names of players who have no 2025-26 season stats.
SELECT s.season, s.pts, s.blk, s.reb, s.gp, p.full_name
FROM player_season_stats s
LEFT JOIN players p ON s.player_id = p.player_id AND s.season = '2025-26'
WHERE p.player_id IS NULL
ORDER BY pts DESC

-- 4. In movies_small.db, count how many rows in roles have no
--    character name recorded.
SELECT role, character
FROM roles
WHERE character IS NULL

-- 5. Show ten people from movies_small.db who have no birth year
--    recorded.
SELECT name, birth_year
FROM people
WHERE birth_year IS NULL
LIMIT 10

-- 6. Pick any query from this unit you found interesting, run it, and
--    export the results to CSV. Name the file
--    unit2_report_lastname.csv and commit it alongside this file.


-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Queries 1 and 2 return different numbers. What are they, and what
-- does the difference represent?
--652 and 2945
--the difference represents the number of players who do not have stats for the 2025-26 season.

-- In query 3 you filtered with IS NULL. Which table did that NULL
-- come from, and why is it NULL?
-- The NULL comes from the players table because that is the table with the full names

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- LEFT JOIN:
--includes all rows in a table even if there is no match for the other table during a join

-- Export:
--sending a file from one place to another
