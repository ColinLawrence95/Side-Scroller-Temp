//Setting Level ID
levelID	= "settingsMenu";
//Playing Menu Music
rMusic = audio_play_sound(sfxMenu_Music,10,true);
audio_sound_pitch(rMusic, 0.8);
audio_sound_gain(rMusic, 0, 0);
audio_sound_gain(rMusic, 1, 2000);

show_debug_message(levelID)