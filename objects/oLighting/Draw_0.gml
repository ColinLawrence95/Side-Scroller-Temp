//
if (surface_exists(lightSurf))
{	
	//drawing darkness
	surface_set_target(lightSurf);
	draw_clear(c_black);
	
	//making oCollectable glow
	with (oCollectable)
	{
		BasicLight();
	}
	
	with (oCollectable2)
	{
		BasicLight();
	}
	
	//adjusting darkness via varible darkness
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(lightSurf, 0, 0, 1, 1, 0, c_white, darkness)
}
else
{
	lightSurf = surface_create(room_width, room_height)
}