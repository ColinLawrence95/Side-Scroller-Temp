function inputCheck()
{
	if (hascontrol) 
	{
		key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
		key_jump = keyboard_check_pressed (vk_space);
		key_dash = keyboard_check_pressed (vk_shift);
		key_god = keyboard_check_pressed(ord("L"));
		key_crouch = keyboard_check(ord("S"));
		move = key_right - key_left;
	}
	else
	{
		key_left = 0;
		key_right = 0;
		key_jump = 0;
		key_dash = 0;
		key_god = 0;
		key_crouch = 0;
		move = 0;
	}
}

function movement()
{

	//horizontal movement
	hsp = move * walksp;
	//Jump
	if (key_jump = 1) and (canJump > 0)
	{
		vsp = vsp - vspJump;
	}
	//Horizontal Collision
	if(place_meeting(x+hsp, y, oObstacle))
	{
		while (!place_meeting(x + sign(hsp), y, oObstacle))
		{
			x += sign(hsp);
		}
		if(place_meeting(x+hsp, y, oJumpWall))
		{
			vsp = 0;
			canJump = 20;
			wallSlideEffect--;
			if (wallSlideEffect = 0)
			{
				DustEffect();
				wallSlideEffect = 8;
			}
		}
		hsp = 0;
	}
	x = x + hsp;
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

function playerIdleState()
{
	//Idle Animation
	image_speed = 1;
	sprite_index = sPlayer;
	mask_index = sPlayer;
	canJump = 10;
	canDash = 0;
	//Change State
	if (hsp == walksp) or (hsp == -walksp)
	{
		playerState = playerStates.walk;
	}
	//Change State
	if (vsp < 0)
	{
		playerState = playerStates.jumping;
	}
	//Change State
	if (vsp > 0) and (!place_meeting (x, y + 1, oObstacle))
	{
		playerState = playerStates.falling;
	}
	if (key_crouch = 1) and (place_meeting(x,y+1,oObstacle))
	{
		playerState = playerStates.crouch;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
}

function playerWalkState()
{
	//Run Animation
	walksp = 4;
	image_speed = 1;
	sprite_index = sPlayerR;
	mask_index = sPlayer;
	canJump = 10;
	canDash = 0;
	if ((image_index > 0 && image_index < 1) || (image_index > 3 && image_index < 4))
	{
	   if (!footStepPlayed)
	   {
	      var chosen_sound = choose(sfxPlayer_Step1, sfxPlayer_Step2, sfxPlayer_Step3, sfxPlayer_Step4);
	      while (chosen_sound == lastFootstepSound)
	      {
	         chosen_sound = choose(sfxPlayer_Step1, sfxPlayer_Step2, sfxPlayer_Step3, sfxPlayer_Step4);
	      }
	      audio_play_sound(chosen_sound, 0, false);
	      lastFootstepSound = chosen_sound;
	      footStepPlayed = true;
	   }
	}
	else
	{
	   footStepPlayed = false;
	}
	if (vsp < 0)
	{
		playerState = playerStates.jumping;
	}
	if (vsp > 0) and (!place_meeting (x, y + 1, oObstacle))
	{
		playerState = playerStates.falling;
	}
	//Change State
	if (hsp == 0)
	{
		playerState = playerStates.idle;
	}
	if (key_crouch = 1) and (place_meeting(x,y+1,oObstacle))
	{
		playerState = playerStates.crouch;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}	
}

function playerJumpingState()
{
	//Jump Animation
	sprite_index = sPlayerA;
	image_speed = 0;
	canJump = 0;
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
	if (vsp > 0)
	{
		playerState = playerStates.falling;
	}
	if (oPersistent.pPinkPower) and (canDash = 0) and (key_dash)
	{
		canJump = 0;
		playerState = playerStates.dash;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (key_crouch = 1)
	{
		image_speed = 0;
		sprite_index = sPlayerC;
		mask_index = sPlayerC;
		oGun.y = oGun.y + 25;
		walksp = 2;
	}
}

function playerFallingState()
{
	sprite_index = sPlayerA;
	image_speed = 0;
	image_index = 3;
	canJump--;
	if (key_crouch = 1)
		{
			image_speed = 0;
			sprite_index = sPlayerC;
			mask_index = sPlayerC;
			oGun.y = oGun.y + 25;
			walksp = 2;	
		}
	if (place_meeting(x,y+1,oObstacle))
	{
		if (key_crouch = 1)
		{
			DustEffect();
			playerState = playerStates.crouch;
		}
		else if(vsp = 0) and (hsp = 0) 
		{
			DustEffect();
			playerState = playerStates.idle;
		}
		else if (vsp = 0) and (hsp != 0) 
		{
			DustEffect();
			playerState = playerStates.walk;
		}	
	}
	if (oPersistent.pPinkPower) and (canDash = 0) and (key_dash)
	{
		canJump = 0;
		playerState = playerStates.dash;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (vsp < 0)
	{
		playerState = playerStates.jumping;
	}

}

function playerCrouchState()
{
	canJump = 0;
	image_speed = 0;
	sprite_index = sPlayerC;
	mask_index = sPlayerC;
	oGun.y = oGun.y + 25;
	walksp = 2;
	if (place_meeting(x,y+1,oObstacle))
    {
		canJump = 10;
		if (key_crouch = 0) and (place_meeting (x, y - 1, oObstacle))
		{
			key_crouch = 1;
		}
    }
	if (key_crouch = 0)
	{ 
		walksp = 4;
		mask_index = sPlayer;
		playerState = playerStates.idle;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (vsp < 0) and (!place_meeting(x,y+1,oObstacle))
	{
		playerState = playerStates.jumping;
	}
	if (vsp > 0) and (!place_meeting(x,y+1,oObstacle))
	{
		playerState = playerStates.falling;
	}
}

function playerDashState()
{

	if (place_meeting(x + hspeed, y + vspeed, oObstacle))
	{
	    // Stop the dash if the player hits a wall
	    dashHitWall = true;
	    hspeed = 0;
		vspeed = 0;
	} 
	else
	{
	    // Move the player
	    if (sign(hsp) == 1) {
	        dashDirection = 1;
	    } else if (sign(hsp) == -1) {
	        dashDirection = -1;
	    } else {
	        dashDirection = 0;
	    }
	    hspeed = dashDirection * dashSpeed;
	    canDash++;
	}
	
	if (canDash >= dashTime || dashHitWall || place_meeting (x, y + 1, oObstacle))
	{
		dashHitWall = false;
		if (vsp < 0)
		{
			hspeed = 0;
			playerState = playerStates.jumping;
		}
		if (vsp >= 0)
		{
			hspeed = 0;
			playerState = playerStates.falling;
		}
		if (hsp == 0)
		{
			hspeed = 0;
			playerState = playerStates.idle;
		}
	}
}

function playerDeathState()
{
	with (oGun)
	{
		instance_destroy();
	}
	//Change to oPlayerD
	instance_change(oPlayerD,true);
	//Delete mouse object
	instance_destroy(oMouse);
	
	//Calculating knockback angle
	direction = point_direction(lastTouch.x, lastTouch.y, x, y,)
	hsp = lengthdir_x(6,direction);			
	vsp = lengthdir_y(4,direction)-2;
		
}

function HurtPlayer(enemyID) //Damage player on contact
{
	//Seeing if god mode is on
	if (oPersistent.pCanDie = true)
	{
		//Deducting HP and setting invincable window
		if (invincable = 0)
		{
			lastTouch = enemyID;
			playerHP = playerHP - 1;
			//Playing hit sfx
			audio_play_sound(sfxPlayer_Hit,15,false);
			playerFlash = 30;
			invincable = 1;
			show_debug_message(playerHP);
		
			if (!alarm[0])
			{
				alarm[0] = 30;
			}
		}	
	}
}
