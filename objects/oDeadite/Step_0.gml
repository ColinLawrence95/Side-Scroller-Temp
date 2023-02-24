#region //Movement and Collision
//Gravity
vsp = vsp + grv;

//makes sure Deadite wont walk off edge
if (grounded) and (wontFall) and (!place_meeting(x + hsp, y + 1, oObstalce))
{
	hsp = -hsp;
}

//Collision and gravity.Idle and movement animations
//Horizontal Collision
if (place_meeting(x + hsp,y,oObstalce))
{
	while (!place_meeting(x + sign(hsp),y,oObstalce))
	{
		x = x + sign(hsp);
	}
	hsp = - hsp;
}
x = x + hsp;



//Vertical Collision
if (place_meeting(x,y+vsp,oObstalce))
{
	while (!place_meeting(x,y+ sign(vsp),oObstalce))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
#endregion

#region //Animation

//Checking if in Air
if (!place_meeting(x,y+1,oObstalce))
{
	grounded = false;
	sprite_index = sDeaditeA;
	image_speed = 1;
	if (sign(vsp) < 0) image_index = 0; else image_index = 2;
}
//Checking if Idle
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sDeadite;
	}

//Checking if Running
	else
	{
		sprite_index = sDeaditeR;
	}
}

// Flipping sprite if moving left
if (hsp != 0) image_xscale = sign(hsp) * 2;
#endregion

