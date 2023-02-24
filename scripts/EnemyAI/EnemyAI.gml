// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemeyLogic(){
	distanceToPlayer = distance_to_object(obj_player);
	directionToPlayer = point_direction(x, y, oPlayer.x, oPlayer.y);
	
	if(distanceToPlayer < 300)
	{
		foundPlayer = true;
	}
	else
	{
		foundPlayer = false;
	}
	
	if(distanceToPlayer < 150)
	{
		foundPlayerToFollow = true;
	}
	else
	{
		foundPlayerToFollow = false;
	}
	
	if(directionToPlayer > 90)
	{
		image_xscale = -enemyScaleX;
		direction = -1;
	}
	else
	{
		image_xscale = enemyScaleX;
		direction = 1;
		show_debug_message("got here");
	}
}
	
function enemyMovement(){
	if (foundPlayerToFollow)
	{
		x += image_xscale * enemyValues.walksp;
	}
}