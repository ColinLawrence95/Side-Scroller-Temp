/// @description show text

//typewriting text
letters += txtSpeed;
txtCurrent = string_copy(txt,1,floor(letters));

//set font
draw_set_font(fNPC1);

if (h == 0)
{
	h = string_height(txt);
}

w = string_width(txtCurrent);

//Erase when finished and allow player to hit any key to continue
if (letters >= length) and (keyboard_check_pressed(ord("F")))
{
	instance_destroy();
	with (oCamera)
	{
		follow = oPlayer;
	}
}