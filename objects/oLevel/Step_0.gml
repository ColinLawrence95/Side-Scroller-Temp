/* Green House 1
	All actions to run specifically for Green House 1 go here,
	or in the level specific object instance*/
	
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

