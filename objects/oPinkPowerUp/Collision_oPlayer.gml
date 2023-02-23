with (oPersistent)
{
	pPinkPower = true;
	show_debug_message("pink power enabled");
}
rPinkPowerUp = audio_play_sound(sfxBlue_Power,20,false);
audio_sound_pitch(rPinkPowerUp, 0.6);
instance_destroy();