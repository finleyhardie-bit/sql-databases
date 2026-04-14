# EPL Database Project — English Premier League 2027-2028

**Finley Hardie · INFO 3140 · March 2026**

---

## Overview

Designed and built a relational database for a fictional sports analytics company called **PremierStats Analytics**, tracking individual player performance statistics across all 20 English Premier League clubs for the 2027-2028 season.

The database serves scouts, coaches, analysts, and media professionals who need to access and compare player performance data across different positions and teams.

**Database stats:** 6 tables · 20 teams · 100+ player records · 4 analytical queries

---

## Business Rules

1. Each team is uniquely identified by `TeamName` — no two teams can share a name
2. Each player appears in exactly one positional table (GK, DEF, MID, WIN, or ST)
3. Every player must be linked to exactly one team (one-to-many: TEAM → each position table)
4. `TeamName` in each position table is a foreign key with `ON UPDATE CASCADE ON DELETE CASCADE`
5. All statistics fields are `NOT NULL` — every player in the database has a complete season record
6. `LeaguePosition` must be a unique value between 1 and 20
7. Percentage stats (`SavePct`, `PassAccuracy`, `ShotAccuracy`) are stored as decimals (82.14 = 82.14%)
8. Appearances range from 0 to 38 (38-game season)

---

## Schema Design

The database uses 6 tables. Position statistics vary significantly by role — save percentage only applies to goalkeepers, successful take-ons only to wingers — so each position gets its own table rather than combining all players into one.

```
TEAM (TeamName PK, City, Stadium, Manager, LeaguePosition, Points, Wins, Draws, Losses, GoalsFor, GoalsAgainst)
  |
  |-- 1:N --> GOALKEEPER (PlayerName PK, TeamName FK, Age, Nationality, Saves, CleanSheets, SavePct, ...)
  |-- 1:N --> DEFENDER   (PlayerName PK, TeamName FK, Age, Nationality, Tackles, Interceptions, Clearances, ...)
  |-- 1:N --> MIDFIELDER (PlayerName PK, TeamName FK, Age, Nationality, PassAccuracy, ChancesCreated, ...)
  |-- 1:N --> WINGER     (PlayerName PK, TeamName FK, Age, Nationality, SuccessfulTakeOns, Crosses, ...)
  |-- 1:N --> STRIKER    (PlayerName PK, TeamName FK, Age, Nationality, Goals, GoalsPerGame, ShotAccuracy, ...)
```

See `ER_Diagram.png` for the full entity-relationship diagram.

---

## Normalization (3NF)

All six tables satisfy Third Normal Form:

- In every table, `PlayerName` (or `TeamName`) is the sole primary key
- Every non-key attribute depends **only** on the primary key, not on other non-key attributes
- No transitive dependencies exist — for example, `Saves` does not determine `CleanSheets` in the GOALKEEPER table; both depend independently on `PlayerName`
- In the TEAM table, `Points` does not strictly determine `LeaguePosition` because goal difference can break ties — both attributes depend on `TeamName` alone

---

## SQL Queries

### Query 1 — Aggregate Function
Average and total striker goals per team. Identifies which clubs have the most productive forward lines.

```sql
SELECT
    t.TeamName,
    t.LeaguePosition,
    COUNT(s.PlayerName)  AS StrikerCount,
    AVG(s.Goals)         AS AvgGoalsPerStriker,
    SUM(s.Goals)         AS TotalStrikerGoals
FROM TEAM t
LEFT JOIN STRIKER s ON t.TeamName = s.TeamName
GROUP BY t.TeamName, t.LeaguePosition
ORDER BY TotalStrikerGoals DESC;
```

### Query 2 — JOIN
Top scorers on the five highest-ranked teams. Built for scouts targeting elite club talent.

```sql
SELECT s.PlayerName, s.TeamName, s.Goals, s.Assists, s.GoalsPerGame, t.LeaguePosition, t.Points
FROM STRIKER s
JOIN TEAM t ON s.TeamName = t.TeamName
WHERE t.LeaguePosition <= 5
ORDER BY s.Goals DESC;
```

### Query 3 — Nested Subquery
All defenders from top-5 clubs, sorted by tackles. Filters high-quality defensive talent from leading teams.

```sql
SELECT PlayerName, TeamName, Age, Tackles, Interceptions, Clearances
FROM DEFENDER
WHERE TeamName IN (
    SELECT TeamName FROM TEAM WHERE LeaguePosition <= 5
)
ORDER BY TeamName, Tackles DESC;
```

### Query 4 — Derived Table
Teams whose strikers average more than 12 goals per season, joined back to the standings. Shows which clubs have genuinely productive striker groups.

```sql
SELECT t.TeamName, t.LeaguePosition, t.Points, striker_stats.AvgStrikerGoals, striker_stats.NumStrikers
FROM TEAM t
JOIN (
    SELECT TeamName, AVG(Goals) AS AvgStrikerGoals, COUNT(*) AS NumStrikers
    FROM STRIKER
    GROUP BY TeamName
    HAVING AVG(Goals) > 12
) striker_stats ON t.TeamName = striker_stats.TeamName
ORDER BY striker_stats.AvgStrikerGoals DESC;
```

---

## Files

| File | Description |
|------|-------------|
| `epl-premier-league-database.sql` | Full SQL — CREATE, INSERT, and all 4 queries |
| `epl-project-writeup.md` | This document |
| `ER_Diagram.png` | Entity-relationship diagram |

---

*University of Denver · Daniels College of Business · INFO 3140*
