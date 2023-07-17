 /// @desc Product 5 dust effects
function DisappearEffect(){
	landingSound = audio_play_sound(sfxPlayer_Landing,4,false);
	audio_sound_pitch(landingSound,random_range(6,15));
	repeat(5)
	{
		with(instance_create_layer(x + 16, y + 16, "Effects", oDust)) vsp = random_range(-1, 1);
	}
}