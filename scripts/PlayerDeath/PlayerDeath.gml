/// @desc Actions that happen when player is dead 
function PlayerDeath(lastTouch)
{
	with (oGun)
	{
	instance_destroy();
	}
	//change to oPlayerD
	instance_change(oPlayerD,true);
	//Delete mouse object
	instance_destroy(oMouse);
	
	//Calculating knockback angle
	direction = point_direction(lastTouch.x, lastTouch.y, x, y,)
	hsp = lengthdir_x(6,direction);			
	vsp = lengthdir_y(4,direction)-2;
		
	//Orienting death sprite
	if (sign(hsp != 0)) 
	{
		image_xscale = sign(hsp) * 2;
	}
}