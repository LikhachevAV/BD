###SELECTS:
#1
# Найти идентификаторы матчейи имена игроков для всех голов, забитых игроками из Германии.
SELECT game.match_id, goal.player
 FROM (game LEFT JOIN goal ON game.match_id = goal.match_id)
   LEFT JOIN team ON goal.team_id = team.team_id
 WHERE team.team_code="GER" GROUP BY goal.player ORDER BY match_id;
 
#2
# Найти игрока, идентификатор команды, название стадиона и дату матча для каждого гола, забитого командой Германии
SELECT goal.player, team.team_id, game.stadium, game.match_date
  FROM (goal INNER JOIN team
    ON goal.team_id = team.team_id) INNER JOIN 
    game ON (game.team1 = goal.team_id OR 
      game.team2 = goal.team_id)
  WHERE team.team_code="GER" ORDER BY player, match_date;

#3
# Найти названия команд для всех встреч, в которых забивал игрок с именем Mario
SELECT team.team_name AS team1_name, team2.team_name AS team2_name
FROM game LEFT JOIN team ON game.team1 = team.team_id
  RIGHT JOIN team AS team2 ON game.team2 = team2.team_id
  LEFT JOIN goal ON goal.team_id = team.team_id
WHERE goal.player LIKE("Mario%");

#4.	Найти имя игрока, идентификатор команды, тренера и минуту, на которой был забит гол из всех голов, которые были забиты в первые 10 минут матча.
SELECT goal.player, team.team_id, team.coach, goal.match_time FROM goal
  LEFT JOIN team ON goal.team_id = team.team_id
  WHERE match_time <= 10 ORDER BY goal.match_time;
  
#5.	Перечислить все даты матчей и названия команд, в которых Fernando Santos был тренерому одной из команд
SELECT game.match_date, team_f.team_name, team_s.team_name FROM game 
  LEFT JOIN team AS team_f ON game.team1 = team_f.team_id 
  LEFT JOIN team AS team_s ON game.team2 = team_s.team_id 
WHERE team_f.coach = "Fernando Santos" OR team_s.coach = "Fernando Santos"
ORDER BY match_date;

#6.	Перечислить всех игроков, которые забивали голы на стадионе «NationalStadium, Warsaw»
SELECT player FROM goal
  LEFT JOIN game ON goal.match_id = game.match_id
WHERE stadium LIKE("Stadion Narodowy, Warsaw%");

#7.	Найти имена всех игроков, которые забили гол в ворота Германии
SELECT player FROM goal
  INNER JOIN team AS goal_team ON goal.team_id = goal_team.team_id
  LEFT JOIN game ON goal.match_id = game.match_id
  INNER JOIN team AS game_team1 ON game.team1 = game_team1.team_id
  INNER JOIN team AS game_team2 ON game.team2 = game_team2.team_id
  WHERE goal_team.team_code != "GER" AND (game_team1.team_code = "GER" OR game_team2.team_code = "GER")
    GROUP BY player;
	
#8.	Найти общее количество забитых мячей для каждой команды (с указанием имени команды)
SELECT team.team_name, COUNT(*) AS goal_count FROM goal
  LEFT JOIN team ON goal.team_id = team.team_id 
GROUP BY team.team_id ORDER BY goal_count;

#9.	Найти количество мячей, забитых на каждом стадионе с указанием названия стадиона
SELECT stadium, COUNT(*) AS goal_count FROM goal 
  LEFT JOIN game ON goal.match_id = game.match_id 
GROUP BY stadium ORDER BY goal_count;

#10. Для каждой команды вывести имена игроков, которые забивали голы через запятую. Если никто не забивал – пустую строку.
SELECT team_name, GROUP_CONCAT(DISTINCT  ' ', player ORDER BY player) AS goal_players 
  FROM goal LEFT JOIN team ON goal.team_id = team.team_id
GROUP BY goal.team_id
ORDER BY team_name;

#11. Для всех матчей, в которых участвовала Германия, вывести дату матча, название команды-соперника и количество заработанных за матч очков. Количество очков в нашей предметной области считается следующим образом: за один гол даётся два очка, за пропуск мяча – вычитается одно очко.

SELECT
	game.match_date,
    team.team_name,
	SUM( CASE WHEN goal.team_id = (SELECT team.team_id FROM team WHERE team.team_name = "Poland") THEN 2 WHEN goal.team_id != (SELECT team.team_id FROM team WHERE team.team_name = "Poland") THEN -1 ELSE 0 END ) as count
  FROM
    game 	
	INNER JOIN team ON game.team1 = team.team_id
	INNER JOIN goal ON game.match_id = goal.match_id
  WHERE
    game.match_id = goal.match_id
	AND game.team2 = (SELECT team.team_id FROM team WHERE team.team_name = "Poland")	
UNION DISTINCT
  SELECT
	game.match_date,
    team.team_name,
	SUM( CASE WHEN goal.team_id = (SELECT team.team_id FROM team WHERE team.team_name = "Poland") THEN 2 WHEN goal.team_id != (SELECT team.team_id FROM team WHERE team.team_name = "Poland") THEN -1 ELSE 0 END ) as count
  FROM
    game 	
	INNER JOIN team ON game.team2 = team.team_id
	INNER JOIN goal ON game.match_id = goal.match_id
  WHERE
    game.match_id = goal.match_id
	AND game.team1 = (SELECT team.team_id FROM team WHERE team.team_name = "Poland")
GROUP BY game.match_id asc;