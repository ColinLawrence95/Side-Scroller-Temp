function BasicLight()
{
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLight, 0, x, y, 1, 1, 0, c_white, 0.5);
		
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(sLight, 0 ,x ,y , 1, 1, 0, c_white, 0.5);
}