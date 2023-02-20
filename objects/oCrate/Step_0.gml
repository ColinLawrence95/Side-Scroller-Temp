//Gravity
	vsp = vsp + grv;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y + sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
	
	//Vertical Collision
	if (place_meeting(x,y+vsp,crateWall))
	{
		while (!place_meeting(x,y + sign(vsp),crateWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;




