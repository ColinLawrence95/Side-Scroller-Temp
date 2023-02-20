/// @description Bullet collision with Deadite

//Damaging Deadite and getting hitfrom value
with (other)
{
	audio_sound_pitch(sfxDeadite_Hit,random_range(0.5,1.5));
	audio_play_sound(sfxDeadite_Hit,9,false);
	hp = hp - 4;
	flash = 3;
	hitFrom = other.direction;
}

instance_destroy();