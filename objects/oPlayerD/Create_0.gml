/// @description Declaring varibles
image_xscale = 2;
image_yscale = 2;
image_speed = 1;
image_index = 0;
hsp = 0;
vsp = 0;
grv = 0.2;
done = 0;

/*game juice for player death*/
ScreenShake(7,100)
audio_play_sound(sfxDeadite_Death,1000,false);
//Slow Motion
game_set_speed(35,gamespeed_fps);

with (oCamera)
{
	follow = other.id;
}