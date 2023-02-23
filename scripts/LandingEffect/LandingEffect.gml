 /// @desc ?
function LandingEffect(){
	landingSound = audio_play_sound(sfxPlayer_Landing,4,false);
	audio_sound_pitch(landingSound,random_range(0.5,1.5));
	repeat(5)
	{
		with(instance_create_layer(x, bbox_bottom, "Effects", oDust))
		{
			vsp = 0;
		}
	}
}