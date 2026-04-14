-- ============================================================
-- English Premier League 2027-2028 Season Database
-- Author: Finley Hardie
-- Course: INFO 3140 — Database Management
-- University of Denver, Daniels College of Business
-- Date: March 2026
-- ============================================================
-- Database tracks individual player performance statistics
-- across all 20 EPL clubs for the 2027-2028 season.
-- Schema: 1 TEAM table + 5 position tables (GK, DEF, MID, WIN, ST)
-- ============================================================


-- ============================================================
-- SECTION 1: CREATE TABLES
-- ============================================================

CREATE TABLE TEAM (
    TeamName        CHAR(30)    NOT NULL PRIMARY KEY,
    City            CHAR(30)    NOT NULL,
    Stadium         CHAR(40)    NOT NULL,
    Manager         CHAR(30)    NOT NULL,
    LeaguePosition  INT         NOT NULL,
    Points          INT         NOT NULL,
    Wins            INT         NOT NULL,
    Draws           INT         NOT NULL,
    Losses          INT         NOT NULL,
    GoalsFor        INT         NOT NULL,
    GoalsAgainst    INT         NOT NULL
);

CREATE TABLE GOALKEEPER (
    PlayerName      CHAR(30)        NOT NULL PRIMARY KEY,
    TeamName        CHAR(30)        NOT NULL,
    Age             INT             NOT NULL,
    Nationality     CHAR(25)        NOT NULL,
    Saves           INT             NOT NULL,
    CleanSheets     INT             NOT NULL,
    SavePct         DECIMAL(5,2)    NOT NULL,
    GoalsConceded   INT             NOT NULL,
    PensSaved       INT             NOT NULL,
    YellowCards     INT             NOT NULL,
    Appearances     INT             NOT NULL,
    FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DEFENDER (
    PlayerName      CHAR(30)    NOT NULL PRIMARY KEY,
    TeamName        CHAR(30)    NOT NULL,
    Age             INT         NOT NULL,
    Nationality     CHAR(25)    NOT NULL,
    Goals           INT         NOT NULL,
    Assists         INT         NOT NULL,
    Tackles         INT         NOT NULL,
    Interceptions   INT         NOT NULL,
    Clearances      INT         NOT NULL,
    DuelsWon        INT         NOT NULL,
    Crosses         INT         NOT NULL,
    YellowCards     INT         NOT NULL,
    Appearances     INT         NOT NULL,
    FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE MIDFIELDER (
    PlayerName      CHAR(30)        NOT NULL PRIMARY KEY,
    TeamName        CHAR(30)        NOT NULL,
    Age             INT             NOT NULL,
    Nationality     CHAR(25)        NOT NULL,
    Goals           INT             NOT NULL,
    Assists         INT             NOT NULL,
    PassAccuracy    DECIMAL(5,2)    NOT NULL,
    ChancesCreated  INT             NOT NULL,
    Tackles         INT             NOT NULL,
    Interceptions   INT             NOT NULL,
    DuelsWon        INT             NOT NULL,
    YellowCards     INT             NOT NULL,
    Appearances     INT             NOT NULL,
    FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE WINGER (
    PlayerName          CHAR(30)    NOT NULL PRIMARY KEY,
    TeamName            CHAR(30)    NOT NULL,
    Age                 INT         NOT NULL,
    Nationality         CHAR(25)    NOT NULL,
    Goals               INT         NOT NULL,
    Assists             INT         NOT NULL,
    SuccessfulTakeOns   INT         NOT NULL,
    Crosses             INT         NOT NULL,
    ChancesCreated      INT         NOT NULL,
    YellowCards         INT         NOT NULL,
    Appearances         INT         NOT NULL,
    FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE STRIKER (
    PlayerName      CHAR(30)        NOT NULL PRIMARY KEY,
    TeamName        CHAR(30)        NOT NULL,
    Age             INT             NOT NULL,
    Nationality     CHAR(25)        NOT NULL,
    Goals           INT             NOT NULL,
    Assists         INT             NOT NULL,
    GoalsPerGame    DECIMAL(4,2)    NOT NULL,
    ShotAccuracy    DECIMAL(5,2)    NOT NULL,
    Shots           INT             NOT NULL,
    AerialDuelsWon  INT             NOT NULL,
    YellowCards     INT             NOT NULL,
    Appearances     INT             NOT NULL,
    FOREIGN KEY (TeamName) REFERENCES TEAM(TeamName)
        ON UPDATE CASCADE ON DELETE CASCADE
);


-- ============================================================
-- SECTION 2: INSERT DATA
-- ============================================================

-- All 20 EPL Teams
INSERT INTO TEAM VALUES
('Manchester United',  'Manchester',    'Old Trafford',               'Erik ten Hag',          1,  95, 29, 8,  5,  98, 31),
('Manchester City',    'Manchester',    'Etihad Stadium',             'Pep Guardiola',          2,  87, 26, 9,  7,  89, 42),
('Arsenal',            'London',        'Emirates Stadium',           'Mikel Arteta',           3,  84, 25, 9,  8,  87, 44),
('Liverpool',          'Liverpool',     'Anfield',                    'Arne Slot',              4,  82, 24, 10, 8,  85, 46),
('Chelsea',            'London',        'Stamford Bridge',            'Mauricio Pochettino',    5,  76, 22, 10, 10, 79, 52),
('Tottenham',          'London',        'Tottenham Hotspur Stadium',  'Ange Postecoglou',       6,  73, 21, 10, 11, 77, 55),
('Brighton',           'Brighton',      'Amex Stadium',               'Roberto De Zerbi',       7,  71, 20, 11, 11, 75, 58),
('Aston Villa',        'Birmingham',    'Villa Park',                 'Unai Emery',             8,  68, 19, 11, 12, 72, 61),
('West Ham',           'London',        'London Stadium',             'David Moyes',            9,  65, 18, 11, 13, 68, 64),
('Fulham',             'London',        'Craven Cottage',             'Marco Silva',            10, 62, 17, 11, 14, 65, 67),
('Brentford',          'London',        'Gtech Community Stadium',    'Thomas Frank',           11, 59, 16, 11, 15, 62, 70),
('Everton',            'Liverpool',     'Goodison Park',              'Sean Dyche',             12, 56, 15, 11, 16, 59, 73),
('Nottingham Forest',  'Nottingham',    'City Ground',                'Nuno Espirito Santo',    13, 53, 14, 11, 17, 56, 76),
('Leicester City',     'Leicester',     'King Power Stadium',         'Steve Cooper',           14, 50, 13, 11, 18, 53, 79),
('Crystal Palace',     'London',        'Selhurst Park',              'Oliver Glasner',         15, 47, 12, 11, 19, 50, 82),
('Ipswich Town',       'Suffolk',       'Portman Road',               'Kieran McKenna',         16, 44, 11, 11, 20, 47, 85),
('Bournemouth',        'Bournemouth',   'Vitality Stadium',           'Gary ONeil',             17, 41, 10, 11, 21, 44, 88),
('Wolverhampton',      'Wolverhampton', 'Molineux Stadium',           'Gary ONeil',             18, 38, 9,  11, 22, 41, 91),
('Southampton',        'Southampton',   'St Marys Stadium',           'Russell Martin',         19, 26, 6,  8,  28, 35, 98),
('Luton Town',         'Luton',         'Kenilworth Road',            'Rob Edwards',            20, 23, 5,  8,  29, 32, 102);

-- Goalkeepers
INSERT INTO GOALKEEPER VALUES
('Andre Onana',           'Manchester United', 28, 'Cameroon',     145, 18, 82.14, 31, 3, 2, 38),
('Ederson',               'Manchester City',   30, 'Brazil',       138, 15, 80.23, 42, 2, 1, 38),
('David Raya',            'Arsenal',           28, 'Spain',        135, 16, 79.41, 44, 1, 2, 38),
('Alisson Ramses Becker', 'Liverpool',         31, 'Brazil',       132, 14, 78.57, 46, 2, 3, 38),
('Robert Sanchez',        'Chelsea',           27, 'Spain',        125, 12, 76.83, 52, 1, 4, 38),
('Alphonse Areola',       'Fulham',            31, 'France',       120, 11, 75.47, 67, 0, 5, 38),
('Lucas Bergvall',        'Tottenham',         26, 'Sweden',       118, 10, 74.68, 55, 1, 37, 38),
('Mads Hermansen',        'Leicester City',    24, 'Denmark',      110, 8,  72.55, 79, 0, 6, 38),
('Bart Verbruggen',       'Brighton',          22, 'Netherlands',  128, 13, 78.92, 58, 2, 2, 38),
('Emiliano Martinez',     'Aston Villa',       31, 'Argentina',    122, 12, 77.05, 61, 1, 3, 38),
('Lukasz Fabianski',      'West Ham',          39, 'Poland',       115, 9,  73.41, 64, 1, 4, 38),
('Kepa Arrizabalaga',     'Brentford',         29, 'Spain',        119, 10, 74.44, 70, 0, 5, 37);

-- Defenders
INSERT INTO DEFENDER VALUES
('Aaron Wan-Bissaka',      'Manchester United', 26, 'England',     2, 4, 78, 42, 156, 68, 12, 3, 38),
('Lisandro Martinez',      'Manchester United', 25, 'Argentina',   3, 2, 82, 51, 189, 79, 8,  2, 37),
('Harry Maguire',          'Manchester United', 30, 'England',     4, 3, 76, 48, 172, 73, 6,  4, 38),
('Diogo Dalot',            'Manchester United', 24, 'Portugal',    2, 5, 81, 39, 145, 64, 15, 2, 36),
('John Stones',            'Manchester City',   30, 'England',     3, 2, 79, 44, 168, 71, 9,  3, 37),
('Ruben Dias',             'Manchester City',   27, 'Portugal',    2, 1, 80, 45, 175, 75, 7,  2, 38),
('Kyle Walker',            'Manchester City',   33, 'England',     1, 3, 77, 38, 142, 62, 11, 5, 35),
('Ben White',              'Arsenal',           26, 'England',     3, 2, 81, 42, 158, 69, 10, 2, 38),
('Gabriel Magalhaes',      'Arsenal',           26, 'Brazil',      4, 4, 79, 41, 172, 74, 8,  3, 38),
('Oleksandr Zinchenko',    'Arsenal',           27, 'Ukraine',     1, 3, 78, 35, 124, 58, 12, 4, 32),
('Virgil van Dijk',        'Liverpool',         32, 'Netherlands', 3, 5, 77, 38, 168, 76, 6,  3, 38),
('Andrew Robertson',       'Liverpool',         29, 'Scotland',    1, 4, 76, 36, 128, 55, 14, 4, 36),
('Trent Alexander-Arnold', 'Liverpool',         25, 'England',     2, 3, 78, 42, 152, 63, 16, 3, 37),
('Reece James',            'Chelsea',           24, 'England',     1, 2, 75, 40, 138, 61, 13, 5, 32),
('Marc Cucurella',         'Chelsea',           25, 'Spain',       2, 3, 76, 37, 131, 57, 11, 3, 35);

-- Midfielders
INSERT INTO MIDFIELDER VALUES
('Bruno Fernandes',   'Manchester United', 29, 'Portugal',  12, 16, 88.45, 68, 52, 28, 82, 4, 38),
('Scott McTominay',   'Manchester United', 27, 'Scotland',  8,  5,  81.23, 31, 74, 42, 65, 5, 38),
('Casemiro',          'Manchester United', 31, 'Brazil',    4,  3,  83.67, 25, 92, 51, 58, 3, 37),
('Christian Eriksen', 'Manchester United', 32, 'Denmark',   5,  8,  82.11, 42, 38, 22, 45, 2, 32),
('Rodri',             'Manchester City',   28, 'Spain',     6,  2,  89.34, 28, 78, 45, 52, 2, 38),
('Phil Foden',        'Manchester City',   24, 'England',   9,  11, 85.67, 52, 41, 25, 68, 3, 37),
('Kevin De Bruyne',   'Manchester City',   32, 'Belgium',   7,  9,  87.89, 48, 35, 21, 42, 4, 28),
('Declan Rice',       'Arsenal',           25, 'England',   4,  3,  84.21, 22, 65, 38, 48, 3, 38),
('Martin Odegaard',   'Arsenal',           25, 'Norway',    8,  7,  86.45, 51, 31, 19, 35, 2, 38),
('James Maddison',    'Tottenham',         27, 'England',   6,  9,  82.33, 44, 28, 15, 32, 4, 35),
('Yves Bissouma',     'Tottenham',         28, 'Mali',      3,  2,  83.56, 18, 71, 42, 38, 5, 38),
('Alexis Mac Allister','Brighton',         24, 'Argentina', 5,  4,  84.67, 25, 42, 28, 42, 3, 37),
('Mateo Kovacic',     'Manchester City',   30, 'Croatia',   4,  3,  88.12, 24, 45, 32, 38, 1, 36),
('Moises Caicedo',    'Chelsea',           21, 'Ecuador',   2,  1,  79.45, 15, 58, 35, 31, 6, 32),
('Enzo Fernandez',    'Chelsea',           23, 'Argentina', 3,  2,  80.56, 18, 52, 28, 25, 4, 30);

-- Wingers
INSERT INTO WINGER VALUES
('Marcus Rashford',    'Manchester United', 26, 'England',      18, 9,  72, 35, 48, 5, 38),
('Jadon Sancho',       'Manchester United', 24, 'England',      14, 8,  68, 41, 39, 4, 37),
('Alejandro Garnacho', 'Manchester United', 20, 'Argentina',    11, 7,  65, 28, 31, 3, 36),
('Bukayo Saka',        'Arsenal',           22, 'England',      13, 10, 69, 45, 38, 3, 38),
('Leandro Trossard',   'Arsenal',           29, 'Belgium',      10, 7,  66, 32, 28, 4, 35),
('Mohamed Salah',      'Liverpool',         31, 'Egypt',        16, 11, 71, 52, 42, 4, 37),
('Luis Diaz',          'Liverpool',         27, 'Colombia',     12, 8,  67, 38, 35, 3, 36),
('Son Heung-min',      'Tottenham',         31, 'South Korea',  14, 9,  68, 43, 36, 5, 37),
('Dejan Kulusevski',   'Tottenham',         24, 'Sweden',       10, 7,  66, 31, 30, 4, 36),
('Jack Grealish',      'Manchester City',   29, 'England',      7,  8,  78, 38, 35, 3, 34),
('Bernardo Silva',     'Manchester City',   29, 'Portugal',     8,  6,  83, 29, 31, 4, 36),
('Solly March',        'Brighton',          24, 'England',      7,  5,  64, 22, 24, 2, 34),
('Kaoru Mitoma',       'Brighton',          27, 'Japan',        9,  6,  74, 28, 30, 2, 35),
('Eberechi Eze',       'Crystal Palace',    25, 'England',      8,  4,  70, 26, 32, 3, 36);

-- Strikers
INSERT INTO STRIKER VALUES
('Cristiano Ronaldo',   'Manchester United', 39, 'Portugal',       28, 6, 0.74, 68.45, 45, 19, 2, 38),
('Erling Haaland',      'Manchester City',   24, 'Norway',         24, 5, 0.63, 64.23, 52, 18, 4, 38),
('Kai Havertz',         'Arsenal',           24, 'Germany',        19, 4, 0.50, 58.34, 42, 12, 3, 38),
('Darwin Nunez',        'Liverpool',         25, 'Uruguay',        18, 3, 0.47, 56.78, 48, 16, 5, 38),
('Nicolas Jackson',     'Chelsea',           22, 'Senegal',        15, 3, 0.39, 52.45, 38, 13, 4, 38),
('Richarlison',         'Tottenham',         26, 'Brazil',         12, 4, 0.35, 48.56, 34, 11, 5, 34),
('Evan Ferguson',       'Brighton',          21, 'Northern Ireland',11,2, 0.30, 44.23, 32, 9,  3, 36),
('Ollie Watkins',       'Aston Villa',       28, 'England',        16, 5, 0.42, 54.67, 42, 14, 4, 38),
('Danny Ings',          'West Ham',          31, 'England',        13, 2, 0.35, 48.34, 28, 8,  3, 37),
('Alexandre Lacazette', 'Arsenal',           37, 'France',         8,  1, 0.21, 38.45, 20, 6,  2, 32),
('Callum Wilson',       'Bournemouth',       32, 'England',        10, 2, 0.27, 42.56, 24, 7,  4, 36),
('Matej Vydra',         'Ipswich Town',      32, 'Czech Republic', 7,  1, 0.19, 35.67, 18, 5,  3, 36);


-- ============================================================
-- SECTION 3: ANALYTICAL QUERIES
-- ============================================================

-- Query 1: Aggregate Function
-- Average and total goals scored by strikers per team
-- Identifies which clubs have the most productive forward lines
SELECT
    t.TeamName,
    t.LeaguePosition,
    COUNT(s.PlayerName)     AS StrikerCount,
    AVG(s.Goals)            AS AvgGoalsPerStriker,
    SUM(s.Goals)            AS TotalStrikerGoals
FROM TEAM t
LEFT JOIN STRIKER s ON t.TeamName = s.TeamName
GROUP BY t.TeamName, t.LeaguePosition
ORDER BY TotalStrikerGoals DESC;


-- Query 2: JOIN
-- Top scorers on the five highest-ranked teams
-- Useful for scouts targeting elite club talent
SELECT
    s.PlayerName,
    s.TeamName,
    s.Goals,
    s.Assists,
    s.GoalsPerGame,
    t.LeaguePosition,
    t.Points
FROM STRIKER s
JOIN TEAM t ON s.TeamName = t.TeamName
WHERE t.LeaguePosition <= 5
ORDER BY s.Goals DESC;


-- Query 3: Nested Query (Subquery)
-- All defenders playing for top-5 teams
-- Quick filter for high-quality defensive talent from leading clubs
SELECT
    PlayerName,
    TeamName,
    Age,
    Tackles,
    Interceptions,
    Clearances
FROM DEFENDER
WHERE TeamName IN (
    SELECT TeamName FROM TEAM WHERE LeaguePosition <= 5
)
ORDER BY TeamName, Tackles DESC;


-- Query 4: Derived Table
-- Teams whose strikers average more than 12 goals per season
-- Surfaces clubs with productive striker groups vs. their standings
SELECT
    t.TeamName,
    t.LeaguePosition,
    t.Points,
    striker_stats.AvgStrikerGoals,
    striker_stats.NumStrikers
FROM TEAM t
JOIN (
    SELECT
        TeamName,
        AVG(Goals)  AS AvgStrikerGoals,
        COUNT(*)    AS NumStrikers
    FROM STRIKER
    GROUP BY TeamName
    HAVING AVG(Goals) > 12
) striker_stats ON t.TeamName = striker_stats.TeamName
ORDER BY striker_stats.AvgStrikerGoals DESC;
