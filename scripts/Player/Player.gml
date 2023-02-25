// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inputCheck()
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed (vk_space);
	key_dash = keyboard_check_pressed (vk_shift);
	key_god = keyboard_check_pressed(ord("L"));
	key_crouch = keyboard_check(ord("S"));
	move = key_right - key_left;
}
function movement()
{
	//horizontal movement
	hsp = move * PlayerValues.walksp;
	//Jump
	if (key_jump = 1) and (PlayerValues.canJump > 0)
	{
		vsp = vsp - PlayerValues.vspJump;
	}
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

function idleStateFunction()
{
	//Idle Animation
	image_speed = 1;
	sprite_index = sPlayer;
	PlayerValues.canJump = 10;
	//Change State
	if(hsp == PlayerValues.walksp) or (hsp == -PlayerValues.walksp)
	{
		playerState = playerStates.walk;
	}
	//Change State
	if(vsp < 0)
	{
		playerState = playerStates.jumping;
	}
	//Change State
	if(vsp > 0) and (!place_meeting (x, y + 1, oObstalce))
	{
		playerState = playerStates.falling;
	}
	if (key_crouch = 1) and (place_meeting(x,y+1,oObstalce))
	{
		playerState = playerStates.crouch;
	}
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}
}
function walkStateFunction()
{
	//Run Animation
	PlayerValues.walksp = 4;
	image_speed = 1;
	sprite_index = sPlayerR;
	PlayerValues.canJump = 10;
	if(vsp < 0)
	{
		playerState = playerStates.jumping;
	}
	if(vsp > 0) and (!place_meeting (x, y + 1, oObstalce))
	{
		playerState = playerStates.falling;
	}
	//Change State
	if (hsp == 0)
	{
		playerState = playerStates.idle;
	}
	if (key_crouch = 1) and (place_meeting(x,y+1,oObstalce))
	{
		playerState = playerStates.crouch;
	}
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}	
}
function jumpingStateFunction()
{
	//Jump Animation
	sprite_index = sPlayerA;
	image_speed = 0;
	PlayerValues.canJump = 0;
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
	//Change State
	if(vsp > 0)
	{
		playerState = playerStates.falling;
	}
	if(oPersistent.pPinkPower) and (PlayerValues.canDash) and (key_dash)
	{
		playerState = playerStates.dash;
	}
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (key_crouch = 1)
	{
		image_speed = 0;
		sprite_index = sPlayerC;
		mask_index = sPlayerC;
		oGun.y = oGun.y + 25;
		PlayerValues.walksp = 2;
	}
}
function fallingStateFunction()
{
	sprite_index = sPlayerA;
	image_speed = 0;
	image_index = 3;
	PlayerValues.canJump--;
	if (key_crouch = 1)
		{
			image_speed = 0;
			sprite_index = sPlayerC;
			mask_index = sPlayerC;
			oGun.y = oGun.y + 25;
			PlayerValues.walksp = 2;	
		}
	if (place_meeting(x,y+1,oObstalce))
	{
		if (key_crouch = 1)
		{
			LandingEffect();
			playerState = playerStates.crouch;
		}
		else if(vsp = 0) and (hsp = 0) 
		{
			LandingEffect();
			playerState = playerStates.idle;
		}
		else if (vsp = 0) and (hsp != 0) 
		{
			LandingEffect();
			playerState = playerStates.walk;
		}	
	}
	if(oPersistent.pPinkPower) and (PlayerValues.canDash) and (key_dash)
	{
		playerState = playerStates.dash;
	}
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (vsp < 0)
	{
		playerState = playerStates.jumping;
	}

}
function crouchStateFunction()
{
	PlayerValues.canJump = 0;
	image_speed = 0;
	sprite_index = sPlayerC;
	mask_index = sPlayerC;
	oGun.y = oGun.y + 25;
	PlayerValues.walksp = 2;
	if (place_meeting(x,y+1,oObstalce))
    {
		PlayerValues.canJump = 10;
		if (key_crouch = 0) and (place_meeting (x, y - 1, oObstalce))
		{
			key_crouch = 1;
		}
    }
	if (key_crouch = 0)
	{ 
		PlayerValues.walksp = 4;
		mask_index = sPlayer;
		playerState = playerStates.idle;
	}
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (vsp < 0) and (!place_meeting(x,y+1,oObstalce))
	{
		playerState = playerStates.jumping;
	}
	if (vsp > 0) and (!place_meeting(x,y+1,oObstalce))
	{
		playerState = playerStates.falling;
	}
}
function dashStateFunction()
{
	PlayerValues.canDash = false;
	PlayerValues.canJump = 0;
	sDashEffect = audio_play_sound(sfxPlayer_Dash,7,false);
	audio_sound_pitch(sDashEffect, random_range(0.5,1.5));
	
	direction = point_direction(x,y,mouse_x,mouse_y);
	if (alarm[1] = -1)
	{
		speed = PlayerValues.dashSpeed;
		alarm[1] = room_speed * PlayerValues.dashTime;
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
	if (PlayerValues.playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	
}
function deathStateFunction()
{
	with (oGun)
	{
	instance_destroy();
	}
	//change to oPlayerD
	instance_change(oPlayerD,true);
	//Delete mouse object
	instance_destroy(oMouse);
	
	//Calculating knockback angle
	direction = point_direction(lastTouch.x, lastTouch.y, x, y,)
	hsp = lengthdir_x(6,direction);			
	vsp = lengthdir_y(4,direction)-2;
		
	//Orienting death sprite
	if (sign(hsp != 0)) 
	{
		image_xscale = sign(hsp) * 2;
	}
}
function HurtPlayer(enemyID)
{
/// @description Damage player on contact

//Seeing if god mode is on
if (oPersistent.pCanDie = true)
{
	//Deducting HP and setting invincable window
	if (PlayerValues.invincable = 0)
	{
		lastTouch = enemyID;
		PlayerValues.playerHP = PlayerValues.playerHP - 1;
		//Playing hit sfx
		audio_play_sound(sfxPlayer_Hit,15,false);
		PlayerValues.playerFlash = 30;
		PlayerValues.invincable = 1;
		show_debug_message(PlayerValues.playerHP);
		
		if (!alarm[0])
		{
			alarm[0] = 30;
		}
	}	
}

}

function godMode()
{
	if (key_god = 1)
	{
		oPersistent.pCanDie = !oPersistent.pCanDie
		if (oPersistent.pCanDie = true)
	    {
	        show_debug_message("GOD MODE OFF");
	    }
	    else
	    {
	        show_debug_message("GOD MODE ON");
	    }
	}
}