if (point_in_circle(oPlayer.x, oPlayer.y ,x ,y ,activateRange))
{
	image_index = 1
	show_debug_message("gotHEre")
	on = true;
}
else
{
	on = false;
}

if (leaverID = "Crate") and (on)
{
	instance_create_layer(x+200,y-500,"Walls",oCrate)
}
else if (leaverID = "Sound") and (on)
{
	audio_play_sound(sfxPlayer_Landing,4,false);
}