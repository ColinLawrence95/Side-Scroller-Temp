/// @description Damage player on contact

//Seeing if god mode is on
if (canDie = true)
{
	//Deducting HP and setting invincable window
	if (invincable = 0)
	{
		playerHP = playerHP - 1;
		//Playing hit sfx
		audio_play_sound(sfxPlayer_Hit,15,false);
		playerFlash = 3;
		invincable = 1;
		show_debug_message(playerHP);
		
		if (!alarm[0])
		{
			alarm[0] = 60;
		}
	}
	//Killing player on 0 hp
	if (playerHP <= 0)
	{
		//delete gun on death
		with (oGun)
		{
			instance_destroy();
		}
		//change to oPlayerD
		instance_change(oPlayerD,true);
		
		//Calculating knockback angle
		direction = point_direction(other.x, other.y, x, y,)
		hsp = lengthdir_x(6,direction);			
		vsp = lengthdir_y(4,direction)-2;
		
		//Orienting death sprite
		if (sign(hsp != 0)) 
		{
			image_xscale = sign(hsp) * 2;
		}
	}
}
