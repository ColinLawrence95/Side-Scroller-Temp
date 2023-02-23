/// @description End Dashing code

if (alarm[0] = -1) //End of dash
{
    motion_set(0, 0); // Stop the motion of the player object
	speed = 0;
	hascontrol = true;
}