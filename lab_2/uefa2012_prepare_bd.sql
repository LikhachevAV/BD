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
  ("12", (SELECT team_id FROM team WHERE team_code = "NED"), "Robin van Persie", "73"),
  #13
  ("13", (SELECT team_id FROM team WHERE team_code = "ITA"), "Andrea Pirlo", "39"),
  ("13", (SELECT team_id FROM team WHERE team_code = "CRO"), "Mario Mandžukić", "72"),
  #14
  ("14", (SELECT team_id FROM team WHERE team_code = "ESP"), "Fernando Torres", "4"),
  ("14", (SELECT team_id FROM team WHERE team_code = "ESP"), "David Silva", "49"),
  ("14", (SELECT team_id FROM team WHERE team_code = "ESP"), "Fernando Torres", "70"),
  ("14", (SELECT team_id FROM team WHERE team_code = "ESP"), "Cesc Fàbregas", "83"),
  #15
  ("15", (SELECT team_id FROM team WHERE team_code = "FRA"), "Jérémy Ménez", "53"),
  ("15", (SELECT team_id FROM team WHERE team_code = "FRA"), "Yohan Cabaye", "56"),
  #16
  ("16", (SELECT team_id FROM team WHERE team_code = "ENG"), "Andy Carroll", "23"),
  ("16", (SELECT team_id FROM team WHERE team_code = "SWE"), "Glen Johnson", "49"),
  ("16", (SELECT team_id FROM team WHERE team_code = "SWE"), "Olof Mellberg", "59"),
  ("16", (SELECT team_id FROM team WHERE team_code = "ENG"), "Theo Walcott", "64"),
  ("16", (SELECT team_id FROM team WHERE team_code = "ENG"), "Danny Welbeck", "78"),
  #17
  ("17", (SELECT team_id FROM team WHERE team_code = "GRE"), "Giorgos Karagounis", "47"),
  #18
  ("18", (SELECT team_id FROM team WHERE team_code = "CZE"), "Petr Jiráček", "72"),
  #19
  ("19", (SELECT team_id FROM team WHERE team_code = "NED"), "Rafael van der Vaart", "11"),
  ("19", (SELECT team_id FROM team WHERE team_code = "POR"), "Cristiano Ronaldo", "28"),
  ("19", (SELECT team_id FROM team WHERE team_code = "POR"), "Cristiano Ronaldo", "74"),
  #20
  ("20", (SELECT team_id FROM team WHERE team_code = "GER"), "Lukas Podolski", "19"),
  ("20", (SELECT team_id FROM team WHERE team_code = "DEN"), "Michael Krohn-Dehli", "24"),
  ("20", (SELECT team_id FROM team WHERE team_code = "GER"), "Lars Bender", "80"),
  #21
  ("21", (SELECT team_id FROM team WHERE team_code = "ESP"), "Jesús Navas", "88"),
  #22
  ("22", (SELECT team_id FROM team WHERE team_code = "ITA"), "Antonio Cassano", "35"),
  ("22", (SELECT team_id FROM team WHERE team_code = "ITA"), "Mario Balotelli", "90"),
  #23
  ("23", (SELECT team_id FROM team WHERE team_code = "SWE"), "Zlatan Ibrahimović", "54"),
  ("23", (SELECT team_id FROM team WHERE team_code = "SWE"), "Sebastian Larsson", "91"),
  #24
  ("24", (SELECT team_id FROM team WHERE team_code = "ENG"), "Wayne Rooney", "48"),
  #25
  ("25", (SELECT team_id FROM team WHERE team_code = "POR"), "Cristiano Ronaldo", "79"),
  #26
  ("26", (SELECT team_id FROM team WHERE team_code = "GER"), "Philipp Lahm", "39"),
  ("26", (SELECT team_id FROM team WHERE team_code = "GRE"), "Giorgios Samaras", "55"),
  ("26", (SELECT team_id FROM team WHERE team_code = "GER"), "Sami Khedira", "61"),
  ("26", (SELECT team_id FROM team WHERE team_code = "GER"), "Miroslav Klose", "68"),
  ("26", (SELECT team_id FROM team WHERE team_code = "GER"), "Marco Reus", "74"),
  ("26", (SELECT team_id FROM team WHERE team_code = "GRE"), "Dimitris Salpingidis", "89"),
  #27
  ("27", (SELECT team_id FROM team WHERE team_code = "ESP"), "Xabi Alonso", "19"),
  ("27", (SELECT team_id FROM team WHERE team_code = "ESP"), "Xabi Alonso", "91"),
  #28
  #no goals (0:0)
  #29
  #no goals (0:0)
  #30
  ("30", (SELECT team_id FROM team WHERE team_code = "ITA"), "Mario Balotelli", "20"),
  ("30", (SELECT team_id FROM team WHERE team_code = "ITA"), "Mario Balotelli", "36"),
  ("30", (SELECT team_id FROM team WHERE team_code = "GER"), "Mesut Özil", "92"),
  #31
  ("31", (SELECT team_id FROM team WHERE team_code = "ESP"), "David Silva", "14"),
  ("31", (SELECT team_id FROM team WHERE team_code = "ESP"), "Jordi Alba", "41"),
  ("31", (SELECT team_id FROM team WHERE team_code = "ESP"), "Fernando Torres", "84"),
  ("31", (SELECT team_id FROM team WHERE team_code = "ESP"), "Juan Mata", "88");