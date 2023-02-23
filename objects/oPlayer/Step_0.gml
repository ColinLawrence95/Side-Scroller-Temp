#region Code that should always be checked every step

if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed (vk_space);
	key_dash = keyboard_check_pressed (vk_shift);
	key_god = keyboard_check_pressed(ord("L"));
	key_crouch = keyboard_check(ord("S"));
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_dash = 0;
	key_god = 0;
	key_crouch = 0;
}

#endregion



//Determine Movement
hsp = (key_right - key_left) * walksp;

//Gravity
vsp += grv;

//Horizontal Collision
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, oWall)) 
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

// Flipping sprite depnding on direction
if (hsp != 0) image_xscale = sign(hsp) * 2; 
	
//Dtect if player dies
if (playerHP <=0) 
{
	state = playerDead;
}

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

//player state
state();
