/// @description Menu selection

//Slide in
menuX += (menu_x_Final - menuX ) / menuSpeed;

//select menu option
if (menu_hasControl)
{
	if (keyboard_check_pressed(ord("W")))
	{
		menuHover = menuHover + 1;
		if (menuHover >= menuOptions) menuHover = 0;
	}
	
	if (keyboard_check_pressed(ord("S")))
	{
		menuHover = menuHover - 1;
		if (menuHover < 0) menuHover = menuOptions - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_Final = guiWidth + 200;
		menuCommited = menuHover;
		menu_hasControl = false;	
	}
}

if (menuX > guiWidth + 150) and (menuCommited != -1)
{
	switch (menuCommited)
	{
		case 3: default: Transition(TRANS_MODE.NEXT); break;
		case 2: 
		{
			if (!file_exists(SAVEFILE))
			{
				Transition(TRANS_MODE.NEXT); break;
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
		case 0: game_end(); break;
	}
}
