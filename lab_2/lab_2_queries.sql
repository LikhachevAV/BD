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
  #("MATCH_ID", (SELECT team_id FROM team WHERE team_code = "TEAM_CODE"), "PLAYER_NAME", "MATCH_TIME");
  #1
  ("1", (SELECT team_id FROM team WHERE team_code = "POL"), "Robert Lewandowski", "17"),
  ("1", (SELECT team_id FROM team WHERE team_code = "GRE"), "Dimitris Salpingidis", "51"),
  #2
  ("2", (SELECT team_id FROM team WHERE team_code = "RUS"), "Alan Dzagoev", "15"),
  ("2", (SELECT team_id FROM team WHERE team_code = "RUS"), "Roman Shirokov", "24"),
  ("2", (SELECT team_id FROM team WHERE team_code = "CZE"), "Václav Pilař", "52"),
  ("2", (SELECT team_id FROM team WHERE team_code = "RUS"), "Alan Dzagoev", "79"),
  ("2", (SELECT team_id FROM team WHERE team_code = "RUS"), "Roman Pavlyuchenko", "82"),
  #3
  ("3", (SELECT team_id FROM team WHERE team_code = "DEN"), "Michael Krohn-Dehli", "24"),
  #4
  ("4", (SELECT team_id FROM team WHERE team_code = "GER"), "Mario Gomez", "72"),
  #5
  ("5", (SELECT team_id FROM team WHERE team_code = "ITA"), "Antonio Di Natale", "61"),
  ("5", (SELECT team_id FROM team WHERE team_code = "ESP"), "Cesc Fàbregas", "64"),
  #6
  ("6", (SELECT team_id FROM team WHERE team_code = "CRO"), "Mario Mandžukić", "3"),
  ("6", (SELECT team_id FROM team WHERE team_code = "IRL"), "Sean St Ledger", "19"),
  ("6", (SELECT team_id FROM team WHERE team_code = "CRO"), "Nikica Jelavić", "43"),
  ("6", (SELECT team_id FROM team WHERE team_code = "CRO"), "Mario Mandžukić", "49"),
  #7
  ("7", (SELECT team_id FROM team WHERE team_code = "ENG"), "Joleon Lescott", "30"),
  ("7", (SELECT team_id FROM team WHERE team_code = "FRA"), "Joleon Lescott", "39"),
  #8
  ("8", (SELECT team_id FROM team WHERE team_code = "SWE"), "Zlatan Ibrahimović", "52"),
  ("8", (SELECT team_id FROM team WHERE team_code = "UKR"), "Andriy Shevchenko", "55"),
  ("8", (SELECT team_id FROM team WHERE team_code = "UKR"), "Andriy Shevchenko", "62"),
  #9
  ("9", (SELECT team_id FROM team WHERE team_code = "CZE"), "Petr Jiráček", "3"),
  ("9", (SELECT team_id FROM team WHERE team_code = "CZE"), "Václav Pilař", "6"),
  ("9", (SELECT team_id FROM team WHERE team_code = "GRE"), "Fanis Gekas", "53"),
  #10
  ("10", (SELECT team_id FROM team WHERE team_code = "RUS"), "Alan Dzagoev", "37"),
  ("10", (SELECT team_id FROM team WHERE team_code = "POl"), "Jakub Błaszczykowski", "57"),
  #11
  ("11", (SELECT team_id FROM team WHERE team_code = "POR"), "Pepe", "24"),
  ("11", (SELECT team_id FROM team WHERE team_code = "POR"), "Hélder Postiga", "36"),
  ("11", (SELECT team_id FROM team WHERE team_code = "DEN"), "Nicklas Bendtner", "41"),
  ("11", (SELECT team_id FROM team WHERE team_code = "DEN"), "Nicklas Bendtner", "80"),
  ("11", (SELECT team_id FROM team WHERE team_code = "POR"), "Silvestre Varela", "87"),
  #12
  ("12", (SELECT team_id FROM team WHERE team_code = "GER"), "Mario Gomez", "24"),
  ("12", (SELECT team_id FROM team WHERE team_code = "GER"), "Mario Gomez", "38"),
  ("12", (SELECT team_id FROM team WHERE team_code = "NED"), "Robin van Persie", "73")
  
  /*("MATCH_ID", (SELECT team_id FROM team WHERE team_code = "TEAM_CODE"), "PLAYER_NAME", "MATCH_TIME")*/;
  
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
