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
  ("POR", "Portugal", "Paulu Bentu"),
  ("DEN", "Denmark", "Morten Olsen");
  
INSERT INTO game (match_date, stadium, team1, team2) VALUES
  ("2012-06-08", "National Stadium, Warsaw", "1", "4"),
  ("2012-06-08", "Stadion Miejski, Wroclaw", "2", "3"),
  ("2012-06-12", "Stadion Miejski, Wroclaw", "4", "3"),
  ("2012-06-12", "National Stadium, Warsaw", "1", "2"),
  ("2012-06-09", "Arena Lvov, Lvov", "5", "6"),
  ("2012-06-17", "Arena Lvov, Lvov", "7", "5");
  
  
  
INSERT INTO goal (match_id, team_id, player, match_time) VALUES
  ("1", "1", "Robert Lewandowski", "17"),
  ("1", "4", "Dimitris Salpingidis", "51"),
  ("2", "2", "Alan Dzagoev", "15"),
  ("1", "2", "Roman Pavlyuchenko", "82"),
  ("5", "5", "Mario Gomes", "72"),
  ("6", "7", "Kron-Deli", "24"),
  ("6", "5", "Lukas Podolski", "19"),
  ("6", "5", "Lars Bender", "80");
  
###SELECTS:
#1
# Найти идентификаторы матчейи имена игроков для всех голов, забитых игроками из Германии.
SELECT game.match_id, goal.player
 FROM (game LEFT JOIN goal ON game.match_id = goal.match_id)
   LEFT JOIN team ON goal.team_id = team.team_id
 WHERE team.team_code="GER";

#2
# Найти игрока, идентификатор команды, название стадиона и дату матча для каждого гола, забитого командой Германии
SELECT goal.player, team.team_id, game.stadium, game.match_date
  FROM (goal INNER JOIN team
    ON goal.team_id = team.team_id) INNER JOIN 
    game ON (game.team1 = goal.team_id OR 
      game.team2 = goal.team_id)
  WHERE team.team_code="GER"
  GROUP BY goal.player;

#3
# Найти названия команд для всех встреч, в которых забивал игрок с именем Mario
SELECT team.team_name AS team1_name, team2.team_name AS team2_name
FROM game LEFT JOIN team ON game.team1 = team.team_id
  RIGHT JOIN team AS team2 ON game.team2 = team2.team_id
  LEFT JOIN goal ON goal.team_id = team.team_id
WHERE goal.player LIKE("Mario%");
