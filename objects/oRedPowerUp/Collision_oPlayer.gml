with (oPersistent)
{
	pRedPower = true;
	show_debug_message("red power enabled");
}
rRedPowerUp = audio_play_sound(sfxBlue_Power,20,false);
audio_sound_pitch(rRedPowerUp, 0.6);
instance_destroy();