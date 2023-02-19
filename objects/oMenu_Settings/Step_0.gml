/// @description Menu selection

//Slide in
menuX += (menu_x_Final - menuX ) / menuSpeed;

//select menu option
if (menu_hasControl)
{
	if (keyboard_check_pressed(ord("W")))
	{
		audio_play_sound(sfxMenu_Option,9,false);
		menuHover = menuHover + 1;
		if (menuHover >= menuOptions) menuHover = 0;
	}
	
	if (keyboard_check_pressed(ord("S")))
	{
		audio_play_sound(sfxMenu_Option,9,false);
		menuHover = menuHover - 1;
		if (menuHover < 0) menuHover = menuOptions - 1;
	}
	//confirm choice
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
	{
		menu_x_Final = guiWidth + 200;
		menuCommited = menuHover;
		menu_hasControl = false;	
		audio_play_sound(sfxMenu_Enter,5,false);
	}
}

if (menuX > guiWidth + 150) and (menuCommited != -1)
{
	switch (menuCommited)
	{
		//Controls
		case 4: Transition(TRANS_MODE.GOTO,room_first); break;
		//Graphics
		case 3: Transition(TRANS_MODE.GOTO,room_first); break;
		//Audio
		case 2: Transition(TRANS_MODE.GOTO,room_first); break;
		//Credits
		case 1: Transition(TRANS_MODE.GOTO,room_first); break;
		//Back
		case 0: Transition(TRANS_MODE.GOTO,room_first); break;
	}
}
