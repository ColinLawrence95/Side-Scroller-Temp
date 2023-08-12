/// @description Insert description here
// You can write your code in this editor

//Health Bar
draw_sprite(sPlayerHealthBarBackground,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sPlayerHealthBar,0,healthbar_x,healthbar_y, (playerHP/playerHPCurrent) * healthbar_width, healthbar_height);
draw_sprite(sPlayerHealthBarBorder,0,healthbar_x,healthbar_y);

//Ammo Counter
draw_set_color(c_white);
draw_set_font(fMenu);
with (oPersistent)
{
	draw_text(110,50,string(pAmmoCount));
}