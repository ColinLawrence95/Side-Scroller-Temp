//Level Specific Code
//Setting level ID
levelID = "greenhouse2"

//Playing level music
rMusic = audio_play_sound(sfxGH2_Music,10,true);
audio_sound_pitch(rMusic, 1);
audio_sound_gain(rMusic, 0, 0);
audio_sound_gain(rMusic, 1, 2000);

show_debug_message(levelID)