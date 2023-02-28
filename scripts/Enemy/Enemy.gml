// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAI()
{
	if (object_exists(oPlayer))
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
	if(place_meeting(x+hsp, y, oObstalce))
	{
		while (!place_meeting(x + sign(hsp), y, oObstalce))
		{
			x += sign(hsp);
		}
		walksp = -walksp;
	}
	x = x + hsp;
	if(foundPlayer)
	{
		if (!place_meeting(x+walksp,y+1,oObstalce))
		{
			walksp = 0;
		}
		else
		{
			walksp = 1;
		}
			x = x + (walksp * sign(image_xscale));
	}
	if (!foundPlayer)
	{
		if (!place_meeting(x+hsp,y+1,oObstalce))
		{
			walksp = -walksp;
		}
	}
	
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
	if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		enemyState = enemyStates.aware;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
		
}

function enemyPatrolStateFunction()
{
	//show_debug_message(hsp);
	if (!alarm[1])
	{
		alarm[1] = patrolToIdle;
	}
	if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		enemyState = enemyStates.aware;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}	
}	

function enemyAwareStateFunction()
{
show_debug_message(walksp);

	if (oPlayer.x > x)
		{
			image_xscale = 2;
		}
		else
		{
			image_xscale = -2;
		}
	if (distanceToPlayer <= attackRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
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
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyAttackStateFunction()
{
	walksp = 0;
	if (oPlayer.x > x)
		{
			image_xscale = 2;
		}
		else
		{
			image_xscale = -2;
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
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyFallingStateFunction()
{
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyDeathStateFunction()
{
	with (instance_create_layer(x,y,layer,oDeaditeD))
	{
		direction = other.hitFrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 5;
		spriteOrientation();
	}
	with (deaditeGun)
	{
		instance_destroy();
	}
	instance_destroy()
}

function hurtEnemy()
{
	hp = hp - 1;
	//Playing hit sfx
	audio_play_sound(sfxPlayer_Hit,15,false);
	flash = 3;
}

