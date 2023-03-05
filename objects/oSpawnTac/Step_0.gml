
vspeed += gravity;
motion_set(direction, speed);

// check for collision with walls
if (place_meeting(x + hspeed, y, oObstacle))
{
    hspeed = -hspeed * bounce; // bounce off wall horizontally
    //direction = -direction; // reverse direction horizontally
}

if (place_meeting(x, y + vspeed, oObstacle))
{
    vspeed = -vspeed * bounce; // bounce off wall vertically
	hspeed = hspeed * bounce;
}

// Stop moving and activate
if (hspeed = 0 and vspeed < 0.5 and place_meeting(x, y, oObstacle))
{
    instance_create_layer(x,y,"Entities",oSpawnTacActive);
    instance_destroy();
}