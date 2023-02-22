/// @description Bullet collision with wall
//Making bullet destroy on impact with wall
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

if (place_meeting(x,y,oWall)) 
{
	while (place_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	speed = 0;
	instance_change(oHitSpark, true);
}
