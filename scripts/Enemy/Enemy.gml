// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAI()
{
	if (instance_exists(oPlayer))
	{
		distanceToPlayer = distance_to_object(oPlayer);
		directionToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y);
	}
	
	if(distanceToPlayer < detectionRange)
	{
		foundPlayer = true;
	}
	else
	{
		foundPlayer = false;
	}
}


function enemyMovement()
{
	//horizontal movement
	hsp = walksp;
	//Horizontal Collision
	if (place_meeting(x + hsp,y,oSlope))
	{
		move_and_collide(hsp,-1,oObstacle,abs(ceil(hsp)))
	}
	else
	{
		move_and_collide(hsp,0,oObstacle,abs(ceil(hsp)))
	}
	
	show_debug_message(walksp);
	show_debug_message(hsp);
	
}

function enemyIdleStateFunction()
{
	walksp = 0;
	idleToPatrol = random_range(idleMinTime,idleMaxTime);
	if (!alarm[0])
	{
		show_debug_message("ALARM 0 SWITCH TO PATROL")
		//change to patrol state under alarm 0
		alarm[0] = idleToPatrol;
	}
	if (instance_exists(oPlayer))
	{
		if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			enemyState = enemyStates.aware;
		}
		if (hp <= 0)
		{
			enemyState = enemyStates.death;
		}
	}	
}

function enemyPatrolStateFunction()
{
	if (place_meeting(x + hsp,y,oGround)) 
	{
		walksp = -walksp;
	}
	if (place_meeting(x + hsp,y,oWall)) 
	{
		walksp = -walksp;
	}
	if (place_meeting(x + hsp,y,oGeneral)) 
	{
		walksp = -walksp;
	}
	if (!place_meeting(x+hsp,y+3,oObstacle))
	{
		walksp = -walksp
	}
	if (instance_exists(oPlayer))
	{
		//show_debug_message(hsp);
		if (!alarm[1])
		{
			alarm[1] = patrolToIdle;
		}
		if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			enemyState = enemyStates.aware;
		}
		if (hp <= 0)
		{
			enemyState = enemyStates.death;
		}
	}
}	
function enemyAwareStateFunction()
{	
	if (instance_exists(oPlayer))
	{
		if (oPlayer.x > x)
			{
				image_xscale = 2;
			}
			else
			{
				image_xscale = -2;
			}	
		if (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false)) 
		{
			if (!place_meeting(x+(hsp * 2),y+3,oObstacle))
			{
				walksp = 0;
			}
			else if (oPlayer.x > x)
			{
				walksp = 1 * speedScaling;
			}
			else if (oPlayer.x < x)
			{
				walksp = -1 * speedScaling;
			}
		}
		if (distanceToPlayer <= attackRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			enemyState = enemyStates.attack;
		}
		if (distanceToPlayer < detectionRange) and (distanceToPlayer > attackRange)
		{
			alarm_set(0,-1);
			alarm_set(1,-1);
		}
		//De-aggro and switching to patrol state under alarm 0
		if(distanceToPlayer >= detectionRange)
		{
			if(!alarm[0])
			{
				alarm[0] = awareTime;
			}
		}
		if (vsp < 0)
		{
			enemyState = enemyStates.jumping;
		}
		if (hp <= 0)
		{
			enemyState = enemyStates.death;
		}
	}
}

function enemyAttackStateFunction()
{
	walksp = 0;
	if (instance_exists(oPlayer))
	{
		if (oPlayer.x > x)
		{
			image_xscale = 2;
		}
		else
		{
			image_xscale = -2;
		}
	}
	if (distanceToPlayer > attackRange)
	{
		enemyState = enemyStates.aware;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyJumpingStateFunction()
{
	if (oPlayer.x > x)
		{
			walksp = 2;
		}
		if (oPlayer.x < x)
		{
			walksp = -2;
		}
	if (vsp >= 0)
	{
		enemyState = enemyStates.falling;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyFallingStateFunction()
{
	if (oPlayer.x > x)
		{
			walksp = 2;
		}
		if (oPlayer.x < x)
		{
			walksp = -2;
		}
	if (vsp = 0) and (distanceToPlayer < detectionRange)
	{
		enemyState = enemyStates.aware;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyDeathStateFunction()
{
	with (instance_create_layer(x,y,layer,enemeyDeathID))
	{
		direction = other.hitFrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 5;
		spriteOrientation();
	}
	instance_destroy()
}


