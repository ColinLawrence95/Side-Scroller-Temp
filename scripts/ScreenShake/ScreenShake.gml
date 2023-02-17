/// @desctiption ScreenShake(howhard,frames)
/// @arg howHard sets the strength of the shake in pixels
/// @arg Frames sets length of shake is frames 60 is 1 sec

with (oCamera)
{
	if (argument0 > shakeRemaining)
	{
		shakeHowHard = argument0;
		shakeRemaining = argument0;
		shakeLength = argument1;
	}	
}		