#region //Playing death animation and correctly orienting it
if (hp <=0)
{
	with (instance_create_layer(x,y,layer,oDeaditeD))
	{
		direction = other.hitFrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 5;
		if (sign(hsp) != 0) image_xscale = sign(hsp) * 2;
		
	}
	
	
	
	instance_destroy()
}
#endregion