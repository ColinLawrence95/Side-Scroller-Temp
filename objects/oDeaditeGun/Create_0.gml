enum deaditeGunStates
{
	idle,
	aware,
	attack,
}
countdown = 100;
countdownRate = countdown;
recoil = 0;
owner = oDeadite;
hsp = 0;
deaditeGunState = deaditeGunStates.idle;
attackRange = 0;
function deaditeGunIdleStateFunction()
{
	x = owner.x;
	y = owner.y;
	image_xscale = 2;
	image_yscale = 2;
	with (oDeadite)
	{
		other.image_xscale = image_xscale;
		if (enemyState = enemyStates.aware)
		{
			other.deaditeGunState = other.deaditeGunStates.aware;
		}
	}
}
function deaditeGunAwareStateFunction()
{
	with(oDeadite)
	{
		other.attackRange = attackRange;
		if (enemyState = enemyStates.attack)
		{
			other.deaditeGunState = other.deaditeGunStates.attack;
		}
	}
	if(!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		aimGun(attackRange)
	}	
}
function deaditeGunAttackStateFunction()
{
	if(!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
	{
		aimGun(attackRange)
		shootGun();
	}
}
function aimGun(attackRange)
{
	x = owner.x;
	y = owner.y;

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
		if (!collision_line(x, y, oPlayer.x, oPlayer.y, oObstalce, false, false))
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
	
