**Before you start:** rename this file to `unit3c_lastname.md`, using your own last name. Read `unit3c_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3c — Normalization

Open **`unit3_Normalization.xlsx`** in Google Sheets or in Excel. Work through the four sheets in order: **Flat_Table → 1NF → 2NF → 3NF**. The first character (Arnold) is filled in on each sheet so you can see the shape. Do the rest.

When you're done, paste your **final 3NF tables** here as markdown tables, and answer the questions.

**Link to my spreadsheet (or file name if you committed it):**


## 1. First normal form — one value per cell

**a.** What was wrong with the `Special_Abilities` column in the flat table? Which 1NF rule does it break?

**Answer:multiple entries for a single cell**


**b.** After fixing it, one character = many rows. What is the primary key of the 1NF table? Why does it take two columns?

**Answer:Character and abillity as all of the other values in the table rely on them**


## 2. Second normal form — the whole key

**c.** `Experience_Level` depends on only *part* of the composite key. Which part? What is that problem called?

**Answer:Character and Partial dependency**


**d.** You split the 1NF table into two. Name them and give each one's primary key.

**Answer:Characters and character_abillities**


## 3. Third normal form — nothing but the key

**e.** `Character_Rating` (Newcomer / Rising Star / Blockbuster) depends on `Experience_Level`, not directly on the character. What is that problem called? What happens if a character's experience goes from 3 to 4 and only one of the two columns gets updated?

**Answer:Transitive dependency and an insertion error**


**f.** What table did you add to fix it?

**Answer:Ratings**


## 4. Your final 3NF tables

List each table from your 3NF sheet on its own line: the table name, then its columns in parentheses. Mark the key columns with **PK** (primary key) and **FK** (foreign key). A column can be both.

Example format (this is not the answer):

    Students (student_id PK, first_name, last_name)
    Enrollments (student_id PK FK, class_id PK FK)
    Classes (class_id PK, class_name, room)

**Your 3NF tables:**

    Table 1:Characters
    Table 2:Character_abillities
    Table 3:Ratings

## 5. When to break the rules

Your 3NF design needs a join every time someone wants to see a character's rating. A game studio might decide to put `Character_Rating` back into the character table on purpose.

**g.** What is that called, and give one reason they would do it.

**Answer:Denormalization and its to cause redundancy to make the table easier to search through**


## Closing 3c — Vocabulary

| Term | Your definition |
|---|---|
| 1NF |All values must be seperate |
| 2NF |Remove all partial depndancy |
| 3NF |Remove all transitive dependancy |
| Partial dependency |Depends on only one value |
| Transitive dependency |depends on a value that is not a primary or foreign key |
| Denormalization |causing redundancy to make tables easier to search through |

**Partner check:** trade files. Say the golden rule ("the key, the whole key, and nothing but the key") and point at which of your partner's three tables proves each part.
