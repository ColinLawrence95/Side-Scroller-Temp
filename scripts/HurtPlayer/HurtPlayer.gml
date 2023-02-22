// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer()
{
/// @description Damage player on contact

//Seeing if god mode is on
if (canDie = true)
{
	//Deducting HP and setting invincable window
	if (invincable = 0)
	{
		lastTouch = oDeadite
		playerHP = playerHP - 1;
		//Playing hit sfx
		audio_play_sound(sfxPlayer_Hit,15,false);
		playerFlash = 3;
		invincable = 1;
		show_debug_message(playerHP);
		
		if (!alarm[0])
		{
			alarm[0] = 60;
		}
	}	
}

}