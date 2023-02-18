//Variable Declaration
levelID = "greenhouse1"
//Getting ID for paralax
layer3 = layer_get_id("GH1Trees3")
layer2 = layer_get_id("GH1Trees2")
layer1 = layer_get_id("GH1Trees1")

//Playing level Music 
audio_play_sound(sfxGH1_Music,10,true);

show_debug_message(levelID)