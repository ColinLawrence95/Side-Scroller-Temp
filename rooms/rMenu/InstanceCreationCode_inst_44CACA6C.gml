//Setting Level ID
levelID	= "menu";
//Playing Menu Music
rMusic = audio_play_sound(sfxMenu_Music,10,true);
audio_sound_pitch(rMusic, 1);
audio_sound_gain(rMusic, 0, 0);
audio_sound_gain(rMusic, 1, 5000);

show_debug_message(levelID)