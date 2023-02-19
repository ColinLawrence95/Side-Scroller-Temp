//Variable Declaration
levelID = "greenhouse1"
//Getting ID for paralax
layer3 = layer_get_id("GH1Trees3")
layer2 = layer_get_id("GH1Trees2")
layer1 = layer_get_id("GH1Trees1")

//Playing level Music 
rMusic = audio_play_sound(sfxGH1_Music,10,true);
audio_sound_pitch(rMusic, 1);
audio_sound_gain(rMusic, 0, 0);
audio_sound_gain(rMusic, 1, 2000);
show_debug_message(levelID)