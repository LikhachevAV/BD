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
