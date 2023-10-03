enemyAI();
enemyMovement();
spriteOrientation();
//show_debug_message(speed);
switch (enemyState) 
{
    case enemyStates.idle:
        enemyIdleStateFunction();
        break;
	case enemyStates.patrol:
        enemyPatrolStateFunction();
        break;
	case enemyStates.aware:
        enemyAwareStateFunction();
        break;
	case enemyStates.attack:
        enemyAttackStateFunction();
        break;
	case enemyStates.death:
        enemyDeathStateFunction();
        break;

}