
-- https://app.quickdatabasediagrams.com/#/
-- Just uncomment below and paste

-- teams
-- -
-- team_id int pk
-- team_name varchar(15)
-- current_ranking int

-- players
-- -
-- player_id int pk
-- team_id int fk >- teams.team_id
-- firstname text
-- lastname text
-- nickname text

-- goals
-- -
-- goal_id int pk
-- player_id int fk >- players.player_id
-- ref_id int fk >- referees.ref_id
-- match_id int fk >- match.match_id

-- games
-- -
-- game_id int pk
-- game_name varchar(15)
-- game_location text
-- player_id int fk >- players.player_id
-- team_id int fk >- teams.team_id
-- ref_id int fk >- referees.ref_id
-- match_id int fk >- match.match_id
-- season_id int fk >- season.season_id

-- referees
-- -
-- ref_id int pk
-- ref_name text

-- match
-- -
-- match_id int pk
-- match_title text
-- player_id int fk >- players.player_id
-- team_id int fk >- teams.team_id
-- season_id int fk >- season.season_id

-- season
-- -
-- season_id int pk
-- season_start_date date
-- season_end_date date

CREATE TABLE "teams" (
    "team_id" int   NOT NULL,
    "team_name" varchar(15)   NOT NULL,
    "current_ranking" int   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "team_id"
     )
);

CREATE TABLE "players" (
    "player_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "firstname" text   NOT NULL,
    "lastname" text   NOT NULL,
    "nickname" text   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "goals" (
    "goal_id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "ref_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "goal_id"
     )
);

CREATE TABLE "games" (
    "game_id" int   NOT NULL,
    "game_name" varchar(15)   NOT NULL,
    "game_location" text   NOT NULL,
    "player_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "ref_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "referees" (
    "ref_id" int   NOT NULL,
    "ref_name" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "ref_id"
     )
);

CREATE TABLE "match" (
    "match_id" int   NOT NULL,
    "match_title" text   NOT NULL,
    "player_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_match" PRIMARY KEY (
        "match_id"
     )
);

CREATE TABLE "season" (
    "season_id" int   NOT NULL,
    "season_start_date" date   NOT NULL,
    "season_end_date" date   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "season_id"
     )
);

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("team_id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_ref_id" FOREIGN KEY("ref_id")
REFERENCES "referees" ("ref_id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("match_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("team_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_ref_id" FOREIGN KEY("ref_id")
REFERENCES "referees" ("ref_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("match_id");

ALTER TABLE "games" ADD CONSTRAINT "fk_games_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("season_id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("team_id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("season_id");

