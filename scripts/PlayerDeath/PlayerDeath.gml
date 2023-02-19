/// @desc Actions that happen when player is dead 
function PlayerDeath()
{
	with (oGun)
	{
	instance_destroy();
	}
	//change to oPlayerD
	instance_change(oPlayerD,true);
	//Calculating knockback angle
	direction = point_direction(oDeadite.x, oDeadite.y, x, y,)
	hsp = lengthdir_x(6,direction);			
	vsp = lengthdir_y(4,direction)-2;
		
	//Orienting death sprite
	if (sign(hsp != 0)) 
	{
		image_xscale = sign(hsp) * 2;
	}
}