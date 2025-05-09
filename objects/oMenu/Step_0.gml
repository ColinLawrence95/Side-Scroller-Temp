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
		case 6: Transition(TRANS_MODE.GOTO, GH2); break
		case 5: Transition(TRANS_MODE.GOTO, rDeniTest); break
		case 4: Transition(TRANS_MODE.GOTO, rColinTest); break;
		//New game
		case 3: Transition(TRANS_MODE.GOTO, GH1); break;
		//Continue
		case 2: 
		{
			if (!file_exists(SAVEFILE))
			{
				Transition(TRANS_MODE.GOTO, Room1); break;
			}
			else
			{
				var file = file_text_open_read(SAVEFILE)
				var target = file_text_read_real(file);
				file_text_close(file);
				Transition(TRANS_MODE.GOTO,target);
			}
		}
		break;
		//Settings
		case 1: Transition(TRANS_MODE.GOTO,rMenu_Settings); break;
		//Quit
		case 0: game_end(); break;
	}
}
