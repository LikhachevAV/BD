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
#7.	Найти имена всех игроков, которые забили гол в ворота Германии
#8.	Найти общее количество забитых мячей для каждой команды (с указанием имени команды)
#9.	Найти количество мячей, забитых на каждом стадионе с указанием названия стадиона
#10. Для каждой команды вывести имена игроков, которые забивали голы через запятую. Если никто не забивал – пустую строку.
