#region Collision and gravity.
//Gravity
vsp = vsp + grv;

//Horizontal Collision
if (place_meeting(x + hsp,y,oObstacle))
{
	while (!place_meeting(x + sign(hsp),y,oObstacle))
	{
		x = x + sign(hsp);
	}
	hsp = - hsp;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oObstacle))
{
	while (!place_meeting(x,y+ sign(vsp),oObstacle))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
#endregion