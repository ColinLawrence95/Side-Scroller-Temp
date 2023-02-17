/// @description Bullet collision with wall
//Making bullet destroy on impact with wall
if (place_meeting(x,y,oWall)) 
{
	instance_destroy();
}