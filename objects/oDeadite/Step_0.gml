applyGravity();
enemyAI();
enemyMovement();

switch (enemyState) 
{
    case enemyStates.idle:
        enemyIdleStateFunction();
        break;
	case  enemyStates.aware:
        enemyAwareStateFunction();
        break;

}