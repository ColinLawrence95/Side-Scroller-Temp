/// @description Bullet collision with wall
//Making bullet destroy on impact with wall
if (place_meeting(x,y,oObstacle)) 
{
	while (place_meeting(x,y,oObstacle))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	speed = 0;
	instance_change(oHitSpark, true);
}
