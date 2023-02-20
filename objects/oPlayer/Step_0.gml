#region Player Input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed (vk_space);
	key_god = keyboard_check_pressed(ord("L"));
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_god = 0;
}

#endregion

#region God mode
if (key_god = 1)
{
	canDie = !canDie;
	
	if (canDie = true)
	{
		show_debug_message("GOD MODE OFF");
	}
	
	else
	{
		show_debug_message("GOD MODE ON");
	}
}
#endregion

#region Collision and Movement
//Determine Movement
var move = key_right - key_left;
hsp = move * walksp;

//Gravity
vsp = vsp + grv;

//Checking if Player is On Floor to Jump
coyote -=1;
if (coyote > 0) and (key_jump)
{
	vsp = -7.5;
	coyote = 0;
	//Playing Jump SFX
	audio_play_sound(sfxPlayer_Jump,6,false);
}

//Horizontal Collision
if (place_meeting(x + hsp,y,oWall))
{
	while (!place_meeting(x + sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+ sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
#endregion

#region Animation
//Checking if in Air
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

//Checking if Idle
else
{
	coyote = 10;
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
	
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}

//Checking if Running
	else
	{
		sprite_index = sPlayerR;
	}
}

// Flipping sprite if moving left
if (hsp != 0) image_xscale = sign(hsp) * 2;

#endregion

#region Player Death
//Killing player if hp = 0
if (playerHP <=0)
{
	PlayerDeath(lastTouch);
}
#endregion