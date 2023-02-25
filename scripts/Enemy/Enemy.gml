// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAI()
{
	distanceToPlayer = distance_to_object(oPlayer);
	directionToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y);
	
	if(distanceToPlayer < 300)
	{
		foundPlayer = true;
	}
	else
	{
		foundPlayer = false;
	}
	
	if (foundPlayer)
	{
		enemyState = enemyStates.aware;
	}
	
}

function enemyMovement()
{

}

function enemyIdleStateFunction()
{
	sprite_index = sDeadite;
	
	
}

function enemyAwareStateFunction()
{
	sprite_index = sDeaditeR;
	if(!foundPlayer)
	{
		enemyState = enemyStates.idle;
	}
}
