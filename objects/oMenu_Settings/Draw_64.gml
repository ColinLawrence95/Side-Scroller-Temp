/// @description Print Menu

draw_set_font(menuFont);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var a = 0; a < menuOptions; a = a + 1)
{
	var offset = 2;
	var text = menu[a]
	if (menuHover == a)
	{
		text = string_insert("- ", text, 0);
		var colour = c_white;
	}
	else
	{
		var colour = c_grey;
	}
	var xx = menuX;
	var yy = menuY - (menu_itemHeight * (a * 1.5));
	draw_set_colour(c_black);
	draw_text(xx - offset,yy,text);
	draw_text(xx + offset,yy,text);
	draw_text(xx,yy - offset,text);
	draw_text(xx,yy + offset,text);
	draw_set_colour(colour);
	draw_text(xx,yy,text);
}