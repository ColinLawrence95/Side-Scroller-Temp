function applyGravity()
{
	//Apply Gravity
	vsp = vsp + grv;
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