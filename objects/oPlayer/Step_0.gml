//Player Input
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
//god mode
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

//Determine Movement
var move = key_right - key_left;
hsp = move * walksp;

//Gravity
vsp = vsp + grv;

//Checking if Player is On Floor to Jump
if (place_meeting (x,y+1,oWall)) and (key_jump)
{
	vsp = -7.5;
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

//Animation
//Checking if in Air
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 1;
	if (sign(vsp) < 0) image_index = 0; else image_index = 2;
}

//Checking if Idle
else
{
	if (sprite_index == sPlayerA)
	{
		audio_sound_pitch(sfxPlayer_Landing,random_range(0.5,1.5));
		audio_play_sound(sfxPlayer_Landing,4,false);
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

//Killing player if hp = 0
if (playerHP <=0)
{
	PlayerDeath();
}