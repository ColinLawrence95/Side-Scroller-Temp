with (oPersistent)
{
	pBluePower = true;
	show_debug_message("Blue power enabled");
}
audio_play_sound(sfxBlue_Power,20,false);
instance_destroy();