/// @desc variable setup for menu

#macro SAVEFILE "SaveFile.sav"

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

//Menu Options Array
menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Settings";
menu[0] = "Quit";

menuOptions = array_length_1d(menu);
menuHover = 3;
