/// @desc Slide transition(mode, targetroom)
/// @arg Mode sets transition mode between next, restart, and goto.
/// @arg Target sets target room when using goto mode.

with (oTransition)
{
	mode = argument[0];
	if (argument_count > 1) target = argument[1];
	audio_stop_all()
	game_set_speed(60,gamespeed_fps);
}