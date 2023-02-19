//Checking Level ID
if (other.levelID = "greenhouse1")
{
	//Paralax
	with (oCamera)
	{
		if (object_exists(oLevel))
		{
			layer_x(other.layer1,x / 2);
			layer_x(other.layer2,x / 4);
			layer_x(other.layer3,x / 8);
		}
	}
	
}


