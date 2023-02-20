/// @desc create wall in crate to make it impassable
vsp = 0;
grv = 0.3;
hsp = 0;


crateWall = instance_create_layer(x,y,layer,oWall);
with (crateWall)
{
	image_xscale = other.sprite_width / sprite_width;
	image_yscale = other.sprite_height / sprite_height;
}

cratewallID = instance_id_get(crateWall);
crateID = instance_id_get(oCrate);
