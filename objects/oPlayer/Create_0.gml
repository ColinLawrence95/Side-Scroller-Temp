#region 
//Varible Declaration
//Physics
hsp = 0;
vsp = 0;
grv = 0.3;

//Player
walksp = 4;
vspJump = -7.5;
hascontrol = true;
image_xscale = 2;
image_yscale = 2;
playerHP = 3;
invincable = 0;
playerFlash = 0;
canJump = 0;
canDash = true;
dashTime = 0.4; //seconds
dashSpeed = 3;



playerIdle = function() //Player Idle
{	
	image_speed = 1;
	if (!place_meeting(x,y+1,oWall)) //If in air
	{
		canJump--;
		sprite_index = sPlayerA;
		image_speed = 1;
		if (vsp < -1)
		{
			image_index = 0;
		}
		if (vsp >= -1 && vsp <= 0  )
		{
			image_index = 1;
		}
		if (vsp >= 0 && vsp <= 1  )
		{
			image_index = 2;
		}
		if (vsp > 1)
		{
			image_index = 3;
		}
	}
	else
	{
		if (sprite_index = sPlayerA) //Player landing
		{
			LandingEffect();
		}
		if (hsp = 0) //Player touching ground wall and idle
		{
			canJump = 10;
			sprite_index = sPlayer;
		}
		else //Player running
		{
			canJump = 10;
			sprite_index = sPlayerR;
		}
	}
	
	if (canJump > 0) and (key_jump)
	{
		state = playerJump;
	}
	if (key_crouch = 1)
	{
		state = playerCrouch;
	}
	if (oPersistent.pPinkPower) and (canDash) and (key_dash)
	{
		state = playerDash;
	}
}

playerCrouch = function() //Crouch
{	
	sprite_index = sPlayerC;
	image_speed = 0;
	image_index = 2;
	walksp = 2;
	oGun.y = oGun.y + 25;
	
	if (key_crouch = 0) and (place_meeting (x, y - 1, oWall))
	{
		key_crouch = 1	
	}
	if (key_crouch = 0) and(!place_meeting(x,y+1,oWall))
	{
		mask_index = sPlayer;
		walksp = 4;
	}
	if (key_crouch = 0)
	{
		mask_index = sPlayer;
		walksp = 4;
		state = playerIdle
	}
	if (place_meeting(x,y+1,oWall) and vsp != 0) //If in air
	{
		LandingEffect();
	}
}

playerJump = function() //Player Jump
{
	vsp = vspJump;
	canJump = 0;
	audio_play_sound(sfxPlayer_Jump,6,false);
	state = playerIdle;
}

playerDash = function() //Player Dash
{
	canDash = false;
	canJump = 0;
	sDashEffect = audio_play_sound(sfxPlayer_Dash,7,false);
	audio_sound_pitch(sDashEffect, random_range(0.5,1.5));
	direction = point_direction(x,y,mouse_x,mouse_y);
	if (alarm[1] = -1)
	{
		speed = dashSpeed;
		alarm[1] = room_speed * dashTime;
	}
	
	if (alarm[1] >= 0) //During Dash
	if (place_meeting(x + hspeed, y + vspeed, oWall)) 		// Check for wall collisions
	{
		speed = 0;
	}
	else
	{
		x += hspeed;
		y += vspeed;
	}
	if (place_meeting(x,y+1,oWall)) //If on ground
	{
		state = playerIdle;
	}
}

playerDead = function() //Player Die
{
	PlayerDeath(lastTouch);
}

state = playerIdle;

#endregion
