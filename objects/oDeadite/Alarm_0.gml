/// @desc Patrol State
patrolToIdle = random_range(patrolMinTime,patrolMaxTime);
walksp = patrolsp * choose(1,-1);
enemyState = enemyStates.patrol;
show_debug_message("ALARM 0 SWITCH TO PATROL")