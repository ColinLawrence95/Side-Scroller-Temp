/// @desc variable setup for menu
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
guiMargin = 32;
menuX = guiWidth + 200;
menuY = guiHeight - guiMargin;
menu_x_Final = guiWidth - guiMargin;
menuSpeed = 25; //low is fast
menuFont = fMenu;
menu_itemHeight = font_get_size(fMenu);
menuCommited = -1;
menu_hasControl = true;

//Settings Menu Options Array
menu[4] = "Controls";
menu[3] = "Graphics";
menu[2] = "Audio";
menu[1] = "Credits";
menu[0] = "Back";

menuOptions = array_length_1d(menu);
menuHover = 4;

