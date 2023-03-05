enum deaditeGunStates
{
	idle,
	aware,
	attack,
}
countdown = 70;
countdownRate = countdown;
recoil = 0;
hsp = 0;
deaditeGunState = deaditeGunStates.idle;
deaditeGunIdle = deaditeGunStates.idle;
deaditeGunAware = deaditeGunStates.aware;
deaditeGunAttack = deaditeGunStates.attack;
attackRange = 0;
detectionRange = 0;
function deaditeGunIdleStateFunction()
{
	image_xscale = 2;
	image_yscale = 2;
	with (oDeadite)
	{
		other.image_xscale = image_xscale;
		if (enemyState = enemyStates.aware)
		{
			other.deaditeGunState = other.deaditeGunAware;
		}
	}
}
function deaditeGunAwareStateFunction()
{
	if (instance_exists(oPlayer))
	{
		if(!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			aimGun(detectionRange)
		}
		with(owner)
		{
			other.detectionRange = detectionRange;
			if (enemyState = enemyStates.attack)
			{
				other.deaditeGunState = other.deaditeGunAttack;
			}
			if (enemyState = enemyStates.idle) or (enemyState = enemyStates.patrol)
			{
				other.deaditeGunState = other.deaditeGunIdle;
			}
		}
	}
}
function deaditeGunAttackStateFunction()
{
	if (instance_exists(oPlayer))
	{
		if(!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			aimGun(detectionRange)
			shootGun();
		}
		with (owner)
		{
			if (enemyState = enemyStates.idle) or (enemyState = enemyStates.patrol)
			{
				other.deaditeGunState = other.deaditeGunIdle;
			}
			if (enemyState = enemyStates.aware)
			{
				other.deaditeGunState = other.deaditeGunAware;
			}	
		}
	}
}
function aimGun(attackRange)
{
	image_xscale = abs(owner.image_xscale); 
	image_yscale = abs(owner.image_yscale);

	if (instance_exists(oPlayer))
	{
		if (oPlayer.x < x)
		{
			image_yscale = -image_yscale;
		}
		if (point_distance(oPlayer.x, oPlayer.y, x, y,) < attackRange)
		{
			image_angle = point_direction(x, y, oPlayer.x, oPlayer.y + 20);
		}
	}
}			
function shootGun()
{
	countdown = countdown - 1;
	if(countdown <0)
	{
		countdown = countdownRate;
		if (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstacle, false, false))
		{
			//Playing gunshot sfx
			audio_play_sound(sfxPlayer_Basic_Shot,7,false);
			with (instance_create_layer (x,y,"Effects",oDeaditeBullet)) 
			{
				spd = 10;
				direction = other.image_angle;
				image_angle = direction;
			}	
		}
	}		
}
	
