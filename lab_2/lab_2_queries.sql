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

###INSERT DATA

INSERT INTO team (team_code, team_name, coach) VALUES
  ("POL", "Poland", "Franciszek Smuda"),
  ("RUS", "Russia", "Dick Advocaat"),
  ("CZE", "Czech Republic", "Michal Bilek"),
  ("GRE", "Greece", "Fernando Santos"),
  ("GER", "Germany", "Yoakhim Lev"),
  ("POR", "Portugal", "Paulu Bentu");
  
INSERT INTO game (match_date, stadium, team1, team2) VALUES
  ("2012-06-08", "National Stadium, Warsaw", "1", "4"),
  ("2012-06-08", "Stadion Miejski, Wroclaw", "2", "3"),
  ("2012-06-12", "Stadion Miejski, Wroclaw", "4", "3"),
  ("2012-06-12", "National Stadium, Warsaw", "1", "2"),
  ("2012-06-10", "Arena Lvov, Lvov", "5", "6");
  
INSERT INTO goal (match_id, team_id, player, match_time) VALUES
  ("1", "1", "Robert Lewandowski", "17"),
  ("1", "4", "Dimitris Salpingidis", "51"),
  ("2", "2", "Alan Dzagoev", "15"),
  ("1", "2", "Roman Pavlyuchenko", "82"),
  ("5", "5", "Mario Gomes", "72");
  
###SELECTS:
#1
SELECT game.match_id, goal.player
 FROM (game LEFT JOIN goal ON game.match_id = goal.match_id)
   LEFT JOIN team ON goal.team_id = team.team_id
 WHERE team.team_code="GER";
