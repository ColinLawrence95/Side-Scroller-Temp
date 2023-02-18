/// @description update camera

//Update Destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	//Camera lock on player death
	if ((follow).object_index == oPlayerD)
	{
		x = xTo;
		y = yTo;
	}
}

//Update X and Y of camera
x = x + (xTo - x) / 25;
y = y + (yTo - y) / 25;

//locking camera to room
x = clamp(x,view_w_half + buff,room_width - view_w_half - buff)
y = clamp(y,view_h_half + buff,room_height - view_h_half - buff)

//Screen Shake
x += random_range(-shakeRemaining,shakeRemaining)
y += random_range(-shakeRemaining,shakeRemaining)
shakeRemaining = max(0,shakeRemaining - ((1/shakeLength) * shakeHowHard));

//Update camera view
camera_set_view_pos(cam,x - view_w_half,y - view_h_half);


