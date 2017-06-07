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
  ("GRE", "Greece", "Fernando Santos"),
  ("RUS", "Russia", "Dick Advocaat"),
  ("CZE", "Czech", "Republic Michal Bílek"),
  ("NED", "Netherlands", "Bert van Marwijk"),
  ("DEN", "Denmark", "Morten Olsen"),
  ("GER", "Germany", "Joachim Löw"),
  ("POR", "Portugal", "Paulo Bento"),
  ("ESP", "Spain", "Vicente del Bosque"),
  ("ITA", "Italy", "Cesare Prandelli"),
  ("IRL", "Ireland", "Giovanni Trapattoni"),
  ("CRO", "Croatia", "Slaven Bilić"),
  ("FRA", "France", "Laurent Blanc"),
  ("ENG", "England", "Roy Hodgson"),
  ("UKR", "Ukraine", "Oleh Blokhin"),
  ("SWE", "Sweden", "Erik Hamrén");


INSERT INTO game (match_date, stadium, team1, team2) VALUES
  ("2012-06-08", 
  "Stadion Narodowy, Warsaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "POL"), 
  (SELECT team.team_id FROM team WHERE team_code = "GRE")),

  ("2012-06-08", 
  "Municipal Stadium Wroclaw, Wroclaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "RUS"), 
  (SELECT team.team_id FROM team WHERE team_code = "CZE")),

  ("2012-06-09", 
  "Metalist Stadium, Kharkiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "NED"), 
  (SELECT team.team_id FROM team WHERE team_code = "DEN")),
			
  ("2012-06-09", 
  "Arena Lviv, Lviv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "GER"), 
  (SELECT team.team_id FROM team WHERE team_code = "POR")),

  ("2012-06-10", 
  "Arena Gdansk, Gdansk (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "ESP"), 
  (SELECT team.team_id FROM team WHERE team_code = "ITA")),
	
  ("2012-06-10", 
  "Municipal Stadium Poznan, Poznan (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "IRL"), 
  (SELECT team.team_id FROM team WHERE team_code = "CRO")),
	
  ("2012-06-11", 
  "Donbass Arena, Donetsk (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "FRA"), 
  (SELECT team.team_id FROM team WHERE team_code = "ENG")),
  
  ("2012-06-11", 
  "NSK Olimpiyskyi, Kyiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "UKR"), 
  (SELECT team.team_id FROM team WHERE team_code = "SWE")),  
  
  ("2012-06-12", 
  "Municipal Stadium Wroclaw, Wroclaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "GRE"), 
  (SELECT team.team_id FROM team WHERE team_code = "CZE")),

  ("2012-06-12", 
  "Stadion Narodowy, Warsaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "POL"), 
  (SELECT team.team_id FROM team WHERE team_code = "RUS")),
  
  ("2012-06-13", 
  "Arena Lviv, Lviv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "DEN"), 
  (SELECT team.team_id FROM team WHERE team_code = "POR")),  

  ("2012-06-13", 
  "Metalist Stadium, Kharkiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "NED"), 
  (SELECT team.team_id FROM team WHERE team_code = "GER")), 	
  
  ("2012-06-14", 
  "Municipal Stadium Poznan, Poznan (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "ITA"), 
  (SELECT team.team_id FROM team WHERE team_code = "CRO")),  

  ("2012-06-14", 
  "Arena Gdansk, Gdansk (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "ESP"), 
  (SELECT team.team_id FROM team WHERE team_code = "IRL")),  
		
  ("2012-06-15", 
  "Donbass Arena, Donetsk (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "UKR"), 
  (SELECT team.team_id FROM team WHERE team_code = "FRA")),	

  ("2012-06-15", 
  "NSK Olimpiyskyi, Kyiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "SWE"), 
  (SELECT team.team_id FROM team WHERE team_code = "ENG")),		

  ("2012-06-16", 
  "Stadion Narodowy, Warsaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "GRE"), 
  (SELECT team.team_id FROM team WHERE team_code = "RUS")),					

  ("2012-06-16", 
  "Municipal Stadium Wroclaw, Wroclaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "CZE"), 
  (SELECT team.team_id FROM team WHERE team_code = "POL")),
  
  ("2012-06-17", 
  "Metalist Stadium, Kharkiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "POR"), 
  (SELECT team.team_id FROM team WHERE team_code = "NED")),

  ("2012-06-17", 
  "Arena Lviv, Lviv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "DEN"), 
  (SELECT team.team_id FROM team WHERE team_code = "GER")), 

  ("2012-06-18", 
  "Arena Gdansk, Gdansk (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "CRO"), 
  (SELECT team.team_id FROM team WHERE team_code = "ESP")), 
  
  ("2012-06-18", 
  "Municipal Stadium Poznan, Poznan (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "ITA"), 
  (SELECT team.team_id FROM team WHERE team_code = "IRL")),

  ("2012-06-19", 
  "NSK Olimpiyskyi, Kyiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "SWE"), 
  (SELECT team.team_id FROM team WHERE team_code = "FRA")),

  ("2012-06-19", 
  "Donbass Arena, Donetsk (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "ENG"), 
  (SELECT team.team_id FROM team WHERE team_code = "UKR")),		

  ("2012-06-21", 
  "Stadion Narodowy, Warsaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "CZE"), 
  (SELECT team.team_id FROM team WHERE team_code = "POR")),	

  ("2012-06-22", 
  "Arena Gdansk, Gdansk (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "GER"), 
  (SELECT team.team_id FROM team WHERE team_code = "GRE")), 

  ("2012-06-23", 
  "Donbass Arena, Donetsk (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "ESP"), 
  (SELECT team.team_id FROM team WHERE team_code = "FRA")), 
  
  ("2012-06-24", 
  "NSK Olimpiyskyi, Kyiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "ENG"), 
  (SELECT team.team_id FROM team WHERE team_code = "ITA")),

  ("2012-06-27", 
  "Donbass Arena, Donetsk (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "POR"), 
  (SELECT team.team_id FROM team WHERE team_code = "ESP")),

  ("2012-06-28", 
  "Stadion Narodowy, Warsaw (POL)", 
  (SELECT team.team_id FROM team WHERE team_code = "GER"), 
  (SELECT team.team_id FROM team WHERE team_code = "ITA")), 
 
  ("2012-07-01", 
  "NSK Olimpiyskyi, Kyiv (UKR)", 
  (SELECT team.team_id FROM team WHERE team_code = "ESP"), 

  (SELECT team.team_id FROM team WHERE team_code = "ITA"));
  
  
  
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
