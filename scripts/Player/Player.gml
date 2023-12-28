function inputCheck()
{
	if (hascontrol) 
	{
		key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
		key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
		key_jump = keyboard_check_pressed (vk_space);
		key_dash = keyboard_check_pressed (vk_shift);
		key_god = keyboard_check_pressed(ord("L"));
		key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
		key_toss = keyboard_check(ord("G"));
		move = key_right - key_left;
	}
	else
	{
		key_left = 0;
		key_right = 0;
		key_up = 0;
		key_jump = 0;
		key_dash = 0;
		key_god = 0;
		key_down = 0;
		key_toss = 0;
		move = 0;
	}
}
function movement()
{
	//horizontal movement
	hsp = move * walksp;
	//Jump
	if (place_meeting(x,y,oWater))
	{
		canJump = 1;
	}
	if (key_jump = 1) and (canJump > 0)
	{
		vsp = vsp - vspJump;
	}
	
	//Moving platforms
	var _movingPlatform = instance_place(x, y + max(1, vsp), oPlatformMoving);
	if (_movingPlatform && bbox_bottom >= _movingPlatform.bbox_top) {
		hsp += _movingPlatform.hsp;
		y = _movingPlatform.y - 48;

	}
	
	
	//Horizontal Collision
	move_and_collide(hsp,0,oObstacle,abs(ceil(hsp)))
	//vertical Collision
	if (array_length(move_and_collide(0,0,oObstacle,abs(ceil(vsp)),0,0)) > 0)
	{
		if (vsp > 0) canJump = 10;
		vsp = 0;
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
	if (instance_exists(oPlatformMoving))
	{
		if (hsp == walksp or hsp == -walksp or hsp == (walksp + oPlatformMoving.hsp) or hsp == (-walksp + oPlatformMoving.hsp))
		{
			playerState = playerStates.walk;
		}
	}
	if (hsp == walksp or hsp == -walksp)
	{
		playerState = playerStates.walk;
	}
	//Change State
	if (vsp < 0)
	{
		playerState = playerStates.jumping;
	}
	//Change State
	if (key_down = 1) and (place_meeting(x,y+2,oObstacle))
	{
		playerState = playerStates.crouch;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (key_toss) and (!tacThrown) and ((!instance_exists(oSpawnTacActive)) and (!instance_exists(oSpawnTacUsed))) 
	{
		playerState = playerStates.toss;
	}
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
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
	if (vsp < 0) and (!place_meeting(x,y + 1,oObstacle))
	{
		playerState = playerStates.jumping;
	}
	if (vsp > 0) and (!place_meeting(x,y + 3,oObstacle))
	{
		playerState = playerStates.falling;
	}
	//Change State
	if ((hsp == 0 and vsp == 0) or (key_left == 0 and key_right == 0))
	{
		playerState = playerStates.idle;
	}
	if (key_down = 1) and (place_meeting(x,y+1,oObstacle))
	{
		playerState = playerStates.crouch;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
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
	if (vsp >= 1 && vsp <= 2  )
	{
		image_index = 3;
	}
	//Change State
	if (oPersistent.pPinkPower) and (canDash = 0) and (key_dash) and (!oPersistent.pAmmoCount = 0)
	{
		canJump = 0;
		oPersistent.pAmmoCount--;
		playerState = playerStates.dash;
	}
	if (vsp > 0) and (!place_meeting(x,y + 3,oObstacle))
	{
		playerState = playerStates.falling;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (key_down = 1)
	{
		image_speed = 0;
		sprite_index = sPlayerC;
		mask_index = sPlayerC;
		oGun.y = oGun.y + 25;
		walksp = 2;
	}
	if (key_toss) and (!tacThrown) and ((!instance_exists(oSpawnTacActive)) and (!instance_exists(oSpawnTacUsed))) 
	{
		playerState = playerStates.toss;
	}
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
	}
}
function playerFallingState()
{
	sprite_index = sPlayerA;
	image_speed = 0;
	image_index = 3;
	canJump--;
	if (place_meeting(x,y+1,oObstacle))
	{
		if (vsp = 0)
		{
			playerState = playerStates.jumping;
			if (hsp = 0)
			{
				playerState = playerStates.idle;
				DustEffect();
			}
			if (hsp !=0)
			{
				playerState = playerStates.walk;
				DustEffect();
			}
			if (key_down = 1)
			{
				playerState = playerStates.crouch
			}
		}
	}
	if (key_down = 1)
	{
		image_speed = 0;
		sprite_index = sPlayerC;
		mask_index = sPlayerC;
		oGun.y = oGun.y + 25;
		walksp = 2;
	}
	if (oPersistent.pPinkPower) and (canDash = 0) and (key_dash) and (!oPersistent.pAmmoCount = 0)
	{
		canJump = 0;
		oPersistent.pAmmoCount--;
		playerState = playerStates.dash;
	}
	if (playerHP <= 0)
	{
		playerState = playerStates.death;
	}
	if (key_toss) and (!tacThrown) and ((!instance_exists(oSpawnTacActive)) and (!instance_exists(oSpawnTacUsed))) 
	{
		playerState = playerStates.toss;
	}
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
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
		if (key_down = 0) and (place_meeting (x, y - 1, oObstacle))
		{
			key_down = 1;
		}
    }
	if (key_down = 0)
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
	if (vsp > 0) and (!place_meeting(x,y+3,oObstacle))
	{
		playerState = playerStates.falling;
	}
	if (key_toss) and (!tacThrown) and ((!instance_exists(oSpawnTacActive)) and (!instance_exists(oSpawnTacUsed))) 
	{
		playerState = playerStates.toss;
	}
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
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
	if((place_meeting(x, y, oLadder1) && key_up = 1) || (place_meeting(x, y + 100, oLadder1)) && key_down = 1 && (place_meeting(x,y+1,oObstacle)))
	{
		playerState = playerStates.ladder;
	}
}
function playerTossState()
{
	var thrownTac = instance_create_layer(x,y,"Entities",oSpawnTac);
	var thrownTacDirection = point_direction(x,y,mouse_x,mouse_y);
	thrownTac.direction = thrownTacDirection;
	tacThrown = true;
	oPersistent.tacSpawnUsed = false;
	playerState = playerStates.idle;
}
function playerLadderState()
{
	vsp = 0;
	image_speed = 1;
	sprite_index = sPlayer;
	mask_index = sPlayer;
	vsp = vsp - grv; //turn off grav
	if(key_up = 1)
	{
		y = y - 5
	}
	if((place_meeting(x, y + 68, oLadder1)) && key_down = 1)
	{
		y = y + 5
	}
	if((!place_meeting(x, y + 68, oLadder1)) && key_down = 1)
	{
		playerState = playerStates.crouch;
	}
	if(key_jump = 1)
	{
		vsp = vsp - vspJump;
		playerState = playerStates.jumping;
	}	
	if(!place_meeting(x, y, oLadder1))
	{
		playerState = playerStates.idle;
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
	direction = point_direction(lastTouch.x, lastTouch.y, x, y)
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
		
			if (!alarm[0])
			{
				alarm[0] = 30;
			}
		}	
	}
}
