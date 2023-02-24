//Gravity
vsp = vsp + grv;

if (object_exists(oPlayer))
{
	#region Chase
	if (point_distance(x, y, oPlayer.x, oPlayer.y)) < 150
	{
		//Gravity
		vsp = vsp + grv;
		if (oPlayer.x > x)
		{
			image_xscale = 2;
		}
		else
		{
			image_xscale = -2;
		}
		if (point_distance(x, y, oPlayer.x, oPlayer.y)) < 60
		{
			speed = 0;
			sprite_index = sGruntM;
			mask_index = sGruntM
			isSwing = true;
			alarm[0] = 6;
		}
		else if (point_distance(x, y, oPlayer.x, oPlayer.y) > 60)
		{
			if (isSwing == false)
			{
				speed = 2;
				direction = point_direction(x, y, oPlayer.x, oPlayer.y);
				mp_potential_step_object(oPlayer.x,y,speed,oWall)
				sprite_index = sGruntR;
				mask_index = sGrunt;
				if (!place_meeting(x + hspeed, y + 1, oWall))
				{
					vsp = -7.5
				}
			}
		}	
		
	}
	#endregion
	
	else if (point_distance(x, y, oPlayer.x, oPlayer.y)) > 150
	{
		#region //Movement and Collision
	//makes sure Deadite wont walk off edge
	if (grounded) and (wontFall) and (!place_meeting(x + hspeed, y + 1, oWall))
	{
		hspeed = -hspeed;
	}

	//Collision and gravity.Idle and movement animations
	//Horizontal Collision
	if (place_meeting(x + hspeed,y,oWall))
	{
		while (!place_meeting(x + sign(hspeed),y,oWall))
		{
			x = x + sign(hspeed);
		}
		hspeed = - hspeed;
	}
	x = x + hspeed;

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
		#region //Animation

	//Checking if in Air
	if (!place_meeting(x,y+1,oWall))
	{
		grounded = false;
		sprite_index = sGruntA;
		if (sign(vsp) < 0) image_index = 0; else image_index = 1;
	}
	//Checking if Idle
	else 
	{
		grounded = true;
		image_speed = 1;
		if (hspeed == 0)
		{
			sprite_index = sGrunt;
		}

	//Checking if Running
		else
		{
			grounded = true;
			sprite_index = sGruntR;
		}
	}
	#endregion
		// Flipping sprite if moving left
		if (hspeed != 0) image_xscale = sign(hspeed) * 2;
	}
}



