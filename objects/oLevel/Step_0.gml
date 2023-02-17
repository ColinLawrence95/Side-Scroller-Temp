/// @desc Determining what level you are on for Paralax
with (oCamera)
{
	if (object_exists(oLevel))
	{
		if (other.levelID = "greenhouse1")
		{
			layer_x(other.layer1,x / 2);
			layer_x(other.layer2,x / 4);
			layer_x(other.layer3,x / 8);
		}
	}
}

