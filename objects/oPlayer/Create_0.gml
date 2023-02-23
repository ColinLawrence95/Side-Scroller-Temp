#region 
//Varible Declaration
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
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



playerMain = function() //Player Main
{
	
	//Determine Movement
	var move = key_right - key_left;
	hsp = move * walksp;

	//Gravity
	vsp += grv;

	if (place_meeting(x + hsp, y, oWall)) //Horizontal Collision
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

	if (place_meeting(x, y + vsp, oWall)) //Vertical Collision
	{
		while (!place_meeting(x, y + sign(vsp), oWall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
	
	if (hsp != 0) image_xscale = sign(hsp) * 2; // Flipping sprite depnding on direction
}

playerOnGround = function() //Player on Ground
{
	if (place_meeting(x,y+1,oWall)) //If not in air
	{
		canJump = 10;
		canDash = true;
		if (sprite_index == sPlayerA)
		{
			landingSound = audio_play_sound(sfxPlayer_Landing,4,false);
			audio_sound_pitch(landingSound,random_range(0.5,1.5));
			playerFeetAtLand = bbox_bottom;
			repeat(5)
			{
				with(instance_create_layer(x, playerFeetAtLand, "Effects", oDust))
				{
					vsp = 0;
				}
			}
		}
	
		image_speed = 1;
	
		if (hsp == 0) //If idle
		{
			sprite_index = sPlayer;
		}

		else	//Checking if Running
		{
			sprite_index = sPlayerR;
		}
	}
}

playerCrouch = function() //Crouch
{
	if (key_crouch = 0) and (place_meeting (x, y - 1, oWall))
	{
		key_crouch = 1;
	}
	
	if (key_crouch = 1) 
	{
		sprite_index = sPlayerC;
		image_speed = 0;
		walksp = 2;
		image_index = 2;
		mask_index = sPlayerC;
		oGun.y = oGun.y + 25;
	}
	else
	{
		mask_index = sPlayer;
		walksp = 4;
	}
}

playerJump = function() //Player Jump
{
	canJump -=1;
	if (canJump > 0) and (key_jump)
	{
		vsp = -7.5;
		canJump = 0;
		audio_play_sound(sfxPlayer_Jump,6,false);
	}
}

playerDash = function() //Player Dash
{
	if (oPersistent.pPinkPower) and (canDash) and (key_dash)
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
	}
	if (alarm[1] >= 0) //During Dash
	{
		if (place_meeting(x + hspeed, y + vspeed, oWall)) 		// Check for wall collisions
		{
			speed = 0;
		}
		else
		{
			x += hspeed;
			y += vspeed;
		}
	}
}

playerInAir = function() //Player in Air
{
	if (!place_meeting(x,y+1,oWall)) 
	{
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
}

playerDead = function() //Player Die
{
	if (playerHP <=0) 
	{
		PlayerDeath(lastTouch);
	}
}

playerGod = function() //God Mode
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

#endregion
