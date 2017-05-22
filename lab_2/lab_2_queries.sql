CREATE database uefa_euro_2012;
USE uefa_euro_2012;
####CREATE TABLES

CREATE TABLE team (
  team_id SERIAL,
  team_code VARCHAR(255),
  team_name VARCHAR(255),
  coach VARCHAR(255),
  PRIMARY KEY (team_id)
);

CREATE TABLE game (
  match_id SERIAL,
  match_date DATE,
  stadium varchar(255),
  team1 BIGINT UNSIGNED,
  team2 BIGINT UNSIGNED,
  PRIMARY KEY (match_id),
  FOREIGN KEY (team1)
    REFERENCES team (team_id)
    ON DELETE CASCADE,
  FOREIGN KEY (team2)
    REFERENCES team (team_id)
    ON DELETE CASCADE  
);

CREATE TABLE goal (
  goal_id SERIAL,
  match_id BIGINT UNSIGNED,
  team_id BIGINT UNSIGNED,
  player VARCHAR (255),
  match_time SMALLINT UNSIGNED,
  PRIMARY KEY (goal_id),
  FOREIGN KEY (match_id)
    REFERENCES game (match_id)
	ON DELETE CASCADE,
  FOREIGN KEY (team_id)
    REFERENCES team (team_id)
	ON DELETE CASCADE
);