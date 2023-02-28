#region //Collision
if (done == 0)
{
	//Gravity
	vsp = vsp + grv;

	//Horizontal Collision
	if (place_meeting(x + hsp,y,oObstacle))
	{
		while (!place_meeting(x + sign(hsp),y,oObstacle))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oObstacle))
	{
		if (vsp > 0)
		{
			done = 1;
			image_index = 5;
		}
		while (!place_meeting(x,y+ sign(vsp),oObstacle))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}
#endregion