#region //Collision
if (done == 0)
{
	//Gravity
	vsp = vsp + grv;

	//Horizontal Collision
	if (place_meeting(x + hsp,y,oObstalce))
	{
		while (!place_meeting(x + sign(hsp),y,oObstalce))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oObstalce))
	{
		if (vsp > 0)
		{
			done = 1;
			image_index = 5;
		}
		while (!place_meeting(x,y+ sign(vsp),oObstalce))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}
#endregion