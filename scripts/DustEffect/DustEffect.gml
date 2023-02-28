 /// @desc Product 5 dust effects
function DustEffect(){
	landingSound = audio_play_sound(sfxPlayer_Landing,4,false);
	audio_sound_pitch(landingSound,random_range(0.5,1.5));
	repeat(5)
	{
		if (place_meeting(x+hsp, y, oJumpWall))
		{
			if (image_xscale = -2)
			{
				with(instance_create_layer(bbox_left, y, "Effects", oDust))
				{
					hsp = 0;
					vsp = -1;
				}
			}
			if (image_xscale = 2)
			{
				with(instance_create_layer(bbox_right, y, "Effects", oDust))
				{
					hsp = 0;
					vsp = -1;
				}
			}		
		}
		else
		{
			with(instance_create_layer(x, bbox_bottom, "Effects", oDust)) vsp = 0;
		}	
	}
}