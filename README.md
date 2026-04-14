# SQL & Databases

**Finley Hardie — INFO 3140 & INFO 3240 · University of Denver**

Relational database design and SQL querying work from two courses at the Daniels College of Business. Projects cover schema design from scratch, ER diagramming, normalization through 3NF, and analytical querying — across sports and business datasets.

---

## Projects

### EPL Premier League Database (`projects/epl-analysis/`)
The main project for INFO 3140. Designed and built a full relational database for a fictional sports analytics company tracking player performance across all 20 English Premier League clubs.

- Designed a 6-table normalized schema (TEAM + 5 position tables) with business rules, foreign keys, and cascade constraints
- Proved Third Normal Form for each table with formal functional dependency analysis
- Wrote 4 analytical queries: aggregate functions, JOIN, nested subquery, and derived table
- Populated with 100+ player records using real player names and fictional stats

**Files:** `epl-premier-league-database.sql` · `epl-project-writeup.md` · `ER_Diagram.png`

---

### NFL 2016 Database (`projects/nfl-2016/`)
Relational database built around 2016 NFL player and team data.

- Designed the schema and ER diagram before writing any SQL
- Built normalized tables for players, teams, and statistics
- Wrote queries to surface top performers by position, team comparisons, and scoring patterns

**Files:** `NFL2016.db` · `nfl-database-queries.sql` · `ER_Diagram.png`

---

### Superhero Database (`projects/superhero-database/`)
Relational modeling exercise using a superhero character dataset — useful for practicing complex joins and many-to-many relationships.

- Modeled relationships between heroes, powers, publishers, and alignment
- Practiced JOIN types (INNER, LEFT, OUTER) across multiple linked tables

**Files:** `superhero.db` · `superhero-queries.sql`

---

### SQL Query Practice (`projects/sql-queries/`)
Standalone SQL scripts from INFO 3240 focused on querying and manipulating existing databases.

- `manipulating_data.sql` — UPDATE, DELETE, INSERT, and data transformation
- `lab2.sql` / `lab3.sql` / `lab5.sql` — GROUP BY, HAVING, subqueries, and aggregate functions

---

## Tools

`SQL` · `SQLite` · `SQLiteStudio` · `ER Diagramming` · `Database Normalization`

---

*University of Denver · Daniels College of Business · INFO 3140 & INFO 3240*
