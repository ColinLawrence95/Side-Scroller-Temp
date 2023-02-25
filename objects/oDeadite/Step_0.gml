applyGravity();
enemyAI();
enemyMovement();
//show_debug_message(enemyState);


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
	case enemyStates.jumping:
        enemyJumpingStateFunction();
        break;
	case enemyStates.falling:
        enemyFallingStateFunction();
        break;
	case enemyStates.death:
        enemyDeathStateFunction();
        break;

}