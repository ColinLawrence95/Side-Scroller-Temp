/// @description Insert description here
// You can write your code in this editor

//Health Bar
draw_sprite(sPlayerHealthBarBackground,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sPlayerHealthBar,0,healthbar_x,healthbar_y, (playerHP/playerHPCurrent) * healthbar_width, healthbar_height);
draw_sprite(sPlayerHealthBarBorder,0,healthbar_x,healthbar_y);

//Ammo Counter and selector
draw_set_color(c_white);
draw_set_font(fMenu);
draw_set_halign(fa_left);
with (oPersistent)
{
	
	draw_text(other.healthbar_x,other.healthbar_y,"Ammo: " + string(pAmmoCount));
	if (pChargeShot = true)
	{
		draw_text(200,50,"Charge Shot")
	}
	else if (pFlamethrower = true)
	{
		draw_text(200,50,"Flamethrower")
	}
	else if (pAcid = true)
	{
		draw_text(200,50,"Acid")
	}
	else if (pIceBeam = true)
	{
		draw_text(200,50,"Ice Beam")
	}
	else
	{
		draw_text(200,50,"Basic Shot")
	}
	
}

