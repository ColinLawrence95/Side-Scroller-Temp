#region //Varible Declaration
vsp = 0;
grv = 0.3;
hsp = walksp;
image_yscale = 2;
hitFrom = 0;
#endregion	

if (hasGun)
{
	deaditeGun = instance_create_layer(x, y, "Gun", oDeaditeGun)
	with (deaditeGun)
	{
		owner = other.id
	}
}
else deaditeGun = noone;