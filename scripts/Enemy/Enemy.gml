// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAI()
{
	if (object_exists(oPlayer))
	{
		distanceToPlayer = distance_to_object(oPlayer);
		directionToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y);
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
		hsp = 0;
	}
	x = x + hsp;
}

function enemyIdleStateFunction()
{
	walksp = 0;
	
	if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
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
		idleToPatrol = random_range(idleMinTime,idleMaxTime);
		if (!alarm[0])
		{
			//change to patrol state under alarm 0
			alarm[0] = idleToPatrol;
		}
		if (hp <= 0)
		{
			enemyState = enemyStates.death;
		}
		
}

function enemyPatrolStateFunction()
{
		if (!alarm[1])
		{
			alarm[1] = patrolToIdol;
		}
	if(distanceToPlayer < detectionRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		foundPlayer = true;
	}
	else
	{
		foundPlayer = false;
	}
	if (foundPlayer)
	{
		//enemyState = enemyStates.aware;
	}
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}	
}	

function enemyAwareStateFunction()
{
	if (distanceToPlayer <= attackRange) and (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		//enemyState = enemyStates.attack;
	}
	if(!foundPlayer)
	{
		enemyState = enemyStates.patrol;
	}
	//De-aggro and switching to patrol state under alarm 0
	alarm[0] = awareTime;
	if (hp <= 0)
	{
		enemyState = enemyStates.death;
	}
}

function enemyAttackStateFunction()
{
	if (distanceToPlayer > attackRange)
	{
		//enemyState = enemyStates.aware;
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

function hurtEnemy ()
{
	hp = hp - 1;
	//Playing hit sfx
	audio_play_sound(sfxPlayer_Hit,15,false);
	flash = 3
}