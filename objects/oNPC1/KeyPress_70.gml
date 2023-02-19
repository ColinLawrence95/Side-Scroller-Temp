/// @description Press F to speak with this NPC
if (point_in_circle(oPlayer.x, oPlayer.y ,x ,y ,talkDistance)) and (!instance_exists(oText))
{
	//disable player movement
	with (oPlayer)
	{
		hascontrol = false;
	}
	//makes NPC face player when speaking
	if (sign(oPlayer.x < oNPC1.x))
	{
		image_xscale = -2;
	}
	else
	{
		image_xscale = 2;
	}
	
	//Creates oText
	with (instance_create_layer(x, y - txtBoxHeight, layer, oText))
	{
		txt = other.txt;
		length = string_length(txt);
	}
	with (oCamera)
	{
		follow = other.id;
	}
}