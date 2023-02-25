/// @desc Patrol State
patrolToIdol = random_range(patrolMinTime,patrolMaxTime);
walksp = patrolsp * choose(1,-1);
enemyState = enemyStates.patrol;
