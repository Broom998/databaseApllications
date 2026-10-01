**Before you start:** rename this file to `unit3b_lastname.md`, using your own last name. Read `unit3b_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3b — Keys and Relationships

## 1. Which key?

For each table, decide: is the primary key **natural** (a real-world value that already exists, like an email) or **surrogate** (a made-up ID number)? Is it **composite** (more than one column)?

| Table | Primary key | Natural or surrogate? | Composite? |
|---|---|:-:|:-:|
| `teams` in `nba_5seasons.db` | `team_id` | | |
| `player_season_stats` in `nba_5seasons.db` | | | |
| A US state table | `state_abbrev` (OH, MI, PA…) | | |
| The school's student records | `student_id` | | |

**a.** The school could use a student's full name as the primary key instead of `student_id`. Give one reason that's a bad idea.

**Answer: Someone else sharing the same name**


## 2. What a foreign key promises

**b.** In `denormalized_demo.db`, `games.home_team_id` is a foreign key to `teams.team_id`. If someone tries to insert a game with `home_team_id = 99` and there is no team 99, what should the database do? What is that rule called?

**Answer:Refuse or reject the entry this is called referential integrity**


**c.** If team 6 were deleted from `teams`, what should happen to its rows in `games`? Name two different choices a designer could make.

**Answer:Wont let it be deleted while there are still rows that point to it or delete all of the rows that do reference the team**


## 3. Sort the relationships

**Choose from:** One-to-one · One-to-many · Many-to-many

| # | Relationship | Type |
|:-:|---|---|
| 1 | One team → its games this season |one-many |
| 2 | Students ↔ the courses they're enrolled in |many-many |
| 3 | A person → their Social Security number |one-one |
| 4 | A customer → their orders |one-many |
| 5 | Movies ↔ the actors in them |many-many |
| 6 | A country → its capital city |one-one |

**d.** Pick either many-to-many row. Relational databases can't store a many-to-many directly. What table do you add, and what columns does it need?

**Answer:a seperate table that connects the other two tables together through foreign keys**


**e.** Not every database uses tables and keys. In a **graph** database (like the one behind Instagram's follow list), the same "who follows whom" relationship is stored as what two things? In a **key-value** store, how is a relationship handled?

**Answer:a relationship in a key value store keys inside of other values so when you ask for the value you additionally get all of the keys involved with that value and those are stored as a value and a key**


## 4. Your first ER diagram

Here is the `denormalized_demo.db` fixed version as a Mermaid diagram. It already renders — push and look at it on GitHub or preview it in VS Code.

```mermaid
erDiagram
    TEAMS ||--o{ GAMES : "home team in"
    TEAMS ||--o{ GAMES : "away team in"
    TEAMS {
        int team_id PK
        string full_name
        string city
        string state
    }
    GAMES {
        int game_id PK
        string game_date
        int home_team_id FK
        int away_team_id FK
        int home_pts
        int away_pts
    }
```

**Now make your own, using AI.** Follow the four steps in the walkthrough: plan it, prompt the AI, proof it, test it. A school schedule has these entities: **STUDENTS**, **COURSES**, **TEACHERS**, and an **ENROLLMENTS** junction table. Rules:

- One teacher teaches many courses; each course has one teacher.
- Students take many courses; courses have many students. (That's what ENROLLMENTS is for.)

Give every entity a primary key and at least two attributes. Mark the foreign keys.

```mermaid
erDiagram
    %% replace this comment with your diagram

```

**Paste the prompt you gave the AI.** If you used a PowerPoint picture, add the picture to your repo too.

```text
 Make a mermaid.live setup with tables for STUDENTS, COURSES, TEACHERS, and an ENROLLMENTS junction table. Rules:
- One teacher teaches many courses; each course has one teacher.
- Students take many courses; courses have many students. (That's what ENROLLMENTS is for.) 
- Give every entity a primary key and at least two attributes. Mark the foreign keys.
```

**f.** Which entity has two foreign keys? What should its primary key be?

**Answer:enrollment / enrollment ID**


**g.** What did you have to fix in the AI's diagram? If you didn't change anything, what did you check to make sure it was right?

**Answer:I chccked to make sure foreign keys actually existed**


## Closing 3b — Vocabulary

| Term | Your definition |
|---|---|
| Entity |thing data is based on |
| Attribute |infor about an entity |
| Natural key |an abbreviation that is interpretted with information ouitside of the database |
| Surrogate key |a one time value that never changes |
| Composite key |made from two or more columns that uniquely identifies a value in a table |
| Referential integrity |refusing to accept a search for a valu that does not exist |
| Junction table |a table that connects two other tables that have a many-many relationship |
| Cardinality |the amount of records able to be related to each other |

**Partner check:** trade files. Read your partner's Mermaid code out loud, one relationship line at a time, as English ("one teacher, many courses"). If it doesn't read right, one of you has the crow's foot on the wrong end.
