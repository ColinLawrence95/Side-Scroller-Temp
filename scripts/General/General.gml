function applyGravity()
{
	//Apply Gravity
	if (place_meeting(x,y,oWater))
	{
		if (vsp < 0)
		{
			vsp = vsp + (grv / 1.5);
		}
		else if (vsp > 0)
		{
			vsp = vsp + (grv / 5);
		}
	}
	else
	{
		vsp = vsp + grv;
	}
	//Vertical Collision
	if (place_meeting(x, y + vsp, oObstacle))
	{
		while (!place_meeting(x, y + sign(vsp), oObstacle))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}
function spriteOrientation()
{
	 if (hsp != 0) image_xscale = sign(hsp) * 2; 
}